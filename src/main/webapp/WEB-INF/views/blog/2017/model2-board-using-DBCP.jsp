<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang"/>
<!DOCTYPE html>
<html lang="${lang }">
<head>
<meta charset="UTF-8" />
<title><spring:message code="model2-board-using-DBCP.title"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="Keywords" content="<spring:message code="model2-board-using-DBCP.keys"/>"/>
<meta name="Description" content="<spring:message code="model2-board-using-DBCP.desc"/>"/>
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/${lang }.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/screen.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/print.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="<c:url value="/resources/css/prettify.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/prettify.js"/>"></script>
<script src="<c:url value="/resources/js/javaschool-prettify.js"/>"></script>
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
		<jsp:include page="../../articles/blog/2017/model2-board-using-DBCP.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../../articles/blog/2017/model2-board-using-DBCP_en.jsp" />
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
