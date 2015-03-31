<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
게시글을 삭제하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
작성자가 아니면 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
작성자 체크를 통과하면
요청의 캐릭터셋을 UTF-8로 설정한다.
articleNo, boardCd, curPage, searchWord 파라미터를 받고
articleNo로 게시글을 삭제한다.
게시글 삭제 후 목록를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("list.jsp?boardCd=free&curPage=1&searchWord=무궁화꽃");
%>
