<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
response.sendRedirect("bye_confirm.jsp");
%>