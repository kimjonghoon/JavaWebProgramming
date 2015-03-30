<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
회원정보를 수정하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
회원정보를 수정한 후 다시 로그인하고 비밀번호 변경화면으로 이동한다.
비밀번호 변경 화면에서는 비밀번호외에 회원정보를 모두 볼 수 있기 때문이다.
*/
response.sendRedirect("changePasswd.jsp");
%>