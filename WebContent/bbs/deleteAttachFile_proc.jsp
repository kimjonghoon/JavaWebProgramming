<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.board.*" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%
/*
첨부파일 삭제를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.

-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자가 아닙니다"); return;
요청의 캐릭터셋을 UTF-8로 설정해야 한다.
요청에서 참조해야 하는 파라미터는
attachFileNo,articleNo,boardCd,curPage,searchWord 이다.
첨부파일를 삭제 후 상세보기를 돌아가기 위해선
searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩한다.
*/
User user = (User) session.getAttribute(WebContants.USER_KEY);

request.setCharacterEncoding("UTF-8");
int attachFileNo = Integer.parseInt(request.getParameter("attachFileNo"));

//로그인 사용자가 첨부파일 소유자인지를 검사
BoardService service = new BoardService();
AttachFile attachFile = service.getAttachFile(attachFileNo);
if (user == null || !user.getEmail().equals(attachFile.getEmail())) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, WebContants.AUTHENTICATION_FAILED);
    return; 
}

String boardCd = request.getParameter("boardCd");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
int curPage = Integer.parseInt(request.getParameter("curPage"));
String searchWord = request.getParameter("searchWord");

service.removeAttachFile(attachFileNo);

searchWord = java.net.URLEncoder.encode(searchWord, "UTF-8");
response.sendRedirect("view.jsp?articleNo=" + articleNo + "&boardCd=" + boardCd + "&curPage=" + curPage + "&searchWord=" + searchWord);
%>
