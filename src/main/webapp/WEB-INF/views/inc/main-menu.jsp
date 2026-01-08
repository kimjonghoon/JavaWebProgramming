<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

<ul id="nav">
	<li><a href="${javaUrl}/Features">Java</a></li>
	<li><a href="${jdbcUrl}/JDBC-Intro">JDBC</a></li>
	<li><a href="${jspUrl}/How-to-install-Tomcat">JSP</a></li>
	<li><a href="${cssLayoutUrl}/div-element-arrangement">CSS Layout</a></li>
	<li><a href="${jspPjtUrl}/Dynamic-Web-Project-Set-Up">JSP Project</a></li>
	<li><a href="${springUrl}/building-java-projects-with-maven">Spring</a></li>
	<li><a href="${javascriptUrl}/introduction">JavaScript</a></li>
	<li><a href="${googleCloudUrl}/building-gae-projects-with-maven">Google Cloud</a></li>
	<li><a href="${blogUrl}">Blog</a></li>
	<li><a href="${bbsUrl}/chat?page=1">BBS</a></li>
</ul>