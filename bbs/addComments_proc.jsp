<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
새로운 댓글을 인서트하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
로그인이 되어 있지 않으면 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
로그인 체크를 통과하면 
먼저 요청의 캐릭터셋을 UTF-8로 설정한다.
boardCd, articleNo, curPage, searchWord, memo 파라미터를 받아서 댓글을 인서트한다.
댓글을 인서트한 후 상세보기를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("view.jsp?articleNo=5&boardCd=free&curPage=1&searchWord=무궁화꽃");
%>