<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
회원가입을 처리하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
자동으로 로그인하지 않는다.
회원가입이 완료되면 환영페이지로 이동한다.
*/
response.sendRedirect("welcome.jsp");
%>