<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>JavaScript</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li><a href="<c:url value="/javascript/intro"/>">자바스크립트 소개</a></li>
	    <li><a href="<c:url value="/javascript/datatype"/>">데이터 타입</a></li>
	    <li><a href="<c:url value="/javascript/objects"/>">자바스크립트 객체</a></li>
	    <li><a href="<c:url value="/javascript/examples"/>">예제</a></li>
	</ul>
	</c:when>
	<c:otherwise>
	<ul>
	    <li><a href="<c:url value="/javascript/intro"/>">Introduction</a></li>
	    <li><a href="<c:url value="/javascript/datatype"/>">Data Type</a></li>
	    <li><a href="<c:url value="/javascript/objects"/>">Objects</a></li>
	    <li><a href="<c:url value="/javascript/examples"/>">Examples</a></li>
	</ul>
	</c:otherwise>
</c:choose>