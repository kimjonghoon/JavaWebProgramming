<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<h1><spring:message code="bbs" /></h1>
<spring:message code="lang" var="lang" />
<ul>
<c:choose>
<c:when test="${lang == 'ko'}">
	<c:forEach var="board" items="${boards }" varStatus="status">
		<c:if test="${board.boardCd == 'admin'}">
			<sec:authorize access="hasRole('ADMIN')">
				<li><a href="${bbsUrl}/${board.boardCd }?page=1">${board.boardNm_ko }</a></li>
			</sec:authorize>
		</c:if>
		<c:if test="${board.boardCd != 'admin'}">
			<li><a href="${bbsUrl}/${board.boardCd }?page=1">${board.boardNm_ko }</a></li>
		</c:if>
	</c:forEach>
</c:when>
<c:otherwise>
	<c:forEach var="board" items="${boards }" varStatus="status">
		<c:if test="${board.boardCd == 'admin'}">
			<sec:authorize access="hasRole('ADMIN')">
				<li><a href="${bbsUrl}/${board.boardCd }?page=1">${board.boardNm }</a></li>
			</sec:authorize>
		</c:if>
		<c:if test="${board.boardCd != 'admin'}">
			<li><a href="${bbsUrl}/${board.boardCd }?page=1">${board.boardNm }</a></li>
		</c:if>
	</c:forEach>
</c:otherwise>
</c:choose>
</ul>
