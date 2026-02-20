<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>객체</h1>

<h2>Number</h2>

<p>
이클립스에서 작업하면 아래 그림처럼 코드 어시스트를 받을 수 있다.<br />
<br />
<img src="<c:url value="/resources/images/javascript-plugin.png"/>" alt="이클립스 자바스크립트  코드 어시스트 기능 활용" /><br />
</p>

<pre class="prettyprint script-result-display">
var num = new Number(2194.123456);
alert("A."+num<strong>.toExponential(3)</strong>); //소수점 이하 3자리를 넘긴 부분은 지수 표현
alert("B."+num<strong>.toPrecision(3)</strong>); //유효숫자를 3자리로 표현
alert("C."+num<strong>.toFixed(8)</strong>); //소수점 이하를 8자로 나머지는 반올림
alert("D."+num<strong>.toLocaleString()</strong>); //로케일에 맞게 숫자를 표현
alert("E."+num<strong>.toString()</strong>); //객체를 문자열로 반환
alert("F."+<strong>Number.MAX_VALUE</strong>); //최대값
alert("G."+<strong>Number.MIN_VALUE</strong>); //최소값
alert("H."+<strong>Number.NEGATIVE_INFINITY</strong>); 
alert("I."+<strong>Number.POSITIVE_INFINITY</strong>); 
alert("J."+<strong>Number.NaN</strong>); //Not a Number 즉, 숫자가 아니라는 의미
alert("K."+(<strong>num.valueOf()</strong> + 1)); //넘버 객체의 값을 기본 데이터 값으로 반환
//isNaN() 내장함수는 수와 관련되므로 여기서 소개한다.
if (<strong>isNaN</strong>("이천십사년") == true) {
	alert("L.숫자가 아니다.");
}
</pre>

<p>
이외에 prototype이라는 프로퍼티가 있다.<br />
prototype 프로퍼티는 객체에 새로운 속성이나 메소드를 추가할 수 있게 한다.
</p>

<h2>String</h2>

<pre class="prettyprint script-result-display">
<strong>var name = new String("홍길동");//또는 var name = "홍길동";</strong>
var engName = "gildong hong"
alert("1) 성명: " + name);
alert("2) 영어이름: " +engName);
alert("3) 성: " + name<strong>.substring(0,1)</strong>);//자바와 같음
alert("4) 이름: " + name<strong>.substring(1)</strong>);//자바와 같음
alert("5) 이름길이: " + name<strong>.length</strong>);//자바는 length()
alert("6) "+name<strong>.charAt(1)</strong>);//문자의 인덱스 1에 위치한 문자 반환,자바와 같음
alert("7) "+name<strong>.charCodeAt(1)</strong>);//인덱스의 문자코드 반환, 자바의 codePointAt()
alert("8) "+name<strong>.concat(",임꺽정,장길산")</strong>);//자바와 같음
alert("9) "+name<strong>.indexOf("길")</strong>);//길이라는 문자가 있는 인덱스 번지 반환,자바와 같음 
alert("10) "+name<strong>.lastIndexOf("길",0)</strong>);//인덱스 0부터 왼쪽으로 검색,자바와 같음
alert("11) "+name<strong>.match(/길동/)</strong>);//정규표현식에 해당하는 문자열을 반환,자바엔 없음
alert("12) "+name<strong>.replace("홍","고")</strong>);//자바의 replaceAll()과 가장 비슷
alert("13) "+name<strong>.search(/동/g)</strong>);//정규표현식에 해당하는 문자열의 찾아 인덱스 반환
alert("14) "+name<strong>.slice(1,2)</strong>);//자바의 substring(int,int)
alert("15) "+name<strong>.slice(1)</strong>);//자바의 substring(int)
alert("16) "+name<strong>.split("길")</strong>);//자바스크립트의 배열은,로 구분,자바의 split() 같음
alert("17) "+name<strong>.substring(1,2)</strong>);//자바와 같음
alert("18) "+engName<strong>.toUpperCase()</strong>);//자바와 같음
alert("19) "+engName<strong>.toLowerCase()</strong>);//자바와 같음
</pre>

<h2>정규표현식</h2>

