<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="net.java_school.user.*" %>
<%@ page import="net.java_school.board.*" %>
<%@ page import="net.java_school.commons.*" %>
<%@ include file="../inc/loginCheck.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

int articleNo = Integer.parseInt(request.getParameter("articleNo"));
String boardCd = request.getParameter("boardCd");
int curPage = Integer.parseInt(request.getParameter("curPage"));
String searchWord = request.getParameter("searchWord");
if (searchWord == null) searchWord = "";

BoardService service = new BoardService();

//PaginHelper 생성
int totalRecord = service.getTotalRecord(boardCd, searchWord);//총 레코드
int numPerPage = 10;//페이지당 보일 레코드
int pagePerBlock = 10;//블록당 페이지 직접 이동 링크 수
PagingHelper pagingHelper = new PagingHelper(totalRecord, curPage, numPerPage, pagePerBlock);

//BoardService에 PagingHelper 주입
service.setPagingHelper(pagingHelper);

service.increaseHit(articleNo);//조회수 1증가

Article detailedArticle = service.getArticle(articleNo);//상세보기에서 볼 게시글
ArrayList<AttachFile> attachFileList = service.getAttachFileList(articleNo);//첨부파일 목록
Article nextArticle = service.getNextArticle(articleNo, boardCd, searchWord);//다음 글
Article prevArticle = service.getPrevArticle(articleNo, boardCd, searchWord);//이전 글
ArrayList<Article> articleList = service.getArticleList(boardCd, searchWord);//게시글 목록
ArrayList<Comment> commentList = service.getCommentList(articleNo);//댓글 목록

String boardNm = service.getBoardNm(boardCd);//게시판 이름

