<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="blog.title" /></title>
<meta name="Keywords" content="<spring:message code="blog.keys" />" />
<meta name="Description" content="<spring:message code="blog.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<style>
#sidebar  {
    display: none;
}
#content  {
    margin-left: 0;
}
.post-card { border: 1px solid #e0e0e0; padding: 20px; margin-bottom: 20px; border-radius: 8px; }
.post-title { margin: 0 0 10px 0; }
.post-title a { text-decoration: none; color: #1a1a1a; font-size: 22px; }
.post-meta { color: #666; font-size: 14px; margin-bottom: 10px; }
.post-summary { color: #444; font-size: 16px; line-height: 1.5; }
.tag { background: #f0f0f0; padding: 3px 8px; border-radius: 4px; margin-right: 5px; font-size: 12px; }
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
<!-- content begin -->
<spring:message code="lang" var="lang"/>

<article id="blog-posts-container">
	<p></p>
</article>
<script>
// 1. 외부 매핑된 폴더 안의 posts.json 파일을 직접 요청
fetch('/docs/posts.json')
	.then(response => {
		if (!response.ok) throw new Error('목록을 불러오지 못했습니다.');
		return response.json();
	})
	.then(posts => {
		const container = document.getElementById('blog-posts-container');
		container.innerHTML = ''; // 로딩 문구 삭제
		if (posts.length === 0) {
			container.innerHTML = '<p>작성된 글이 없습니다.</p>';
			return;
		}
		/*
		// 2. 글 목록 데이터를 반복하며 카드 형태의 HTML 생성
		posts.forEach(post => {
			const card = document.createElement('div');
			card.className = 'post-card';
			// 태그 배열을 HTML 문자열로 변환
			const tagsHtml = post.tags.map(tag => `<span class="tag">#\${tag}</span>`).join('');
			// 카드 내부 구조 정의 (detail.jsp?file=파일명 구조로 링크 연결)
			card.innerHTML = `
			<h2 class="post-title">
				<a href="${blogUrl}/\${post.id}">\${post.title}</a>
			</h2>
			<div class="post-meta">
				<span>📅 \${post.date}</span> | 
				<span>📂 \${post.category}</span>
			</div>
			<p class="post-summary">\${post.summary}</p>
			<div class="post-tags">\${tagsHtml}</div>`;

			container.appendChild(card);
		});
		*/
		const listItems = posts.map(post => {
			const title = ("${lang}" === "ko") ? post.title : post.title_en;
			return `<li><a href="${blogUrl}/\${post.id}">\${title}</a> - \${post.date}</li>`;
		}).join('');
		const ulHtml = `<ul>\${listItems}</ul>`;
		container.innerHTML = ulHtml;
	})
	.catch(error => {
		document.getElementById('blog-posts-container').innerHTML = `<p style="color:red;">\${error.message}</p>`;
	});
</script>
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="../articles/blog-index.jsp"/>
	</c:when>
	<c:otherwise>
		<jsp:include page="../articles/blog-index_en.jsp"/>
	</c:otherwise>
</c:choose>
<!-- content end -->
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
