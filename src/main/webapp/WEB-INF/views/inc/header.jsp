<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="<%=request.getContextPath() %>" scope="application" />
<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="${ctx}/"><img src="${ctx}/resources/images/ci.gif" alt="java-school" /></a></div>

<div id="memberMenu" style="float: right;position: relative;top: 7px;">
	<security:authorize access="!isAuthenticated()">    
		<a href="${ctx}/users/login"></a><button type="button"><spring:message code="login" /></button></a>
		<a href="${ctx}/users/signUp"><button type="button"><spring:message code="signup" /></button></a>
	</security:authorize>        
	<security:authorize access="isAuthenticated()">    
		<button type="button" id="logout"><spring:message code="logout" /></button>
		<a href="${ctx}/users/editAccount"><button type="button"><spring:message code="modify.account" /></button></a>
	</security:authorize>        
	<security:authorize access="hasRole('ADMIN')">
		<a href="${ctx }/admin?page=1"><button type="button">Admin</button></a>
	</security:authorize>
</div>
<%
String url = "";
String english = "";
String korean = "";
String qs = request.getQueryString();
if (qs != null) {
  if (qs.indexOf("&lang=") != -1) {
    qs = qs.substring(0, qs.indexOf("&lang="));
  }
  if (qs.indexOf("lang=") != -1) {
    qs = qs.substring(0, qs.indexOf("lang="));
  }
  if (!qs.equals("")) {
    String decodedQueryString = java.net.URLDecoder.decode(request.getQueryString(), "UTF-8");
    url = "?" + decodedQueryString;
    if (url.indexOf("&lang=") != -1) {
      url = url.substring(0, url.indexOf("&lang="));
    }
    english = url + "&lang=en";
    korean = url + "&lang=ko";
  } else {
    english = url + "?lang=en";
    korean = url = "?lang=ko";
  }
} else {
  english = url + "?lang=en";
  korean = url = "?lang=ko";
}
pageContext.setAttribute("english", english);
pageContext.setAttribute("korean", korean);
%>
<div id="localeChangeMenu" style="float: right;position: relative;top: 7px;margin-right: 10px;">
	<a href="${english}"><button type="button">english</button></a>
	<a href="${korean}"><button type="button">korean</button></a>
</div>
<form:form id="logoutForm" style="display:none" action="${ctx}/logout" method="post">
</form:form>
<script>
$(document).ready(function () {
  $('#logout').click(function () {
    $('#logoutForm').submit();
    return false;
  });
});
</script>