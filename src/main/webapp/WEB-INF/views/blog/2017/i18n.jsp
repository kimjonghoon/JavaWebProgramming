<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="i18n.title" /></title>
<meta name="Keywords" content="<spring:message code="i18n.keys" />" />
<meta name="Description" content="<spring:message code="i18n.desc" />" />
<%@ include file="../../inc/common-meta-links-scripts.jsp" %>
<script src="${ctx}/resources/js/commons.js"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="${ctx}/resources/css/prettify.css" type="text/css" />
<script src="${ctx}/resources/js/run_prettify.js"></script>
<!-- for pretty code end -->
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
		<%@ include file="../../inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="../../inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<spring:message code="lang" var="lang" />
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="../../articles/blog/2017/i18n.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../../articles/blog/2017/i18n_en.jsp" />
	</c:otherwise>
</c:choose>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		
	</div>

	<div id="extra">
		<%@ include file="../../inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="../../inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>
