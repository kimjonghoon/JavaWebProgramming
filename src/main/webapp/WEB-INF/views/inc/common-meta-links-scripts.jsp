<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:url var="staticUrl" value="/resources"/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/x-icon" href="${staticUrl}/images/favicon.ico" />
<link rel="stylesheet" href="${staticUrl}/css/<spring:message code="lang" />.css" type="text/css" />
<link rel="stylesheet" href="${staticUrl}/css/screen.css" type="text/css" />
<link rel="stylesheet" href="${staticUrl}/css/print.css" type="text/css" />
<script src="${staticUrl}/js/jquery.js"></script>