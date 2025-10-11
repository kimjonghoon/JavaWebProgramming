<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<h1><spring:message code="membership" /></h1>
<ul>
	<security:authorize access="!isAuthenticated()">        
		<li><a href="${ctx}/users/login"><spring:message code="login" /></a></li>
		<li><a href="${ctx}/users/signUp"><spring:message code="signup" /></a></li>
		<li><a href="#"><spring:message code="forgot.id" /></a></li>
		<li><a href="#"><spring:message code="forgot.pw" /></a></li>
	</security:authorize>
	    
	<security:authorize access="isAuthenticated()">
		<li><a href="${ctx}/users/editAccount"><spring:message code="modify.account" /></a></li>
		<li><a href="${ctx}/users/changePasswd"><spring:message code="change.password" /></a></li>
		<li><a href="${ctx}/users/bye"><spring:message code="bye" /></a></li>
	</security:authorize>
</ul>