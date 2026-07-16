<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang"/>">
<spring:message code="lang" var="lang"/>
<head>
<meta charset="UTF-8" />
<title>Title</title>
<meta name="Keywords" content="Keywords"/>
<meta name="Description" content="Description"/>
<%@ include file="../inc/common-meta-links-scripts.jsp"%>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/prettify.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/prettify.js"/>"></script>
<script>
$(document).ready(function() {
	let slug = "${slug}";
	if (slug) {
		if ("${lang}" === "en") slug = slug + "_en";
		const filename = slug + ".html";
    		// $.get() 메서드를 사용해 html 파일을 가져옵니다.
		$.get('/docs/' + filename)
			.done(function(htmlData) {
				// 성공 시 #content-area에 HTML 삽입
				$('#content-area').html(htmlData);
				//구글 코드 프리티파이(prettyPrint) 함수 호출
				if (typeof PR !== 'undefined' && PR.prettyPrint) {
					PR.prettyPrint();
				}
				$('pre.prettyprint').html(function() {
					return this.innerHTML.replace(/\t/g, '&nbsp;&nbsp;')
				});
				$('pre.prettyprint').dblclick(function() {
					selectRange(this);
				});
				//title
				const title = $(htmlData).find('h1').first().text();
				$(document).attr('title', title);
				//Keywords meta tag content value
				const keywordsArr = $(htmlData).find('em').map(function() {
					return $(this).text();
				}).get();
				if (keywordsArr) {
					const keywords = keywordsArr.join(',');
					$('meta[name="Keywords"]').attr('content',keywords);
				}
				const description = $(htmlData).find('#description').text();
				$('meta[name="Description"]').attr('content',description);
			})
			.fail(function() {
				// 실패 시 에러 메시지 출력
				$('#content-area').html('<p style="color:red;">글을 불러오는데 실패했습니다.</p>');
			});
	} else {
		$('#content-area').html('<p>잘못된 접근입니다.</p>');
	}

});
</script>
<style>
#sidebar  {
    display: none;
}
#content  {
    margin-left: 0;
}
#content-area em {
	font-style: normal;
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

<div id="content-area"></div>

<script>
// 서블릿에서 request.setAttribute()로 보낸 값을 자바스크립트 변수에 주입
// 예: const filename = "how-to-install-java.html";
/*
const slug = "${slug}";

if (slug) {
	const filename = slug + ".html";
	fetch('/docs/' + filename)
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
*/
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
