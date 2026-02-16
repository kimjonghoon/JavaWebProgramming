<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>Spring</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li><a href="<c:url value="/spring/building-java-projects"/>">순수 자바</a></li>
	    <li><a href="<c:url value="/spring/spring-mvc"/>">스프링 MVC</a></li>
	    <li><a href="<c:url value="/spring/spring-security"/>">스프링 시큐리티</a></li>
	    <li><a href="<c:url value="/spring/bean-validation"/>">빈 검증</a></li>
	</ul>
	</c:when>
	<c:otherwise>
	<ul>
	    <li><a href="<c:url value="/spring/building-java-projects"/>">Building Java Projects</a></li>
	    <li><a href="<c:url value="/spring/spring-mvc"/>">Spring MVC</a></li>
	    <li><a href="<c:url value="/spring/spring-security"/>">Spring Security</a></li>
	    <li><a href="<c:url value="/spring/bean-validation"/>">Bean Validation</a></li>
	</ul>
	</c:otherwise>
</c:choose>