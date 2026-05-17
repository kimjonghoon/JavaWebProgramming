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
<script src="<c:url value="/resources/js/prettify.js"/>"></script>
<!-- for pretty code end -->
<c:url var="commentsUrl" value="/comments"/>
<script>
function escapeHtml(str) {
    if (typeof str !== "string") return "";
    return str
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;");
}
function displayComments() {
	const url = '${commentsUrl}/' + ${articleNo};
	$.getJSON(url, function (data) {
		$('#all-comments').empty();
		$.each(data, function (i, item) {
			const creation = new Intl.DateTimeFormat('<spring:message code="lang" />', {dateStyle: 'medium', timeStyle: 'medium'}).format(new Date(item.regdate));
			let comments = '<div class="comments">' 
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
				+ '<div class="comment-memo">' + escapeHtml(item.memo) + '</div>'
				+ '<form class="comment-form" action="${commentsUrl}/' + ${articleNo } + '/' + item.commentNo + '" method="put" style="display: none;">'
				+ '<div style="text-align: right;">'
				+ '<a href="#" class="comment-modify-submit-link">' + '<spring:message code="submit" />' + '</a> | <a href="#" class="comment-modify-cancel-link">' + '<spring:message code="cancel" />' + '</a>'
				+ '</div>'
				+ '<div>'
				+ '<textarea class="comment-textarea" name="memo" rows="7" cols="50">' + escapeHtml(item.memo) + '</textarea>'
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
	const title = $('#bbs-title').html();
	$('title').append(title);
	
	$('#file-list a.download').click(function (e) {
		e.preventDefault();
		const filename = this.title;
		const fileno = $(this).attr('href');
		$('#downForm input[name*=filename]').val(filename);
		$('#downForm input[name*=fileno]').val(fileno);
		$('#downForm').submit();
	});
	
	$('#file-list a:not(.download)').click(function (e) {
		e.preventDefault();
		const chk = confirm('<spring:message code="delete.confirm" />');
		if (chk === true) {
			const attachFileNo = this.title;
			$('#deleteAttachFileForm input[name*=attachFileNo]').val(attachFileNo);
			$('#deleteAttachFileForm').submit();
		}
	});
	
	$('#next-article-link').click(function (e) {
		e.preventDefault();
		const articleNo = this.title;
		let action = $('#viewForm').attr('action');
		action += articleNo;
		$('#viewForm').attr('action', action);
		const firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
		if (parseInt(articleNo) > parseInt(firstItemNo)) {
			$('#viewForm-page').val(${param.page - 1});
		}
		$('#viewForm').submit();
	});
	
	$('#prev-article-link').click(function (e) {
		e.preventDefault();
		const articleNo = this.title;
		let action = $('#viewForm').attr('action');
		action += articleNo;
		$('#viewForm').attr('action', action);
		const lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
		if (parseInt(articleNo) < parseInt(lastItemNo)) {
			$('#viewForm-page').val(${param.page + 1});
		}
		$('#viewForm').submit();
	});
	//Modify Button
	$('.goModify').click(function () {
		$('#modifyForm').submit();
	});
	//Del Button
	$('.goDelete').click(function () {
		const chk = confirm('<spring:message code="delete.confirm" />');
		if (chk === true) {
			$('#delForm').submit();
		}
	});
	//Next Article Button
	$('.next-article').click(function () {
		const articleNo = this.title;
		let action = $('#viewForm').attr('action');
		action += articleNo;
		$('#viewForm').attr('action', action);
		const firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
		if (parseInt(articleNo) > parseInt(firstItemNo)) {
			$('#viewForm-page').val(${param.page - 1});
		}
		$('#viewForm').submit();
	});
	//Prev Article Button
	$('.prev-article').click(function () {
		const articleNo = this.title;
		let action = $('#viewForm').attr('action');
		action += articleNo;
		$('#viewForm').attr('action', action);
		const lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
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
		const articleNo = this.title;
		let action = $('#viewForm').attr('action');
		action += articleNo;
		$('#viewForm').attr('action', action);
		$('#viewForm').submit();
	});
	//Paging
	$('#paging a').click(function (e) {
		e.preventDefault();
		const page = this.title;
		$('#listForm input[name*=page]').val(page);
		$('#listForm').submit();
	});
	//Write Button on Search Button
	$('#list-menu > input').click(function () {
		$('#writeForm').submit();
	});
	$('#searchForm').submit(function() {
		const $search = $('#searchForm input[name*=search]').val().trim();
		$('#searchForm input[name*=search]').val($search);
		$('#searchForm').submit();
	});
	$("#addCommentForm").submit(function (event) {
		event.preventDefault();
		const $form = $(this);
		const memo = $('#addComment-ta').val().trim();
		if (memo.length === 0) {
			$('#addComment-ta').val('');
			return false;
		}
		const dataToBeSent = $form.serialize();
		const url = $form.attr("action");
		const posting = $.post(url, dataToBeSent);
		posting.done(function () {
			displayComments();
			$('#addComment-ta').val('');
		});
	});
	//[img],[code],[vid],[txt]를 HTML 엘리먼트로 바꿈
	$('#article-content').html(function() {
		return $(this).html().replace(/\[img\]/g,'<p class="images">')
					.replace(/\[\/img\]/g,'</p>')
					.replace(/\[img100\]/g,'<p class="image">')
					.replace(/\[\/img100\]/g,'</p>')
					.replace(/\[code\]/g,'<pre class="prettyprint">')
					.replace(/\[\/code\]/g,'</pre>')
					.replace(/\[vid\]/g,'<p class="videos">')
					.replace(/\[\/vid\]/g,'</p>')
					.replace(/\[txt\]/g,'<p class="text">')
					.replace(/\[\/txt\]/g,'</p>')
					.replace(/\[link\]/g,'<p class="links">')
					.replace(/\[\/link\]/g,'</p>');
	});
	//동영상 태그 활성
	if ($('#article-content .videos').length) {
		$('#article-content .videos').html(function() {
			return $(this).html().replace(/\&lt;/g,"<").replace(/\&gt;/g,">");
		});
		$('#article-content .videos').contents().not('iframe').remove();
	}
	//동영상 너비와 속성 조정
	if ($('#article-content iframe').length) {
		const width = $('#article-content').width();
		$('#article-content iframe').each(function(index,element) {
			const originWidth = $(element).width();
			const originHeight = $(element).height();
			const height = originHeight * width / originWidth;
			$(element).css({'width':width,'height':height,'allow':'fullscreen'})
		});
	}
	//글
	if ($('#article-content .text').length) {
		$('#article-content .text').html(function() {
			return $(this).html().trim().replace(/\n\r?/g, "<br />");
		});
	}
	//링크 태그 활성
	if ($('#article-content .links').length) {
		$('#article-content .links').html(function() {
			return $(this).html().replace(/\&lt;/g,"<").replace(/\&gt;/g,">");
		});
		$('#article-content .links').contents().not('a').remove();
	}
	// 이미지 태그 활성
	if ($('#article-content .image').length) {
		$('#article-content .image').html(function() {
			return $(this).html().replace(/\&lt;/g,"<").replace(/\&gt;/g,">");
		});
		$('#article-content .image').contents().not('img').remove();
		$('#article-content .image').find('img').css('width','100%');
	}
	//이미지 태그 생성
	if ($('#article-content .images').length) {
		$('#article-content .images').each(function(idx,element) {
			const str = $(element).html();
			const lines = str.split(/\n\r?/);
			$.each(lines, function(index, line) {
				if ($.trim(line) === '') {
					return true;
				}
				let imgTag = $('<img/>').attr('src',line).attr('alt','img ' + (idx+1) + '' + (index+1));
				imgTag.css({'width':'105px','height': 'auto'});
				$(element).append(imgTag);
			});
			$(element).contents().filter(function() {
				return this.nodeType === 3;
			}).remove();
			//$(element).css({'float': 'left'});
		});
		//$('#article-content .images').contents().not('img').remove();
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
	//코드
	prettyPrint();
	$('pre.prettyprint').html(function() {
		return this.innerHTML.replace(/\t/g,'&nbsp;&nbsp;')
	});	
});
$(document).on('click', '#all-comments', function (e) {
	if ($(e.target).is('.comment-modify-link')) {
		e.preventDefault();
		const $form = $(e.target).parent().parent().find('.comment-form');
		const $div = $(e.target).parent().parent().find('.comment-memo');
		
		if ($form.is(':hidden') === true) {
			$form.show();
			$div.hide();
		} else {
			$form.hide();
			$div.show();
		}
	} else if ($(e.target).is('.comment-modify-cancel-link')) {
		e.preventDefault();
		const $form = $(e.target).parent().parent().parent().find('.comment-form');
		const $div = $(e.target).parent().parent().parent().find('.comment-memo');
		
		if ($form.is(':hidden') === true) {
			$form.show();
			$div.hide();
		} else {
			$form.hide();
			$div.show();
		}
	} else if ($(e.target).is('.comment-modify-submit-link')) {
		e.preventDefault();
		const $form = $(e.target).parent().parent().parent().find('.comment-form');
		const $textarea = $(e.target).parent().parent().find('.comment-textarea');
		const memo = $textarea.val();
		$('#modifyCommentForm input[name*=memo]').val(memo);
		const dataToBeSent = $('#modifyCommentForm').serialize();
		const url = $form.attr("action");
		
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
		const chk = confirm('<spring:message code="delete.confirm" />');
		if (chk === false) {
			return;
		}
		const $commentNo = $(e.target).attr('title');
		let url = $('#deleteCommentForm').attr('action');
		url += $commentNo;
		const dataToBeSent = $('#deleteCommentForm').serialize();
		
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
<style>
#article-content > p {
	font-size: 1.2em;
}
#article-content > pre {
	font-size: 1.2em;
}
#article-content > pre.prettyprint {
	margin: 0.4em 0;
	font-size: 1.1em;
	border: 0;
}
#article-content img {
	max-width: 100%;
}
</style>
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
	<th style="text-align: left;color: #555;font-size: 1em;" id="bbs-title"><c:out value="${title }"/></th>
    </tr>
</table>
<div id="detail">
    <div id="date-writer-hit">edited ${regdate } by ${name } hit ${hit }</div>
    <div id="article-content"><c:out value="${content}" /></div>
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
        <p><spring:message code="next.article" /> : <a href="#" title="${nextArticle.articleNo }" id="next-article-link"><c:out value="${nextArticle.title }"/></a></p>
    </c:if>
    <c:if test="${prevArticle != null }">
        <p><spring:message code="prev.article" /> : <a href="#" title="${prevArticle.articleNo }" id="prev-article-link"><c:out value="${prevArticle.title }"/></a></p>
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
                <a href="#" title="${article.articleNo }"><c:out value="${article.title }"/></a>
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
java.text.DateFormat df = java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT, (java.util.Locale) locale);
Object writeDate = pageContext.getAttribute("writeDate");
pageContext.setAttribute("writeDate", df.format((java.util.Date) writeDate));
%>           
            <td style="text-align: center;font-size: 0.8em;">${writeDate }</td>
            <td style="text-align: center;font-size: 0.8em;">${article.hit }</td>
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
