<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.commons.WebContants" %>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.board.*" %>
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
User user = (User) session.getAttribute(WebContants.USER_KEY);

request.setCharacterEncoding("UTF-8");
int commentNo = Integer.parseInt(request.getParameter("commentNo"));

//로그인 사용자가 댓글의 소유자인지를 검사
BoardService service = new BoardService();
Comment comment = service.getComment(commentNo);
if (user == null || !user.getEmail().equals(comment.getEmail())) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    return; 
}

String boardCd = request.getParameter("boardCd");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
int curPage = Integer.parseInt(request.getParameter("curPage"));
String searchWord = request.getParameter("searchWord");

String memo = request.getParameter("memo");

//생성되어 있는 Comment 객체를 재사용한다.
comment.setCommentNo(commentNo);
comment.setArticleNo(articleNo);
comment.setEmail(user.getEmail());
comment.setMemo(memo);

service.modifyComment(comment);

searchWord = java.net.URLEncoder.encode(searchWord,"UTF-8");
response.sendRedirect("view.jsp?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord);
%>