<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.user.UserService" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%
/*
회원정보를 수정하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
회원정보를 수정한 후 다시 로그인하고 비밀번호 변경화면으로 이동한다.
비밀번호 변경 화면에서는 비밀번호외에 회원정보를 모두 볼 수 있기 때문이다.
*/

User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.NOT_LOGIN);
    return;
}

request.setCharacterEncoding("UTF-8");
//전달되는 파라미터 name, mobile, passwd
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String passwd = request.getParameter("passwd");

String email = user.getEmail();

UserService service = new UserService();

user = service.login(email, passwd);

if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    session.removeAttribute(WebContants.USER_KEY);//패스워드가 틀리면 세션을 끊는다.
    return;
}

user = new User(email, passwd, name, mobile);

service.editAccount(user);
session.setAttribute(WebContants.USER_KEY, user);

response.sendRedirect("changePasswd.jsp");
%>