<p>
RegExp는 정규 표현식 객체이다.<br />
/ ~ /로 표현한다. ("/ ~ /", '/ ~ /' 모두 아니다!)<br />
정규 표현식 객체에는 test()와 exec() 메소드가 있다.<br />
test()는 아규먼트로 들어온 문자열이 정규 표현식에 부합한지를 판단하여 불린 값을 리턴한다.<br />
exec()는 아규먼트로 들어온 문자열에서 정규 표현식에 부합된 문자열을 찾아 리턴한다.<br />
</p>

<pre class="prettyprint script-result-display">
var regExp = /Java/;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h3>i flag</h3>

<p>
정규 표현식 객체의 끝의 / 다음에 오는 문자열은 플래그다.<br />
i 플래그가 붙으면 대소문자를 가리지 않는다.<br />
</p>

<pre class="prettyprint script-result-display">
var regExp = /Java/i;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h3>g flag</h3>

<p>
g 플래그를 사용하면 마지막으로 매칭 된 위치를 기억하고 있다가 
다음번의 exec()를 호출되면 그다음 위치부터 매칭 되는 곳을 찾게 된다.<br />
</p>

<pre class="prettyprint script-result-display">
var regExp = new RegExp('Java', 'gi'); // /Java/gi
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h3>/../ 사이의 문자</h3>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">횟수</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">*</th>
	<td class="table-in-article-td">0회 이상</td>
</tr>
<tr>
	<th class="table-in-article-th">+</th>
	<td class="table-in-article-td">1회 이상</td>
</tr>
<tr>
	<th class="table-in-article-th">?</th>
	<td class="table-in-article-td">0 또는 1회</td>
</tr>
<tr>
	<th class="table-in-article-th">.</th>
	<td class="table-in-article-td">정확히 1회</td>
</tr>
<tr>
	<th class="table-in-article-th">{}</th>
	<td class="table-in-article-td">
	중괄호는 문자의 반복 횟수를 지정할 때 사용한다.<br />
	s{2} s의 두 번 반복 즉, ss를 의미한다.<br />
	</td>
</tr>	
</table>

<pre class="prettyprint script-result-display">
var regExp = /Java-*/gi;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">
	<em class="path">\</em> 다음 일반 문자는 약속된 특수 문자로 취급<br />
	<em class="path">\</em> 다음 특수 문자는 문자 그 자체로 취급<br />
	</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;"><em class="path">\w</em></th>
	<td class="table-in-article-td">낱말, 정확히는 알파벳과 숫자와 _를 의미한다.</td>
</tr>
<tr>
	<th class="table-in-article-th"><em class="path">\W</em></th>
	<td class="table-in-article-td"><em class="path">\w</em> 반대</td>
</tr>
<tr>
	<th class="table-in-article-th"><em class="path">\d</em></th>
	<td class="table-in-article-td">숫자</td>
</tr>
<tr>
	<th class="table-in-article-th"><em class="path">\D</em></th>
	<td class="table-in-article-td"><em class="path">\d</em>와 반대, <em class="path">\D*</em>는 문자 0회 이상을 의미한다.</td>
</tr>
<tr>
	<th class="table-in-article-th"><em class="path">\s</em></th>
	<td class="table-in-article-td">공백문자</td>
</tr>
</table>

<pre class="prettyprint script-result-display">
var regExp = /\s\*/g;
var testStr = "www.java-school.net *is *the *best *site *to *learn *JAVA";
var retStr = testStr.replace(regExp,'-');
alert(retStr);
</pre>

<p>
다음은 회원가입을 위한 폼이다.<br />
</p>

<pre class="prettyprint">
&lt;form id="signUp" action="signUp" method="post" onsubmit="return check()"&gt;
    이름 &lt;input type="text" name="name" /&gt;
	
    &lt;!-- 중간 생략 --&gt;

&lt;/form&gt;
</pre>

<p>
이름에 해당하는 파라미터의 값이 공백문자로만 이루어졌는지 검사하는 자바스크립트 코드를 작성한다.<br />
</p>

<pre class="prettyprint">
function check() {
	var regExp = /\s/g;
	var form = document.getElementById("signUp");
	var name = form.name.value;
	name = name.replace(regExp,"");
	if (name.length == 0) {
		alert("이름이 유효하지 않습니다.");
		return false;
	}
	return true;
}
</pre>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">시작(^)과 끝($)</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">^</th>
	<td class="table-in-article-td">시작를 의미, /^JAVA/는 시작부에서 JAVA를 찾는다.</td>
