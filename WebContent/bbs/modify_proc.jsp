<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.user.UserService" %>
<%@ page import="net.java_school.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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
User user = (User) session.getAttribute(WebContants.USER_KEY);

String dir = application.getRealPath("/upload");

MultipartRequest multi = new MultipartRequest(
        request,
        dir,
        5*1024*1024,
        "UTF-8",
        new DefaultFileRenamePolicy());

BoardService service = new BoardService();
int articleNo = Integer.parseInt(multi.getParameter("articleNo"));
//글 소유자인지 검사
if (!service.getArticle(articleNo).getEmail().equals(user.getEmail())) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    return;
}

String boardCd = multi.getParameter("boardCd");
int curPage = Integer.parseInt(multi.getParameter("curPage"));
String searchWord = multi.getParameter("searchWord");
searchWord = java.net.URLEncoder.encode(searchWord, "UTF-8");

String title = multi.getParameter("title");
String content = multi.getParameter("content");
String filename = multi.getFilesystemName("attachFile");
String filetype = multi.getContentType("attachFile");

File f = multi.getFile("attachFile");
long filesize = 0L;
AttachFile attachFile = null;

if (f != null) {
    filesize = f.length();
    attachFile = new AttachFile();
    attachFile.setFilename(filename);
    attachFile.setFiletype(filetype);
    attachFile.setFilesize(filesize);
    attachFile.setEmail(user.getEmail());
    attachFile.setArticleNo(articleNo);
}

Article article = new Article();
article.setArticleNo(articleNo);
article.setBoardCd(boardCd);
article.setTitle(title);
article.setContent(content);
article.setEmail(user.getEmail());

service.modifyArticle(article, attachFile);

response.sendRedirect("view.jsp?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord);
%>