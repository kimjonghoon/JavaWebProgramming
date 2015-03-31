<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
댓글 업데이트를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
작성자 체크를 통과하면
요청의 캐릭터셋을 UTF-8로 설정한다.
commentNo, boardCd, articleNo, curPage, searchWord, memo 파라미터를 받아서
댓글을 업데이트한다.
댓글을 업데이트 처리한 후 상세보기를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("view.jsp?articleNo=5&boardCd=free&curPage=1&searchWord=무궁화꽃");
%>
