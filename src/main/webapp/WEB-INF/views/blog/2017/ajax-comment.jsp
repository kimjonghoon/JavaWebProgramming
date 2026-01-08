<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<spring:message code="lang" var="lang"/>
<!DOCTYPE html>
<html lang="${lang }">
<head>
<meta charset="UTF-8" />
<title><spring:message code="ajax-comment.title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="Keywords" content="<spring:message code="ajax-comment.keys"/>"/>
<meta name="Description" content="<spring:message code="ajax-comment.desc"/>"/>
<c:url var="staticUrl" value="/resources"/>
<link rel="icon" type="image/x-icon" href="${staticUrl}/images/favicon.ico"/>
<link rel="stylesheet" href="${staticUrl}/css/${lang }.css" type="text/css" />
<link rel="stylesheet" href="${staticUrl}/css/screen.css" type="text/css"/>
<link rel="stylesheet" href="${staticUrl}/css/print.css" type="text/css"/>
<script src="${staticUrl}/js/jquery.js"></script>
<script src="${staticUrl}/js/commons.js"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="${staticUrl}/css/prettify.css" type="text/css"/>
<script src="${staticUrl}/js/prettify.js"></script>
<script src="${staticUrl}/js/javaschool-prettify.js"></script>
<!-- for pretty code end -->
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
<c:choose>
	<c:when test="${lang == 'ko'}">
		<jsp:include page="../../articles/blog/2017/ajax-comment.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../../articles/blog/2017/ajax-comment_en.jsp" />
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
