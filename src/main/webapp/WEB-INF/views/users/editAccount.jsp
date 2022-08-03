<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.editaccount.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="user.editaccount.keys" />" />
<meta name="Description" content="<spring:message code="user.editaccount.desc" />" />
<link rel="stylesheet" href="/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/print.css" type="text/css" />
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/commons.js"></script>
<script>
$(document).ready(function() {
    $('#editAccountForm').submit(function(){
        var name = $('#editAccountForm input[name*=name]').val();
        name = $.trim(name);
        if (name.length === 0) {
            alert('<spring:message code="fullname.validation.error" />');
            $('#editAccountForm input[name*=name]').val('');
            return false;
        }
        var mobile = $('#editAccountForm input[name*=mobile]').val();
        mobile = $.trim(mobile);
        if (mobile.length === 0) {
            alert('<spring:message code="mobile.validation.error" />');
            $('#editAccountForm input[name*=mobile]').val('');
            return false;
        }
        var passwd = $('#editAccountForm input[name*=passwd]').val();
        passwd = $.trim(passwd);
        if (passwd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#editAccountForm input[name*=passwd]').val('');
            return false;            
        }
        $('#editAccountForm input[name*=name]').val(name);
        $('#editAccountForm input[name*=mobile]').val(mobile);
        $('#editAccountForm input[name*=passwd]').val(passwd);
            
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
<h2><spring:message code="editAccount.heading" /></h2>
<p>
    <spring:message code="editAccount.content" />
    <a href="changePasswd"><spring:message code="change.password" /></a><br />
</p>
<sf:form id="editAccountForm" action="editAccount" method="post" modelAttribute="user">
    <sf:hidden path="email" value="abc@def.ghi" />
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