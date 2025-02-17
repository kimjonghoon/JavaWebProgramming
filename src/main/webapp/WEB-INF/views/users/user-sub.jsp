<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <security:authentication property="principal.username" var="check" />
</security:authorize>

<h1><spring:message code="membership" /></h1>
<ul>
    <c:choose>
        <c:when test="${empty check}">
            <li><a href="${ctx}/users/login"><spring:message code="login" /></a></li>
            <li><a href="${ctx}/users/signUp"><spring:message code="signup" /></a></li>
            <li><a href="#"><spring:message code="forgot.id" /></a></li>
            <li><a href="#"><spring:message code="forgot.pw" /></a></li>
        </c:when>
        <c:otherwise>
            <li><a href="${ctx}/users/editAccount"><spring:message code="modify.account" /></a></li>
            <li><a href="${ctx}/users/changePasswd"><spring:message code="change.password" /></a></li>
            <li><a href="${ctx}/users/bye"><spring:message code="bye" /></a></li>
        </c:otherwise>
	</c:choose>
</ul>