</tr>
<tr>
	<th class="table-in-article-th">$</th>
	<td class="table-in-article-td">끝을 의미, /school$/은 끝에서 school를 찾는다.</td>
</tr>
</table>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">여러 문자를 매칭하고 싶다면 [] 안에 나열한다.</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">[a-zA-Z]</th>
	<td class="table-in-article-td">알파벳을 찾는다.</td>
</tr>
<tr>
	<th class="table-in-article-th">[0-9]</th>
	<td class="table-in-article-td">숫자를 찾는다.</td>
</tr>
<tr>
	<th class="table-in-article-th">[] 안의 ^</th>
	<td class="table-in-article-td">^ 가 [ ] 안에서 쓰이면 ~을 제외한다는 의미이다. [^0-9]는 <em class="path">\D</em>와 같다.</td>
</tr>
</table>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 90px;">()</th>
	<td class="table-in-article-td">
	괄호로 묶은 패턴은 매칭 된 다음 그 부분을 기억하고 그 값을 배열과 같이 저장된다.<br />
	기억되는 부분 문자열은 $1, $2, ...에 저장된다.
	</td>
</tr>
<tr>
	<th class="table-in-article-th">|</th>
	<td class="table-in-article-td">"또는"를 의미한다. a|b는 a 또는 b, a|b|c는 a 또는 b 또는 c
	</td>
</tr>
</table>

<h3>필요한 정규 표현식 얻기</h3>

<p>
다음 사이트에서 이메일에 대한 정규 표현식을 얻을 수 있다.<br />
<a href="http://regexlib.com">http://regexlib.com</a><br />

이를 이용해서 사용자가 입력한 이메일과 날짜가 유효한 값인지 체크하는 자바스크립트 함수를 만들어 본다.<br />
</p>

<pre class="prettyprint script-result-display" style="white-space: pre-wrap">
var emailRegExp = /^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
var dateRegExp = /^\d{4}\/\d{2}\/\d{2}/;

//테스트 데이터
var email = "hong@gmail.org";
var signUpDate = "2015/1/16";

var check = emailRegExp.test(email);

if (check) {
	alert("유효한 이메일");
} else {
	alert("유효하지 않은 이메일");
}

check = dateRegExp.test(signUpDate);

if (check) {
	alert("유효한 등록일");
} else {
	alert("유효하지 않은 등록일");
}
</pre>

<h2>Date</h2>

<p>
Date 객체를 통해 날짜를 생성하고 년, 월, 일, 초 등의 값에 접근할 수 있다.<br />
아규먼트 없이 생성하면 시스템의 현재 날짜와 시간으로 초기화된다.<br />
</p>

<pre class="prettyprint script-result-display">
var now = new Date();
alert("지금 : " + now.toUTCString());

var milliSecs = new Date(7789110879);
alert("milliSecs: " +milliSecs.toUTCString());

var soccerDay = new Date("Nov 9, 2013 8:00:00");
alert("경기당일: " + soccerDay.toUTCString());

var birthday = new Date(1981,1,25);
alert("생년월일: " + birthday.toLocaleString());

var newYearsEve = new Date(2014,11,31,23,59,59,59);
alert("새해전날: " + newYearsEve.toUTCString());
</pre>

<!-- 
Date 객체를 생성하고 난 후엔, 여러 가지 메소드로 값에 접근할 수 있다.
단순히 값에 접근하는 정적 메소드도 몇 가지 있고, 날짜의 각 비트를 조작할 수 있는 메소드도
몇가지 있다.
Date.now 는 현재 날짜와 시각을 반환하고, Date.parse는 1970년 1월 1일 12시 이후로 현재까지 경과된 시간을 밀리 초 단위로 반환하며, 
Date.UTC 는 1970년 1월 1일 자정 이후로 현재까지 경과된 시간을 밀리 초 단위로 반환한다.

var numMs = Date.UTC(1977,16,24,30,30,30);

Date 객체의 메소드를 사용하면, 특정 요소를 설정하거나 값을 알아낼 수 있다.
다음 메소드는 로컬 날짜값과 시각값을 가져온다.

getFullYear
getHours
getMilliseconds
getMinutes
getMonth
getSeconds
getYear

