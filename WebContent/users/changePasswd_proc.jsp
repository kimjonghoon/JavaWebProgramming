<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.user.UserService" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%
/*
비밀번호를 변경하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인이 되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
비밀번호 변경후 비밀번호 변경 확인 페이지로 이동한다.
*/
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.NOT_LOGIN);
    return;
}

//전달되는 파라미터 currentPasswd(현재 비밀번호),newPasswd(변경할 비밀번호)
String currentPasswd = request.getParameter("currentPasswd");
String newPasswd = request.getParameter("newPasswd");
String email = user.getEmail();

UserService service = new UserService();
int check = service.changePasswd(currentPasswd, newPasswd, email);
if (check < 1) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    session.removeAttribute(WebContants.USER_KEY);//세션에서 유저 객체 제거
    return;
} 
response.sendRedirect("changePasswd_confirm.jsp");
%>
