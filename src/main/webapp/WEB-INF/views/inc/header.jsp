<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="<%=request.getContextPath() %>" scope="application" />
<div style="float: left;width: 150px;position: relative;top: 7px;"><a href="${ctx}/"><img src="${ctx}/resources/images/ci.gif" alt="java-school" /></a></div>

<!-- 2025.9.9 fixed for only spring security taglibs-->
<div id="memberMenu" style="float: right;position: relative;top: 7px;">
<!-- 
    <security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <security:authentication property="principal.username" var="check" />
    </security:authorize> 
    <c:choose>
        <c:when test="${empty check}"> -->
    <security:authorize access="!isAuthenticated()">    
            <input type="button" value="<spring:message code="login" />" onclick="location.href = '${ctx}/users/login'" />
            <input type="button" value="<spring:message code="signup" />" onclick="location.href = '${ctx}/users/signUp'" />
    </security:authorize>        
<!--            
        </c:when>
        <c:otherwise> -->
    <security:authorize access="isAuthenticated()">    
            <input type="button" value="<spring:message code="logout" />" id="logout" />
            <input type="button" value="<spring:message code="modify.account" />" onclick="location.href = '${ctx}/users/editAccount'" />
    </security:authorize>        
<!--            
        </c:otherwise>
	</c:choose> -->
	<security:authorize access="hasRole('ADMIN')">
		<input type="button" value="Admin" onclick="location.href='${ctx }/admin'" />
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
  <input type="button" value="English" onclick="location.href = '${english}'" />
  <input type="button" value="Korean" onclick="location.href = '${korean }'" />
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