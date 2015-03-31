<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login User");
	return;
}
request.setCharacterEncoding("UTF-8");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
String boardCd = request.getParameter("boardCd");
String curPage = request.getParameter("curPage");
String searchWord = request.getParameter("searchWord");
//TODO articleNo로 게시글 객체를 얻어서 현재 로그인된 사용자가 글 소유자인지를 검사한다.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="글쓰기 화면" />
<meta name="Description" content="글쓰기 화면" />
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[
           
function check() {
    //var form = document.getElementById("writeForm");
    //유효성 검사로직 추가
    return true;
}

function goView() {
    var form = document.getElementById("viewForm");
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

<!--  본문 시작 -->
<div id="url-navi">BBS</div>
<h1>자유게시판</h1>

<div id="bbs">
<h2>수정</h2>
<form id="writeForm" action="modify_proc.jsp" method="post" enctype="multipart/form-data" onsubmit="return check()">
<p style="margin: 0;padding: 0;">
<input type="hidden" name="articleNo" value="5" />
<input type="hidden" name="boardCd" value="free" />
<input type="hidden" name="curPage" value="1" />
<input type="hidden" name="searchWord" value="무궁화꽃" />
</p>
<table id="write-form">
<tr>
    <td>제목</td>
    <td><input type="text" name="title" style="width: 90%" value="무궁화꽃" /></td>
</tr>
<tr>
    <td colspan="2">
        <textarea name="content" rows="17" cols="50">무궁화꽃이피었습니다</textarea>
    </td>
</tr>
<tr>
    <td>파일첨부</td>
    <td><input type="file" name="attachFile" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="전송" />
    <input type="button" value="상세보기" onclick="goView()" />
</div>
</form>
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
    <form id="viewForm" action="view.jsp" method="get">
    <p>
        <input type="hidden" name="articleNo" value="5" />
        <input type="hidden" name="boardCd" value="free" />
        <input type="hidden" name="curPage" value="1" />
        <input type="hidden" name="searchWord" value="무궁화꽃" />
    </p>
    </form>
</div>

</body>
</html>