getUTCFullYear
getUTCHours
getUTCMilliseconds
getUTCMinutes
getUTCMonth
getUTCSeconds

대부분의 get 메소드는 상응하는 set 메소드가 있다.

getDate 메소드는 월을 숫자로 반환하며, getDay 메소드는 요일을 숫자로 반환한다.
요일을 반환할 때는 기준으로 일요일을 0으로 한다.

var dtNow = new Date();
alert(dtNow.getDay());

getTimezoneOffset 는 UTC 와 로컬 시각의 차이를 +/-기호와 함께 분 단위로 표시한다.

toString
로컬 시각을 문자열로 출력한다.

toGMTString
문자열 형식을 GMT 표준으로 지정한다.

toLocaleDateString 과 toLocaleTimeString
로케일을 사용해서 날짜와 시각을 출력한다.

toLocaleString
문자열 형식으로 현재 로케일로 지정한다.

toUTCString
문자열 형식을 UTC 표준으로 정한다.

[예제 4-8] : 다양한 date 메소드의 사용 예

주의
getYear 에 대해서 firefox 와 IE 모두 테스트한다.
-->

<h2>배열</h2>

<h2>배열 선언 방법</h2>

<p>
자바스크립트의 배열은 배열 선언 시 배열 요소의 수를 정할 수 있고 프로그램 실행 중에 추가할 수도 있다.
</p>

<pre class="prettyprint script-result-display">
var cities = ["Seoul", "New York"];
alert("cities.length=" + cities.length);

var years = new Array(1969, 1970);
years[46] = 2015; //이런식으로 배열 요소를 추가할 수 있다.
alert("years.length=" + years.length);

alert("years=" + years);

for (var idx in years) {
	alert(years[idx]);
}
</pre>

<h3>배열의 메소드</h3>

<ul>
	<li>splice() : 배열에서 요소를 추가/제거한다. 제거되는 요소를 반환한다.</li>
	<li>slice() : 배열의 부분으로 새로운 배열을 만들어 리턴한다.</li>
	<li>concat() : 2개 이상의 배열을 합치고 합친 배열의 복사본을 리턴한다.</li>
	<li>reverse() : 배열의 순서를 뒤집는다.</li>
</ul>

<p>
concat()과 slice()는 원래의 배열을 변경하지 않고, 수행 결과를 새로운 배열로 반환한다.<br />
자바스크립트 엔진은 배열을 배열 요소가 콤마(,) 로 구분되어 있는 문자열로 변환한다.<br />
</p>

<pre class="prettyprint script-result-display">
var words = new Array('A','B','C','D','E');
var s1 = words.splice(2,2,'c','d');//인덱스2부터 2개 제거하고 2개의 요소 추가 

alert(words);
alert(s1);

var s2 = words.slice(2,4);//2는 포함 4는 포함되지 않는 부분 배열 반환
alert(s2);
alert(words);
</pre>
 
<h3>for .. in 문 사용 예</h3>

<pre class="prettyprint script-result-display">
var lang = ["C", "JAVA", "javascript"];
for (var idx in lang) {
	alert(lang[idx]);
}
</pre>

<!-- 
자바스크립트 엔진은 쉼표(,)를 구분자로 사용해 배열을 문자열로 변환한다.
쉼표 대신 다른 구분자를 지정하고 싶다면 join 메소드를 사용한다.

var strng = fruitArray.join('*'); // 쉼표(,) 대신 별표(*)를 구분자로 사용한다.

reverse 메소드를 사용하면 배열 요소들의 순서를 뒤집을 수 있다.

fruitArray.reverse();

FIFO 큐
push: 배열 끝에 요소를 추가한다.
pop: 배열의 마지막 요소를 제거한다.
shift: 첫번째 요소를 제거한다.
unshift: 배열의 시작 위치에 요소를 추가한다.

[예제 4-10]
-->

<h3>연관 배열 (일종의 맵이다)</h3>

<p>
연관 배열에는 인덱스를 사용해서 요소에 접근할 수 없다.<br />
연관 배열을 생성할 할 때는 Object를 일반적으로 사용한다.<br />
새 요소가 추가될 때마다 배열은 자동으로 확장된다.<br />
</p>

<pre class="prettyprint script-result-display">
var account = new Object();

account["accountNo"] = "111-222-333333";
account["name"] = "홍길동";
account["balance"] = 100;

