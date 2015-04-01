<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.commons.WebContants" %>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.board.*" %>
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

User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.NOT_LOGIN);
    return;
}
request.setCharacterEncoding("UTF-8");

String boardCd = request.getParameter("boardCd");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
int curPage = Integer.parseInt(request.getParameter("curPage"));
String searchWord = request.getParameter("searchWord");
String memo = request.getParameter("memo");

Comment comment = new Comment();
comment.setArticleNo(articleNo);
comment.setEmail(user.getEmail());
comment.setMemo(memo);

BoardService service = new BoardService();
service.addComment(comment);

searchWord = java.net.URLEncoder.encode(searchWord, "UTF-8");
response.sendRedirect("view.jsp?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord);
%>