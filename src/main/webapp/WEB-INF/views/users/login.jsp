<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.login.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="user.login.keys" />" />
<meta name="Description" content="<spring:message code="user.login.desc" />" />
<link rel="stylesheet" href="${ctx}/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="${ctx}/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/resources/css/print.css" type="text/css" />
<script src="${ctx}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${ctx}/resources/js/commons.js"></script>
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
<div id="content-categories"><spring:message code="membership" /></div>

<h2><spring:message code="login.heading" /></h2>

<c:if test="${not empty param.error }">
    <h3>${SPRING_SECURITY_LAST_EXCEPTION.message }</h3>
</c:if>
<c:url var="loginUrl" value="/login" />
<form:form action="${loginUrl }" method="post">
<table>
<tr>
    <td style="width: 200px;"><spring:message code="email" /></td>
    <td style="width: 390px"><form:input path="username" style="width: 99%;" /></td>
</tr>
<tr>
    <td><spring:message code="password" /></td>
    <td><form:input path="password" style="width: 99%;" /></td>
</tr>
</table>
<div style="text-align: center;padding: 15px 0;">
    <input type="submit" value="<spring:message code="submit" />" />
    <input type="button" value="<spring:message code="signup" />" onclick="location.href='signUp'" />
</div>
</form:form>
<!-- content end -->
		</div>
	</div>
	
	<div id="sidebar" lang="en">
		<%@ include file="user-sub.jsp" %>
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
