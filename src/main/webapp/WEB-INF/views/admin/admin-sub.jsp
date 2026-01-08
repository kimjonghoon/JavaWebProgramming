<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1><spring:message code="user.admin" /></h1>
<ul>
	<c:url var="adminUrl" value="/admin"/>
    <li><a href="${adminUrl}?page=1"><spring:message code="user.list" /></a></li>
    <li><a href="${adminUrl}/board"><spring:message code="bbs" /></a></li>
</ul>
