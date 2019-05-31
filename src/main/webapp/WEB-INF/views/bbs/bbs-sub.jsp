<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h1><spring:message code="global.bbs" /></h1>
<spring:message code="lang" var="lang" />
<ul>
<c:choose>
<c:when test="${lang == 'ko'}">
	<c:forEach var="board" items="${boards }" varStatus="status">
		<li><a href="/bbs/${board.boardCd }?page=1">${board.boardNm_ko }</a></li>
	</c:forEach>
</c:when>
<c:otherwise>
	<c:forEach var="board" items="${boards }" varStatus="status">
		<li><a href="/bbs/${board.boardCd }?page=1">${board.boardNm }</a></li>
	</c:forEach>
</c:otherwise>
</c:choose>
</ul>