<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="bbs.write.title" /></title>
<meta name="Keywords" content="<spring:message code="bbs.write.keys" />" />
<meta name="Description" content="<spring:message code="bbs.write.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<style>
#extra  {
    display: none;
}
#content  {
    margin-right: 0;
}
textarea {
	font-size: 1.2em;
	font-weight: bold;
}
</style>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<script>
$(document).ready(function() {
   $('#writeForm').submit(function() {
      var title = $('#writeForm input[name*=title]').val();
      var content = $('#writeForm-ta').val();
      title = $.trim(title);
      content = $.trim(content);
      
      if (title.length === 0) {
          alert('<spring:message code="title.empty" />');
          $('#writeForm input[name*=title]').val('');
          return false;
      }
      
      if (content.length === 0) {
          alert('<spring:message code="content.empty" />');
          $('#writeForm-ta').val('');
          return false;
      }
      
      $('#writeForm input[name*=title]').val(title);
      $('#writeForm-ta').val(content);
   });
   
   $('#goList').click(function() {
      $('#listForm').submit(); 
   });
   
   $('#goView').click(function() {
      $('#viewForm').submit(); 
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
<div id="content-categories">${boardName }</div>

<h3><spring:message code="new.article" /></h3>
<form:form id="writeForm" action="${bbsUrl}/${boardCd}?${_csrf.parameterName}=${_csrf.token}" method="post" modelAttribute="article" enctype="multipart/form-data">
<form:errors path="*" cssClass="error" />
<table id="write-form" class="bbs-table">
<tr>
    <td><spring:message code="title" /></td>
    <td>
    	<form:input path="title" style="width: 90%" /><br />
    	<form:errors path="title" cssClass="error" />
    </td>
</tr>
<tr>
    <td colspan="2">
        <form:textarea path="content" rows="17" cols="50" id="writeForm-ta"></form:textarea><br />
        <form:errors path="content" cssClass="error" />
    </td>
</tr>
<tr>
    <td><spring:message code="attach.file" /></td>
    <td><input type="file" name="attachFile" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
    <input type="submit" value="<spring:message code="submit" />" />
    <input type="button" value="<spring:message code="list" />" id="goList" />
    <c:if test="${not empty param.articleNo }">
    <input type="button" value="<spring:message code="back.to.article" />" id="goView" />
    </c:if>
</div>
</form:form>

<div id="form-group" style="display: none">
    <form id="viewForm" action="${bbsUrl}/${boardCd }/${param.articleNo }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    <form id="listForm" action="${bbsUrl}/${boardCd }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    
    <div id="title-empty" title="<spring:message code="title.empty" />"></div>
    <div id="content-empty" title="<spring:message code="content.empty" />"></div>
</div>
<!-- content end -->
		</div>
	</div>

	<div id="sidebar" lang="en">
		<%@ include file="bbs-sub.jsp" %>
	</div>

	<div id="extra">
		
	</div>
	
	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>
	
</div>
</body>
</html>