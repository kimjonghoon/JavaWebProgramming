<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Code Along JSTL</h1>

<h2>forEach</h2>

<pre class="prettyprint">List&lt;String&gt; fruits = List.of("Peach", "Melon", "Watermelon", "Strawberry", "Apple", "Banana", "Grape");
pageContext.setAttribute("fruits", fruits);
</pre>

<%
List<String> fruits = List.of("Peach", "Melon", "Watermelon", "Strawberry", "Apple", "Banana", "Grape");
pageContext.setAttribute("fruits", fruits);
%>

<div class="result">
<c:forEach var="fruit" items="${fruits}">
	${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach items="\${fruits}" varStatus="status"&gt;
	\${status.current}
&lt;/c:forEach&gt;
</pre>

<div class="result">
<c:forEach items="${fruits}" varStatus="status">
	${status.current}
</c:forEach>
</div>


<c:forEach var="num" begin="1" end="10">
	${num}
</c:forEach>

<hr />

<c:forEach begin="1" end="10" varStatus="status">
	${status.current}
</c:forEach>

<hr />

<c:forEach begin="1" end="10" step="2" varStatus="status">
	${status.current}
</c:forEach>

<hr />

<c:forEach begin="1" end="10" step="3" varStatus="status">
	${status.current}
</c:forEach>

<hr />

<c:forEach var="fruit" items="${fruits}" step="2">
	${fruit}
</c:forEach>

<hr />

<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5">
	${fruit}
</c:forEach>

<hr />

<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5" varStatus="status">
	${status.index} : ${fruit}
</c:forEach>

<hr />

<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5" varStatus="status">
	${status.count} : ${fruit}
</c:forEach>

<hr />

<c:forEach var="num" begin="3" end="1">
	${num}
</c:forEach>

<hr />

<c:forEach var="fruit" items="${fruits}" varStatus="status">
	${status.last}:${fruit}
</c:forEach>

<hr />

<c:forEach items="${fruits}" varStatus="status">
	<c:if test="${status.count % 2 == 0}">
		${status.count}:${status.current}
	</c:if>
</c:forEach>

<hr />
<%
/*
BMI(체질량지수)
체중(kg)을 키(m)의 제곱으로 나누어 계산
공식 체중 / (키 × 키)
대한비만학회 기준 한국인 비만도
18.5 미만 저체중
18.5~22.9 정상
23~24.9 과체중
25 이상 비만
*/
double height = 1.657;
double weight = 71.8;
double myBMI = weight / (height * height);
pageContext.setAttribute("bmi", myBMI);
%>
<c:out value="${bmi}"/>
<hr />
<c:if test="${bmi gt 25}">비만</c:if>
<c:if test="${bmi le 24.9}">비만 아님</c:if>

<hr />

<c:choose>
	<c:when test="${bmi lt 18.5 }">
		저체중
	</c:when>
	<c:when test="${bmi ge 18.5 and bmi le 22.9}">
		정상
	</c:when>
	<c:when test="${bmi ge 23 and bmi le 24.9}">
		과체중
	</c:when>
	<c:when test="${bmi ge 25 and bmi le 29.9}">
		1단게 비만
	</c:when>
	<c:when test="${bmi ge 30 and bmi le 34.9}">
		2단게 비만
	</c:when>
	<c:when test="${bmi ge 35}">
		3단게 비만(고도 비만)
	</c:when>
</c:choose>

<hr />

<c:if test="${not empty user}">안녕하세요, ${user.name}님!</c:if>





















</article>
