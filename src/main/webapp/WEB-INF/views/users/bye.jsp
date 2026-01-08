<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="user.bye.title" /></title>
<meta name="Keywords" content="<spring:message code="user.bye.keys" />" />
<meta name="Description" content="<spring:message code="user.bye.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<c:url var="staticUrl" value="/resources"/>
<script src="${staticUrl}/js/commons.js"></script>
<script>
$(document).ready(function() {
    $('#byeForm').submit(function(){
        var email = $('#byeForm input[name*=email]').val();
        email = $.trim(email);
        if (email.length === 0) {
            alert('<spring:message code="email.validation.error" />');
            $('#byeForm input[name*=email]').val('');
            return false;
        }
        var passwd = $('#byeForm input[name*=passwd]').val();
        passwd = $.trim(passwd);
        if (passwd.length === 0) {
            alert('<spring:message code="passwd.validation.error" />');
            $('#byeForm input[name*=passwd]').val('');
            return false;                
        }
        $('#byeForm input[name*=email]').val(email);
        $('#byeForm input[name*=passwd]').val(passwd);
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
<h2><spring:message code="bye.heading" /></h2>
<form id="byeForm" action="bye" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <table>
        <tr>
            <td><spring:message code="email" /></td>
            <td><input type="text" name="email" /></td>
        </tr>
        <tr>
            <td><spring:message code="password" /></td>
            <td><input type="password" name="passwd" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="<spring:message code="submit" />" /></td>
        </tr>
    </table>
</form>
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