alert(account["name"]);
alert(account.balance);
</pre>

<p>
아래는 연관 배열에서 요소에 접근하는 예다.<br />
연관 배열 document의 요소인 getElementsByTagName()에 접근한다.<br />
연관 배열 Math의 요소 ceil()에 접근한다.<br />
</p>

<pre>
document.getElementsByTagName('a');
Math.ceil(175);
</pre>

<p>
document 객체의 요소를 출력하면 이해가 쉽다.<br />
</p>

<pre class="prettyprint script-result-display">
for (var property in document) {
	alert(property + ":" + document[property]);
}
</pre>

<p>
자바스크립트 객체는 연관 배열임을 알 수 있다.<br />
결과는 브라우저마다 다르다.<br />
</p>

<h2>Math</h2>

<pre class="prettyprint script-result-display">
var random = Math.random() * 10;
random = random.toPrecision(3);
alert("랜덤값 : " + random);

var ceil = Math.ceil(random);
alert("올림값 : " + ceil);

var floor = Math.floor(random);
alert("내림값 : " + floor);

var round = Math.round(random);
alert("반올림 : " + round);
</pre>

<h4>로또번호 생성기 자바스크립트 버전</h4>
<pre class="prettyprint script-result-display">
var lotto = new Array();
var index = 0;
while(true) {
	var check = true;
	var ball = Math.random() * 45;
	ball = Math.floor(ball) + 1;
	for (var i = 0; i &lt; lotto.length;i++) {
		if (lotto[i] == ball) {
			check = false;
			break;
		}
	}
	if (check) {
		lotto[index++] = ball
	}
	if (index &gt; 5) {
		break;
	}
}

alert("예상로또번호: " + lotto.toString());
</pre>

<h2>함수</h2>

<p>
자바스크립트에서 함수는 선언적 함수와 익명 함수로 나뉜다.<br />
</p>

<h3>선언적 함수</h3>

<p>
선언적 함수는 페이지가 로드할 때 단 한번 해석된다.<br />
해석된 후에는 함수는 호출될 때마다 실행된다.<br />
선언적 함수는 function 키워드, 함수명, 파라미터 리스트, 함수 몸체를 아래와
같은 문법으로 만든다.<br />
</p>

<pre class="prettyprint">
function 함수명 (파라미터1, 파라미터2,,,파라미터n) {
	//함수의 실행구문..
}
</pre>

<pre class="prettyprint script-result-display">
function add(a,b) {
	return a + b;
}
alert(add(3,4));
</pre>

<h3>익명 함수(anonymous function)</h3>

<p>
익명 함수는 런타임 때 동적으로 생성되는 함수이다.<br />
</p>

<pre class="prettyprint script-result-display">
var multiply = function(a, b) {
	return a * b
};
alert(multiply(3,4));
</pre>

<p>
Function 생성자를 이용해서 익명 함수를 만들 수 있다.<br />
하지만 잘 쓰지는 않는다.<br />
</p>

<pre class="prettyprint script-result-display">
var minus = new Function('a','b', 'return a - b');
alert(minus(3,4));
</pre>

<h3>자기 호출 익명 함수(Self-Executing Anonymous Functions)</h3>

<p>
자기 호출 익명 함수는 jQuery 와 같은 자바스크립트 라이브러리 코드에서 많이 볼 수 있는데, 
함수를 ()를 이용해서 감싸고 마지막에 (); 있으면 () 안의 함수가 즉시 실행된다.<br />
</p>

<pre class="prettyprint script-result-display">
(function() {
	alert("Hello World!");
})();
</pre>

<pre class="prettyprint script-result-display">
(function(whom) {
	alert("Hello " + whom);
})('장길산');
</pre>

<pre class="prettyprint script-result-display">
(function(a, b) {
	alert(a + b);
})(2,5);

</pre>

<h3>스코핑(Scoping)과 호이스팅(Hoisting)</h3>

