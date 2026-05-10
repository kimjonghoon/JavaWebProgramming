<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>JDBC</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li><a href="<c:url value="/jdbc/intro"/>">JDBC 소개</a></li>
	    <li><a href="<c:url value="/jdbc/oracle-install"/>">오라클 설치</a></li>
	    <li><a href="<c:url value="/jdbc/scott-account"/>">SCOTT 계정</a></li>
	    <li><a href="<c:url value="/jdbc/sql-basics"/>">SQL 기본</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-test-on-oracle"/>">오라클 JDBC 테스트</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-guide"/>">JDBC 프로그래밍 방법</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-examples"/>">JDBC 실습</a></li>
	    <li><a href="<c:url value="/jdbc/preparedstatement"/>">PreparedStatement</a></li>
	    <li><a href="<c:url value="/jdbc/join"/>">JDBC - 조인</a></li>
	    <li><a href="<c:url value="/jdbc/transaction"/>">JDBC - 트랜잭션</a></li>
	    <li><a href="<c:url value="/jdbc/connection-pool"/>">커넥션 풀</a></li>
	    <li class="sub-heading">예제</li>
	    <li><a href="<c:url value="/jdbc/namecard"/>">명함관리</a></li>
	    <li><a href="<c:url value="/jdbc/javabank"/>">자바은행</a></li>
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
	    <li><a href="<c:url value="/jdbc/intro"/>">JDBC introduction</a></li>
	    <li><a href="<c:url value="/jdbc/oracle-install"/>">Oracle Install</a></li>
	    <li><a href="<c:url value="/jdbc/scott-account"/>">SCOTT Account</a></li>
	    <li><a href="<c:url value="/jdbc/sql-basics"/>">SQL Basics</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-test-on-oracle"/>">JDBC Test on Oracle</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-guide"/>">JDBC Guide</a></li>
	    <li><a href="<c:url value="/jdbc/jdbc-examples"/>">JDBC Examples</a></li>
	    <li><a href="<c:url value="/jdbc/preparedstatement"/>">PreparedStatement</a></li>
	    <li><a href="<c:url value="/jdbc/join"/>">JDBC - Join</a></li>
	    <li><a href="<c:url value="/jdbc/transaction"/>">JDBC - Transaction</a></li>
	    <li><a href="<c:url value="/jdbc/connection-pool"/>">Connection Pool</a></li>
	    <li class="sub-heading">Examples</li>
	    <li><a href="<c:url value="/jdbc/namecard"/>">Name Cards</a></li>
	    <li><a href="<c:url value="/jdbc/javabank"/>">Java Bank</a></li>
	</ul>		
	</c:otherwise>
</c:choose>