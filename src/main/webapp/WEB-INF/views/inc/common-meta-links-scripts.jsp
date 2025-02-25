<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/x-icon" href="${ctx}/resources/images/favicon.ico" />
<link rel="stylesheet" href="${ctx}/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="${ctx}/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/resources/css/print.css" type="text/css" />
<script src="${ctx}/resources/js/jquery.js"></script>