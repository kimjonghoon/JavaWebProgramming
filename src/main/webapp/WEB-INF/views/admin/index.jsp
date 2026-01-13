<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="admin.index.title" /></title>
<meta name="Keywords" content="<spring:message code="admin.index.keys" />" />
<meta name="Description" content="<spring:message code="admin.index.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<script>
$(document).ready(function() {
	$('.del-user-link').click(function(e) {
        e.preventDefault();
        var check = confirm('<spring:message code="delete.confirm" />')
        if (check) {
            var email = this.title;
            $('#delUserForm input[name*=email]').val(email);
            $('#delUserForm').submit();
        }
    });
});
</script>
</head>
<body>
<div id="wrap">
	
	<div id="header">
		<%@ include file="../inc/header.jsp" %>
	</div>
	
	<div id="main-menu" lang="en">
		<%@ include file="../inc/main-menu.jsp" %>
	</div>
	
	<div id="container">
		<div id="content">
<!-- content begin -->
<h2><spring:message code="user.list" /></h2>
<table class="bbs-table">
    <tr>
        <th style="text-align: left;">No</th>
        <th style="text-align: left;"><spring:message code="full.name" /></th>
        <th style="text-align: left;"><spring:message code="email" /></th>
        <th style="text-align: left;"><spring:message code="mobile" /></th>
        <th style="text-align: left;"><spring:message code="user.authorities" /></th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="user" items="${list }" varStatus="status">
        <tr>
            <td>${pagingNumbers.listItemNo - status.index }</td>
            <td>${user.name }</td>
            <td>${user.email }</td>
            <td>${user.mobile }</td>
            <td>${user.authorities }</td>
            <td>
                <a href="${adminUrl}/editAccount?email=${user.email }&page=${param.page }&search=${param.search }"><spring:message code="modify" /></a> |
                <a href="#" title="${user.email }" class="del-user-link"><spring:message code="delete" /></a>
            </td>
        </tr>
    </c:forEach>
</table>
<div id="paging">
    <c:if test="${pagingNumbers.finalOfPrevGroup > 0 }">
        <a href="${adminUrl}?page=1">1</a>
        <a href="${adminUrl}?page=${prev }&search=${search }">[ <spring:message code="prev" /> ]</a>
    </c:if>
    <c:forEach var="i" begin="${pagingNumbers.startPage }" end="${pagingNumbers.finalPage }" varStatus="stat">
        <c:choose>
            <c:when test="${param.page == i}">
                <span class="bbs-strong">${i }</span>
            </c:when>
            <c:otherwise>
                <a href="${adminUrl}?page=${i }&search=${param.search }">[ ${i } ]</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pagingNumbers.startOfNextGroup > 0 }">
        <a href="${adminUrl}?page=${pagingNumbers.startOfNextGroup }&search=${search }">[ <spring:message code="next" /> ]</a>
        <a href="${adminUrl}?page=${pagingNumbers.lastPage }">[ <spring:message code="last" /> ]</a>
    </c:if>
</div>

<form>
    <input type="hidden" name="page" value="1" />
    <input type="text" name="search" /><input type="submit" value="<spring:message code="search" />" />
</form>

<form id="delUserForm" action="${adminUrl}/delUser" method="post">
    <input type="hidden" name="page" value="${param.page }" />
    <input type="hidden" name="search" value="${param.search }" />
    <input type="hidden" name="email" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		<%@ include file="admin-sub.jsp" %>
	</div>

	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
	
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>
