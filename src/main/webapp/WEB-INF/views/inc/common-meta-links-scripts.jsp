<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/favicon.ico"/>"/>
<spring:message code="lang" var="language"/>
<link rel="stylesheet" href="<c:url value="/resources/css/${language}.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/screen.css"/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/css/print.css"/>" type="text/css"/>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>