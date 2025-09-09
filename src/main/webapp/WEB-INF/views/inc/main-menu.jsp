<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<ul id="nav">
    <li><a href="${ctx}/java/Features">Java</a></li>
    <li><a href="${ctx}/jdbc/JDBC-Intro">JDBC</a></li>
    <li><a href="${ctx}/jsp/How-to-install-Tomcat">JSP</a></li>
    <li><a href="${ctx}/css-layout/div-element-arrangement">CSS Layout</a></li>
    <li><a href="${ctx}/jsp-pjt/Dynamic-Web-Project-Set-Up">JSP Project</a></li>
    <li><a href="${ctx}/spring/building-java-projects-with-maven">Spring</a></li>
    <li><a href="${ctx}/javascript/introduction">JavaScript</a></li>
    <li><a href="${ctx}/google-app-engine/building-gae-projects-with-maven">Google Cloud</a></li>
    <li><a href="${ctx}/blog">Blog</a></li>
    <li><a href="${ctx}/bbs/chat?page=1">BBS</a></li>
<!--     <security:authorize access="hasRole('ROLE_ADMIN')"> 
        <li><a href="${ctx}/admin">Admin</a></li>
    </security:authorize>
-->
</ul>