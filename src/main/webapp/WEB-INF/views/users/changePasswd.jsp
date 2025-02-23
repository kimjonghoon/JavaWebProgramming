<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.changepasswd.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="user.changepasswd.keys" />" />
<meta name="Description" content="<spring:message code="user.changepasswd.desc" />" />
<link rel="stylesheet" href="${ctx}/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="${ctx}/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/resources/css/print.css" type="text/css" />
<script src="${ctx}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${ctx}/resources/js/commons.js"></script>
<script>
$(document).ready(function () {
    $('#changePasswordForm').submit(function() {
        var currentPasswd = $('#changePasswordForm input[name*=currentPasswd]').val();
        currentPasswd = $.trim(currentPasswd);
        if (currentPasswd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#changePasswordForm input[name*=currentPasswd]').val('');
            return false;
        }
        var newPasswd = $('#changePasswordForm input[name*=newPasswd]').val();
        newPasswd = $.trim(newPasswd);
        if (newPasswd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#changePasswordForm input[name*=newPasswd]').val('');
            return false;
        }
        var confirmPasswd = $('#changePasswordForm input[name*=confirm]').val();
        confirmPasswd = $.trim(confirmPasswd);
        if (confirmPasswd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#changePasswordForm input[name*=confirm]').val('');
            return false;
        }
        if (newPasswd !== confirmPasswd) {
            alert('<spring:message code="changePasswd.passwd.validation" />');
            return false;
        }
        
        $('#changePasswordForm input[name*=currentPasswd]').val(currentPasswd);
        $('#changePasswordForm input[name*=newPasswd]').val(newPasswd);
        $('#changePasswordForm input[name*=confirm]').val(confirmPasswd);

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
<div id="content-categories"><spring:message code="membership" /></div>
<h2><spring:message code="changePasswd.heading" /></h2>
<div>
    ${user.name }<br />
    ${user.mobile }<br />
</div>
<form:form id="changePasswordForm" action="changePasswd" method="post" modelAttribute="password">
<table>
<tr>
  <td><spring:message code="changePasswd.current.passwd" /></td>
  <td>
    <form:password path="currentPasswd" /><br />
    <form:errors path="currentPasswd" cssClass="error" />
  </td>
</tr>
<tr>
  <td><spring:message code="changePasswd.new.passwd" /></td>
  <td>
    <form:password path="newPasswd" /><br />
    <form:errors path="newPasswd" cssClass="error" />
  </td>
</tr>
<tr>
  <td><spring:message code="changePasswd.new.passwd.confirm" /></td>
  <td><input type="password" name="confirm" /></td>
</tr>
<tr>
  <td colspan="2"><input type="submit" value="<spring:message code="submit" />" /></td>
</tr>
</table>
</form:form>
<!-- content end -->
		</div>
	</div>
	
	<div id="sidebar" lang="en">
		<%@ include file="user-sub.jsp" %>
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