<p>
스코핑(Scoping)은 변수가 유효성을 갖는 영역이 결정되는 규칙을 말한다.<br /> 
스코핑을 충분히 이해하기 위해서는 호이스팅에 대한 이해가 중요하다.<br />
호이스팅이란 자바스크립트 인터프리터가 <strong>'선언된 변수나 함수를 현재 실행 영역의 맨 위로 끌어올리는 동작'</strong>을 말한다.<br />
할당 구문은 런타임 과정에서 이루어지기 때문에 호이스팅되지 않는다.<br />
참고로, 호이스팅은 자바스크립트의 공식 용어는 아니다.<br />
<a href="http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf">ECMA-262.pdf</a> 문서에서 호이스팅이란 용어는 나오지 않는다.<br />
자바는 블록({ }) 안에서 변수를 선언하면 그 변수는 블록에서만 유효한 변수이다.<br />
하지만 자바스크립트에서 그와 같은 변수는 함수 안에서만 만들 수 있다.<br />
자바스크립트에서는 {}, if 문 블록에서만 유효한 변수는 만들 수 없다.<br />
<br />
다음 코드의 결과를 예측해 보자.<br />
</p>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
	if (true) {
		var x = 10;
	}
	alert(x);
}
fn();
</pre>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
	x = 10;
	return;
}
fn();
alert(x);
</pre>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
	x = 10;
	return;
	function x() {}
}
fn();
alert(x);
</pre>

<p>
위 예제는 설명이 필요하다.
정확하게 위 소스는 다음과 같이 해석되어 실행된다.<br />
결론적으로 fn() 함수의 식별자 x는 fn() 함수 내에서만 유효하게 된다.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
	function x() {}
	x = 10;
	return;
}
fn();
alert(x);
</pre>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
	function x() {}
	x = 10;
	return x;
}
var retVal = fn();
alert(retVal);
alert(x);
</pre>

<p>
자바스크립트에서는 {}, if 문 블록에서만 유효한 변수는 만들 수 없다.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
alert(x);
if (true) {
	var x = 2;
	alert(x);
	x++;
}
alert(x);
</pre>

<pre class="prettyprint script-result-display">
function foo() {
	var x = 1;
	if (x) {
		(<strong>function () {
			var x = 2;</strong>
			alert(x);
		<strong>}</strong>());
	}
	alert(x);
}
foo();
</pre>

<p>
위 예제는 함수에 var x = 2;를 선언했다.<br />
이 x 변수는 함수 내에서만 유효한 영역을 가지는 새로운 변수이다.<br />
함수 밖의 var x = 1;와는 전혀 상관없는 변수이다.<br /> 
</p>

<pre class="prettyprint script-result-display">
var x = 10;
function fn() {
	alert(x);
	var x = 20;
	alert(x);
}
fn();
alert(x);
</pre>

<p>
위 코드가 호이스팅되면 아래 코드와 같다.<br />
</p>

<pre class="prettyprint script-result-display">
var x = 10;
function fn() {
	var x;
	alert(x);
	x = 20;
	alert(x);
}
fn();
alert(x);
</pre>

<p>
만약 위 코드에서 함수 fn() 안에 선언된 var x;를 주석 처리하면 결과는 어떻게 바뀔까?
</p>

<pre class="prettyprint script-result-display">
sayHo(); //sayHo();호출이 코드에서 먼저 있다
function sayHo() { 
	alert("Ho");
}
</pre>

<p>
호이스팅되면 결과적으로 아래 코드와 같다.<br />
</p>

<pre class="prettyprint script-result-display">
function sayHo() { 
	alert("Ho");
}
sayHo();
</pre>

<p>
하지만 비슷해 보이는 다음 코드는 에러를 발생시킨다.<br /> 
</p>

<pre class="typeError">
sayHo(); //TypeError: sayHo is not a function
var sayHo = function() {
	alert("Ho");
}
</pre>

<p>
다음은 좀 더 어려운 예제이다.<br />
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
	function greet() {
		alert("How You Doin?");
	}
	return greet();
	function greet() {
		alert("What's Up?");
	}
}
bumpInto();
</pre>

<p>
호이스팅되면 결과적으로 아래 코드와 같다.<br />
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
	function greet() {
		alert("How You Doin?");
	}
	function greet() {
		alert("What's Up?");
	}
	return greet();
}
bumpInto();
</pre>

<p>
파라미터 리스트가 다르면 자바처럼 오버 로딩될까?
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
	function greet() {
		alert("How You Doin?");
	}
	function greet(whom) { //파라미터가 있는 greet 함수
		alert("What's Up?");
	}
	return greet();
}
bumpInto();
</pre>

