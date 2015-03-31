<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
비밀번호를 변경하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인이 되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
비밀번호 변경후 비밀번호 변경 확인 페이지로 이동한다.
*/
response.sendRedirect("changePasswd_confirm.jsp");
%>
