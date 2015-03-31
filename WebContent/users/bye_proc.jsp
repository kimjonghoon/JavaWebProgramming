<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.user.UserService" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%
/*
회원탈퇴를 처리하는 페이지로 모델 2에서는 삭제해야한다.
-구현-
로그인이 되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
회원테이블에서 회원정보를 지운다.
세션을 지운다.
탈퇴 확인 페이지로 이동한다.
*/

User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.NOT_LOGIN); 
    return;
}

//전달되는 파라미터 email,passwd
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");

//email,passwd 가 맞으면 회원테이블레서 회원정보 삭제하고 세션 제거
UserService service = new UserService();
User check = service.login(email, passwd);
if (check == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED); 
    return;
}

//회원테이블에서 회원정보를 삭제
service.bye(user.getEmail(), passwd);
//세션제거
session.removeAttribute(WebContants.USER_KEY);
//탈퇴 확인 페이지로 이동
response.sendRedirect("bye_confirm.jsp");
%>