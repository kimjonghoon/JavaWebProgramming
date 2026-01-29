<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="<spring:message code="lang" />">
<head>
<meta charset="UTF-8" />
<title><spring:message code="bbs.view.title" /></title>
<meta name="Keywords" content="<spring:message code="bbs.view.keys" />" />
<meta name="Description" content="<spring:message code="bbs.view.desc" />" />
<%@ include file="../inc/common-meta-links-scripts.jsp" %>
<script src="<c:url value="/resources/js/commons.js"/>"></script>
<!-- for pretty code begin -->
<link rel="stylesheet" href="<c:url value="/resources/css/prettify.css"/>" type="text/css" />
<script src="<c:url value="/resources/js/run_prettify.js"/>"></script>
<!-- for pretty code end -->
<link rel="stylesheet" href="<c:url value="/resources/css/bbs-view.css"/>" type="text/css" />
<c:url var="commentsUrl" value="/comments"/>
<script>
function displayComments() {
    var url = '${commentsUrl}/' + ${articleNo};
    $.getJSON(url, function (data) {
        $('#all-comments').empty();
        $.each(data, function (i, item) {
	    var creation = new Intl.DateTimeFormat('<spring:message code="lang" />', {dateStyle: 'medium', timeStyle: 'medium'}).format(new Date(item.regdate));
            var comments = '<div class="comments">'
                    + '<span class="writer">' + item.name + '</span>'
                    + '<span class="date">' + creation + '</span>';
            if (item.editable === true) {
                comments = comments
                        + '<span class="modify-del">'
                        + '<a href="#" class="comment-modify-link">' + '<spring:message code="modify" />' + '</a> | '
                        + '<a href="#" class="comment-delete-link" title="' + item.commentNo + '">' + '<spring:message code="delete" />' + '</a>'
                        + '</span>';
            }
            comments = comments
                    + '<div class="comment-memo">' + item.memo + '</div>'
                    + '<form class="comment-form" action="${commentsUrl}/' + ${articleNo } + '/' + item.commentNo + '" method="put" style="display: none;">'
                    + '<div style="text-align: right;">'
                    + '<a href="#" class="comment-modify-submit-link">' + '<spring:message code="submit" />' + '</a> | <a href="#" class="comment-modify-cancel-link">' + '<spring:message code="cancel" />' + '</a>'
                    + '</div>'
                    + '<div>'
                    + '<textarea class="comment-textarea" name="memo" rows="7" cols="50">' + item.memo + '</textarea>'
                    + '</div>'
                    + '</form>'
                    + '</div>';
            $('#all-comments').append(comments);
            //console.log(item);
        });
    });
}

