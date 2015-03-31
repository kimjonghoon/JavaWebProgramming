<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.*" %>
<%
/*
회원가입을 처리하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
자동으로 로그인하지 않는다.
회원가입이 완료되면 환영페이지로 이동한다.
*/

request.setCharacterEncoding("UTF-8");

String email = request.getParameter("email");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");

//email,passwd,name,mobile 순으로
User user = new User(email, passwd, name, mobile);

UserService service = new UserService();
service.addUser(user);

response.sendRedirect("welcome.jsp");
%>