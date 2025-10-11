<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h1><spring:message code="bbs" /></h1>
<spring:message code="lang" var="lang" />
<ul>
<c:choose>
<c:when test="${lang == 'ko'}">
	<c:forEach var="board" items="${boards }" varStatus="status">
		<li><a href="${ctx}/bbs/${board.boardCd }?page=1">${board.boardNm_ko }</a></li>
	</c:forEach>
</c:when>
<c:otherwise>
	<c:forEach var="board" items="${boards }" varStatus="status">
		<li><a href="${ctx}/bbs/${board.boardCd }?page=1">${board.boardNm }</a></li>
	</c:forEach>
</c:otherwise>
</c:choose>
</ul>
