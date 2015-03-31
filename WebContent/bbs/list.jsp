<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.board.*" %>
<%@ page import="net.java_school.commons.PagingHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../inc/loginCheck.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String boardCd = request.getParameter("boardCd");
int curPage = Integer.parseInt(request.getParameter("curPage"));
String searchWord = request.getParameter("searchWord");
if (searchWord == null) searchWord = "";
BoardService service = new BoardService();

//PaginHelper 생성
//1. 총 레코드 계산
int totalRecord = service.getTotalRecord(boardCd, searchWord);
//2. numPerPage, pagePerBlock 설정
int numPerPage = 10;
int pagePerBlock = 10;
PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);

//BoardService에 PagingHelper 주입
service.setPagingHelper(pagingHelper);

ArrayList<Article> articleList = service.getArticleList(boardCd, searchWord);
String boardNm = service.getBoardNm(boardCd);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[

function goList(curPage) {
    var form = document.getElementById("listForm");
    form.curPage.value = curPage;
    form.submit();
}

function goView(articleNo) {
    var form = document.getElementById("viewForm");
    form.articleNo.value = articleNo;
    form.submit();
}

function goWrite() {
    var form = document.getElementById("writeForm");
    form.submit();
}

//]]>           
</script>
</head>
<body>

<div id="wrap">

	<div id="header">
		<%@ include file="../inc/header.jsp" %>
	</div>
    
	<div id="main-menu">
		<%@ include file="../inc/main-menu.jsp" %>
	</div>
    
    <div id="container">
		<div id="content" style="min-height: 800px;">
			<div id="url-navi">BBS</div>

<!-- 본문 시작 -->
<h1><%=boardNm %></h1>
<div id="bbs">
	<table>
	<!--  게시판 목록 머리말 -->
	<tr>
		<th style="width: 60px;">NO</th>
		<th>TITLE</th>
		<th style="width: 84px;">DATE</th>
		<th style="width: 60px;">HIT</th>
	</tr>
	<!--  반복 구간 시작 -->
<%
int listItemNo = service.getListItemNo();
int size = articleList.size();

for (int i = 0; i < size; i++) {
	Article article = articleList.get(i);
	int articleNo = article.getArticleNo();
	String title = article.getTitle();
	java.util.Date regdate = article.getRegdate();
	int attachFileNum = article.getAttachFileNum();
	int commentNum = article.getCommentNum();
	int hit = article.getHit();
%>	
	<tr>
		<td style="text-align: center;"><%=listItemNo %></td>
		<td>
			<a href="javascript:goView('<%=articleNo %>')"><%=title %></a>
			<% if (attachFileNum > 0) { %><img src="../images/attach.png" alt="첨부파일" /><% } %>
			<% if (commentNum > 0) { %><span class="bbs-strong">[<%=commentNum %>]</span><% } %>
		</td>
		<td style="text-align: center;"><%=regdate %></td>
		<td style="text-align: center;"><%=hit %></td>
	</tr>
<%
	listItemNo--;
} //for문 끝
%>	
	<!--  반복 구간 끝 -->
	</table>
                
	<div id="paging">
<%
if (service.getPrevPage() != 0) {
%>	
		<a href="javascript:goList('<%=service.getPrevPage() %>')">[이전]</a>
<%
}//if문 끝

int firstPage = service.getFirstPage();
int lastPage = service.getLastPage();
for (int i = firstPage; i <= lastPage; i++) {
	if (curPage == i) {	
%>		
		<span class="bbs-strong"><%=i %></span>
<%
	} else {
%>		
		<a href="javascript:goList('<%=i %>')"><%=i %></a>
<%
	}
}// for문 끝

//[다음] 링크 구현
if (service.getNextPage() != 0) {
%>		
		<a href="javascript:goList('<%=service.getNextPage() %>')">[다음]</a>
<%
}//if문 끝
%>		
	</div>

	<div id="list-menu">
		<input type="button" value="새글쓰기" onclick="goWrite()" />
	</div>

	<div id="search">
		<form action="list.jsp" method="get">
			<p style="margin: 0;padding: 0;">
				<input type="hidden" name="boardCd" value="<%=boardCd %>" />
				<input type="hidden" name="curPage" value="1" />
				<input type="text" name="searchWord" size="15" maxlength="30" />
				<input type="submit" value="검색" />
			</p>
		</form>
	</div>

</div>
<!-- 본문 끝 -->

		</div>
	</div>
    
	<div id="sidebar">
		<%@ include file="bbs-menu.jsp" %>
	</div>
    
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
    
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
        
</div>

<div id="form-group" style="display: none">
    <form id="listForm" action="list.jsp" method="get">
    <p>
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
    <form id="viewForm" action="view.jsp" method="get">
    <p>
        <input type="hidden" name="articleNo" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
    <form id="writeForm" action="write_form.jsp" method="post">
    <p>
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
</div>

</body>
</html>