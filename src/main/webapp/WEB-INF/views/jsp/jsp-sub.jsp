<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>JSP</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li><a href="<c:url value="/jsp/tomcat-install"/>">톰캣 설치</a></li>
	    <li><a href="<c:url value="/jsp/namecard-webapp"/>">명함관리 웹 애플리케이션</a></li>
	    <li class="sub-heading">게시판</li>
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
	    <li><a href="<c:url value="/jsp/tomcat-install"/>">Tomcat Install</a></li>
	    <li><a href="<c:url value="/jsp/namecard-webapp"/>">Namecard Web App</a></li>
	    <li class="sub-heading">Board</li>
	</ul>		
	</c:otherwise>
</c:choose>