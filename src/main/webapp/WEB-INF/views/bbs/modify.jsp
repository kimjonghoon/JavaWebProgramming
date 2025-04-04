<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="bbs.modify.title" /></title>
<meta name="Keywords" content="<spring:message code="bbs.modify.keys" />" />
<meta name="Description" content="<spring:message code="bbs.modify.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<script src="${ctx}/resources/js/commons.js"></script>
<script>
$(document).ready(function() {
   $('#modifyForm').submit(function() {
      var title = $('#modifyForm input[name*=title]').val();
      var content = $('#modifyForm-ta').val();
      title = $.trim(title);
      content = $.trim(content);

      if (title.length === 0) {
          alert('<spring:message code="title.empty" />');
          $('#modifyForm input[name*=title]').val('');
          return false;
      }
      
      if (content.length === 0) {
          alert('<spring:message code="content.empty" />');
          $('#modifyForm-ta').val('');
          return false;
      }

      $('#modifyForm input[name*=title]').val(title);
      $('#modifyForm-ta').val(content);
   });
   
   $('#goView').click(function(){
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

<h3><spring:message code="modify" /></h3>

<form:form id="modifyForm" action="${ctx}/bbs/${boardCd}/${articleNo}?${_csrf.parameterName}=${_csrf.token}" method="post" modelAttribute="article" enctype="multipart/form-data">
<input type="hidden" name="page" value="${param.page }" />
<input type="hidden" name="search" value="${param.search }" />
<form:errors path="*" cssClass="error"/>
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
		<form:textarea path="content" rows="17" cols="50" id="modifyForm-ta" /><br />
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
	<input type="button" value="<spring:message code="back.to.article" />" id="goView" />
</div>
</form:form>
		
<div id="form-group" style="display: none">
    <form id="viewForm" action="${ctx}/bbs/${boardCd }/${articleNo }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
</div>
<!-- content end -->
		</div>
	</div>
	
	<div id="sidebar" lang="en">
		<%@ include file="bbs-sub.jsp" %>
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
