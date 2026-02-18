<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="lang" var="lang" />

<h1>Java</h1>

<c:choose>
	<c:when test="${lang == 'ko'}">
	<ul>
	    <li class="sub-heading">자바 소개</li>
	    <li><a href="<c:url value="/java/features"/>">자바의 특징</a></li>
	    <li><a href="<c:url value="/java/object-and-class"/>">객체와 클래스</a></li>
	
	    <li class="sub-heading">자바 기초</li>
	    <li><a href="<c:url value="/java/identifiers"/>">키워드,식별자,주석</a></li>
	    <li><a href="<c:url value="/java/datatype"/>">데이터 타입</a></li>
	    <li><a href="<c:url value="/java/arrays"/>">배열</a></li>
	    <li><a href="<c:url value="/java/operators"/>">연산자</a></li>
	    <li><a href="<c:url value="/java/package"/>">패키지</a></li>
	    <li><a href="<c:url value="/java/inheritance"/>">상속</a></li>
	    <li><a href="<c:url value="/java/static"/>">static 키워드</a></li>
	    <li><a href="<c:url value="/java/collection"/>">컬렉션</a></li>
	    <li><a href="<c:url value="/java/exception"/>">예외</a></li>
	
	    <li class="sub-heading">예제: 자바은행</li>
	    <li><a href="<c:url value="/java/javabank-requirements-analysis"/>">요구사항 분석</a></li>
	    <li><a href="<c:url value="/java/javabank-design"/>">구현</a></li>
	    <li><a href="<c:url value="/java/javabank-inheritance"/>">상속 적용</a></li>
	    <li><a href="<c:url value="/java/javabank-abstract-class"/>">추상 클래스 적용</a></li>
	    <li><a href="<c:url value="/java/javabank-interface"/>">인터페이스 적용</a></li>
	
	    <li class="sub-heading">스레드 I/O 네트워크</li>
	    <li><a href="<c:url value="/java/thread"/>">스레드</a></li>
	    <li><a href="<c:url value="/java/io"/>">자바 I/O</a></li>
	    <li><a href="<c:url value="/java/logging"/>">로깅</a></li>
	    <li><a href="<c:url value="/java/socket"/>">소켓</a></li>
	    <li><a href="<c:url value="/java/rmi"/>">RMI</a></li>
	</ul>	    	
	</c:when>
	<c:otherwise>
	<ul>
		<li class="sub-heading">Java Introduction</li>
		<li><a href="<c:url value="/java/features"/>">Java Features</a></li>
		<li><a href="<c:url value="/java/object-and-class"/>">Object and Class</a></li>
		
		<li class="sub-heading">Java Basic</li>
		<li><a href="<c:url value="/java/identifiers"/>">Identifiers</a></li>
		<li><a href="<c:url value="/java/datatype"/>">Data Type</a></li>
		<li><a href="<c:url value="/java/arrays"/>">Arrays</a></li>
		<li><a href="<c:url value="/java/operators"/>">Operators</a></li>
		<li><a href="<c:url value="/java/package"/>">Package</a></li>
		<li><a href="<c:url value="/java/inheritance"/>">Inheritance</a></li>
		<li><a href="<c:url value="/java/static"/>">static keyword</a></li>
		<li><a href="<c:url value="/java/collection"/>">Collection</a></li>
		<li><a href="<c:url value="/java/exception"/>">Exception</a></li>
		
		<li class="sub-heading">Example: Java Bank</li>
		<li><a href="<c:url value="/java/javabank-requirements-analysis"/>">Requirements Analysis</a></li>
		<li><a href="<c:url value="/java/javabank-design"/>">Application Design</a></li>
		<li><a href="<c:url value="/java/javabank-inheritance"/>">Inheritance</a></li>
		<li><a href="<c:url value="/java/javabank-abstract-class"/>">Abstract Class</a></li>
		<li><a href="<c:url value="/java/javabank-interface"/>">Interface</a></li>
		
		<li class="sub-heading">Thread I/O Network</li>
		<li><a href="<c:url value="/java/thread"/>">Thread</a></li>
		<li><a href="<c:url value="/java/io"/>">Java I/O</a></li>
		<li><a href="<c:url value="/java/logging"/>">Logging</a></li>
		<li><a href="<c:url value="/java/socket"/>">Socket</a></li>
		<li><a href="<c:url value="/java/rmi"/>">RMI</a></li>
	</ul>		
	</c:otherwise>
</c:choose>