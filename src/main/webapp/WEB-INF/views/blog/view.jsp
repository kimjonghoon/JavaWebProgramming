<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang"/>">
<head>
<meta charset="UTF-8" />
<title>Title</title>
<meta name="Keywords" content="Keywords"/>
<meta name="Description" content="Description"/>
<%@ include file="../inc/common-meta-links-scripts.jsp"%>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/prettify.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/run_prettify.js"/>"></script>
<script>
$(document).ready(function() {
	$('pre.prettyprint').html(function() {
		return this.innerHTML.replace(/\t/g, '&nbsp;&nbsp;')
	});
	$('pre.prettyprint').dblclick(function() {
		selectRange(this);
	})
})
</script>
<style>
#sidebar  {
    display: none;
}
#content  {
    margin-left: 0;
}
</style>
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<%@ include file="../inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="../inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<spring:message code="lang" var="lang"/>
<div id="content-area">내용을 불러오는 중입니다...</div>

<script>
// 서블릿에서 request.setAttribute()로 보낸 값을 자바스크립트 변수에 주입
// 예: const filename = "how-to-install-java.html";
const filename = "${targetFile}";

if (filename && filename !== ".html") {
	// 외부 폴더에서 실제 HTML 본문 fetch
	fetch(`/posts/\${filename}`)
		.then(response => {
			if (!response.ok) throw new Error('글을 불러오는데 실패했습니다.');
			return response.text();
		})
		.then(htmlData => {
			document.getElementById('content-area').innerHTML = htmlData;
		})
		.catch(error => {
			document.getElementById('content-area').innerHTML = `<p style="color:red;">\${error.message}</p>`;
		});
} else {
    document.getElementById('content-area').innerHTML = '<p>잘못된 접근입니다.</p>';
}
</script>
		</div>
	</div>

	<div id="sidebar" lang="en">
		
	</div>

	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>
