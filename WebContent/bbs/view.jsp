<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div id="content">

<!-- 본문 시작 -->
<div id="url-navi">BBS</div>
<h1>자유게시판</h1>

<div id="bbs">
<table>
<tr>
    <th style="width: 37px;text-align: left;vertical-align: top;">TITLE</th>
    <th style="text-align: left;color: #555;">무궁화꽃이피었습니다</th>
</tr>
</table>
<div id="gul-content">
    <span id="date-writer-hit">edited 2014-10-09 17:50:30 by 홍길동 hit 1330</span>
    <p>
    무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다<br />
    무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다<br />
    </p>
    <p id="file-list" style="text-align: right">
    	<a href="#">abc.zip</a>
    	<a href="javascript:deleteAttachFile('23')">x</a>
    </p>
</div>

<!--  덧글 반복 시작 -->
<div class="comments">
    <span class="writer">xman</span>
    <span class="date">2011.12.11 12:14:32</span>
    <span class="modify-del">
        <a href="javascript:modifyCommentToggle('5')">수정</a>
         | <a href="javascript:deleteComment('5')">삭제</a>
    </span>
    <p id="comment5">무궁화꽃이피었습니다</p>
    <div class="modify-comment">
        <form id="modifyCommentForm5" action="updateComments_proc.jsp" method="post" style="display: none;">
        <p>
            <input type="hidden" name="commentNo" value="5" />
            <input type="hidden" name="boardCd" value="free" />
            <input type="hidden" name="no" value="12" />
            <input type="hidden" name="curPage" value="1" />
            <input type="hidden" name="searchWord" value="무궁화꽃" />
        </p>
        <div class="fr">
                <a href="javascript:document.forms.modifyCommentForm5.submit()">수정하기</a>
                | <a href="javascript:modifyCommentToggle('5')">취소</a>
        </div>
        <div>
            <textarea class="modify-comment-ta" name="memo" rows="7" cols="50">무궁화꽃이 피었습니다.</textarea>
        </div>
        </form>
    </div>
</div>
<!--  덧글 반복 끝 -->

<form id="addCommentForm" action="addComments_proc.jsp" method="post">
	<p style="margin: 0;padding: 0">
		<input type="hidden" name="articleNo" value="5" />
		<input type="hidden" name="boardCd" value="free" />
		<input type="hidden" name="curPage" value="1" />
		<input type="hidden" name="searchWord" value="무궁화꽃" />
	</p>
    <div id="addComment">
        <textarea rows="7" cols="50"></textarea>
    </div>
    <div style="text-align: right;">
        <input type="button" value="덧글남기기" />
    </div>
</form>

<div id="next-prev">
    <p>다음글 : <a href="javascript:goView('6')">무궁화꽃이 피었습니다.</a></p>
    <p>이전글 : <a href="javascript:goView('4')">무궁화꽃이 피었습니다.</a></p>
</div>

<div id="view-menu">
    <div class="fl">
        <input type="button" value="수정" onclick="goModify()" />
        <input type="button" value="삭제" onclick="goDelete()" />
    </div>
    
    <div class="fr">
        <input type="button" value="다음글" onclick="goView('6')" />
        <input type="button" value="이전글" onclick="goView('4')" />
        <input type="button" value="목록" onclick="location.href='list.jsp?boardCd=free&curPage=1'" />
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
        
<tr>
	<td style="text-align: center;"><img src="../images/arrow.gif" alt="현재글" /></td>
	<td>
		<a href="javascript:goView('1')">제목</a>
		<img src="../images/attach.png" alt="첨부파일" />
		<span class="bbs-strong">[5]</span>
	</td>
	<td style="text-align: center;">2011.11.15</td> <!--등록일-->
	<td style="text-align: center;">4555</td> <!--조회수-->
</tr>
</table>
                
<div id="paging">
	<a href="javascript:golist('5')">[이전]</a>
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
        <input type="hidden" name="articleNo" value="5" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="12" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
    <form id="modifyForm" action="modify_form.jsp" method="post">
    <p>
        <input type="hidden" name="articleNo" value="5" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
    <form id="delForm" action="del_proc.jsp" method="post">
    <p>
        <input type="hidden" name="articleNo" value="5" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
    <form id="deleteCommentForm" action="deleteComments_proc.jsp" method="post">
    <p>
        <input type="hidden" name="commentNo" />
        <input type="hidden" name="articleNo" value="12" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>   
    <form id="deleteAttachFileForm" action="deleteAttachFile_proc.jsp" method="post">
    <p>
        <input type="hidden" name="attachFileNo" />
        <input type="hidden" name="articleNo" value="23" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>       
</div>

</body>
</html>