<p>
greet()와 greet(whom) 함수는 자바처럼 오버 로딩되지 않는다.<br />
나중에 선언된 greet(whom) 함수가 실행된다.<br /> 
<br />
할당 구문은 런타임 과정에서 이루어지기 때문에 호이스팅 되지 않는다고 했다.<br />
다음 예제를 보자.<br />
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
	var greet = function () {
		alert("How You Doin?");
	}
	return greet();
	var greet = function (whom) {
		alert("What's Up?");
	}
}
bumpInto();
</pre>

<p>
호이스팅 되면 결과적으로 아래 코드와 같다.<br />
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
	var greet;
	var greet;
	greet = function () {
		alert("How You Doin?");
	}
	return greet();
	greet = function (whom) {
		alert("What's Up?");
	}
}
bumpInto();
</pre>

<p>
return 문 다음에 있는 "What's Up?"을 출력하는 greet() 함수는 실행될 기회가 없다.<br />
</p>

<h3>클로저(Closures)</h3>

<h4>내부 함수</h4>

<p>
자바스크립트는 내부 함수(inner function)를 지원하는 언어다.<br />
내부 함수는 외부 함수(내부 함수는 감싸는)에서 선언된 변수를  사용할 수 있다.<br />
</p>

<pre class="prettyprint script-result-display">
function fn() {
	var balance = 0; //외부에서 선언된 변수
	function deposit(money) { //내부함수
		balance += money;
		alert(balance);
	}
	deposit(100);
}
fn();
</pre>

<p>
부모 함수 밖에서 내부 함수를 직접 부를 수는 없지만 부모 함수 밖에서 내부 함수를 실행시킬 방법은 있다.<br />
<strong>"자바스크립트 함수는 기본적으로 함수 객체이다. 
그래서 함수를 변수에 할당하거나 다른 함수의 아규먼트로 넘길 수 있다."</strong><br />
위 예제를 다음과 같이 바꾸어 보자.<br />
코드는 내부 함수에 대한 참조를 반환하여, 부모 함수 밖에서도 이 함수를 참조할 수 있게 된다.<br />
</p>

<pre class="prettyprint script-result-display">
function fn() {
	var balance = 0; //외부에서 선언된 변수
	function deposit(money) { //내부함수
		balance += money;
		alert(balance);
	}
	<strong>alert("fn() 함수가 실행된다.");</strong>
	<strong>return deposit;</strong>
}
var retFn = fn();//만약 fn함수가 반환하지 않는 함수라면 retFn은 undefined 이다.
retFn(200);
</pre>

<p>
이 코드가 문제없이 실행된다는 사실은 자바 프로그래머를 불편하게 한다.<br />
자바에서는 메소드 안에 정의된 지역변수는 메소드가 종료되면 사라진다.<br />
마찬가지로 fn() 함수가 종료될 때 이 함수 내부에 정의된 지역 변수(balance)는 없어져야 하지만,
fn() 함수가 리턴 값을 반환했는데도 balance 변수는 여전히 유효하다.<br />
<br />
balance가 여전히 유효한 이유는 retFn가 클로저를 갖는다는 데 있다.<br />
클로저는 2개로 이루어진 특별한 객체이다.<br />
첫 번째는 함수이고 두 번째는 그 함수가 만들어진 환경이다.<br />
여기서 환경이란 함수가 만들어질 때 사용할 수 있는 변수들이다.<br />
<strong>"retFn는 deposit 함수와 balance 변수를 포함하는 클로저를 갖는다."</strong><br />
</p>

<pre class="prettyprint script-result-display">
function fn() {
	var balance = 0;
	function deposit(money) {
		balance += money;
		alert(balance);
	}
	return deposit;
}

var ac1 = fn();
alert("---ac1---");
ac1(50);
ac1(450);

var ac2 = fn();
alert("---ac2---");
ac2(2000);
ac2(500);
</pre>

