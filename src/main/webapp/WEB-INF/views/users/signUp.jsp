<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.signup.title" /></title>
<meta name="Keywords" content="<spring:message code="user.signup.keys" />" />
<meta name="Description" content="<spring:message code="user.signup.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<script src="${ctx}/resources/js/commons.js"></script>
<script>
$(document).ready(function() {
    $('#signUpForm').submit(function() {
        var name = $('#signUpForm input[name*=name]').val();
        name = $.trim(name);
        if (name.length === 0) {
            alert('<spring:message code="fullname.validation.error" />');
            $('#signUpForm input[name*=name]').val('');
            return false;
        }
        var passwd = $('#signUpForm input[name*=passwd]').val();
        passwd = $.trim(passwd);
        if (passwd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#signUpForm input[name*=passwd]').val('');
            return false;
        }
        var confirm = $('#signUpForm input[name*=confirm]').val();
        confirm = $.trim(confirm);
        if (confirm.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#signUpForm input[name*=confirm]').val('');
            return false;
        }
        if (passwd !== confirm) {
            alert('<spring:message code="passwd.confirm.not.same" />');
            return false;
        }
        var email = $('#signUpForm input[name*=email]').val();
        email = $.trim(email);
        if (email.length === 0) {
            alert('<spring:message code="email.validation.error" />');
            $('#signUpForm input[name*=email]').val('');
            return false;
        }
        var mobile = $('#signUpForm input[name*=mobile]').val();
        mobile = $.trim(mobile);
        if (mobile.length === 0) {
            alert('<spring:message code="mobile.validation.error" />');
            $('#signUpForm input[name*=mobile]').val('');
            return false;
        }
        $('#signUpForm input[name*=name]').val(name);
        $('#signUpForm input[name*=passwd]').val(passwd);
        $('#signUpForm input[name*=confirm]').val(confirm);
        $('#signUpForm input[name*=email]').val(email);
        $('#signUpForm input[name*=mobile]').val(mobile);
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

<h2><spring:message code="signup.heading" /></h2>

<form:form id="signUpForm" action="signUp" method="post" modelAttribute="user">
    <form:errors path="*" cssClass="error" />
    <table style="width: 98%;">
        <tr>
            <td style="width: 18%;"><spring:message code="full.name" /></td>
            <td>
                <form:input path="name" style="width: 80%;" /><br />
                <form:errors path="name" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td><spring:message code="password" /></td>
            <td>
                <form:password path="passwd" style="width: 80%;" /><br />
                <form:errors path="passwd" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;font-weight: bold;">
                <spring:message code="signup.warning" />
            </td>
        </tr>
        <tr>
            <td><spring:message code="confirm" /></td>
            <td><input type="password" name="confirm" style="width: 80%;" /></td>
        </tr>
        <tr>
            <td><spring:message code="email" /></td>
            <td>
                <form:input path="email" style="width: 80%;" /><br />
                <form:errors path="email" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td><spring:message code="mobile" /></td>
            <td>
                <form:input path="mobile" style="width: 80%;" /><br />
                <form:errors path="mobile" cssClass="error" />
            </td>
        </tr>
    </table>
    <div style="text-align: center;padding-bottom: 15px;">
        <input type="submit" value="<spring:message code="submit" />" />
    </div>
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