$(document).ready(function () {
    displayComments();
    $('title').empty();
    var title = $('#bbs-title').html();
    $('title').append(title);
    
    $('#file-list a.download').click(function (e) {
        e.preventDefault();
        var filename = this.title;
	var fileno = $(this).attr('href');
        $('#downForm input[name*=filename]').val(filename);
        $('#downForm input[name*=fileno]').val(fileno);
        $('#downForm').submit();
    });
    $('#file-list a:not(.download)').click(function (e) {
        e.preventDefault();
        var chk = confirm('<spring:message code="delete.confirm" />');
        if (chk === true) {
            var attachFileNo = this.title;
            $('#deleteAttachFileForm input[name*=attachFileNo]').val(attachFileNo);
            $('#deleteAttachFileForm').submit();
        }
    });
    //2022.10.22 added
    $('#next-article-link').click(function (e) {
        e.preventDefault();
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
	var firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
        if (parseInt(articleNo) > parseInt(firstItemNo)) {
        	$('#viewForm-page').val(${param.page - 1});
	}
        $('#viewForm').submit();
    });
    //2022.10.18 added
    $('#prev-article-link').click(function (e) {
        e.preventDefault();
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
	//2022.10.22 added
        var lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
        if (parseInt(articleNo) < parseInt(lastItemNo)) {
		$('#viewForm-page').val(${param.page + 1});
	}
        $('#viewForm').submit();
    });
    /* 2022.10.18 removed 
    $('.next-prev a').click(function (e) {
        e.preventDefault();
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
        $('#viewForm').submit();
    }); */
    //Modify Button
    $('.goModify').click(function () {
        $('#modifyForm').submit();
    });
    //Del Button
    $('.goDelete').click(function () {
        var chk = confirm('<spring:message code="delete.confirm" />');
        if (chk === true) {
            $('#delForm').submit();
        }
    });
    //Next Article Button
    $('.next-article').click(function () {
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
	//2022.10.22 added
	var firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
        if (parseInt(articleNo) > parseInt(firstItemNo)) {
		$('#viewForm-page').val(${param.page - 1});
	}
        $('#viewForm').submit();
    });
    //Prev Article Button
    $('.prev-article').click(function () {
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
	//2022.10.22 added
        var lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
        if (parseInt(articleNo) < parseInt(lastItemNo)) {
		$('#viewForm-page').val(${param.page + 1});
	}
        $('#viewForm').submit();
    });
    //List Button
    $('.goList').click(function () {
        $('#listForm').submit();
    });
    //Write Button
    $('.goWrite').click(function () {
        $('#writeForm').submit();
    });
    //Title Link in view.jsp
    $('#list-table a').click(function (e) {
        e.preventDefault();
        var articleNo = this.title;
        var action = $('#viewForm').attr('action');
        action += articleNo;
        $('#viewForm').attr('action', action);
        $('#viewForm').submit();
    });
    //Paging
    $('#paging a').click(function (e) {
        e.preventDefault();
        var page = this.title;
        $('#listForm input[name*=page]').val(page);
        $('#listForm').submit();
    });
    //Write Button on Search Button
    $('#list-menu > input').click(function () {
        $('#writeForm').submit();
    });
    $('#searchForm').submit(function() {
        var $search = $('#searchForm input[name*=search]').val();
        $search = $.trim($search);
        $('#searchForm input[name*=search]').val($search);
        $('#searchForm').submit();
    });
    $("#addCommentForm").submit(function (event) {
        event.preventDefault();
        var $form = $(this);
        var memo = $('#addComment-ta').val();
        memo = $.trim(memo);
        if (memo.length === 0) {
            $('#addComment-ta').val('');
            return false;
        }
        var dataToBeSent = $form.serialize();
        var url = $form.attr("action");
        var posting = $.post(url, dataToBeSent);
        posting.done(function () {
            displayComments();
            $('#addComment-ta').val('');
        });
    });    
    if ($('#article-content iframe').length) {
      const width = $('#article-content').width();
      $('#article-content iframe').each(function(index,element) {
        let originWidth = $(element).width();
        let originHeight = $(element).height();
        let height = originHeight * width / originWidth;
        $(element).css({'width':width,'height':height,'allowFullScreen':''});
      });
    }
    $('#article-content img').click(function(event) {
		toggleFullScreen(event.target);
	});
    function toggleFullScreen(elem) {
        elem = elem || document.documentElement;

        // Check if already fullscreen
        if (!document.fullscreenElement &&
            !document.mozFullScreenElement &&
            !document.webkitFullscreenElement &&
            !document.msFullscreenElement) {
            
            // Enter fullscreen
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { // Firefox
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { // Chrome, Safari, Opera
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { // IE/Edge
                elem.msRequestFullscreen();
            }
        } else {
            // Exit fullscreen
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    }	
});

$(document).on('click', '#all-comments', function (e) {
    if ($(e.target).is('.comment-modify-link')) {
        e.preventDefault();
        var $form = $(e.target).parent().parent().find('.comment-form');
        var $div = $(e.target).parent().parent().find('.comment-memo');

        if ($form.is(':hidden') === true) {
            $form.show();
            $div.hide();
        } else {
            $form.hide();
            $div.show();
        }
    } else if ($(e.target).is('.comment-modify-cancel-link')) {
        e.preventDefault();
        var $form = $(e.target).parent().parent().parent().find('.comment-form');
        var $div = $(e.target).parent().parent().parent().find('.comment-memo');

        if ($form.is(':hidden') === true) {
            $form.show();
            $div.hide();
        } else {
            $form.hide();
            $div.show();
        }
    } else if ($(e.target).is('.comment-modify-submit-link')) {
        e.preventDefault();
        var $form = $(e.target).parent().parent().parent().find('.comment-form');
        var $textarea = $(e.target).parent().parent().find('.comment-textarea');
        var memo = $textarea.val();
        $('#modifyCommentForm input[name*=memo]').val(memo);
        var dataToBeSent = $('#modifyCommentForm').serialize();
        var url = $form.attr("action");
        $.ajax({
            url: url,
            type: 'POST',
            data: dataToBeSent,
            success: function () {
                displayComments();
            },
            error: function () {
                alert('error!');
            }
        });
    } else if ($(e.target).is('.comment-delete-link')) {
        e.preventDefault();
        var chk = confirm('<spring:message code="delete.confirm" />');
        if (chk === false) {
            return;
        }
        var $commentNo = $(e.target).attr('title');
        var url = $('#deleteCommentForm').attr('action');
        url += $commentNo;
        var dataToBeSent = $('#deleteCommentForm').serialize();
        $.ajax({
            url: url,
            type: 'POST',
            data: dataToBeSent,
            success: function () {
                displayComments();
            },
            error:function(request,status,error){
                console.log("code:" + request.status 
                		+ "\n" + "message:" + request.responseText 
                		+ "\n" + "error:" + error);
            }
        });
    }
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

<div class="view-menu" style="margin-top: 15px;margin-bottom: 5px;">
    <security:authorize access="#email == principal.username or hasAuthority('ROLE_ADMIN')">
        <div class="fl">
            <button type="button" class="goModify"><spring:message code="modify" /></button>
            <button type="button" class="goDelete"><spring:message code="delete" /></button>
        </div>
    </security:authorize>        
    <div class="fr">
        <c:if test="${nextArticle != null }">    
            <button type="button" title="${nextArticle.articleNo }" class="next-article"><spring:message code="next.article" /></button>
        </c:if>
        <c:if test="${prevArticle != null }">        
            <button type="button" title="${prevArticle.articleNo}" class="prev-article"><spring:message code="prev.article" /></button>
        </c:if>        
        <button type="button" class="goList"><spring:message code="list" /></button>
        <button type="button" class="goWrite"><spring:message code="new.article" /></button>
    </div>
</div>

<table class="bbs-table">
    <tr>
        <th style="width: 47px;text-align: left;vertical-align: top;font-size: 1em;">TITLE</th>
        <th style="text-align: left;color: #555;font-size: 1em;" id="bbs-title">${title }</th>
    </tr>
</table>
<div id="detail">
    <div id="date-writer-hit">edited ${regdate } by ${name } hit ${hit }</div>
    <div id="article-content">${content }</div>
    <div id="file-list" style="text-align: right">
        <c:forEach var="file" items="${attachFileList }" varStatus="status">
            <div id="attachfile${file.attachFileNo }" class="attach-file">
		<a href="${file.attachFileNo }" title="${file.filename }" class="download">${file.filename }</a>
                <security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')">
                <a href="#" title="${file.attachFileNo }"><spring:message code="delete" /></a>
                </security:authorize>
            </div>
        </c:forEach>
    </div>
</div>

<form:form id="addCommentForm" action="${commentsUrl}/${articleNo }" method="post" style="margin: 10px 0;">
    <div id="addComment">
        <textarea id="addComment-ta" name="memo" rows="7" cols="50"></textarea>
    </div>
    <div style="text-align: right;">
        <input type="submit" value="<spring:message code="new.comments" />" />
    </div>
</form:form>

<!--  comments begin -->
<div id="all-comments">
</div>
<!--  comments end -->

<div class="next-prev">
    <c:if test="${nextArticle != null }">
        <p><spring:message code="next.article" /> : <a href="#" title="${nextArticle.articleNo }" id="next-article-link">${nextArticle.title }</a></p>
    </c:if>
    <c:if test="${prevArticle != null }">
        <p><spring:message code="prev.article" /> : <a href="#" title="${prevArticle.articleNo }" id="prev-article-link">${prevArticle.title }</a></p>
    </c:if>
</div>

<div class="view-menu" style="margin-bottom: 47px;">
    <security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')">
        <div class="fl">
            <button type="button" class="goModify"><spring:message code="modify" /></button>
            <button type="button" class="goDelete"><spring:message code="delete" /></button>
        </div>
    </security:authorize>        
    <div class="fr">
        <c:if test="${nextArticle != null }">    
            <button type="button" title="${nextArticle.articleNo }" class="next-article"><spring:message code="next.article" /></button>
        </c:if>
        <c:if test="${prevArticle != null }">        
            <button type="button" title="${prevArticle.articleNo}" class="prev-article"><spring:message code="prev.article" /></button>
        </c:if>        
        <button type="button" class="goList"><spring:message code="list" /></button>
        <button type="button" class="goWrite"><spring:message code="new.article" /></button>
    </div>
</div>

<!--  BBS list in detailed Article -->
<table id="list-table" class="bbs-table">
    <tr>
        <th style="width: 60px;">NO</th>
        <th>TITLE</th>
        <th style="width: 84px;">DATE</th>
        <th style="width: 60px;">HIT</th>
    </tr>
	<c:set var="locale" value="${pageContext.response.locale }" />
    <c:forEach var="article" items="${list }" varStatus="status">        
        <tr>
            <td style="text-align: center;">
                <c:choose>
                    <c:when test="${articleNo == article.articleNo }">	
                        <img src="${staticUrl}/images/arrow.gif" alt="<spring:message code="here" />" />
                    </c:when>
                    <c:otherwise>
                        ${pagingNumbers.listItemNo - status.index }
                    </c:otherwise>
                </c:choose>	
            </td>
            <td>
                <a href="#" title="${article.articleNo }">${article.title }</a>
                <c:if test="${article.attachFileNum > 0 }">		
                    <img src="${staticUrl}/images/attach.png" alt="<spring:message code="attach.file" />" style="vertical-align: middle;" />
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
</table>

<div id="paging">
    <c:if test="${pagingNumbers.finalOfPrevGroup > 0 }">
        <a href="#" title="1">[<spring:message code="first" />]</a>
        <a href="#" title="${pagingNumbers.finalOfPrevGroup }">[<spring:message code="prev" />]</a>
    </c:if>

    <c:forEach var="i" begin="${pagingNumbers.startPage }" end="${pagingNumbers.finalPage }">
        <c:choose>
            <c:when test="${param.page == i }">
                <span class="bbs-strong">${i }</span>
            </c:when>	
            <c:otherwise>	
                <a href="#" title="${i }">[ ${i } ]</a>
            </c:otherwise>
        </c:choose>			
    </c:forEach>

    <c:if test="${pagingNumbers.startOfNextGroup > 0 }">
        <a href="#" title="${pagingNumbers.startOfNextGroup }">[<spring:message code="next" />]</a>
        <a href="#" title="${pagingNumbers.lastPage }">[<spring:message code="last" />]</a>
    </c:if>
</div>

<div id="list-menu">
    <button type="button" class="goWrite"><spring:message code="new.article" /></button>
</div>
<form id="searchForm" action="${bbsUrl}/${boardCd }" method="get">
    <input type="hidden" name="page" value="1" />
    <div id="search">
        <input type="text" name="search" size="15" maxlength="30" />
        <input type="submit" value="<spring:message code="search" />" />
    </div>
</form>

<div id="form-group" style="display: none">
    <form id="listForm" action="${bbsUrl}/${boardCd }" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    <form id="viewForm" action="${bbsUrl}/${boardCd }/" method="get">
        <input type="hidden" name="page" value="${param.page }" id="viewForm-page" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    <form id="writeForm" action="${bbsUrl}/${boardCd}/new" method="get">
        <input type="hidden" name="articleNo" value="${articleNo }" />
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    <form:form id="delForm" action="${bbsUrl}/${boardCd }/${articleNo }" method="delete">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form:form>
    <form id="modifyForm" action="${bbsUrl}/${boardCd }/${articleNo }/edit" method="get">
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form>
    <form:form id="deleteAttachFileForm" action="${bbsUrl}/deleteAttachFile" method="delete">
        <input type="hidden" name="attachFileNo" />
        <input type="hidden" name="articleNo" value="${articleNo }" />
        <input type="hidden" name="boardCd" value="${boardCd }" />
        <input type="hidden" name="page" value="${param.page }" />
        <input type="hidden" name="search" value="${param.search }" />
    </form:form>
    <c:url var="dataUrl" value="/data"/>
    <form:form id="downForm" action="${dataUrl}" method="get">
        <input type="hidden" name="filename" />
        <input type="hidden" name="fileno" />
    </form:form>
    <form:form id="modifyCommentForm" method="put">
    	<input type="hidden" name="memo" />
    </form:form>
    <form:form id="deleteCommentForm" action="${commentsUrl}/${articleNo }/" method="delete">
    </form:form>
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
