<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>예제</h1>

<h2>1 select 엘리먼트 다루기</h2>

<h3>select 엘리먼트의 항목 처리</h3>

<h4>동적으로 항목 추가</h4>

<pre class="prettyprint">
opts[opts.length] = new Option("옵션 text", "옵션 value");
</pre>

<h4>동적으로 항목 제거</h4>

<pre class="prettyprint">
opts[2] = null;
</pre>

<p>
자바와 달리 중간에 생긴 빈 공간은 없어지고 배열이 자동으로 정렬된다.
</p>

<h4>모든 항목 제거</h4>

<pre class="prettyprint">
opts.length = 0;
</pre>

<p>
다음 예제는 '프로그래밍 언어'를 선택하면 두 번째 선택 상자에서 메뉴가 생성되는 예제이다.
언어를 선택할 때 최상위 메뉴를 선택하면 두 번째 선택 상자가 초기화되도록 구현했다.
</p>

<h6 class="src">sel.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 select 엘리먼트 다루기&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function chooseLang() {
	var form = document.getElementById("testForm");
	var lang = form.programLanguage.value;

	switch (lang) {
	case "java":
		form.step.options[0] = new Option("자바과정에대해","javaIntro");
		form.step.options[1] = new Option("객체와 클래스","ClassObject");
		form.step.options[2] = new Option("데이터타입","JavadataType");
		break;
	case "javascript":
		form.step.options[0] = new Option("자바스크립트란","javascriptIntro");
		form.step.options[1] = new Option("데이터타입","JavascriptDataType");
		form.step.options[2] = new Option("자바스크립트객체","JavascriptObjects");
		break;
	default:
		form.step.options.length = 0;
	}
	
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" action="sel.html"&gt;
	&lt;select name="programLanguage" onchange="chooseLang()"&gt;
		&lt;option value=""&gt;--언어를 선택하세요&lt;/option&gt;
		&lt;option value="java"&gt;자바&lt;/option&gt;
		&lt;option value="javascript"&gt;자바스크립트&lt;/option&gt;
	&lt;/select&gt;
	&lt;select name="step"&gt;
	&lt;/select&gt;
	&lt;input type="submit" value="테스트" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<a href="<c:url value="/examples/sel.html"/>">sel.html 예제 실행</a>

<h2>2 유효성 검사</h2>

<h3>폼에 접근</h3>

<p>
&lt;form id="someform"&gt; 폼 태그가 있다면 폼의 참조를 얻는 방법이다.<br />
</p>

<pre class="prettyprint">
var form = document.getElementsTagName("form")[0];
var form = document.getElementById("someform");
</pre>

<h3>폼에 이벤트를 추가하는 방법</h3>

<p>
폼 엘리먼트 내에 submit 버튼이 클릭 이벤트에 핸들러 함수를 매핑하는 방법은 다음과 같다.<br />
</p>

<pre class="prettyprint">
&lt;form id="someform" onsubmit="return 핸들러함수() "&gt;
</pre>

<p>
이때 핸들러 함수는 불린을 리턴해야 한다.<br />
유효성 검사를 통과하여 폼을 전송하려면 return true;로<br />
유효성 검사를 통과 못 해서 폼 전송을 취소하려면 return false;로 구현한다.<br />
</p>

<h3>라디오 버튼과 체크 박스</h3>

<p>
라디오 버튼을 비활성화 시키는 방법은 아래와 같다.<br />
</p>

<pre class="prettyprint">
document.someform.radiogroup[i].disabled = true;
</pre>

<p>
비활성화하면 이 파라미터는 서버에 전송되지 않는다.<br />
</p>

<h6 class="src">send1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 테스트&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function check() {
	var form = document.getElementById("testForm");
	<strong>form.condition[4].disabled = true;</strong>
	return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
	이름 &lt;input type="text" name="name" /&gt;&lt;br /&gt;
	B&lt;input type="radio" name="condition" value="best" /&gt;
	G&lt;input type="radio" name="condition" value="good" /&gt;
	N&lt;input type="radio" name="condition" value="normal" /&gt;
	B&lt;input type="radio" name="condition" value="bad" /&gt;
	W&lt;input type="radio" name="condition" value="worst" /&gt;
	&lt;input type="submit" value="전송" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1.html"/>">예제 실행</a><br />
이름을 입력하고 W를 선택한 후 서밋 버튼을 클릭하여 전송되는 파라미터와 값을 확인한다.<br />
W 외에 다른 값을 선택한 후 서밋 버튼을 클릭하여 전송되는 파라미터와 값을 확인한다.<br />
</p>

<h3>라디오 버튼이나 체크 박스를 선택하면 실행되는 이벤트 핸들러 등록 예제</h3>

<h6 class="src">send2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 테스트&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function agree() {
	var form = document.getElementById("testForm");
	var submit = document.getElementById("submit");
	if (form.agreement.checked == true) {
		submit.disabled = false;	
	} else {
		submit.disabled = true;
	}
	
}
function check() {
	var form = document.getElementById("testForm");
	form.condition[4].disabled = true;
	var chk = form.confirm[0].value

	return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
	이름 &lt;input type="text" name="name" /&gt;&lt;br /&gt;
	B&lt;input type="radio" name="condition" value="best" /&gt;
	G&lt;input type="radio" name="condition" value="good" /&gt;
	N&lt;input type="radio" name="condition" value="normal" /&gt;
	B&lt;input type="radio" name="condition" value="bad" /&gt;
	W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
	정보 제공에 동의합니다.
	&lt;input type="radio" name="agreement" value="y" onchange="agree()" /&gt;
	&lt;input type="submit" id="submit" value="확인" disabled="disabled" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send2.html"/>">예제 실행</a><br />
입력 후 서밋 버튼을 클릭하여 전송되는 파라미터와 값을 확인한다.<br />
</p>

<h3>그 밖의 참고사항</h3>
<ul>
	<li>라디오 버튼이나 체크박스의 경우 옵션을 동적으로 추가 또는 삭제할 수 없다.</li>
	<li>input 엘리먼트의 type 속성은 text, password, hidden 이 있다.</li>
	<li>textarea는 여러 줄을 입력할 수 있게 한다.</li>
	<li>input 과 textarea에서 사용자가 입력한 값은 value 속성으로 접근할 수 있다.</li>
	<li>click 이외에도 change, focus, blur 이벤트를 이용하여 폼 유효성 검사를 수행할 수 있다.</li>
	<li>이벤트 핸들러를 등록하는 방법은 아래와 같다.
		<ul>
			<li>onclick="핸들러 함수()"</li>
			<li>onchange="핸들러 함수()"</li>
			<li>onfocus="핸들러 함수()"</li>
			<li>onblur="핸들러 함수()"</li>
		</ul>
	</li>
</ul>

<h3>자바스크립트 코드와 디자인의 분리</h3>

<p>
엘리먼트의 onclick 속성을 이용하여 이벤트를 등록하는 방법은 디자인과의 결합도가 높은 코드다.<br />
<em class="path">&lt;form id="testForm" method="get" onsubmit="return check()"&gt;</em>
부분이 결합도가 높다. send1.html 파일을 아래처럼 바꾸어서 테스트한다.
</p>

<h6 class="src">send1-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 테스트&lt;/title&gt;
&lt;script type="text/javascript"&gt;
<strong>
window.onload = initPage;

function initPage() {
	var form = document.getElementById("testForm");
	form.onsubmit = check;
}

function check() {
	var form = document.getElementById("testForm");
	form.condition[4].disabled = true;
	return true;
}
</strong>
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
	이름 &lt;input type="text" name="name" /&gt;&lt;br /&gt;
	B&lt;input type="radio" name="condition" value="best" /&gt;
	G&lt;input type="radio" name="condition" value="good" /&gt;
	N&lt;input type="radio" name="condition" value="normal" /&gt;
	B&lt;input type="radio" name="condition" value="bad" /&gt;
	W&lt;input type="radio" name="condition" value="worst" /&gt;
	&lt;input type="submit" value="전송" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1-1.html"/>">예제 실행</a><br />
자바스크립트 코드를 외부 파일로 만들면 좋은 코드가 된다.<br />
</p>

<h6 class="src">send1-2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 테스트&lt;/title&gt;
<strong>&lt;script type="text/javascript" src="send1.js"&gt;&lt;/script&gt;</strong>
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
	이름 &lt;input type="text" name="name" /&gt;&lt;br /&gt;
	B&lt;input type="radio" name="condition" value="best" /&gt;
	G&lt;input type="radio" name="condition" value="good" /&gt;
	N&lt;input type="radio" name="condition" value="normal" /&gt;
	B&lt;input type="radio" name="condition" value="bad" /&gt;
	W&lt;input type="radio" name="condition" value="worst" /&gt;
	&lt;input type="submit" value="전송" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1-2.html"/>">예제 실행</a><br />
</p>

<h6 class="src">send1.js</h6>
<pre class="prettyprint">
window.onload = initPage;

function initPage() {
	var form = document.getElementById("testForm");
	form.onsubmit = check;
}

function check() {
	var form = document.getElementById("testForm");
	form.condition[4].disabled = true;
	return true;
}
</pre>

<h6 class="src">send2-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 테스트&lt;/title&gt;
&lt;script type="text/javascript"&gt;
window.onload = initPage;

function initPage() {
	var submit = document.getElementById("submit");
	submit.disabled = true;
	var form = document.getElementById("testForm");
	form.onsubmit = check;
	form.agreement.onchange = agree;
}

function agree() {
	var form = document.getElementById("testForm");
	var submit = document.getElementById("submit");
	if (form.agreement.checked == true) {
		submit.disabled = false;	
	} else {
		submit.disabled = true;
	}
}
function check() {
	var form = document.getElementById("testForm");
	form.condition[4].disabled = true;
	return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
	이름 &lt;input type="text" name="name" /&gt;&lt;br /&gt;
	B&lt;input type="radio" name="condition" value="best" /&gt;
	G&lt;input type="radio" name="condition" value="good" /&gt;
	N&lt;input type="radio" name="condition" value="normal" /&gt;
	B&lt;input type="radio" name="condition" value="bad" /&gt;
	W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
	정보 제공에 동의합니다.
	&lt;input type="radio" name="agreement" value="y"/&gt;
	&lt;input type="submit" id="submit" value="확인" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send2-1.html"/>">예제 실행</a><br />

위 예제 역시 자바스크립트 코드를 분리하면 더 좋은 코드가 된다.<br />

<a href="<c:url value="/examples/send2-2.html"/>">예제 실행</a><br />
</p>

<h2>3 쿠키 다루기</h2>

<pre class="prettyprint no-border">
var allCookies = document.cookie
</pre>

<p>
위 코드는 현재 문서 객체가 접근할 수 있는 모든 쿠키를 얻는다.<br /> 
</p>

<pre class="prettyprint no-border">
document.cookie = newCookie;
</pre>

<p>
위 코드는 새로운 쿠키를 추가한다.<br />
(추가한다고 document.cookie += newCookie;처럼 사용하지 않는다)
</p>

<h3>쿠키를 다루기 위한 사용자 정의 함수</h3>

<p>
아래 createCookie(), readCookie(), deleteCookie() 함수는 각각 쿠키를 굽고 쿠키를 읽고 쿠키를 삭제한다.<br />
쿠키를 굽는 createCookie() 함수는 <strong>쿠키 이름=쿠키값; 파기 날짜;</strong> 형태의 문자열을 생성한다.<br />
(이 경우 도메인, 경로, 보안은 디폴트 값이 적용된다)
</p>

<pre class="prettyprint">function createCookie(name, value, days) {
    var newCookie = name + "=" + escape(value);
    if (days) {
        var expires = new Date();
        expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
        newCookie += "; expires=" + expires.toGMTString();
    }
    document.cookie = newCookie;
}
function readCookie(name) {
    var allCookies = document.cookie;
    var beginIndex = allCookies.indexOf(" " + name + "=");
    if (beginIndex === -1) {
        beginIndex = allCookies.indexOf(name + "=");
    }
    if (beginIndex === -1) {
        return null;
    } else {
        beginIndex = allCookies.indexOf("=", beginIndex) + 1;
        var endIndex = allCookies.indexOf(";", beginIndex);
        if (endIndex === -1) {
            endIndex = allCookies.length;
        }
        return unescape(allCookies.substring(beginIndex, endIndex));
    }
}
function deleteCookie(name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
</pre>

<p>
사용자 정의 함수를 이용해서 게시판에 적용할 수 있는 예제를 만들었다.<br />
예제에서 사용자는 게시판 목록의 페이지당 레코드 수를 쿠키에 저장할 수 있다.<br />
(구글 크롬은 로컬에서 생산한 쿠키를 저장하지 않기에, 로컬 테스트를 하려면 다른 브라우저를 사용하라)
</p>

<div class="filename">Test.html</div>
<pre class="prettyprint">&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;자바스크립트 쿠키 테스트&lt;/title&gt;
&lt;script&gt;
window.onload = initPage;

function initPage() {
    var selectBox = document.getElementById("numPerPage");
    selectBox.onchange = setNumPerPage;
    var delNumPerPageBtn = document.getElementById("del-numPerPage-btn");
    delNumPerPageBtn.onclick = delNumPerPageCookie;
}
function setNumPerPage() {
    var selectBox = document.getElementById("numPerPage");
    var numPerPage = selectBox.value;
    createCookie('numPerPage', numPerPage, '100');
	showCookie();
}
function showCookie() {
    var numPerPage = readCookie("numPerPage");
    var div = document.getElementById('show-npp-div');
    if(numPerPage) {
      div.innerHTML = numPerPage;
    } else {
      div.innerHTML = '쿠키가 없습니다!';
    }
}
function delNumPerPageCookie() {
    deleteCookie("numPerPage");
    showCookie();
}
function createCookie(name, value, days) {
    var newCookie = name + "=" + escape(value);
    if (days) {
        var expires = new Date();
        expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
        newCookie += "; expires=" + expires.toGMTString();
    }
    document.cookie = newCookie;
}
function readCookie(name) {
    var allCookies = document.cookie;
    if (!allCookies) {
      return null;
    }
    var beginIndex = allCookies.indexOf(" " + name + "=");
    if (beginIndex === -1) {
        beginIndex = allCookies.indexOf(name + "=");
    }
    if (beginIndex === -1) {
        return null;
    } else {
        beginIndex = allCookies.indexOf("=", beginIndex) + 1;
        var endIndex = allCookies.indexOf(";", beginIndex);
        if (endIndex === -1) {
            endIndex = allCookies.length;
        }
        return unescape(allCookies.substring(beginIndex, endIndex));
    }
}
function deleteCookie(name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div&gt;
  &lt;select id="numPerPage"&gt;
    &lt;option value="10"&gt;10&lt;/option&gt;
    &lt;option value="25"&gt;25&lt;/option&gt;
    &lt;option value="50"&gt;50&lt;/option&gt;
    &lt;option value="100"&gt;100&lt;/option&gt;
  &lt;/select&gt;
  &lt;input type="button" id="del-numPerPage-btn" value="numPerPage 쿠키 삭제" /&gt;
&lt;/div&gt;
&lt;div id="show-npp-div"&gt;&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
setNumPerPage() 함수는 100일간 유지되는 numPerPage 쿠키를 굽는다.
</p>

<pre class="prettyprint">function setNumPerPage() {
  var selectBox = document.getElementById("numPerPage");
  var numPerPage = selectBox.value;
  createCookie('numPerPage', numPerPage, '100');
}
</pre>

<p>
numPerPage 쿠키가 구워지면 서버 측 코드는 다음처럼 쿠키를 얻을 수 있다.
</p>

<pre class="prettyprint">int numPerPage = 10;// 디폴트 레코드 수
Cookie[] cookies = req.getCookies();
if (cookies != null) {
  for (int i = 0; i &lt; cookies.length; i++) {
    String name = cookies[i].getName();
    if (name.equals("numPerPage")) {
      numPerPage = Integer.parseInt(cookies[i].getValue());
      break;
    }
  }
}
</pre>


<h2>4 HTML에서 자바스크립트 분리</h2>

<p>
이벤트 핸들러를 지정하는 데는 두 가지 방식이 있다.
</p>

<h4 class="filename">1. HTML 엘리먼트 속성에 바로 지정하는 방식</h4>
<pre class="prettyprint no-border">&lt;input type="button" value="버튼" onclick="이벤트 핸들러" /&gt;</pre>

<p>
HTML 속성에 이벤트 핸들러를 지정하면 HTML과 자바스크립트의 결합도가 높아진다.<br />
DOM 모델을 활용해서 이벤트 핸들러를 지정할 수 있는데, 이렇게 하면 HTML과 자바스크립트의 결합도를 조금 낮출 수 있다.<br />
지정을 보다 편하게 하기 위해 HTML 엘리먼트에 id 속성을 추가한다. 
</p>

<pre class="prettyprint no-border">&lt;input type="button" <strong>id="some-button"</strong> value="버튼" /&gt;</pre>

<h4 class="filename">2. DOM 모델을 활용해 지정하는 방식</h4>

<pre class="prettyprint no-border">window.onload = function() {
	var btn = document.getElementById("<strong>some-button</strong>");
	btn.onclick = function() {
		//TODO
	};
};
</pre>

<p>
웹 브라우저는 HTML 문서를 해석하여 보여준다.<br />
정확하게 말하면, HTML 문서로부터 DOM 트리를 생성한 후 DOM 트리를 해석해서 보여준다.<br />
모든 문서가 준비되었을 때 발생하는 이벤트가 window의 onload 이벤트다.<br />
window의 onload 이벤트에 이벤트 핸들러가 지정하는 방식에도 단점이 있다.<br />
필요하지 않았던 글로벌 속성(id,class,title)을 추가해야 하고, 문서에 이미지가 많을수록 핸들러 등록이 늦어진다.
(window의 onload 이벤트는 이미지가 모두 로드된 후 발생하기 때문이며, 절 후반에 제이쿼리를 사용하면 개선할 수 있다)<br />
이 절에서 우리는 HTML 속성에 지정한 핸들러를 제거하고, DOM을 활용해서 핸들러를 지정하는 실습을 할 것이다. 
실습 대상은 게시판의 view.jsp 파일이다.
</p>

<h3>첨부 파일 링크와 첨부 파일 삭제 링크</h3>

<p>
<img alt="첨부 파일링크와 첨부 파일 삭제 링크" src="<c:url value="/resources/images/files.png"/>" /><br />
</p>

<p>
다운로드 링크와 삭제 링크를 다음과 같이 수정한다.
</p>

<pre class="prettyprint">&lt;div id="detail"&gt;
	&lt;div id="date-writer-hit"&gt;
		edited &lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="\${regdate }" /&gt; by \${name } hit {hit }
	&lt;/div&gt;
	&lt;div id="article-content"&gt;\${content }&lt;/div&gt;
	&lt;div id="file-list" style="text-align: right;"&gt;
		&lt;c:forEach var="file" items="/\${attachFileList }" varStatus="status"&gt;
			&lt;div class="attach-file"&gt;
			&lt;a href="#" <strong>title="/\${file.filename }" class="download"</strong>&gt;\${file.filename }&lt;/a&gt;
			&lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
				<strong>&lt;a href="#" title="\${file.attachFileNo }"&gt;삭제&lt;/a&gt;</strong>
			&lt;/security:authorize&gt;
		&lt;/div&gt;
		&lt;/c:forEach&gt;
	&lt;/div&gt;        
&lt;/div&gt;
</pre>

<p>
&lt;script&gt;와 &lt;/script&gt; 사이에 다음을 추가한다.
</p>

<pre class="prettyprint">window.onload = initPage;

function initPage() {
  //첨부 파일 다운로드, 첨부 파일 삭제
  var file_list = document.getElementById("file-list");
  var fileLinks = file_list.getElementsByTagName("a");
  
  for (var i = 0; i &lt; fileLinks.length; i++) {
    var fileLink = fileLinks[i];
    if (fileLink.className == "download") {
      fileLink.onclick = function() {
        var attachFileNo = this.title;
        var form = document.getElementById("downForm");
        form.attachFileNo.value = attachFileNo;
        form.submit();
        return false;
      };
    } else {
      fileLink.onclick = function() {
        var attachFileNo = this.title;
        var chk = confirm("정말로 삭제하겠습니까?");
        if (chk === true) {
          var form = document.getElementById("deleteAttachFileForm");
          form.attachFileNo.value = attachFileNo;
          form.submit();
          return false;
        }
      };
    }
  }
  //TODO 진행하면서 이곳에 코드를 추가한다.
  
}//initPage 함수 끝
</pre>


<h3>댓글</h3>

<p>
<img alt="댓글 반복" src="<c:url value="/resources/images/comments.png"/>" /><br />
관련 코드를 다음처럼 수정한다.<br />
</p>

<pre class="prettyprint"><strong>&lt;div id="all-comments"&gt;</strong>
  &lt;c:forEach var="comment" items="\${commentList }" varStatus="status"&gt;
  &lt;div class="comments"&gt;
    &lt;span class="writer"&gt;\${comment.name }&lt;/span&gt;
    &lt;span class="date"&gt;\${comment.regdate }&lt;/span&gt;
    &lt;security:authorize access="#comment.email == principal.username or hasRole('ROLE_ADMIN')"&gt;
    &lt;span class="modify-del"&gt;
      <strong>&lt;a href="#"&gt;수정&lt;/a&gt;</strong> | <strong>&lt;a href="#" title="\${comment.commentNo }"&gt;삭제&lt;/a&gt;</strong>
    &lt;/span&gt;
    &lt;/security:authorize&gt;
    <strong>&lt;div class="comment-memo"&gt;\${comment.memo }&lt;/div&gt;</strong>
    <strong>&lt;form class="comment-form" action="updateComment" method="post" style="display: none"&gt;</strong>
      &lt;input type="hidden" name="commentNo" value="\${comment.commentNo }" /&gt;
      &lt;input type="hidden" name="boardCd" value="\${param.boardCd }" /&gt;
      &lt;input type="hidden" name="articleNo" value="\${param.articleNo }" /&gt;
      &lt;input type="hidden" name="page" value="\${param.page }" /&gt;
      &lt;input type="hidden" name="searchWord" value="\${param.searchWord }" /&gt;
      &lt;div style="text-align: right;"&gt;
        <strong>&lt;a href="#"&gt;전송&lt;/a&gt;</strong> | <strong>&lt;a href="#"&gt;취소&lt;/a&gt;</strong>
      &lt;/div&gt;
      &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;\${comment.memo }&lt;/textarea&gt;
      &lt;/div&gt;
    &lt;/form&gt;
  &lt;/div&gt;
  &lt;/c:forEach&gt;
<strong>&lt;/div&gt;</strong>
</pre>

<p>
initPage() 함수 밖에 다음을 추가한다.
</p>

<pre class="prettyprint">function commentUpdate(e) {
  var me = getActivatedObject(e);
  var form = me.parentNode;
  while (form.className != "comment-form") {
    form = form.parentNode;
  }
  form.submit();
  return false;
}
function modifyCommentToggle(e) {
  var me = getActivatedObject(e);
  var comments = me.parentNode;
  while (comments.className != "comments") {
    comments = comments.parentNode;
  }
  var div = comments.getElementsByTagName("div")[0];//댓글 내용
  var form = comments.getElementsByTagName("form")[0];//댓글 form
  if (div.style.display) {
    div.style.display = '';
    form.style.display = 'none';
  } else {
    div.style.display = 'none';
    form.style.display = '';
  }
  return false; 
}
/*
 Head First Ajax 참조 
*/
function getActivatedObject(e) {
  var obj;
  if (!e) {
    //IE 옛 버전
    obj = window.event.srcElement;
  } else if (e.srcElement) {
    //IE 7 이상
    obj = e.srcElement;
  } else {
    //DOM 레벨 2 브라우저
    obj = e.target;
  }
  return obj;
}
</pre>

<p>
initPage() 함수에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">//댓글
var allComments = document.getElementById("all-comments");
var divs = allComments.getElementsByTagName("div");

for (i = 0; i &lt; divs.length; i++) {
  if (divs[i].className == "comments") {
    var comments = divs[i];
    var spans = comments.getElementsByTagName("span");
    for (var j = 0; j &lt; spans.length; j++) {
      if (spans[j].className === "modify-del") {
        var md = spans[j];
        var commentModifyLink = md.getElementsByTagName("a")[0];//수정 링크
        commentModifyLink.onclick = modifyCommentToggle;
        var commentDelLink = md.getElementsByTagName("a")[1];//삭제 링크
        commentDelLink.onclick = function() {
          var commentNo = this.title;
          var chk = confirm("정말로 삭제하겠습니까?");
          if (chk === true) {
            var form = document.getElementById("deleteCommentForm");
            form.commentNo.value = commentNo;
            form.submit();
            return false;
           }
         };
      }
      //form 태그 안의 수정하기 링크
      var form = comments.getElementsByTagName("form")[0];
      var div = form.getElementsByTagName("div")[0];
      commentModifyLink = div.getElementsByTagName("a")[0];
      commentModifyLink.onclick = commentUpdate;
      //form 태그 안의 취소링크
      var cancelLink = div.getElementsByTagName("a")[1];
      cancelLink.onclick = modifyCommentToggle;
    }
  }  
}
</pre>


<h3>이전 글 링크와 다음 글 링크</h3>

<p>
<img alt="다음 글 이전 글 링크" src="<c:url value="/resources/images/next-prev.png"/>" /><br />
관련 코드를 수정한다.<br />
</p>

<pre class="prettyprint">&lt;div id="next-prev"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;p&gt;다음 글 : &lt;a href="#" <strong>title="\${nextArticle.articleNo }"</strong>&gt;\${nextArticle.title } &lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;p&gt;이전 글 : &lt;a href="#" <strong>title="\${prevArticle.articleNo }"</strong>&gt;\${prevArticle.article.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
</pre>

<p>
initPage() 함수에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">//다음 글, 이전 글 링크
var nextPrev = document.getElementById("next-prev");
links = nextPrev.getElementsByTagName("a");
for (i = 0; i &lt; links.length; i++) {
  links[i].onclick = function() {
    var form = document.getElementById("viewForm");
    form.articleNo.value = this.title;
    form.submit();
    return false;  	
  };
}
</pre>


<h3>수정, 삭제, 다음 글, 이전 글, 목록, 새 글쓰기 버튼</h3>

<p>
<img alt="수정, 삭제, 다음 글, 이전 글, 목록, 새 글쓰기 버튼" src="<c:url value="/resources/images/view-menu-buttons.png"/>" /><br />
관련 코드를 다음과 같이 수정한다. (두 군데 모두 수정한다)<br />
</p>

<pre class="prettyprint">&lt;div class="view-menu" ..&gt;
  &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="수정" <strong>class="goModify"</strong> /&gt;
    &lt;input type="button" value="삭제" <strong>class="goDelete"</strong> /&gt;
  &lt;/div&gt;
  &lt;/security:authorize&gt;
  &lt;div class="fr"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;input type="button" value="다음 글" title="\${nextArticle.articleNo }" <strong>class="next-article"</strong> /&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;input type="button" value="이전 글" title="\${prevArticle.articleNo }" <strong>class="prev-article"</strong> /&gt;
  &lt;/c:if&gt;
    &lt;input type="button" value="목록" <strong>class="goList"</strong> /&gt;
    &lt;input type="button" value="새 글쓰기" <strong>class="goWrite"</strong> /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
initPage() 함수에 다음 코드를 추가한다.<br />
</p>

<pre class="prettyprint">//수정버튼
var modifyBtns = document.getElementsByClassName("goModify");
i = modifyBtns.length;
while (i--) {
  modifyBtns[i].onclick = function() {
    var form = document.getElementById("modifyForm");
    form.submit();
  };
}
//삭제버튼
var deleteBtns = document.getElementsByClassName("goDelete");
i = deleteBtns.length;
while (i--) {
  deleteBtns[i].onclick = function() {
    var chk = confirm('정말로 삭제하겠습니까?');
    if (chk === true) {
      var form = document.getElementById("delForm");
      form.submit();
    }
  };
}
//다음 글 버튼
var nextArticleBtns = document.getElementsByClassName("next-article");
i = nextArticleBtns.length;
while (i--) {
  nextArticleBtns[i].onclick = function() {
  	    var form = document.getElementById("viewForm");
  	    form.articleNo.value = this.title;
  	    form.submit();
  };
}
//이전 글 버튼
var prevArticleBtns = document.getElementsByClassName("prev-article");
i = prevArticleBtns.length;
while (i--) {
  prevArticleBtns[i].onclick = function() {
    var form = document.getElementById("viewForm");
    form.articleNo.value = this.title;
    form.submit();
  };
}
//목록버튼
var listBtns = document.getElementsByClassName("goList");
i = listBtns.length
while (i--) {
  listBtns[i].onclick = function() {
    var form = document.getElementById("listForm");
    form.submit();
  };
}  
//새 글쓰기 버튼
var writeBtns = document.getElementById("goWrite");
i = writeBtns.length;
while(i--) {
  writeBtns[i].onclick = function() {
      var form = document.getElementById("writeForm");
      form.submit();
  };
}
</pre>

<h3>제목 링크, 페이징 직접 이동 링크, 새 글쓰기 버튼</h3>

<p>
<img alt="view.jsp에서 목록과 페이징 처리 부분, 새 글쓰기 버튼" src="<c:url value="/resources/images/list-table-paging-list-menu.png"/>" /><br />
관련 코드를 수정한다.<br />
</p>

<pre class="prettyprint">&lt;table <strong>id="list-table"</strong> class="bbs-table"&gt;
&lt;tr&gt;
  &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
  &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 시작 --&gt;
&lt;c:forEach var="article" items="\${list }" varStatus="status"&gt;
&lt;tr&gt;
  &lt;td style="text-align: center;"&gt;
  &lt;c:choose&gt;
    &lt;c:when test="\${param.articleNo == article.articleNo }"&gt;
      &lt;img src="/resources/images/arrow.gif" alt="현재 글" /&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt; 
      \${listItemNo - status.index }
    &lt;/c:otherwise&gt;
  &lt;/c:choose&gt; 
  &lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;a href="#" title="\${article.articleNo }"&gt;\${article.title }&lt;/a&gt;</strong>
    &lt;c:if test="\${article.attachFileNum &gt; 0 }"&gt;
      &lt;img src="/resources/images/attach.png" alt="첨부 파일" style="vertical-align: middle;" /&gt;
    &lt;/c:if&gt;
    &lt;c:if test="\${article.commentNum &gt; 0 }"&gt;
      &lt;span class="bbs-strong"&gt;[\${article.commentNum }]&lt;/span&gt;
    &lt;/c:if&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;
    &lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;\${article.hit }&lt;/td&gt;
&lt;/tr&gt;
&lt;/c:forEach&gt;
&lt;!--  반복 구간 끝 --&gt;
&lt;/table&gt;
    
&lt;div id="paging"&gt;
  &lt;c:if test="\${prevPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${prevPage }"&gt;[이전]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
  &lt;c:forEach var="i" begin="\${firstPage }" end="\${lastPage }"&gt;
    &lt;c:choose&gt;
      &lt;c:when test="\${param.page == i }"&gt;
        &lt;span class="bbs-strong"&gt;\${i }&lt;/span&gt;
      &lt;/c:when&gt;
      &lt;c:otherwise&gt;   
        <strong>&lt;a href="#" title="\${i }"&gt;\${i }&lt;/a&gt;</strong>
        &lt;/c:otherwise&gt;
    &lt;/c:choose&gt;   
  &lt;/c:forEach&gt;
  &lt;c:if test="&#36;{nextPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${nextPage }"&gt;[다음]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
&lt;/div&gt;
&lt;div id="list-menu"&gt;
  <strong>&lt;input type="button" value="새 글쓰기" /&gt;</strong>
&lt;/div&gt;
</pre>

<p>
initPage() 함수에 다음 코드를 추가한다.<br />
</p>

<pre class="prettyprint">//상세보기에서 목록 제목 링크
var listTable = document.getElementById("list-table");
links = listTable.getElementsByTagName("a");
for (i = 0; i &lt; links.length; i++) {
  links[i].onclick = function() {
    var form = document.getElementById("viewForm");
    form.articleNo.value = this.title;
    form.submit();
    return false;
  };
}
//페이징 처리
var paging = document.getElementById("paging");
links = paging.getElementsByTagName("a");
for (i = 0; i &lt; links.length; i++) {
  links[i].onclick = function() {
    var form = document.getElementById("listForm");
    form.page.value = this.title;
    form.submit();
    return false;
  };
}
//검색 버튼 위 새 글쓰기 버튼
var listMenu = document.getElementById("list-menu");
writeBtn = listMenu.getElementsByTagName("input")[0];
writeBtn.onclick = function() {
  var form = document.getElementById("writeForm");
  form.submit();
};
</pre>

<h3>첨부 파일 링크와 첨부 파일 삭제 링크(jQuery)</h3>

<p>
자바스크립트 분리 DOM 실습을 jQuery로 수정한다.<br />
순서대로 첨부 파일 다운로드 링크와 삭제 링크부터 수정한다.<br />
<img alt="첨부 파일링크와 첨부 파일 삭제 링크" src="<c:url value="/resources/images/files.png"/>" /><br />

<a href="http://jQuery.com">jQuery.com</a>에서 jQuery 최신 버전을 내려받는다.<br />
/js 폴더에 내려받은 jQuery 파일을 복사한다.<br />
view.jsp의 &lt;head&gt;와 &lt;/head&gt; 사이에 다음 코드를 추가한다.
</p>

<pre class="prettyprint no-border"><strong>&lt;script src="/resources/js/jquery.js"&gt;&lt;/script&gt;</strong></pre>

<p>
다운로드 링크와 삭제 링크는 제이쿼리를 적용하는 데 있어 고칠 부분이 없다.
</p>

<pre class="prettyprint">&lt;div id="detail"&gt;
	&lt;div id="date-writer-hit"&gt;
		edited &lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="\${regdate }" /&gt; by \${name } hit {hit }
	&lt;/div&gt;
	&lt;div id="article-content"&gt;\${content }&lt;/div&gt;
	&lt;div id="file-list" style="text-align: right;"&gt;
	&lt;c:forEach var="file" items="\${attachFileList }" varStatus="status"&gt;
		&lt;div class="attach-file"&gt;
			&lt;a href="#" <strong>title="\${file.filename }" class="download"</strong>&gt;\${file.filename }&lt;/a&gt;
			&lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
				<strong>&lt;a href="#" title="\${file.attachFileNo }"&gt;x&lt;/a&gt;</strong>
			&lt;/security:authorize&gt;
		&lt;/div&gt;
    &lt;/c:forEach&gt;
	&lt;/div&gt;        
&lt;/div&gt;
</pre>

<p>
자바스크립트 기존 내용은 모두 주석 처리한 후 아래 코드를 추가한다.
</p>

<pre class="prettyprint">$(document).ready(function() {
  $('#file-list a.download').click(function(e) {
    e.preventDefault();
    var filename = this.title;
    $('#downForm input[name*=filename]').val(filename);
    $('#downForm').submit();
  });
  $('#file-list a:not(.download)').click(function(e) {
    e.preventDefault();
    var chk = confirm("정말로 삭제하겠습니까?");
    if (chk === true) {
      var attachFileNo = this.title;
      $('#deleteAttachFileForm input[name*=attachFileNo]').val(attachFileNo);
      $('#deleteAttachFileForm').submit();
    }
  });
});
</pre>

<h3>댓글(jQuery)</h3>

<p>
<img alt="댓글 반복" src="<c:url value="/resources/images/comments.png"/>" /><br />
다음과 같이 수정한다.
</p>

<pre class="prettyprint">&lt;div id="all-comments"&gt;
  &lt;c:forEach var="comment" items="\${commentList }"&gt;
  &lt;div class="comments"&gt;
    &lt;span class="writer"&gt;\${comment.username }&lt;/span&gt;
    &lt;span class="date"&gt;\${comment.regdate }&lt;/span&gt;
    &lt;c:if test="\${user.username == comment.username }" &gt;
    &lt;span class="modify-del"&gt;
      &lt;a href="#" <strong>class="comment-modify-link"</strong>&gt;수정&lt;/a&gt; | 
      &lt;a href="#" <strong>class="comment-delete-link"</strong> title="\${comment.commentNo }"&gt;삭제&lt;/a&gt;
    &lt;/span&gt;
    &lt;/c:if&gt;
    &lt;div class="comment-memo"&gt;\${comment.memo }&lt;/div&gt;
    &lt;form class="comment-form" action="updateComment" method="post" style="display: none"&gt;
      &lt;input type="hidden" name="commentNo" value="\${comment.commentNo }" /&gt;
      &lt;input type="hidden" name="boardCd" value="\${param.boardCd }" /&gt;
      &lt;input type="hidden" name="articleNo" value="\${param.articleNo }" /&gt;
      &lt;input type="hidden" name="page" value="\${param.page }" /&gt;
      &lt;input type="hidden" name="searchWord" value="\${param.searchWord }" /&gt;
      &lt;div style="text-align: right;"&gt;
        &lt;a href="#" <strong>class="comment-modify-submit-link"</strong>&gt;전송&lt;/a&gt; | &lt;a href="#" <strong>class="comment-modify-cancel-link"</strong>&gt;취소&lt;/a&gt;
      &lt;/div&gt;
      &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;\${comment.memo }&lt;/textarea&gt;
      &lt;/div&gt;
    &lt;/form&gt;
  &lt;/div&gt;
  &lt;/c:forEach&gt;
&lt;/div&gt;
</pre>

<p>
$(document).ready(function() {} 함수에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">//댓글반복
$('.comments').click(function(e) {
  e.preventDefault();
  if ($(e.target).is('.comment-modify-link')) {
    var $form = $(e.target).parent().parent().find('.comment-form');
    var $div = $(e.target).parent().parent().find('.comment-memo');
    if ($form.is(':hidden') === true) {
      $form.show();
      $div.hide();
    } else {
      $form.hide();
      $div.show();
    }
  } else if ($(e.target).is('.comment-modify-cancel-link')) {
    var $form = $(e.target).parent().parent().parent().find('.comment-form');
    var $div = $(e.target).parent().parent().parent().find('.comment-memo');
    if ($form.is(':hidden') === true) {
      $form.show();
      $div.hide();
    } else {
      $form.hide();
      $div.show();
    }
  } else if ($(e.target).is('.comment-modify-submit-link')) {
    var $form = $(e.target).parent().parent().parent().find('.comment-form');
    $form.submit();
  } else if ($(e.target).is('.comment-delete-link')) {
    var chk = confirm('정말로 삭제하겠습니까?');
    if (chk === false) {
      return;
    }
    var $commentNo = $(e.target).attr('title');
    $('#deleteCommentForm input[name*=commentNo]').val($commentNo);
    $('#deleteCommentForm').submit();
  }
});  
</pre>


<h3>이전 글 링크와 다음 글 링크(jQuery)</h3>

<p>
<img alt="다음 글 이전 글 링크" src="<c:url value="/resources/images/next-prev.png"/>" /><br />
관련 코드는 전과 같다.
</p>

<pre class="prettyprint">&lt;div id="next-prev"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;p&gt;다음 글 : &lt;a href="#" <strong>title="\${nextArticle.articleNo }"</strong>&gt;\${nextArticle.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;p&gt;이전 글 : &lt;a href="#" <strong>title="\${prevArticle.articleNo }"</strong>&gt;\${prevArticle.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
</pre>

<p>
$(document).ready(function() {} 함수에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">$('#next-prev a').click(function(e) {
  e.preventDefault();
  var articleNo = this.title;
  $('#viewForm input[name*=articleNo]').val(articleNo);
  $('#viewForm').submit();
});
</pre>

<h3>수정, 삭제, 다음 글, 이전 글, 목록, 새 글쓰기 버튼(jQuery)</h3>

<p>
<img alt="수정, 삭제, 다음 글, 이전 글, 목록, 새 글쓰기 버튼" src="<c:url value="/resources/images/view-menu-buttons.png"/>" /><br />
관련 코드는 전과 같다.
</p>

<pre class="prettyprint">&lt;div class="view-menu" .. &gt;
  &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="수정" <strong>class="goModify"</strong> /&gt;
    &lt;input type="button" value="삭제" <strong>class="goDelete"</strong> /&gt;
  &lt;/div&gt;
  &lt;/security:authorize&gt;    
  &lt;div class="fr"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;      
    &lt;input type="button" value="다음 글" title="\${nextArticle.articleNo }" <strong>class="next-article"</strong> /&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;          
    &lt;input type="button" value="이전 글" title="\${prevArticle.articleNo }" <strong>class="prev-article"</strong> /&gt;
  &lt;/c:if&gt;
    &lt;input type="button" value="목록" <strong>class="goList"</strong> /&gt;
    &lt;input type="button" value="새 글쓰기" <strong>class="goWrite"</strong> /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
$(document).ready(function() {} 함수에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">//수정 버튼
$('.goModify').click(function() {
  $('#modifyForm').submit();
});
//삭제 버튼
$('.goDelete').click(function() {
  var chk = confirm('정말로 삭제하겠습니까?');
  if (chk === true) {
    $('#delForm').submit();
  }
});
//다음 글 버튼
$('.next-article').click(function() {
  var articleNo = this.title;
  $('#viewForm input[name*articleNo]').val(articleNo);
  $('#viewForm').submit();
});
//이전 글 버튼
$('.prev-article').click(function() {
  var articleNo = this.title;
  $('#viewForm input[name*articleNo]').val(articleNo);
  $('#viewForm').submit();
});
//목록버튼
$('.goList').click(function() {
  $('#listForm').submit();
});
//새 글쓰기 버튼
$('.goWrite').click(function() {
  $('#writeForm').submit();
});
</pre>

<h3>제목 링크, 페이징 직접 이동 링크, 새 글쓰기 버튼(jQuery)</h3>

<p>
<img alt="view.jsp에서 목록과 페이징처리 부분,새 글쓰기 버튼" src="<c:url value="/resources/images/list-table-paging-list-menu.png"/>" /><br />
관련 코드는 전과 같다.<br />
</p>

<pre class="prettyprint">&lt;table <strong>id="list-table"</strong> class="bbs-table"&gt;
&lt;tr&gt;
  &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
  &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 시작 --&gt;
&lt;c:forEach var="article" items="\${list }" varStatus="status"&gt;
&lt;tr&gt;
  &lt;td style="text-align: center;"&gt;
  &lt;c:choose&gt;
    &lt;c:when test="\${param.articleNo == article.articleNo }"&gt;
      &lt;img src="/resources/images/arrow.gif" alt="현재 글" /&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt; 
      \${listItemNo - status.index }
    &lt;/c:otherwise&gt;
  &lt;/c:choose&gt; 
  &lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;a href="#" title="\${article.articleNo }"&gt;\${article.title }&lt;/a&gt;</strong>
    &lt;c:if test="&#36;{article.attachFileNum &gt; 0 }"&gt;
      &lt;img src="/resources/images/attach.png" alt="첨부 파일" style="vertical-align: middle;" /&gt;
    &lt;/c:if&gt;
    &lt;c:if test="&#36;{article.commentNum &gt; 0 }"&gt;
      &lt;span class="bbs-strong"&gt;[\${article.commentNum }]&lt;/span&gt;
    &lt;/c:if&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;
    &lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;\${article.hit }&lt;/td&gt;
&lt;/tr&gt;
&lt;/c:forEach&gt;
&lt;!--  반복 구간 끝 --&gt;
&lt;/table&gt;
    
&lt;div id="paging"&gt;
  &lt;c:if test="&#36;{prevPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${prevPage }"&gt;[이전]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
    
  &lt;c:forEach var="i" begin="\${firstPage }" end="\${lastPage }"&gt;
    &lt;c:choose&gt;
      &lt;c:when test="\${param.page == i }"&gt;
        &lt;span class="bbs-strong"&gt;\${i }&lt;/span&gt;
      &lt;/c:when&gt;
      &lt;c:otherwise&gt;   
        <strong>&lt;a href="#" title="\${i }"&gt;\${i }&lt;/a&gt;</strong>
        &lt;/c:otherwise&gt;
    &lt;/c:choose&gt;   
  &lt;/c:forEach&gt;
    
  &lt;c:if test="&#36;{nextPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${nextPage }"&gt;[다음]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
    
&lt;/div&gt;

&lt;div id="list-menu"&gt;
  <strong>&lt;input type="button" value="새 글쓰기" /&gt;</strong>
&lt;/div&gt;
</pre>

<p>
$(document).ready(function() {} 함수에 다음 코드를 추가한다.<br />
</p>

<pre class="prettyprint">//상세보기에서 목록 제목 링크
$('#list-table a').click(function(e) {
  e.preventDefault();
  var articleNo = this.title;
  $('#viewForm input[name*articleNo]').val(articleNo);
  $('#viewForm').submit();
});
//페이징 처리
$('#paging a').click(function(e) {
  e.preventDefault();
  var page = this.title;
  $('#listForm input[name*=page]').val(page);
  $('#listForm').submit();
});
//검색 버튼 위 새 글쓰기 버튼
$('#list-menu input').click(function() {
  $('#writeForm').submit();
});
</pre>

<p>
DOM 처리 자바스크립트 실습에서 title 속성을 자주 사용했는데 title은 글로벌 속성이라 다양한 엘리먼트에 쓸 수 있기에 선택했다. 그 외 특별한 이유는 없다.<br />
순수 자바스크립트 또는 jQuery를 사용할 지는 여러분 몫이다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://en.wikipedia.org/wiki/HTTP_cookie">http://en.wikipedia.org/wiki/HTTP_cookie</a></li>
	<li><a href="http://ezbuilder.tistory.com/34">http://ezbuilder.tistory.com/34</a></li>
	<li><a href="http://stackoverflow.com/questions/2144386/javascript-delete-cookie">http://stackoverflow.com/questions/2144386/javascript-delete-cookie</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>이전 : <a href="<c:url value="/javascript/objects"/>">자바스크립트 객체</a></li>
	</ul>
</div>

</article>