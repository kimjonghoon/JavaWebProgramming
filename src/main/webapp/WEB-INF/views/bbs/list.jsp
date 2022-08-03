<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="bbs.list.title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="Keywords" content="<spring:message code="bbs.list.keys" />" />
<meta name="Description" content="<spring:message code="bbs.list.desc" />" />
<link rel="stylesheet" href="/resources/css/<spring:message code="lang" />.css" />
<link rel="stylesheet" href="/resources/css/screen.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/print.css" type="text/css" />
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/commons.js"></script>
<script>
$(document).ready(function() {
    $('#paging a').click(function(e) {
        e.preventDefault();
        var page = this.title;
        $('#listForm input[name*=page]').val(page);
        $('#listForm').submit();
    });
    $('.view-link').click(function(e){
        e.preventDefault();
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
        $('#viewForm').submit();
    });
    $('#write-btn').click(function() {
        $('#writeForm').submit();
    });
    $('#numPerPage').change(function() {
        var numPerPage = $('#numPerPage option:selected').val();
        if (numPerPage) {
            createCookie('numPerPage', numPerPage, '30');
            $('#listForm input[name*=page]').val('1');
            $('#listForm').submit();
        }
    });
    $('#searchForm').submit(function() {
        var $searchWord = $('#searchForm input[name*=searchWord]').val();
        $searchWord = $.trim($searchWord);
        $('#searchForm input[name*=searchWord]').val($searchWord);
        $('#searchForm').submit();
    });
});

function createCookie(name, value, days) {
    var newCookie = name + "=" + escape(value);
    if (days) {
        var expires = new Date();
        expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
        newCookie += "; expires=" + expires.toGMTString();
    }
    document.cookie = newCookie;
}
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
<div style="text-align: right;">
    <select id="numPerPage">
        <option value=""><spring:message code="num.per.page" /></option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="50">50</option>
        <option value="100">100</option>
    </select>
</div>
<table class="bbs-table">
    <tr>
        <th style="width: 60px;">NO</th>
        <th>TITLE</th>
        <th style="width: 84px;">DATE</th>
        <th style="width: 60px;">HIT</th>
    </tr>
    <!--  bbs list begin-->
    <c:set var="locale" value="${pageContext.response.locale }" />
    <c:forEach var="article" items="${list }" varStatus="status">
        <tr>
            <td style="text-align: center;">${listItemNo - status.index}</td>
            <td>
                <a href="#" title="${article.articleNo }" class="view-link">${article.title }</a>
                <c:if test="${article.attachFileNum > 0 }">
                    <img src="/resources/images/attach.png" alt="<spring:message code="attach.file" />" style="vertical-align: middle;" />
                </c:if>
                <c:if test="${article.commentNum > 0 }">
                    <span class="bbs-strong">[${article.commentNum }]</span>
                </c:if>
            </td>
            <c:set var="writeDate" value="${article.regdate }"/>
<%
Object locale = pageContext.getAttribute("locale");
java.text.DateFormat df = 
	java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT, (java.util.Locale) locale);
Object writeDate = pageContext.getAttribute("writeDate");
pageContext.setAttribute("writeDate", df.format((java.util.Date) writeDate));
%>
            <td style="text-align: center;">${writeDate }</td>
            <td style="text-align: center;">${article.hit }</td>
        </tr>
    </c:forEach>
    <!--  bbs list end -->
</table>

<div id="paging">

    <c:if test="${prevPage > 0 }">
        <a href="#" title="1">[<spring:message code="first" />]</a>
        <a href="#" title="${prevPage }">[<spring:message code="prev" />]</a>
    </c:if>

    <c:forEach var="i" begin="${firstPage }" end="${lastPage }" varStatus="stat">
        <c:choose>
            <c:when test="${param.page == i}">
                <span class="bbs-strong">${i }</span>
            </c:when>
            <c:otherwise>
                <a href="#" title="${i }">[ ${i } ]</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${nextPage > 0 }">
        <a href="#" title="${nextPage }">[<spring:message code="next" />]</a>
        <a href="#" title="${totalPage }">[<spring:message code="last" />]</a>
    </c:if>

</div>

<div id="list-menu">
    <input type="button" value="<spring:message code="new.article" />" id="write-btn" />
</div>

<form id="searchForm" method="get">
    <input type="hidden" name="page" value="1" />
    <div id="search">
        <input type="text" name="searchWord" size="15" maxlength="30" />
        <input type="submit" value="<spring:message code="search" />" />
    </div>
</form>

<div id="form-group">
    <form id="listForm" method="get">
        <input type="hidden" name="page" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </form>
    <form id="viewForm" action="/bbs/${boardCd }/" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
    </form>
    <form id="writeForm" action="/bbs/${boardCd }/new" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="searchWord" value="${param.searchWord }" />
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
