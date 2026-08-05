<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Code Along: JSP</h1>

<h2>JSTL</h2>

<h3>forEach</h3>

<% 
List<String> list = List.of("복숭아", "멜론", "수박", "딸기", "사과", "바나나", "포도");
// 2. EL식에서 사용할 수 있도록 pageContext 영역에 저장
pageContext.setAttribute("fruits", list);
%>        
<c:forEach var="fruit" items="${fruits}">
	${fruit}
</c:forEach>

<hr />

<c:forEach items="${fruits}" varStatus="status">
	${status.current}
</c:forEach>

<hr />

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























</article>