String articleOwnerName = detailedArticle.getName();//게시글 작성자 이름
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="게시판 상세보기" />
<meta name="Description" content="게시판 상세보기" />
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[

function modifyCommentToggle(articleNo) {
	var p_id = "comment" + articleNo;
	var p = document.getElementById(p_id);
	
	var form_id = "modifyCommentForm" + articleNo;
	var form = document.getElementById(form_id);

	var p_display;
	var form_display;
	
	if (p.style.display) {
		p_display = '';
		form_display = 'none';
	} else {
		p_display = 'none';
		form_display = '';
	}

	p.style.display = p_display;
	form.style.display = form_display;
}

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

function goModify() {
    var form = document.getElementById("modifyForm");
    form.submit();
}

function goDelete() {
    var check = confirm("정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("delForm");
        form.submit();
    }
}

function deleteAttachFile(attachFileNo) {
    var check = confirm("첨부파일을 정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("deleteAttachFileForm");
        form.attachFileNo.value = attachFileNo;
        form.submit();
    }
}

function deleteComment(commentNo) {
    var check = confirm("댓글을 정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("deleteCommentForm");
        form.commentNo.value = commentNo;
        form.submit();
    }
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

<!-- 본문 시작 -->
<div id="url-navi">BBS</div>
<h1><%=boardNm %></h1>
<div id="bbs">
<table>
<tr>
    <th style="width: 37px;text-align: left;vertical-align: top;">TITLE</th>
    <th style="text-align: left;color: #555;"><%=detailedArticle.getTitle() %></th>
</tr>
</table>
<div id="gul-content">
    <span id="date-writer-hit">edited <%=detailedArticle.getRegdate() %> by <%=articleOwnerName %> hit <%=detailedArticle.getHit() %></span>
<%
String content = detailedArticle.getContent();
content = content.replaceAll(System.getProperty("line.separator"), "<br />");
%>    
    <p><%=content %></p>
<%
int size = attachFileList.size();
if (size > 0) {
%>    
    <p id="file-list" style="text-align: right">
<%
	String path = request.getContextPath();
	String uploadPath = path + "/upload/";
	
	for (int i = 0; i < size; i++) {
		AttachFile attachFile = attachFileList.get(i);
		String filename = attachFile.getFilename();
		int attachFileNo = attachFile.getAttachFileNo();
		String fileFullPath = uploadPath + filename;
	
%>    
    	<a href="<%=fileFullPath %>"><%=filename %></a>
<%
		if (user.getEmail().equals(detailedArticle.getEmail())) {
%>    	
    	<a href="javascript:deleteAttachFile('<%=attachFileNo %>')">x</a>
<%
		}//if문 끝
%>
		<br />    	
<%
	}//for문 끝
%>    	
    </p>
<%
}//if문 끝
%>    
</div>
<!--  덧글 반복 시작 -->
<%
size = commentList.size();
for (int i = 0; i < size; i++) {
	Comment comment = commentList.get(i);
	int commentNo = comment.getCommentNo();
	String email = comment.getEmail();
	String memo = comment.getMemo();
	String commentOwnerName = comment.getName();
	Date regdate = comment.getRegdate();

%>
<div class="comments">
    <span class="writer"><%=commentOwnerName %></span>
    <span class="date"><%=regdate %></span>
<%
	if (user.getEmail().equals(email)) {
%>    
    <span class="modify-del">
        <a href="javascript:modifyCommentToggle('<%=commentNo %>')">수정</a>
         | <a href="javascript:deleteComment('<%=commentNo %>')">삭제</a>
    </span>
<%
	}//if문 끝
%>    
    <p id="comment<%=commentNo %>"><%=memo %></p>
    <div class="modify-comment">
        <form id="modifyCommentForm<%=commentNo %>" action="updateComments_proc.jsp" method="post" style="display: none;">
        <p>
            <input type="hidden" name="commentNo" value="<%=commentNo %>" />
            <input type="hidden" name="boardCd" value="<%=boardCd %>" />
            <input type="hidden" name="articleNo" value="<%=articleNo %>" />
            <input type="hidden" name="curPage" value="<%=curPage %>" />
            <input type="hidden" name="searchWord" value="<%=searchWord %>" />
        </p>
        <div class="fr">
                <a href="javascript:document.forms.modifyCommentForm<%=commentNo %>.submit()">수정하기</a>
                | <a href="javascript:modifyCommentToggle('<%=commentNo %>')">취소</a>
        </div>
        <div>
            <textarea class="modify-comment-ta" name="memo" rows="7" cols="50"><%=memo %></textarea>
        </div>
        </form>
    </div>
</div>
<%
}//for문 끝
%>
<!--  덧글 반복 끝 -->

<form id="addCommentForm" action="addComments_proc.jsp" method="post">
	<p style="margin: 0;padding: 0">
		<input type="hidden" name="articleNo" value="<%=articleNo %>" />
		<input type="hidden" name="boardCd" value="<%=boardCd %>" />
		<input type="hidden" name="curPage" value="<%=curPage %>" />
		<input type="hidden" name="searchWord" value="<%=searchWord %>" />
	</p>
    <div id="addComment">
        <textarea name="memo" rows="7" cols="50"></textarea>
    </div>
    <div style="text-align: right;">
        <input type="submit" value="덧글남기기" />
    </div>
</form>

<div id="next-prev">
<%
if (nextArticle != null) {
%>
    <p>다음글 : <a href="javascript:goView('<%=nextArticle.getArticleNo() %>')"><%=nextArticle.getTitle() %></a></p>
<%
}
if (prevArticle != null) {
%>    
    <p>이전글 : <a href="javascript:goView('<%=prevArticle.getArticleNo() %>')"><%=prevArticle.getTitle() %></a></p>
<%
}
%>
</div>

<div id="view-menu">
    <div class="fl">
<%
if (user.getEmail().equals(detailedArticle.getEmail())) {
%>    
        <input type="button" value="수정" onclick="goModify()" />
        <input type="button" value="삭제" onclick="goDelete()" />
<%
}
%>        
    </div>
    
    <div class="fr">
<%
if (nextArticle != null) {
%>    
        <input type="button" value="다음글" onclick="goView('<%=nextArticle.getArticleNo() %>')" />
<%
}
if (prevArticle != null) {
%>        
        <input type="button" value="이전글" onclick="goView('<%=prevArticle.getArticleNo() %>')" />
<%
}
%>        
        <input type="button" value="목록" onclick="goList('<%=curPage %>')" />
        <input type="button" value="새글쓰기" onclick="goWrite()" />
    </div>
</div>

<!-- 목록 -->
<table>
<tr>
	<th style="width: 60px;">NO</th>
	<th>TITLE</th>
	<th style="width: 84px;">DATE</th>
	<th style="width: 60px;">HIT</th>
</tr>
<%
int listItemNo = service.getListItemNo();
size = articleList.size();
for (int i = 0; i < size; i++) {
	Article article = articleList.get(i);
	int aNo = article.getArticleNo();
	String title = article.getTitle();
	Date regdate = article.getRegdate();
	int hit = article.getHit();
	int attachFileNum = article.getAttachFileNum();
	int commentNum = article.getCommentNum();

%>        
<tr>
	<td style="text-align: center;">
<%
if (articleNo == aNo) {
%>	
	<img src="../images/arrow.gif" alt="현재글" />
<%
} else {
%>
	<%=listItemNo %>
<%
}
%>	
	</td>
	<td>
		<a href="javascript:goView('<%=aNo %>')"><%=title %></a>
<%
if (attachFileNum > 0) {
%>		
		<img src="../images/attach.png" alt="첨부파일" />
<%
}
if (commentNum > 0) {
%>		
		<span class="bbs-strong">[<%=commentNum %>]</span>
<%
}
%>		
	</td>
	<td style="text-align: center;"><%=regdate %></td>
	<td style="text-align: center;"><%=hit %></td>
</tr>
<%
	listItemNo--;
}//for문 끝
%>
</table>
                
<div id="paging">
<%
if (service.getPrevPage() != 0) {
%>
	<a href="javascript:golist('<%=service.getPrevPage() %>')">[이전]</a>
<%
}
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
}//for문 끝	
//[다음]링크 구현
if (service.getNextPage() != 0) {
%>	
	<a href="javascript:goList('<%=service.getNextPage() %>')">[다음]</a>
<%
}
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

</div><!-- bbs 끝 -->
<!-- 본문 끝 -->

		</div><!-- content 끝 -->
	</div><!-- container 끝 -->
    
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
        <input type="hidden" name="articleNo" value="<%=articleNo %>" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
    <form id="modifyForm" action="modify_form.jsp" method="post">
    <p>
        <input type="hidden" name="articleNo" value="<%=articleNo %>" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
    <form id="delForm" action="del_proc.jsp" method="post">
    <p>
        <input type="hidden" name="articleNo" value="<%=articleNo %>" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>
    <form id="deleteCommentForm" action="deleteComments_proc.jsp" method="post">
    <p>
        <input type="hidden" name="commentNo" />
        <input type="hidden" name="articleNo" value="<%=articleNo %>" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>   
    <form id="deleteAttachFileForm" action="deleteAttachFile_proc.jsp" method="post">
    <p>
        <input type="hidden" name="attachFileNo" />
        <input type="hidden" name="articleNo" value="<%=articleNo %>" />
        <input type="hidden" name="boardCd" value="<%=boardCd %>" />
        <input type="hidden" name="curPage" value="<%=curPage %>" />
        <input type="hidden" name="searchWord" value="<%=searchWord %>" />
    </p>
    </form>       
</div>

</body>
</html>