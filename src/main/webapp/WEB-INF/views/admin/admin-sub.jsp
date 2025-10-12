<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1><spring:message code="user.admin" /></h1>
<ul>
    <li><a href="${ctx}/admin?page=1"><spring:message code="user.list" /></a></li>
    <li><a href="${ctx}/admin/board"><spring:message code="bbs" /></a></li>
</ul>
