<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>기본 데이터 타입</h1>

<p>
자바스크립트의 기본 데이터 타입은 문자, 숫자, 불린이다.<br />
변수를 선언할 때 변수 명 앞에 variable의 약자인 var를 붙인다.<br />
</p>

<pre class="prettyprint script-result-display">
const city = "서울";//또는 '서울'
const result = 1200 / 1000;
const onGlass = true;
alert('city: ' + city);
alert('result: ' + result);
alert('onGlass: ' + onGlass);
</pre>

<h3>지역변수와 전역변수</h3>

<p>
지역변수는 함수 내에서 선언된 변수로 함수 내에서만 사용할 수 있다.<br />
전역변수는 함수 밖에서 선언된 변수로 모든 함수에서 사용할 수 있다.<br />
var 키워드를 사용해 선언한 변수는 함수 레벨 스코프를 가진다. 
var로 선언한 변수는 함수가 아닌 블록(if 또는 for)내에 선언해도 함수 전체에 유효하다.
var를 붙이지 않고 선언한 변수는, 변수의 위치가 함수 안이든 밖이든 상관없이, 전역변수가 된다.<br />
</p>

<p>
const와 let으로 선언한 변수는 블록 레벨 스코프를 가진다.
블록 내에서만 변수가 유효하므로 var를 사용하는 것보다 안전하다.
const와 let은 중복 선언시 오류를 발생시켜 실수를 방지한다.
권장되는 변수 선언 방법은, 재할당이 필요없는 모든 변수는 const를 사용하고, 재할당이 필요한 경우에만 let을 사용한다.
제이쿼리 변수를 선언할 때도 const와 let을 사용한다. 
</p>

<pre class="prettyprint script-result-display">
for (let i = 1;i &lt; 5;i++) {
	const ret = i;
	alert(ret);
}
</pre>

<h3>상수</h3>

<p>
상수를 선언할 때는 상수 앞에 const를 붙인다.<br />
상수 이름은 대문자와 _로 구성한다.<br />
상수도 변수와 같이 전역 상수와 지역 상수가 있다.<br />
</p>

<pre class="prettyprint script-result-display">
const PI = 3.14;
alert('PI: ' + PI);
</pre>

<h3>주석</h3>

<p>
// 은 한 줄 주석이고,<br />
/* */ 은 여러 줄 주석이다.<br />
</p>

<h3>식별자</h3>

<p>
식별자로는 문자, 숫자, _, $을 조합한 어떠한 문자열도 가능하다.<br />
대소문자를 구별한다.<br />
예약어는 사용할 수 없다.<br />
</p>

<h3>undefined</h3>

<p>
TODO:
undefined는 변수가 선언되고 초기화되지 않은 상태에서 값을 참조했을 때 '값이 할당되지 않았다'는 
의미이다.<br />
</p>

<pre class="prettyprint script-result-display">
let i;
alert('i: ' + i);
</pre>

<p>
if 문의 조건절에 0, "", NaN, undefined 가 오면 false이다.<br />
</p>

<pre class="prettyprint script-result-display">
let i;
if (i) {
	alert('i: ' + "true");
} else {
	alert('i: ' + "false");
}
</pre>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/javascript/objects"/>">자바스크립트 객체</a></li>
		<li>이전 : <a href="<c:url value="/javascript/intro"/>">자바스크립트 소개</a></li>
	</ul>
</div>

</article>