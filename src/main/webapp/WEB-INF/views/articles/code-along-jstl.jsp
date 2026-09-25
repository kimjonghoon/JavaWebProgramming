<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
div.code-along-result {
	margin: 0 0 2em 0;
	padding: 0.3em 0;
	font-size: 0.9em;
	font-weight: bold;
	letter-spacing: 0.1em;
	border: 2px dotted grey;
}
</style>

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

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}"&gt;
  \${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}">
  ${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach items="\${fruits}" varStatus="status"&gt;
  \${status.current}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach items="${fruits}" varStatus="status">
  ${status.current}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="num" begin="1" end="10"&gt;
  \${num}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="num" begin="1" end="10">
  ${num}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach begin="1" end="10" varStatus="status"&gt;
  \${status.current}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach begin="1" end="10" varStatus="status">
  ${status.current}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach begin="1" end="10" step="2" varStatus="status"&gt;
  \${status.current}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach begin="1" end="10" step="2" varStatus="status">
  ${status.current}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach begin="1" end="10" step="3" varStatus="status"&gt;
  \${status.current}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach begin="1" end="10" step="3" varStatus="status">
	${status.current}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}" step="2"&gt;
  \${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}" step="2">
	${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}" step="2" begin="1" end="5"&gt;
  \${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5">
	${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}" step="2" begin="1" end="5" varStatus="status"&gt;
  \${status.index} : \${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5" varStatus="status">
	${status.index} : ${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}" step="2" begin="1" end="5" varStatus="status"&gt;
  \${status.count} : \${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}" step="2" begin="1" end="5" varStatus="status">
	${status.count} : ${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="num" begin="3" end="1"&gt;
  \${num}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="num" begin="3" end="1">
	${num}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach var="fruit" items="\${fruits}" varStatus="status"&gt;
  \${status.last}:\${fruit}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="fruit" items="${fruits}" varStatus="status">
	${status.last}:${fruit}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;c:forEach items="\${fruits}" varStatus="status"&gt;
  &lt;c:if test="\${status.count % 2 == 0}"&gt;
    \${status.count}:\${status.current}
  &lt;/c:if&gt;
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach items="${fruits}" varStatus="status">
	<c:if test="${status.count % 2 == 0}">
		${status.count}:${status.current}
	</c:if>
</c:forEach>
</div>

<pre class="prettyprint">
&lt;%
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
double weight = 70.8;
double myBMI = weight / (height * height);
pageContext.setAttribute("bmi", myBMI);
%&gt;
&lt;c:out value="\${bmi}"/&gt;&lt;br /&gt;
&lt;c:if test="\${bmi gt 25}"&gt;비만&lt;/c:if&gt;
&lt;c:if test="\${bmi le 25}"&gt;비만 아님&lt;/c:if&gt;
</pre>

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
double weight = 70.8;
double myBMI = weight / (height * height);
pageContext.setAttribute("bmi", myBMI);
%>
<div class="code-along-result">
<c:out value="${bmi}"/><br />
<c:if test="${bmi gt 25}">비만</c:if>
<c:if test="${bmi le 25}">비만 아님</c:if>
</div>

<pre class="prettyprint">
&lt;c:out value="\${bmi gt 25 ? '비만' : '비만 아님'}"/&gt;
</pre>

<div class="code-along-result">
<c:out value="${bmi gt 25 ? '비만' : '비만 아님'}"/>
</div>

<pre class="prettyprint">
&lt;c:choose&gt;
	&lt;c:when test="\${bmi gt 25}"&gt;
	비만
	&lt;/c:when&gt;
	&lt;c:otherwise&gt;
	비만 아님
	&lt;/c:otherwise&gt;
&lt;/c:choose&gt;
</pre>

<div class="code-along-result">
<c:choose>
	<c:when test="${bmi gt 25}">
	비만
	</c:when>
	<c:otherwise>
	비만 아님
	</c:otherwise>
</c:choose> 
</div>

<pre class="prettyprint">
&lt;c:choose&gt;
  &lt;c:when test="\${bmi lt 18.5 }"&gt;
    저체중
  &lt;/c:when&gt;
  &lt;c:when test="\${bmi ge 18.5 and bmi le 23}"&gt;
    정상
  &lt;/c:when&gt;
  &lt;c:when test="\${bmi gt 23 and bmi le 25}"&gt;
    과체중
  &lt;/c:when&gt;
  &lt;c:when test="\${bmi gt 25 and bmi le 30}"&gt;
    1단계 비만
  &lt;/c:when&gt;
  &lt;c:when test="\${bmi gt 30 and bmi le 35}"&gt;
    2단계 비만
  &lt;/c:when&gt;
  &lt;c:when test="\${bmi gt 35}"&gt;
    3단계 비만(고도 비만)
  &lt;/c:when&gt;
&lt;/c:choose&gt;
</pre>

<div class="code-along-result">
<c:choose>
	<c:when test="${bmi lt 18.5 }">
		저체중
	</c:when>
	<c:when test="${bmi ge 18.5 and bmi le 23}">
		정상
	</c:when>
	<c:when test="${bmi gt 23 and bmi le 25}">
		과체중
	</c:when>
	<c:when test="${bmi gt 25 and bmi le 30}">
		1단계 비만
	</c:when>
	<c:when test="${bmi ge 30 and bmi le 35}">
		2단계 비만
	</c:when>
	<c:when test="${bmi gt 35}">
		3단계 비만(고도 비만)
	</c:when>
</c:choose>
</div>

<pre class="prettyprint">
&lt;%!
/*
내부 클래스 Person(필드 name,age)
*/
public class Person {
	private String name;
	private int age;
	
	public Person() {}
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
%&gt;
&lt;%
Person dua = new Person("Dua Lipa",31);
pageContext.setAttribute("dua", dua);
%&gt;
</pre>

<pre class="prettyprint">
&lt;c:if test="\${not empty dua}"&gt;안녕하세요, \${dua.name}님!&lt;/c:if&gt;
</pre>

<%!
/*
내부 클래스 Person(필드 name,age)
*/
public class Person {
	private String name;
	private int age;
	
	public Person() {}
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
%>

<%
Person dua = new Person("Dua Lipa",31);
pageContext.setAttribute("dua", dua);
%>

<div class="code-along-result">
<c:if test="${not empty dua}">안녕하세요, ${dua.name}님!</c:if>
</div>

<pre class="prettyprint">
&lt;%
java.util.Map&lt;String,Person&gt; celebList = new java.util.HashMap<>();
pageContext.setAttribute("celebList",celebList);
%&gt;
&lt;c:if test="\${empty celebList}"&gt;셀럽리스트가 비었습니다.&lt;/c:if&gt;
&lt;c:if test="\${not empty celebList}"&gt;셀럽리스트에 셀럽이 있습니다.&lt;/c:if&gt;
</pre>

<%
java.util.Map<String,Person> celebList = new java.util.HashMap<>();
pageContext.setAttribute("celebList",celebList);
%>

<div class="code-along-result">
<c:if test="${empty celebList}">셀럽리스트가 비었습니다.</c:if>
<c:if test="${not empty celebList}">셀럽리스트에 셀럽이 있습니다.</c:if>
</div>

<pre class="prettyprint">
&lt;%
celebList.put("dua",dua);
%&gt;
&lt;c:if test="\${empty celebList}"&gt;셀럽리스트가 비었습니다.&lt;/c:if&gt;
&lt;c:if test="\${not empty celebList}"&gt;셀럽리스트에 셀럽이 있습니다.&lt;/c:if&gt;
</pre>

<%
celebList.put("dua",dua);
%>
<div class="code-along-result">
<c:if test="${empty celebList}">셀럽리스트가 비었습니다.</c:if>
<c:if test="${not empty celebList}">셀럽리스트에 셀럽이 있습니다.</c:if>
</div>

<pre class="prettyprint">
&lt;c:forEach var="entry" items="\${celebList}"&gt;
	\${entry.key} : \${entry.value.name}
&lt;/c:forEach&gt;
</pre>

<div class="code-along-result">
<c:forEach var="entry" items="${celebList}">
	${entry.key} : ${entry.value.name}
</c:forEach>
</div>

<pre class="prettyprint">
&lt;%
Person rogerFederer = new Person("Roger Federer",45);
celebList.put("roger-federer",rogerFederer);
%&gt;
&lt;c:forEach var="entry" items="\${celebList}"&gt;
	\${entry.key} : \${entry.value.name}&lt;br /&gt;
&lt;/c:forEach&gt;
</pre>

<%
Person rogerFederer = new Person("Roger Federer",45);
celebList.put("roger-federer",rogerFederer);
%>


<div class="code-along-result">
<c:forEach var="entry" items="${celebList}">
	${entry.key} : ${entry.value.name}<br />
</c:forEach>
</div>

<p>
value의 데이터 타입이 Person 객체라면, ${entry.value}는 클래스 이름과 해시코드를 출력한다. 
따라서 퍼슨 객체의 이름을 출력하려면 .value 뒤에 퍼슨 객체의 필드명을 붙인다. ${entry.value.name}
</p>

<p>
배열이나 컬렉션 요소에 접근할 때는 [] 연산자를 사용한다.
(예, ${list[0]} 또는 ${array[0]})
맵의 경우 키 값을 대괄호 안에 넣어서 ${map['key']} 형태로 키에 해당하는 값에 접근한다.
이때 .(도트)를 [] 연산자 댓힌 사용할 수 있다.
(예, ${userMap['name']} 대신 ${userMap.name}를 사용할 수 있다)
도트를 사용할 때는 맵의 키 값에 특수 문자가 없어야 한다는 제약이 있다.
</p>

<pre class="prettyprint">
\${celebList['dua'].name}
</pre>

<div class="code-along-result">
${celebList['dua'].name}
</div>

<pre class="prettyprint">
\${celebList.dua.name}
</pre>

<div class="code-along-result">
${celebList.dua.name}
</div>

<pre class="prettyprint">
\${celebList['roger-federer'].name}
</pre>

<div class="code-along-result">
${celebList['roger-federer'].name}
</div>

<pre class="prettyprint">
\${celebList.roger-federer.name}
</pre>

<div class="code-along-result">
${celebList.roger-federer.name}
</div>

<p>
키 값이 roger-federer에는 -(대시) 문자가 있기에 .(도트)를 사용하면 원하는 값에 접근할 수 없다.
맵의 키값으로는 낙타 표기법이나 스네이크 표기법을 권장한다.
그리고 공백은 피한다.
영문 대소문자, 숫자, 언더바(_)로만 구성하도록 한다.
</p>

<p>
예외 처리 태그 &lt;c:catch&gt;
자바의 try-catch문과 유사하게 동작하는 제어 태그다.
태그 내부 코드를 실행하다가 에러(예외)가 발생하면, 에러를 잡아 지정한 변수에 저장하고 다음 코드를 정상 실행한다.
에러가 발생했을 때만 안내 문구를 보여주는 일종의 조건부 처리가 가능하다.
</p>

<pre class="prettyprint">
&lt;c:catch var="error"&gt;
1.시작&lt;br /&gt;
&lt;% 
int result = 10 / 0;
pageContext.setAttribute("result",result); 
%&gt;
2.결과: &lt;c:out value="\${result}"/&gt;&lt;br /&gt; 
&lt;/c:catch&gt;
&lt;c:if test="\${not empty error}"&gt;
3.에러 메시지: \${error}&lt;br /&gt;
&lt;/c:if&gt;
</pre>

<div class="code-along-result">
<c:catch var="error">
1.시작<br />
<% 
int result = 10 / 0;
pageContext.setAttribute("result",result); 
%>
2.결과: <c:out value="${result}"/><br /> 
</c:catch>
<c:if test="${not empty error}">
3.에러 메시지: ${error}<br />
</c:if>
</div>

<pre class="prettyprint">
&lt;c:catch var="errorMsg"&gt;
1.시작&lt;br /&gt;
&lt;% 
int result1 = 10 / 1; 
pageContext.setAttribute("result1",result1); 
%&gt; 
2.결과: &lt;c:out value="\${result1}"/&gt;&lt;br /&gt;
&lt;/c:catch&gt;
&lt;c:if test="\${not empty errorMsg}"&gt;
3.에러 메시지: \${errorMsg}&lt;br /&gt;
&lt;/c:if&gt;
</pre>

<div class="code-along-result">    
<c:catch var="errorMsg">
1.시작<br />
<% 
int result1 = 10 / 1; 
pageContext.setAttribute("result1",result1); 
%> 
2.결과: <c:out value="${result1}"/><br />
</c:catch>
<c:if test="${not empty errorMsg}">
3.에러 메시지: ${errorMsg}<br />
</c:if>
</div>

</article>
