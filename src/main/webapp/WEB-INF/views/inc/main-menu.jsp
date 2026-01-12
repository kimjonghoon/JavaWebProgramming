<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:url var="homeUrl" value="/"/>
<!-- 
<c:url var="javaUrl" value="/java"/>
<c:url var="jdbcUrl" value="/jdbc"/>
<c:url var="jspUrl" value="/jsp"/>
<c:url var="cssLayoutUrl" value="/css-layout"/>
<c:url var="jspPjtUrl" value="/jsp-pjt"/>
<c:url var="springUrl" value="/spring"/>
<c:url var="javascriptUrl" value="/javascript"/>
<c:url var="googleCloudUrl" value="/google-app-engine"/>
<c:url var="blogUrl" value="/blog"/>
<c:url var="bbsUrl" value="/bbs"/>
-->
<ul id="nav">
	<li><a href="${homeUrl}java/Features">Java</a></li>
	<li><a href="${homeUrl}jdbc/JDBC-Intro">JDBC</a></li>
	<li><a href="${homeUrl}jsp/How-to-install-Tomcat">JSP</a></li>
	<li><a href="${homeUrl}css-layout/div-element-arrangement">CSS Layout</a></li>
	<li><a href="${homeUrl}jsp-pjt/Dynamic-Web-Project-Set-Up">JSP Project</a></li>
	<li><a href="${homeUrl}spring/building-java-projects-with-maven">Spring</a></li>
	<li><a href="${homeUrl}javascript/introduction">JavaScript</a></li>
	<li><a href="${homeUrl}google-app-engine/building-gae-projects-with-maven">Google Cloud</a></li>
	<li><a href="${homeUrl}blog">Blog</a></li>
	<li><a href="${homeUrl}bbs/chat?page=1">BBS</a></li>
</ul>