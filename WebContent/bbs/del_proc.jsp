<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.commons.WebContants" %>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.board.*" %>
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
User user = (User) session.getAttribute(WebContants.USER_KEY);

request.setCharacterEncoding("UTF-8");
//전달된 파라미터 articleNo,boardCd,curPage,searchWord
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
//글 소유자 검사
BoardService service = new BoardService();
Article article = service.getArticle(articleNo);
if (user == null || !user.getEmail().equals(article.getEmail())) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    return;
}

service.removeArticle(articleNo);

String boardCd = request.getParameter("boardCd");
String curPage = request.getParameter("curPage");
String searchWord = request.getParameter("searchWord");

searchWord = java.net.URLEncoder.encode(searchWord, "UTF-8");
response.sendRedirect("list.jsp?boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord);
%>