<p>
함수가 정의된 범위 밖에서 그 내부 함수를 참조할 때 클로저가 만들어진다.<br />
내부 함수가 자신의 영역 범위를 넘어서 참조를 통해서 호출될 수 있다는 사실은 그 함수가 앞으로도 
계속 호출될 수 있고, 그래서 자바스크립트는 그 함수를 계속 유지해야 함을 뜻한다.<br />
변수가 부모 함수의 지역 변수라면 당연히 내부 함수는 그 부모의 범위를 상속하고 
있기 때문에 그 변수를 참조할 수 있다.<br />
같은 레퍼런스를 이용해서 deposit()를 두 번 호출하면 balance 변수의 값이 누적되고 있음을 확인할 수 있다.<br />
ac1(50); ac1(450);<br />
ac2(200); ac2(500);<br />
서로 다른 레퍼런스(ac1과 ac2)로 deposit() 함수를 호출하면, balance 변수가 서로 독립적으로 증가한다.
</p>

<h4>클로저 간 변수 공유</h4>

<pre class="prettyprint script-result-display">
function account(accountNo) {
	var balance = 0;
	
	function getAccountNo() {
		return accountNo;
	}
	function deposit(money) {
		balance += money;
	}
	function withdraw(money) {
		balance -= money;
	}
	function getBalance() {
		return balance;
	}
	return {
		"getAccountNo": getAccountNo,
		"deposit": deposit,
		"withdraw": withdraw,
		"getBalance": getBalance
	};
}

var ac1 = account('111');
ac1.deposit(1000);
ac1.withdraw(500);
alert(ac1.getAccountNo() + ': ' + ac1.getBalance());

var ac2 = account('222');
ac2.deposit(3000);
ac2.withdraw(1000);
alert(ac2.getAccountNo() + ': ' + ac2.getBalance());
</pre>

<p>
4 개의 내부 함수는 동일한 지역변수를 참조하고 있으며, 동일한 변수 범위를 공유하고 있다.<br />
deposit() 함수가 balance를 1000 증가시키면 withdraw()가 다시 호출될 때에 증가된 balance의 값이 
새로운 시작 값이 된다.<br />
account()을 또 호출하면(var ac2 = account('222');)<br />
동일한 닫힌 환경을 가지는 클로저의 새 인스턴스가 생성된다.<br />
</p>

<h3>객체 지향 자바스크립트</h3>

<p>
자바에서의 클래스를 자바스크립트에서는 다음처럼 작성하면 된다.<br />
간단히 설명하면,<br />
자바스크립트에서는 class 란 키워드가 없으니 클래스를 만들려면 function를 이용해서 만든다.<br />
this는 자바에서의 this 와 같다고 보면 된다.<br />
</p>

<pre class="prettyprint script-result-display">
function Account(accountNo,balance) {
	this.accountNo = accountNo.toString();
	this.balance = balance;
}
Account.prototype.getAccountNo = function () {
	return this.accountNo;
};
Account.prototype.getBalance = function () {
	return this.balance;
};
Account.prototype.deposit = function (money) {
	this.balance += money;
};
Account.prototype.withdraw = function (money) {
	this.balance -= money;
};

var ac1 = new Account('111',500);
ac1.deposit(1000);
ac1.withdraw(500);
alert(ac1.getAccountNo() + ': ' + ac1.getBalance());

var ac2 = new Account('222',1000);
ac2.deposit(3000);
ac2.withdraw(1000);
alert(ac2.getAccountNo() + ': ' + ac2.getBalance());
</pre>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html">http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html</a></li>
	<li><a href="http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf">http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf</a></li>
	<li><a href="http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html">JavaScript Scoping and Hoisting</a></li>
	<li><a href="http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf">ECMAScript 2017 Language Specification</a></li>
	<li><a href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects">Introducing JavaScript objects</a></li>
	<li><a href="http://www.w3schools.com/jsref/jsref_obj_regexp.asp">http://www.w3schools.com/jsref/jsref_obj_regexp.asp</a></li>
	<li><a href="http://regexlib.com">http://regexlib.com</a></li>
	<li><a href="http://www.w3schools.com/jsref/jsref_obj_date.asp">http://www.w3schools.com/jsref/jsref_obj_date.asp</a></li>
	<li><a href="http://www.w3schools.com/jsref/jsref_obj_array.asp">http://www.w3schools.com/jsref/jsref_obj_array.asp</a></li>
	<li><a href="http://www.w3schools.com/jsref/jsref_obj_math.asp">http://www.w3schools.com/jsref/jsref_obj_math.asp</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/javascript/examples"/>">예제</a></li>
		<li>이전 : <a href="<c:url value="/javascript/datatype"/>">데이터 타입</a></li>
	</ul>
</div>

</article>