<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>JSP</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li><a href="<c:url value="/jsp/tomcat-install"/>">톰캣 설치</a></li>
	    <li><a href="<c:url value="/jsp/namecard-webapp"/>">명함관리 웹 애플리케이션</a></li>
	    <li><a href="<c:url value="/jsp/web-application"/>">웹 애플리케이션이란?</a></li>
	    <li><a href="<c:url value="/jsp/servlets"/>">서블릿</a></li>
	    <li><a href="<c:url value="/jsp/jsp-basics"/>">JSP</a></li>
	    <li><a href="<c:url value="/jsp/using-jdbc"/>">데이터베이스 연동</a></li>
	    <li class="sub-heading">게시판</li>
	    <li><a href="<c:url value="/jsp/bbs-basics"/>">게시판 기본</a></li>
	    <li><a href="<c:url value="/jsp/thread-bbs"/>">계층형 게시판</a></li>
	    <li><a href="<c:url value="/jsp/model-1-bbs"/>">모델 1 게시판</a></li>
	    <li><a href="<c:url value="/jsp/datasource"/>">데이터소스</a></li>
	    <li><a href="<c:url value="/jsp/model-2-bbs"/>">모델 2 게시판</a></li>	    
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
	    <li><a href="<c:url value="/jsp/tomcat-install"/>">Tomcat Install</a></li>
	    <li><a href="<c:url value="/jsp/namecard-webapp"/>">Namecard Web App</a></li>
	    <li><a href="<c:url value="/jsp/web-application"/>">Web Application?</a></li>
	    <li><a href="<c:url value="/jsp/servlets"/>">Servlets</a></li>
	    <li><a href="<c:url value="/jsp/jsp"/>">JSP</a></li>
	    <li><a href="<c:url value="/jsp/using-jdbc"/>">Using JDBC</a></li>
	    <li class="sub-heading">Bulletin Board</li>
	    <li><a href="<c:url value="/jsp/bbs-basics"/>">Board Basics</a></li>
	    <li><a href="<c:url value="/jsp/thread-bbs"/>">Thread Board</a></li>
	    <li><a href="<c:url value="/jsp/model-1-bbs"/>">Model 1 Board</a></li>
	    <li><a href="<c:url value="/jsp/datasource"/>">DataSource</a></li>
	    <li><a href="<c:url value="/jsp/model-2-bbs"/>">Model 2 Board</a></li>	    
	</ul>
	</c:otherwise>
</c:choose>