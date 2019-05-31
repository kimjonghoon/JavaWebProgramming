<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="404.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="404.keys" />" />
<meta name="Description" content="<spring:message code="404.desc" />" />
<link rel="stylesheet" href="/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/print.css" type="text/css" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/commons.js"></script>
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="/"><img src="/resources/images/ci.gif" alt="java-school" /></a></div>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="./inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<div id="content-categories">Error</div>
<h2>404</h2>
<p>
<spring:message code="404.msg" />
</p>
 <!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		<h1>Error</h1>
	</div>

	<div id="extra">
		<%@ include file="./inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="./inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>