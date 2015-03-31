<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/loginCheck.jsp" %>
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
<h1>자유게시판</h1>
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
	<tr>
		<td style="text-align: center;">11</td>
		<td>
			<a href="javascript:goView('1')">제목</a>
			<img src="../images/attach.png" alt="첨부파일" />
			<span class="bbs-strong">[5]</span>
		</td>
		<td style="text-align: center;">2011.11.15</td>
		<td style="text-align: center;">4555</td>
	</tr>
	<!--  반복 구간 끝 -->
	</table>
                
	<div id="paging">
		<a href="javascript:goList('5')">[이전]</a>
		<span class="bbs-strong">6</span>
		<a href="javascript:goList('7')">7</a>
		<a href="javascript:goList('8')">8</a>
		<a href="javascript:goList('9')">9</a>
		<a href="javascript:goList('10')">10</a>
		<a href="javascript:goList('11')">[다음]</a>
	</div>

	<div id="list-menu">
		<input type="button" value="새글쓰기" onclick="goWrite()" />
	</div>

	<div id="search">
		<form action="list.jsp" method="get">
			<p style="margin: 0;padding: 0;">
				<input type="hidden" name="boardCd" value="free" />
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
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
    <form id="viewForm" action="view.jsp" method="get">
    <p>
        <input type="hidden" name="articleNo" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
    <form id="writeForm" action="write_form.jsp" method="post">
    <p>
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
</div>

</body>
</html>