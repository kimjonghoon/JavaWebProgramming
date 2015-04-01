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
새 게시글을 등록하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인이 되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
로그인 체크를 통과하면
boardCd, title, content, attachFile 파라미터를 가지고 새글을 인서트한다.
form 이 enctype="multipart/form-data" 인 경우 request.getParameter()로 파라미터의 값을 얻을 수 없다.
프로그래밍을 손쉽게 하기 위해 외부 라이브러리르 이용한다.(아파치 commons.fileupload 또는 cos)
새글을 등록한 후 목록의 첫번째 페이지로 되돌아가야 한다.
*/

User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.NOT_LOGIN);
    return;
}

String dir = application.getRealPath("/upload");

MultipartRequest multi = new MultipartRequest(
        request,
        dir,
        5*1024*1024,
        "UTF-8",
        new DefaultFileRenamePolicy());

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
}

String boardCd = multi.getParameter("boardCd");

Article article = new Article();
article.setEmail(user.getEmail());
article.setTitle(title);
article.setContent(content);
article.setBoardCd(boardCd);

BoardService service = new BoardService();
service.addArticle(article, attachFile);

response.sendRedirect("list.jsp?boardCd=" + boardCd + "&curPage=1");
%>