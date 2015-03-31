<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
게시글을 수정하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
articleNo, boardCd, curPage, searchWord, title, content, attachFile 파라미터를 받고
게시글을 수정한다.
form 이 enctype="multipart/form-data" 인 경우 request.getParameter()로 파라미터의 값을 얻을 수 없다.
쉽게 프로그래밍하기 위해 외부 라이브러리를 이용한다.(아파치 commons.fileupload 또는 cos)
게시글을 수정한 후 상세보기를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("view.jsp?articleNo=5&curPage=1&boardCd=free&searchWord=무궁화꽃");
%>
