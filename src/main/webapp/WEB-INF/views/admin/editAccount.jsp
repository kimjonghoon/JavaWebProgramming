<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="admin.editaccount.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="admin.editaccount.keys" />" />
<meta name="Description" content="<spring:message code="admin.editaccount.desc" />" />
<link rel="stylesheet" href="/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/print.css" type="text/css" />
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/commons.js"></script>
<script>
$(document).ready(function () {
    $('.del-auth-link').click(function (e) {
        e.preventDefault();
        var authority = this.title;
        $('#deleteAuthorityForm input[name*=authority]').val(authority);
        $('#deleteAuthorityForm').submit();
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
<h2><spring:message code="user.modify" /></h2>

<sf:form id="editAccountForm" action="editAccount" method="post" modelAttribute="user">
    <sf:hidden path="email" value="${user.email }" />
    <input type="hidden" name="page" value="${param.page }" />
    <input type="hidden" name="search" value="${param.search }" />
    <sf:errors path="*" cssClass="error" />
    <table>
        <tr>
            <td><spring:message code="full.name" /></td>
            <td>
                <sf:input path="name" value="${user.name }" /><br />
                <sf:errors path="name" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td><spring:message code="mobile" /></td>
            <td>
                <sf:input path="mobile" value="${users.mobile }" /><br />
                <sf:errors path="mobile" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="<spring:message code="submit" />" /></td>
        </tr>
    </table>
</sf:form>

<hr />

<sf:form id="changePasswdForm" action="changePasswd" method="post" modelAttribute="user">
    <sf:hidden path="email" value="${user.email }" />
    <input type="hidden" name="page" value="${param.page }" />
    <input type="hidden" name="search" value="${param.search }" />
    <sf:errors path="*" cssClass="error" />
    <table>
        <tr>
            <td><spring:message code="password" /></td>
            <td>
                <sf:password path="passwd" /><br />
                <sf:errors path="passwd" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="<spring:message code="submit" />" /></td>
        </tr>
    </table>
</sf:form>

<hr />

<form id="addAuthorityForm" action="addAuthority" method="post">
    <input type="hidden" name="email" value="${user.email }" />
    <input type="hidden" name="page" value="${param.page }" />
    <input type="hidden" name="search" value="${param.search }" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <table>
        <tr>
            <td>현재 권한</td>
            <td>
                <c:forEach var="authority" items="${user.authorities }" varStatus="status">
                    ${authority } <a href="#" title="${authority }" class="del-auth-link">x</a>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td>권한 추가</td>
            <td>
                <select name="authority">
                    <option value="ROLE_USER" selected="selected">ROLE_USER</option>
                    <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                </select>
                <input type="submit" value="<spring:message code="submit" />" />
            </td>
        </tr>
    </table>
</form>

<div style="text-align: right;">
    <form action="/admin">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
        <input type="submit" value="<spring:message code="user.list" />" />
    </form>
</div>

<div style="display: none;">
    <form id="deleteAuthorityForm" action="delAuthority" method="get">
        <input type="hidden" name="email" value="${user.email }" />
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
        <input type="text" name="authority" />
    </form>
</div>
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