<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>프로토타입</h1>

<p>
프로토타입(Prototype)이란 개발 초기에 만드는 일종의 모형이다.<br />
웹 애플리케이션의 프로토타입은 화면에 해당하는 뷰(JSP 또는 html)를 중심으로 작성한다.<br />
프로그램 로직은 테스트에 필요하거나 개발 종료까지 변경되지 않는 명확한 부분만 작성한다.<br />
</p>
<h1>주요 엘리먼트 배치</h1>

<p style="margin: 17px; font-weight: bold; font-size: 15px;">
이번 글은 CSS 포지셔닝을 다룬다. 
CSS 포지셔닝이란 CSS를 사용하여 웹사이트의 화면을 구성하는 기법을 말한다.
따라서 HTML과 CSS에 대한 기본적인 이해가 필요하다.
</p>

<p>
화면구성할 때 중요하게 쓰이는 CSS 속성은 float과 margin이다.
여기서 소개하는 방법의 특별한 점은 margin 값에 음수를 사용한다는 데 있다.
이제부터 margin에 음수값을 지정하는 기법을 '음수 마진'이라고 부르겠다.
음수 마진은 화면구성에 필요한 엘리먼트의 수를 최소화할 수 있다.
</p>
 
<h2>음수 마진 기법 이해하기</h2>

<h3>float이 적용된 엘리먼트 다음의 엘리먼트</h3>

<p>
float이 적용된 엘리먼트 다음의 정상적인 엘리먼트는 float이 적용된 엘리먼트의 존재를 인식하지 못하고 자신의 상자 영역을 확보한다.
하지만 float이 적용된 엘리먼트의 영역은 침범하지 않는다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		background-color: #ddd;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b.png"/>" alt="A float:left" />
</p>

<h3>clear 프로퍼티</h3>

<p>
clear 프로퍼티 값은 left, right, both가 있다.
정확한 의미는 다음 예제로 확인하자.
</p>

<p>
A에 float: left, B에 float: right 프로퍼티 적용한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		float: right;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right.png"/>" alt="A float:left,B float:right" />
</p>

<p>
C에 clear: left; 를 추가한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		float: right;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		<strong>clear: left;</strong>
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-left.png"/>" alt="A float:left,B float:right,C clear:left" />
</p>

<p>
C의 clear 프로퍼티를 clear: right; 로 수정한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		float: right;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		<strong>clear: right;</strong>
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-right.png"/>" alt="A float:left,B float:right,C clear:right" />
</p>

<p>
C의 clear 프로퍼티를 clear: both; 로 수정한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		float: right;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		<strong>clear: both;</strong>
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-both.png"/>" alt="A float:left,B float:right,C clear:both" />
</p>

<h3>음수 마진</h3>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		background-color: #ddd;
	}
&lt;/style&gt;
</pre>

<div style="margin: 0 auto;width: 268px;border-left: 4px red dotted;border-right: 4px red dotted;">
<img src="<c:url value="/resources/images/a-b.png"/>" alt="A float:left,B float:left" />
</div>

<p>
A의 margin-left에 음수값을 적용하면 그 값만큼 A가 왼쪽으로 움직인다.
이때 B도 따라 움직인다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		<strong>margin-left: -50px;</strong>
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		background-color: #ddd;
	}
&lt;/style&gt;
</pre>

<!-- 왼쪽으로 50px -->
<div style="margin: 0 auto;width: 265px;height: 100px;border-left: 4px red dotted;border-right: 4px red dotted;">
<img src="<c:url value="/resources/images/a-margin-left-50px-b.png"/>" alt="A float:left;margin-left: -50px;,B float:left" style="display: block;float: left;margin-left: -50px;opacity: 0.6;"/>
</div>

<p>
A의 margin-right에 음수값을 적용하면 그 값만큼 B를 끌어당긴다.
이때 B의 콘텐츠가 A 콘텐츠를 덮는다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100px;
		<strong>margin-right: -50px;</strong>
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		background-color: #ddd;
	}
&lt;/style&gt;
</pre>

<div style="margin: 0 auto;width: 265px;border-left: 4px red dotted;border-right: 4px red dotted">
<img src="<c:url value="/resources/images/a-margin-right-50px-b.png"/>" alt="A float:left;margin-right: -50px;,B float:left" />
</div>

<h3>3열 포지셔닝</h3>

<p>
A, B, C 모두는 float: left; 이다. 음수 마진이 적용하지 않는 한 서로 간의 영역을 침범하지 않는다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		<strong>float: left;</strong>
		width: 100px;
		background-color: #66f;
	}
	#B {
		<strong>float: left;</strong>
		width: 100px;
		background-color: #ddd;
	}
	#C {
		<strong>float: left;</strong>
		width: 100px;
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-b-c-all-float-left.png"/>" alt="A float:left;B float:left,C float:left" />
</p>

<p>
A의 width를 width: 100%; 로 수정한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		<strong>width: 100%;</strong>
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		float: left;
		width: 100px;
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-100-width-b-c-all-float-left.png"/>" alt="A float:left;width:100%,B float:left,C float:left" />
</p>

<p>
A 아래 B와 C가 있는 듯하지만, A, B, C는 나란히 있다고 봐야 한다.
</p>

<p>
A의 width가 100%이고, 여기에 margin-right: -100%; 를 추가하면 B, C는 A의 왼쪽에 겹치게 된다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100%;
		<strong>margin-right: -100%;</strong>
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		background-color: #ddd;
	}
	#C {
		float: left;
		width: 100px;
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-100-width-margin-right-100-b-c-all-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<p>
A의 margin-right: -100%; 를 지우고 B에 margin-left: -100%; 를 추가한다.
그러면 B는 A의 왼쪽에 겹치고 C는 원래 B자리로 이동한다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100%;
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		<strong>margin-left: -100%;</strong>
		background-color: #ddd;
	}
	#C {
		float: left;
		width: 100px;
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-b-margin-left-100-c-all-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<p>
원래 C의 넓이만큼 C에 margin-left: -100px; 를 주면 C는 A의 오른쪽에 겹쳐 위치하게 된다.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
	#A {
		float: left;
		width: 100%;
		background-color: #66f;
	}
	#B {
		float: left;
		width: 100px;
		margin-left: -100%;	
		background-color: #ddd;
	}
	#C {
		float: left;
		width: 100px;
		<strong>margin-left: -100px;</strong>
		background-color: #f66;
	}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<h3>고정크기를 가지는 3열(Column) 레이아웃</h3>

<p>
고정넓이를 가진 3열 레이아웃을 실습 레이아웃으로 선택했다.
화면은 header, man-menu, sidebar, content, extra, footer로 구성된다.
</p>

<ul>
	<li><strong>header</strong>: 가장 위에 위치하며, 회사 로고 이미지를 담는다.</li>
	<li><strong>main-menu</strong>: header 바로 밑에서 메인 메뉴를 보여준다.</li>
	<li><strong>sidebar</strong>: 화면 왼쪽에서 서브 메뉴를 보여준다.</li>
	<li><strong>content</strong>: 화면 중앙에서 페이지의 주요 내용을 보여준다.</li>
	<li><strong>extra</strong>: 화면 오른쪽에서 광고나 새로운 아이디어를 보여준다.</li>
	<li><strong>footer</strong>: 가장 아래에 위치하며, Copyright, 연락처, 찾아오시는 길 등등의 글로벌 메뉴를 보여준다.</li>
</ul>

<p>
위에서 언급한 주요 엘리먼트의 크기를 아래와 같이 지정한다.
</p>

<h4>header</h4>

<p style="padding-left: 20px;">
넓이: 1000px
높이: 48px
</p>

<h4>main-menu</h4>

<p style="padding-left: 20px;">
넓이: 1000px
높이: 35px
</p>

<h4>sidebar</h4>

<p style="padding-left: 20px;">
넓이: 175px
높이: 내용에 따라 변함
</p>

<h4>content</h4>

<p style="padding-left: 20px;">
넓이: 720px
높이: 내용에 따라 변함
</p>

<h4>extra</h4>

<p style="padding-left: 20px;">
넓이: 205px
높이: 내용에 따라 변함
</p>

<h4>footer</h4>

<p style="padding-left: 20px;">
넓이: 1000px
높이: 70px
</p>

<h3>디폴트 HTML 문서 템플릿 작성</h3>

<p>
아래를 복사하여 사용하고 있는 에디터에 붙여넣는다.
</p>

<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="<em>keywords</em>" /&gt;
&lt;meta name="Description" content="<em>description</em>" /&gt;
&lt;title&gt;<em>title</em>&lt;/title&gt;
&lt;link rel="stylesheet" href="css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
생성한 파일을 index.html 이름으로 도큐먼트 베이스에 저장한다.
이클립스를 사용한다면 DocType(Document Type)별로 제공되는 HTML 문서 템플릿을 선택하여 작성할 수 있다.
이클립스가 제공하는 디폴트 문서 템플릿이 마음에 들지 않는다면 템플릿을 수정할 수도 있다.
</p>

<p>
이제 페이지의 주요 구성요소를 입력할 차례이다.
index.html 파일의 body 엘리먼트 사이에 다음 내용을 붙여넣는다.
</p>

<pre class="prettyprint">
&lt;div id="wrap"&gt;

	&lt;div id="header"&gt;header&lt;/div&gt;
	
	&lt;div id="main-menu"&gt;main-menu&lt;/div&gt;
	
	&lt;div id="container"&gt;
		&lt;div id="content"&gt;content&lt;/div&gt;
	&lt;/div&gt;
	
	&lt;div id="sidebar"&gt;sidebar&lt;/div&gt;
	
	&lt;div id="extra"&gt;extra&lt;/div&gt;
	
	&lt;div id="footer"&gt;footer&lt;/div&gt;
	
&lt;/div&gt;
</pre>

<p>
위에서 wrap과 container는 설명하지 않은 엘리먼트이다.
이 엘리먼트는 견고한 포지셔닝을 위해서 필요한 여분의 엘리먼트이다.
wrap은 문서의 모든 div를 포함한다.
container는 여기에서 설명하는 3열을 배치하는 데 필요하다.
되도록 이런 여분의 엘리먼트는 그 수를 최소화해야 한다.
</p>

<p>
실습하고 있는 포지셔닝에서는 본문을 담는 content가 서브 메뉴를 담는 sidebar보다 먼저 나온다.
웹페이지에서 본문이 가장 중요하고 내용도 자주 바뀌므로 먼저 나오면 유지보수에 유리하다.
</p>

<p>
도큐먼트 베이스에 css 서브 디렉토리를 만들고 아래 내용으로 screen.css 파일을 만든다.
</p>

<pre class="prettyprint">
@CHARSET "UTF-8";
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
/*** The Essential Code ***/
html, body {
	margin: 0;
	padding: 0;
	background-color: #FFF;
	font-family: "Noto Sans KR", "Liberation Sans", Helvetica, "돋움", dotum, sans-serif;
	font-size: 1em;
}
#wrap {
	margin: 0 auto;
	padding: 0;
	width: 1000px;
}
#header {
	width: 1000px;
	height: 48px;
}
#main-menu {
	width: 1000px;
	height: 35px;
}
#container {
	width: 100%;
}
#content {
        
}
#sidebar {
	width: 175px;
}
#extra {
	width: 205px; 
}
#footer {
	width: 1000px;
	height: 70px;
}
/*** Just for Looks ***/
#header, #footer {
	font-size: large;
	text-align: center;
	background: #999;
}
#main-menu {
	font-size: large;
	text-align: center;
	background: #DAEAAA;
}
#content {
	font-size: large;
	text-align: center;
	background: #DDD;
	height: 100px;
}
#sidebar {
	font-size: large;
	text-align: center;
	background: #66F;
	height: 100px;
}
#extra {
	font-size: large;
	text-align: center;
	background: #F66;
	height: 100px;
}
</pre>

<p>
CSS 문서의 내용은 다음과 같은 형식의 반복이다.
</p>

<pre class="prettyprint">
Selector {
	Property(속성): value(속성값);
	..
	.
}
</pre>

<p>
Selector 종류는 Type, Descendant, Class, id, Child, attribute가 있다.
다음은 각 셀렉터의 모습이다.
</p>

<pre class="prettyprint">
/* Type Selector */
body {

}
/* Descendant Selector */
ul strong {

}
/* Class Selector */
.redwine {

}
/* id Selector */
#header {

}
/* Child Selector */
body &gt; p {

}
/* attribute Selector */
input[type="text"] {

}
</pre>

<p>
CSS 파일에서 id 셀렉터(Selector)를 정의할 때는 id 앞에 #을 붙인다.<br />
id는 HTML 문서에서 엘리먼트에 유일성을 부여한다.<br />
그러므로 id 값은 HTML 문서에서 단 한 번만 나타나야 하는 엘리먼트에 사용한다.<br />
index.html에서 wrap, header, main-menu, container, content, sidebar, extra, footer가 
그런 엘리먼트이다. 반면, Class 셀렉터를 정의할 때는 클래스 이름앞에 .(도트)를 붙인다.<br />
Class는 id와 달리 HTML 문서에서 반복되어 나타날 수 있다.
</p>

<dl class="note">
<dt><em>div.redwine</em>와 <em>div .redwine</em></dt>
<dd><em>div.redwine</em>은 HTML 문서에서 <em>&lt;div class="redwine"&gt;</em>에 적용된다.</dd>
<dd><em>div .redwine</em>은 div 엘리먼트에 포함되어 있는 엘리먼트 중에서 class 속성값이 redwine인 엘리먼트에 적용된다.</dd>
</dl>

<p>
지금까지 작성한 페이지를 웹브라우저로 확인한다.<br />
웹서버가 동작하지 않아도 된다. 탐색기에서 작성한 index.html를 더블클릭하여 화면이 아래와 같이 보이는지 테스트한다.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-1.png"/>" alt="예제보기 1" />
</p>

<h3>screen.css 설명</h3>

<p>
완성 전 코드이지만 지금까지의 CSS 파일의 내용을 살펴보자.<br />
screen.css 파일이 완성되면 화면 구성도 완성된다.<br />
HTML 문서의 내용은 바뀌지 않는다.
</p>

<h4>html, body</h4>

<pre class="prettyprint">
html, body {
	margin: 0;
	padding: 0;
	background-color: #FFF;
	font-family: "Noto Sans KR", "Liberation Sans", Helvetica, "돋움", dotum, sans-serif;
	font-size: 1em;
}
</pre>

<p>
위 설정은 html과 body 엘리먼트 모두에 적용된다.<br />
div와는 달리 html과 body 엘리먼트는 거의 모든 웹브라우저에서 디폴트 마진과 패딩을 가지고 있다.<br />
정밀하게 설정된 화면은 이 값 때문에 화면이 깨질 수 있다.<br />
그래서 대부분 웹디자이너는 html과 body의 마진과 패딩을 0으로 설정한 후 디자인을 시작한다.
</p>

<h4>#wrap</h4>

<pre class="prettyprint">
#wrap {
	margin: 0 <strong>auto</strong>;
	padding: 0;
	width: 1000px;
}
</pre>

<p>
margin에는 4개의 값이 있어야 한다.<br />
만약 값이 하나만 있다면 top right bottom left에 모두 그 값이 지정된다.<br />
값이 2개이면 첫 번째 값이 top과 bottom에 대한 값이고 두 번째 값이 right와 left에 대한 값이다.<br />
값이 3개라면 순서대로 top right bottom에 대한 값이며 left는 right와 같게 설정된다.<br />
값이 4개라면 순서대로 top right bottom left에 대한 값이다.
</p>

<p>
margin 프로퍼티의 두 번째 값 auto는 해당 엘리먼트를 중앙에 위치시킨다.<br />
margin: 0 auto; 에서 두 번째 값이 auto이므로 wrap은 좌우를 기준으로 중앙으로 이동한다.<br />
속성값 0에는 단위를 생략한다.<br />
div 엘리먼트의 디폴트 margin과 padding 값은 0이다.<br />
wrap은 HTML 문서 내의 모든 엘리먼트를 담아야 하니 1000px 안에 모든 화면을 넣어야 한다.
</p>

<p>
CSS 파일에서 /*** Essential Code ***/ 부분이 중요하다.<br />
/*** Just for Looks ***/ 부분은 예제를 웹브라우저로 확인할 때 보기 좋게 하기 위한 설정으로, 
프로젝트가 진행되면서 없어질 부분이다.
</p>

<h4>#container</h4>

<pre class="prettyprint">
#container {
	width: 100%;
}
</pre>

<p>
container의 width가 100%로 설정되어 있다.<br />
100%라 함은 container의 콘텐츠가 들어갈 수 있는 최대 넓이이다.<br />
container의 마진과 패딩이 0이고 border 역시 설정되어 있지 않기 때문에
100%는 여기서 wrap과 같은 1000px이다.
</p>

<h3>#content을 중앙에 배치</h3>

<p>
/*** The Essential Code ***/의 #content에 다음을 추가한다.
</p>

<pre class="prettyprint">
#content {
	margin-left: 175px;
	margin-right: 205px;
}
</pre>

<p>
<img src="<c:url value="/resources/images/layout1-2.png"/>" alt="예제보기 2" />
</p>

<h3>#container, #sidebar, #extra에 float: left;</h3>

<p>
#content 왼쪽에 #sidebar를, #content 오른쪽에 #extra를 배치해 보자.
/*** The Essential Code ***/부분에서 아래 부분을 수정한다.
</p>

<pre class="prettyprint">
#container {
	<strong>float: left;</strong>
	width: 100%;
}
#content {
	margin-left: 175px;
	margin-right: 205px;
}
#sidebar {
	<strong>float: left;</strong>
	width: 175px;
}
#extra {
	<strong>float: left;</strong>
	width: 205px; 
}
#footer {
	<strong>clear: both;</strong>
	height: 70px;
}
</pre>

<p>
#content를 감싸고 있는 #container에 float 속성을 적용한다.
#container 다음부터 나오는 엘리먼트인 #sidebar, #extra도 역시 float 속성을 적용한다.
#container, #sidebar, #extra 모두 float:left; 로 설정했으므로 정상적인 흐름 안의 상자처럼 위아래가 아니라 옆으로 인접해 있다고 생각해야 한다.
#footer는 clear 프로퍼티를 both로 설정해서 #footer의 위치를 가장 아래에 있도록 한다.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-3.png"/>" alt="예제보기 3" />
</p>

<h3>#sidebar를 #content 왼쪽에 배치</h3>

<p>
/*** The Essential Code ***/의 #sidebar에 다음을 추가한다.
</p>

<pre class="prettyprint">
#sidebar {
	float: left;
	width: 175px;
	<strong>margin-left: -1000px;</strong>
}
</pre>

<p>
margin-left: -100%;으로 해도 된다.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-4.png"/>" alt="예제보기 4" />
</p>

<h3>#extra를 #content 오른쪽에 배치</h3>

<p>
#extra에 다음을 추가한다.
</p>

<pre class="prettyprint">
#extra {
	float: left;
	width: 205px;
	<strong>margin-left: -205px;</strong> 
}
</pre>

<img src="<c:url value="/resources/images/layout1-5.png"/>" alt="예제보기 5" />

<h1>메인 메뉴 스타일 지정</h1>

<p>
도큐먼트베이스 아래 images 폴더를 만들고, 다음 다섯 이미지를 저장한다.
</p>

<ol>
	<li><img src="<c:url value="/resources/images/bull_circle.gif"/>" alt="bull_circle.gif" style="width: 90px;height: 90px;background: #ebebeb;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/attach.png"/>" alt="attach.png" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/ci.gif"/>" alt="ci.gif" style="width: 117px;height: 39px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/circle.gif"/>" alt="circle.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/arrow.gif"/>" alt="arrow.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
</ol>

<p>
이전 글에서 만든 index.html을 열고 #main-menu 엘리먼트에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">
&lt;div id="main-menu"&gt;
<strong>
	&lt;ul id="nav"&gt;
		&lt;li&gt;&lt;a href="#"&gt;Java&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;JSP&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;Spring&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
	&lt;/ul&gt;
</strong>	
&lt;/div&gt;	
</pre>

<h3>#main-menu 폰트 설정</h3>

<p>
메인 메뉴의 폰트 스타일을 지정한다.
/*** The Essential Code ***/에 다음 강조된 부분을 추가한다.
/*** Just for Looks ***/에 있는 #main-menu는 필요없으니 제거한다.
</p>

<pre class="prettyprint">
#main-menu {
	width: 1000px;
	height: 35px;
	<strong>font-family: Verdana, sans-serif;
	font-weight: bold;
	font-size: 12px;</strong>	
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-01.png"/>" alt="예제보기 1" />
</p>

<h3>ul#nav</h3>

<p>
/*** The Essential Code ***/에 다음을 추가하여,
li의 디폴트 리스트 스타일과 ul과 li가 가진 디폴트 마진과 패딩을 제거한다.
</p>

<pre class="prettyprint">
ul#nav {
	margin: 0;
	padding: 0;
	list-style-type: none;
}	
</pre>

<p>
<img src="<c:url value="/resources/images/main-02.png"/>" alt="예제보기 2" />
</p>

<h3>ul#nav li</h3>

<p>
서브 메뉴가 가로로 보이도록 /*** The Essential Code ***/에 다음을 추가한다.
</p>

<pre class="prettyprint">
ul#nav li {
	float: left;
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-03.png"/>" alt="예제보기 3" />
</p>

<p>
메뉴 항목이 붙어있으니 항목 좌우에 적당한 패딩을 준다.
</p>

<pre class="prettyprint">
ul#nav li {
	float: left;
	<strong>padding: 0 17px 0 8px;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-04.png"/>" alt="예제보기 4" />
</p>

<h3>ul#nav 위치 수정</h3>

<p>
메뉴가 있는 ul이 #main-menu의 위쪽으로 치우쳐 있다.
#main-menu의 높이에 변화를 주지 않으면서 ul를 중앙으로 이동시키기 위해 다음을 추가한다.
</p>

<pre class="prettyprint">
ul#nav {
	margin: 0;
	padding: 0;
	list-style-type: none;
	<strong>position: relative;
	top: 9px;
	left: 17px;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-05.png"/>" alt="예제보기 5" />
</p>

<h3>메인 메뉴 링크 스타일</h3>

<p>
#main-menu 배경색을 지정한다.
</p>

<pre class="prettyprint">
#main-menu {
	width: 1000px;
	height: 35px;
	font-family: Verdana, sans-serif;
	font-weight: bold;
	font-size: 12px;
	<strong>background: #92B91C;</strong>
}
</pre>

<p>
링크의 글자색은 흰색으로,
링크 밑줄은 없애고,
마우스를 올릴 때 밑줄이 보이도록,
/*** The Essential Code ***/에 다음을 추가한다.
</p>

<pre class="prettyprint">
<strong>ul#nav &gt; li &gt; a {
	text-decoration: none;
	color: #FFF;
}
ul#nav &gt; li &gt; a:hover {
	text-decoration: underline;
	background: none;
	color: #FFF;
}</strong>
</pre>

<p>
<img src="<c:url value="/resources/images/main-06.png"/>" alt="예제보기 6" />
</p>

<h3>메인 메뉴의 항목 앞에 이미지 넣기</h3>

<p>
ul을 list-style-type: none;으로 설정하면, li 앞의 동그라미는 사라진다.
동그라미 없애고 대신 li 앞에 배경 이미지를 넣으면 리스트를 좀 더 세련되게 표현할 수 있다.
다음 코드를 ul#nav li 스타일에 추가한다.
url 다음의 이미지 경로는 CSS 파일 위치를 기준으로 이미지 위치를 상대경로로 표시해야 한다.
</p>

<pre class="prettyprint">
ul#nav li {
	float: left;
	padding: 0 17px 0 8px;
	<strong>background: url('../images/bull_circle.gif') no-repeat 0 50%;</strong>
}
</pre>


<p>
아래 강조된 부분을 #main-menu에 추가한다.
</p>

<pre class="prettyprint">
#main-menu {
	<strong>margin: 15px 0;</strong>
	width: <strong>996px;</strong>
	height: 35px;
	font-family: Verdana, sans-serif;
	font-weight: bold;
	font-size: 12px;	
	background: #92B91C;
	<strong>border: 2px solid #DAEAAA;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-final.png"/>" alt="예제보기 최종" />
</p>


<h1>서브 메뉴 스타일 지정</h1>

<p>
왼쪽에 위치시킨 #sidebar 엘리먼트에 아래와 같이 서브 메뉴를 추가한다.
</p>

<pre class="prettyprint">
&lt;div id="sidebar"&gt;
	<strong>&lt;h1&gt;Eclipse&lt;/h1&gt;
	&lt;ul&gt;
		&lt;li class="sub-heading"&gt;자바 소개&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;자바의 특징&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;객체와 클래스&lt;/a&gt;&lt;/li&gt;
	&lt;/ul&gt;</strong>
&lt;/div&gt;
</pre>

<p>
/*** Just for Looks ***/의 #sidebar 설정은 제거한다.
</p>

<p>
<img src="<c:url value="/resources/images/sub-01.png"/>" alt="예제보기 1"/>
</p>

<h3>서브 메뉴의 보더(border)와 폰트(font)</h3>

<pre class="prettyprint">
#sidebar {
	float: left;
	width: <strong>173px;</strong>
	margin-left: -1000px;<strong>
	margin-bottom: 20px;
	border: 1px solid #DAEAAA;
	font-family: Verdana, sans-serif;
	font-size: 12px;
	position: relative;
	top: 7px;</strong>
}
</pre>

<p>
마진과 패딩이 없는 엘리먼트가 실제 차지하는 넓이는 'width + 좌우 보더 합'으로 계산된다.<br />
#sidebar가 175px의 넓이여야 한다면, 좌우 보더 합이 2px이므로 175px에서 173px로 width를 변경했다.<br />
position: relative;와 top: 7px;은 #sidebar 박스를 #container 위 경계에서 아래로 7px만큼 아래로 이동시킨다.<br />
박스를 아래로 움직이면 #sidebar가 #footer를 침범할 수 있다.<br />
#sidebar가 #footer를 침범하지 않도록 margin-bottom: 20px을 추가했다.
</p>

<h3>#sidebar &gt; h1</h3>

<p>
서브 메뉴 머릿말에 해당하는 h1 엘리먼트의 스타일을 다음과 같이 추가한다.
</p>

<pre class="prettyprint">
<strong>#sidebar &gt; h1 {
	margin: 0;
	padding: 14px;
	background: #92B91C;
	color: #FFF;
	font-size: 16px;
}</strong>
</pre>

<p>
<img src="<c:url value="/resources/images/sub-02.png"/>" alt="예제보기 2" />
</p>

<h3>#sidebar &gt; ul</h3>

<p>
다음을 /*** The Essential Code ***/에 추가한다.
</p>

<pre class="prettyprint">
#sidebar &gt; ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
</pre>

<p>
<img src="<c:url value="/resources/images/sub-03.png"/>" alt="예제보기 3" />
</p>

<h3>서브 메뉴 아이템 스타일</h3>

<p>
/*** The Essential Code ***/에 다음을 추가한다.
</p>

<pre class="prettyprint">
<strong>#sidebar &gt; ul &gt; li.sub-heading {
    display: block;
    padding: 6px 10px 6px 10px;
    color: #64615D;
    background: #DAEAAA;
    text-decoration: none;
    font-weight: bold;
}
sidebar &gt; ul &gt; li &gt; a:hover {
	background-color: #EDFEBA;
	color: #64615D;
}
#sidebar &gt; ul &gt; li &gt; a {
	display: block;
	color: #64615D;
	padding: 5px 3px 4px 17px;
	text-decoration: none;
	border-bottom: 1px solid #FFF;
	font-weight: normal;
	background: #FFF url('../images/circle.gif') no-repeat 5% 50%;
}</strong>
</pre>

<p>
a는 인라인(inline) 엘리먼트지만 display: block으로 설정하면 상자(box)가 되어 상자 영역 전체에 링크가 된다.
</p>

<p>
<img src="<c:url value="/resources/images/sub-final.png"/>" alt="예제보기 최종" />
</p>


<h1>#header, #footer, #content 스타일 지정</h1>

<p>
index.html의 #header 사이에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">
&lt;h1&gt;&lt;a href="/"&gt;&lt;img src="images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
</pre>

<p>
/*** Just for Looks ***/에서 #header, #footer의 배경색을 제외한 나머지 스타일을 제거한다.
</p>

<pre class="prettyprint">
#header, #footer {
	background: #999;
}
</pre>

<p>
<img src="<c:url value="/resources/images/header-01.png"/>" alt="예제보기 1" />
</p>

<h3>#header h1 위치 재지정</h3>

<p>
h1 엘리먼트는 디폴트 마진을 가지고 있기에 #header 엘리먼트는 마진만큼 아래로 떨어진다.<br />
h1의 디폴트 마진과 패딩을 제거한다. 그리고 9px 아래로 이동한다.<br />
/*** The Essential Code ***/에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">
#header h1 {
	margin: 0;
	padding: 0;
	position: relative;
	top: 9px;
}
</pre>

<p>
<img src="<c:url value="/resources/images/header-02.png"/>" alt="예제보기 2" />
</p>

<h2>#footer 디자인</h2>

<p>
index.html의 #footer 사이에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">
&lt;div id="footer"&gt;
	<strong>&lt;ul&gt;
		&lt;li&gt;&lt;a href="#"&gt;이용약관&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;개인정보보호정책&lt;/a&gt;&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;이메일무단수집거부&lt;/a&gt;&lt;/li&gt;
		&lt;li id="company-info"&gt;전화 : 02-123-5678, FAX : 02-123-5678&lt;br /&gt;
		people@ggmail.org&lt;br /&gt;
		Copyright java-school.net All Rights Reserved.&lt;/li&gt;
		&lt;li&gt;&lt;a href="#"&gt;찾아오시는 길&lt;/a&gt;&lt;/li&gt;
	&lt;/ul&gt;</strong>
&lt;/div&gt;
</pre>

<p>
/*** The Essential Code ***/의 #footer에 다음 강조한 부분을 추가한다.
</p>

<pre class="prettyprint">
#footer {
	clear: both;
	width: 1000px;
	height: 70px;
	<strong>font-size: 11px;
	color: #8d8d8d;
	letter-spacing: -1px;
	border-top: 1px solid #DAEAAA;
	position: relative;
	top: 7px;</strong>	
}
</pre>

<p>
/*** Just for Looks ***/의 #header, footer를 제거한다.
</p>

<p>
<img src="<c:url value="/resources/images/footer-01.png"/>" alt="예제보기 1" />
</p>

<h3>#footer 메뉴를 가로로 보이게 수정</h3>

<p>
/*** The Essential Code ***/에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">
<strong>#footer &gt; ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
#footer &gt; ul &gt; li {
	float: left;
}</strong> 
</pre>

<p>
<img src="<c:url value="/resources/images/footer-02.png"/>" alt="예제보기 2" />
</p>

<h3>footer 글로벌 메뉴 스타일</h3>

<pre class="prettyprint">
#footer &gt; ul {
	margin: 0;
	padding: 0;
	list-style-type: none;<strong>
	position: relative;
	left: 8px;</strong>
}
#footer &gt; ul &gt; li {
	float: left;
	<strong>padding: 6px 12px 6px 8px;
	background: url('../images/circle.gif') no-repeat 0 50%;</strong>
}<strong>
#footer &gt; ul &gt; li &gt; a {
	color: #8D8D8D;
	text-decoration: none;
}
#footer &gt; ul &gt; li &gt; a:hover {
	text-decoration: underline;
}
#footer &gt; ul &gt; li#company-info {
	margin-left: 350px;
	letter-spacing: 0;
	background: none;
}</strong>
</pre>

<p>
<img src="<c:url value="/resources/images/footer-03.png"/>" alt="예제보기 3" />
</p>

<h2>#content 스타일</h2>

<p>
#content 좌우 마진을 5px씩 늘려서 #content가 #sidebar와 #extra 사이에 간격을 두도록 설정한다.
보더를 추가하여 경계를 구분한다.
</p>

<pre class="prettyprint">
#content {
	margin-left: <strong>180px;</strong>
	margin-right: <strong>210px;</strong>
}
</pre>

<p>
#content 상자의 영역은 1000px이다.
좌우 마진합이 390px(180 + 210)이라면 #content의 width는 610px이다.
border를 좌우로 1px 주었다면, #content의 width는 608px이 된다.
</p>

<p>
레이아웃을 좀 더 우아하게 보이도록 강조된 부분을 추가한다.
</p>

<pre class="prettyprint">
#container {
	float: left;
	width: 100%;
	<strong>border-top: 1px solid #DAEAAA;</strong>
}
</pre>

<pre class="prettyprint">
#extra {
	float: left;
	width: 205px;
	margin-left: -205px;
	<strong>margin-bottom: 20px;
	position: relative;
	top: 7px;</strong>
}
</pre>

<p>
 테스트를 위해서 /*** Just for Looks ***/의 #content의 높이를 100px에서 300px으로 수정한다. 
</p>

<pre class="prettyprint">
#content {
	font-size: large;
	text-align: center;
	background: #DDD;
	<strong>height: 300px;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/footer-04.png"/>" alt="예제보기 4"/>
</p>


<h1>게시판 목록 스타일 지정</h1>

<p>
웹사이트에 전체에 적용될 스타일을 설정한다.<br />
아래 코드를 /*** The Essential Code ***/의 html, body 설정 다음에 추가한다.<br />
</p>

<pre class="prettyprint">
<strong>pre {
    margin: 0 0 0.7em 0;
    font-family: Consolas, "Noto Sans KR", dotum, "Liberation Mono", Courier, monospace;	
}
input, select, textarea, td, th {
    color: #646464; 
    font-size: 12px;
    font-family: "돋움", dotum, sans-serif; 
}
table {
    border-collapse: collapse;
}
img {
    border: 0; 
}
form { 
    margin: 0;
	padding: 0; 
}
a:link {
    color: #2C80D0;
    text-decoration: none;
}
a:visited {
    color: #2C80D0;
    text-decoration: none;
}
a:active {
    color: #2C80D0;
    text-decoration: none;
}
a:hover {
    color: #2C80D0;
    text-decoration: underline;
}</strong>
</pre>

<p>
html, body에 설정한 폰트가 모든 엘리먼트에 적용된다고 생각해선 안 된다.<br />
다음 줄에 html과 body에 설정한 폰트가 적용되지 않은 엘리먼트(input, select, textarea, td)의 폰트를 지정하고 있다.<br />
div역시 html, body에서 설정한 폰트를 상속하지 않지만 div 폰트를 일괄적으로 설정하는 것은 필요치 않아 뺐다.<br />
</p>

<p>
table의 border-collapse: collapse; 설정은 셀(td를 의미)과 셀의 테두리를 서로 겹치게 하여 셀이 서로 붙어 보이게 한다.<br />
img의 border: 0; 설정은 img에 디폴트 border 값을 주는 옛 브라우저가 있어 추가했다.<br />
</p>

<p>
form 엘리먼트의 margin과 padding은 디폴트 값이 있다.<br />
form 엘리먼트의 margin과 padding이 필요하지 않아 모두 0으로 설정했다.
</p>


<h2>게시판 목록 디자인</h2>

<p>
/*** Just for Looks ***/에서 #content를 삭제한다.<br />
index.html을 열고 '다른 이름으로 저장하기' 메뉴를 사용해 list.html 파일을 만든다.<br />
list.html의 #content 엘리먼트에 다음을 추가한다.
</p>

<pre class="prettyprint">
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;Eclipse &amp;gt;자유 게시판&lt;/div&gt;

&lt;table class="bbs-table"&gt;
&lt;!--  게시판 목록 머리말 --&gt;
&lt;tr&gt;
	&lt;th&gt;NO&lt;/th&gt;
	&lt;th&gt;TITLE&lt;/th&gt;
	&lt;th&gt;DATE&lt;/th&gt;
	&lt;th&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 시작 --&gt;
&lt;tr&gt;
	&lt;td&gt;11&lt;/td&gt; &lt;!--번호--&gt;
	&lt;td&gt;
		&lt;a href="#"&gt;제목&lt;/a&gt;
		&lt;!--첨부 파일이 있으면 표시--&gt;
		&lt;img src="images/attach.png" alt="첨부 파일" /&gt;
		&lt;!--댓글 개수표시--&gt;
		[5] 
		&lt;/td&gt;
		&lt;td&gt;2011.11.15&lt;/td&gt; &lt;!--등록일--&gt;
		&lt;td&gt;4555&lt;/td&gt; &lt;!--조회 수--&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 끝 --&gt;             
&lt;/table&gt;
&lt;div id="paging"&gt;
	&lt;a href="#"&gt;[이전]&lt;/a&gt;
	&lt;span class="bbs-strong"&gt;6&lt;/span&gt; &lt;!--현재 페이지--&gt;
	&lt;a href="#"&gt;[7]&lt;/a&gt;
	&lt;a href="#"&gt;[8]&lt;/a&gt;
	&lt;a href="#"&gt;[9]&lt;/a&gt;
	&lt;a href="#"&gt;[10]&lt;/a&gt;
	&lt;a href="#"&gt;[다음]&lt;/a&gt;
&lt;/div&gt;
&lt;div id="list-menu"&gt;
	&lt;input type="button" value="새 글쓰기" /&gt;
&lt;/div&gt;
&lt;div id="search"&gt;
	&lt;form method="get"&gt;
	&lt;p style="margin: 0;padding: 0;" &gt;
		&lt;input type="hidden" name="curPage" value="1" /&gt;
		&lt;input type="hidden" name="boardCd" value="chat" /&gt;
		&lt;div&gt;
			&lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
			&lt;input type="submit" value="검색" /&gt;
		&lt;/div&gt;
	&lt;/p&gt;
	&lt;/form&gt;
&lt;/div&gt;
&lt;!--  본문 끝 --&gt;
</pre>

<p>
<img alt="게시판 디자인 1" src="<c:url value="/resources/images/bbs-list-01.png"/>" />
</p>

<h3>#content 패딩, 폰트 크기, 줄 간격 설정</h3>

<pre class="prettyprint">
#content {
	margin-left: 180px;
	margin-right: 210px;
	<strong>padding-left: 9px;
	padding-right: 9px;
	font-size: 0.9em;
	line-height: 1.6;</strong>
}
</pre>

<p>
패딩을 추가했으므로 #content의 width는 592px이다.<br />
1000 - 마진 390(180 + 210) - 패딩 18(9+9) = 592
</p>

<p>
<img alt="게시판 디자인 2" src="<c:url value="/resources/images/bbs-list-02.png"/>" />
</p>

<p>
#content-categories는 #content의 가장 위에서 사용자에게 #content 내용이 어떤 카테고리에 속하는지 보여준다.<br />
다음을 스타일 시트에 추가한다.
</p>

<pre class="prettyprint">
<strong>#content-categories {
	margin: 0;
	padding-top: 10px;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 11px;
	color: #666;</strong>
}
</pre>

<p>
<img alt="게시판 디자인 3" src="<c:url value="/resources/images/bbs-list-03.png"/>" />
</p>

<h3>게시판 테이블 셀 헤더 스타일</h3>

<pre class="prettyprint">
<strong>.bbs-table {
	width: 100%;
	margin: 0.7em 0 0 0;
}
.bbs-table th {
	color: #92B91C;
	border-top: 1px solid #92B91C;
	border-bottom: 1px solid #92B91C;
}</strong>
</pre>

<p>
<img alt="게시판 디자인 5" src="<c:url value="/resources/images/bbs-list-05.png"/>" />
</p>

<h3>게시판 테이블 셀 스타일</h3>

<pre class="prettyprint">
<strong>.bbs-table td {
	padding-top: 3px;
	padding-bottom: 3px;
	border-bottom: 1px solid silver;
	line-height: 1.45;
}
.bbs-table td a {
	color: #555;
	text-decoration: none;
}
.bbs-table td a:hover {
	color:#555;
	text-decoration: underline;
}</strong>
</pre>

<p>
<img alt="게시판 디자인 6" src="<c:url value="/resources/images/bbs-list-06.png"/>" />
</p>

<p>
목록 머릿말의 넓이를 조절한다.
</p>

<pre class="prettyprint">
&lt;!--  게시판 목록 머리말 --&gt;
&lt;tr&gt;
    &lt;th <b>style="width: 60px;"</b>&gt;NO&lt;/th&gt;
    &lt;th&gt;TITLE&lt;/th&gt;
    &lt;th <b>style="width: 84px;"</b>&gt;DATE&lt;/th&gt;
    &lt;th <b>style="width: 60px;"</b>&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
</pre>

<p>
<img alt="게시판 디자인 7" src="<c:url value="/resources/images/bbs-list-07.png"/>" />
</p>

<p>
목록 아이템 중 제목을 제외하고 text-align: center;로 설정한다.
</p>

<pre class="prettyprint">
&lt;!-- 반복 구간 시작 --&gt;
&lt;tr&gt;
	&lt;td <strong>style="text-align: center;"</strong>&gt;11&lt;/td&gt;&lt;!-- 번호 --&gt;
	&lt;td&gt;
		&lt;a href="#"&gt;제목&lt;/a&gt;
		&lt;!-- 첨부 파일이 있으면 표시 --&gt;
		&lt;img src="images/attach.png" alt="첨부 파일" <strong>style="vertical-align: middle;"</strong> /&gt;
		&lt;!-- 댓글 개수표시 --&gt;
		[5]
	&lt;/td&gt;
	&lt;td <strong>style="text-align: center;"</strong>&gt;2011.11.15&lt;/td&gt;
	&lt;td <strong>style="text-align: center;"</strong>&gt;4555&lt;/td&gt;
&lt;/tr&gt;
&lt;!-- 반복 구간 끝 --&gt;
</pre>

<p>
<img alt="게시판 디자인 8" src="<c:url value="/resources/images/bbs-list-08.png"/>" />
</p>

<h3>페이지 이동 링크 스타일</h3>

<pre class="prettyprint">
<strong>#paging {
    text-align: center;
    font-size: 13px;
}
#paging &gt; a {
    color: #555;
    text-decoration: none;
}
#paging &gt; a:hover {
    color: #555;
    text-decoration: underline;
}</strong>
</pre>

<p>
<img alt="게시판 디자인 9" src="<c:url value="/resources/images/bbs-list-09.png"/>" />
</p>

<p>
댓글 개수, 현재 페이지 번호와 같이 게시판에서 글자를 강조하기 위한 스타일을 추가한다.
</p>

<pre class="prettyprint">
<strong>.bbs-strong {
	color: #FFA500;
	font-weight: bold;
}</strong>
</pre>

<p>
bbs-string 스타일을 댓글 개수와 현재 페이지 번호에 적용한다.<br />
목록 아이템에서 댓글 개수에 스타일을 적용한다.<br />
현재 페이지 번호는 이미 되어 있다.
</p>
 
<pre class="prettyprint">
&lt;tr&gt;
	&lt;td style="text-align: center;"&gt;11&lt;/td&gt; &lt;!--번호--&gt;
	&lt;td&gt;
		&lt;a href="#"&gt;제목&lt;/a&gt;
		&lt;!--첨부 파일이 있으면 표시--&gt;
		&lt;img src="images/attach.png" alt="첨부 파일" style="vertical-align: middle;" /&gt;
		&lt;!--댓글 개수표시--&gt;<strong>
		&lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;</strong>
	&lt;/td&gt;
	&lt;td style="text-align: center;"&gt;2011.11.15&lt;/td&gt; &lt;!--등록일--&gt;
	&lt;td style="text-align: center;"&gt;4555&lt;/td&gt; &lt;!--조회 수--&gt;
&lt;/tr&gt;
&lt;/table&gt;
</pre>

<p>
<img alt="게시판 디자인 10" src="<c:url value="/resources/images/bbs-list-10.png"/>" />
</p>

<h3>새 글쓰기 버튼을 오른쪽에 배치</h3>

<pre class="prettyprint">
<strong>#list-menu {
    text-align: right;
}</strong>
</pre>

<p>
<img alt="게시판 디자인 11" src="<c:url value="/resources/images/bbs-list-11.png"/>" />
</p>

<h3>검색을 중앙에 배치</h3>

<pre class="prettyprint">
<strong>#search {
	text-align: center;
}</strong>
</pre>

<p>
<img alt="게시판 디자인 12" src="<c:url value="/resources/images/bbs-list-12.png"/>" />
</p>


<h1>게시판 상세보기 스타일 지정</h1>

<p>
list.html 파일을 '다른 이름으로 저장하기' 메뉴를 이용하여 view.html 파일을 생성한다.<br />
view.html 문서를 열고 #content의 <strong>div id="content-categories"</strong> 아래 다음 코드를 붙여넣는다.<br />
목록을 보여주는 기존 코드는 그대로 둔다.
</p>

<pre class="prettyprint">
&lt;div class="view-menu" style="margin-top: 15px;margin-bottom: 5px;"&gt;
    &lt;div class="fl"&gt;
        &lt;input type="button" value="수정" /&gt;
        &lt;input type="button" value="삭제" /&gt;
    &lt;/div&gt;
    &lt;div class="fr"&gt;
        &lt;input type="button" value="다음 글" /&gt;
        &lt;input type="button" value="이전 글" /&gt;
        &lt;input type="button" value="목록" /&gt;
        &lt;input type="button" value="새 글쓰기" /&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;table class="bbs-table"&gt;
&lt;tr&gt;
    &lt;th style="width: 47px;text-align: left;vertical-align: top;font-size: 1em;"&gt;TITLE&lt;/th&gt;
    &lt;th style="text-align: left;color: #555;font-size: 1em;"&gt;무궁화꽃이피었습니다&lt;/th&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div id="detail"&gt;
    &lt;div id="date-writer-hit"&gt;2014 10-09 17:50:30 by 홍길동 hit 1330&lt;/div&gt;
    &lt;div id="article-content"&gt;
    무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다&lt;br /&gt;
    무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다&lt;br /&gt;
    &lt;/div&gt;
	&lt;div id="file-list" style="text-align: right;"&gt;
		&lt;div class="attach-file"&gt;
			&lt;a href="#" title="filename" class="download"&gt;TEST.png&lt;/a&gt;
			&lt;a href="#" title="filekey"&gt;삭제&lt;/a&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/div&gt;
&lt;!--  댓글 쓰기 --&gt;
&lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
    &lt;div id="addComment"&gt;
        &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div style="text-align: right;"&gt;
        &lt;input type="submit" value="댓글 남기기" /&gt;
    &lt;/div&gt;
&lt;/form&gt;
&lt;!--  댓글 반복 시작 --&gt;
&lt;div class="comments"&gt;
    &lt;span class="writer"&gt;xman&lt;/span&gt;
    &lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
    &lt;span class="modify-del"&gt;
        &lt;a href="javascript:modifyCommentToggle('5')"&gt;수정&lt;/a&gt;
         | &lt;a href="javascript:deleteComment('5')"&gt;삭제&lt;/a&gt;
    &lt;/span&gt;
    &lt;p id="comment5"&gt;무궁화꽃이피었습니다&lt;/p&gt;
    &lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
    &lt;input type="hidden" name="commentNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="articleNo" value="12" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;div class="fr"&gt;
            &lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;수정하기&lt;/a&gt;
            | &lt;a href="javascript:modifyCommentToggle('5')"&gt;취소&lt;/a&gt;
    &lt;/div&gt;
    &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;무궁화꽃이 피었습니다.&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;/form&gt;
&lt;/div&gt;
&lt;!--  댓글 반복 끝 --&gt;
&lt;div id="next-prev"&gt;
    &lt;p&gt;다음 글 : &lt;a href="#"&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
    &lt;p&gt;이전 글 : &lt;a href="#"&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class="view-menu" style="margin-bottom: 47px;"&gt;
    &lt;div class="fl"&gt;
        &lt;input type="button" value="수정" /&gt;
        &lt;input type="button" value="삭제" /&gt;
    &lt;/div&gt;
    &lt;div class="fr"&gt;
        &lt;input type="button" value="다음 글" /&gt;
        &lt;input type="button" value="이전 글" /&gt;
        &lt;input type="button" value="목록" /&gt;
        &lt;input type="button" value="새 글쓰기" /&gt;
    &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
댓글이 반복되는 부분에서 comment5와 modifyCommentForm5에서 <strong>5</strong>는 댓글의 고유번호이다.
이 번호는 프로그램적으로 부여되어야 한다.
</p>

<p>
<img alt="bbs-view-01" src="<c:url value="/resources/images/bbs-view-01.png"/>"/>
</p>

<h3>댓글 수정을 위한 자바 스크립트 토글 함수</h3>

<p>
아래 그림의 <strong>수정</strong>을 클릭하면 동작하는 자바스크립트 함수를 생성하려 한다.
</p>

<p>
<img alt="댓글 수정 링크" src="<c:url value="/resources/images/bbs-view-comments.png"/>"/>
</p>

<p>
<img alt="댓글 수정 링크" src="<c:url value="/resources/images/toggle-test-02.png"/>"/>
</p>

<p>
<img alt="댓글 수정 링크" src="<c:url value="/resources/images/bbs-view-comments.png"/>"/>
</p>

<p>
<strong>수정</strong>을 클릭하면 textarea를 포함하는 수정 폼이 나타나야 한다.
(이 수정 폼은 디폴트로 숨겨져 있다)
아래 자바스크립트 코드를 &lt;/head&gt; 바로 위에 복사한다.
</p>

<pre class="prettyprint">
&lt;script type="text/javascript"&gt;
function modifyCommentToggle(articleNo) {
    var p_id = "comment" + articleNo;
    var p = document.getElementById(p_id);
    
    var form_id = "modifyCommentForm" + articleNo;
    var form = document.getElementById(form_id);
    
    var p_display;
    var form_display;
    
    if (p.style.display) {
            p_display = '';
            form_display = 'none';
    } else {
            p_display = 'none';
            form_display = '';
    }
    p.style.display = p_display;
    form.style.display = form_display;
}
&lt;/script&gt;
</pre>

<p>
댓글의 수정과 취소를 클릭하여 자바스크립트 함수가 제대로 동작하는지 확인한다.
</p>

<p>
위에서 강조된 수정과 취소 링크는 같은 동작을 한다.
수정 폼이 보이면 안 보이게, 안 보이면 보이게 한다.
댓글 본문을 담는 p 엘리먼트는 정확히 이와 반대로 동작한다.
이를 토글(toggle)이라 한다.
</p>

<h3>날짜, 작성자, 조회 수 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 작성자, 조회 수 디자인 결과" src="<c:url value="/resources/images/bbs-view-writer-hit.png"/>"/>
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;span id="date-writer-hit&gt;2014 10-09 17:50:30 by 홍길동 hit 1330&lt;/span&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#date-writer-hit {
	display: block;
	margin: 0;
	padding: 0;
	font-size: 11px;
	color: #555;
	text-align: right;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 작성자, 조회 수 디자인 결과" src="<c:url value="/resources/images/bbs-view-add-comments-result.png"/>"/>
</p>

<h3>게시글 본문, 첨부 파일 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시글 본문, 첨부 파일 디자인 전" src="<c:url value="/resources/images/article-content-attach-file-before.png"/>"/>
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div id="article-content"&gt;
무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다&lt;br /&gt;
무궁화꽃이피었습니다무궁화꽃이피었습니다무궁화꽃이피었습니다&lt;br /&gt;
&lt;/div&gt;
&lt;div id="file-list" style="text-align: right;"&gt;
	&lt;div class="attach-file"&gt;
		&lt;a href="#" title="filename" class="download"&gt;TEST.png&lt;/a&gt;
		&lt;a href="#" title="filekey"&gt;삭제&lt;/a&gt;
	&lt;/div&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#article-content {
	font-size: 0.9em;
	color: #333;
}
.attach-file {
	font-size: 11px;
	line-height: 1.3;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시글 본문, 첨부 파일 결과 화면" src="<c:url value="/resources/images/article-content-attach-file.png"/>" style="border: 1px solid grey;"/>
</p>

<h3>댓글 작성자, 댓글 작성일, 수정|삭제 링크, 댓글 본문 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 댓글 디자인 전" src="<c:url value="/resources/images/toggle-test-01.png"/>" style="border: 1px solid grey;" />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;span class="writer"&gt;xman&lt;/span&gt;
&lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
&lt;span class="modify-del"&gt;
&lt;a href="javascript:modifyCommentToggle('5')"&gt;수정&lt;/a&gt;
 | &lt;a href="javascript:deleteComment('5')"&gt;삭제&lt;/a&gt;
&lt;/span&gt;
&lt;p id="comment5"&gt;무궁화꽃이피었습니다&lt;/p&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
/* 댓글과 댓글을 테두리로 구분 */
.comments {
    border-top: 1px solid #ebebeb;
}
/* 댓글 작성자 ID */
.comments &gt; span.writer {
    display: block;
    float: left;
    margin: 3px;
    padding: 0;
    font-size: 12px;
    font-weight: bold;
    color: #555;
}
/* 댓글 작성일 */
.comments &gt; span.date {
    display: block;
    float: left;
    margin: 3px;
    padding: 0;
    font-size: 12px;
    color: #555;
}
/* 댓글 수정|삭제 */
.comments &gt; span.modify-del {
    display: block;
    float: right;
    margin: 3px;
    padding: 0;
    font-size: 12px;
    color: #555;
}
/* 댓글 수정|삭제 링크 */
.comments a {
    color: #555;
    text-decoration: none;
    font-size: 11px;
}
.comments a:hover {
    color: #555;
    text-decoration: underline;
}
/* 댓글 내용 */
.comments &gt; p {
    clear: both;
    margin: 0;
    padding: 0 3px 3px 3px;
    color: #555;
    font-size: 11px;
}
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 댓글 디자인 결과" src="<c:url value="/resources/images/bbs-view-comments-result.png"/>" style="border: 1px solid grey" /><br />
</p>

<h3>댓글 수정 폼 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 댓글 수정 폼 디자인 전" src="<c:url value="/resources/images/bbs-view-modify-form.png"/>" style="border: 1px solid grey" /><br />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
&lt;input type="hidden" name="commentNo" value="5" /&gt;
&lt;input type="hidden" name="boardCd" value="chat" /&gt;
&lt;input type="hidden" name="articleNo" value="12" /&gt;
&lt;input type="hidden" name="curPage" value="1" /&gt;
&lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
&lt;div style="text-align: right;"&gt;
	&lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;수정하기&lt;/a&gt;
	| &lt;a href="javascript:modifyCommentToggle('5')"&gt;취소&lt;/a&gt;
&lt;/div&gt;
&lt;div&gt;
	&lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;무궁화꽃이피었습니다.&lt;/textarea&gt;
&lt;/div&gt;
&lt;/form&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>.comment-form {
	clear: both; 
	padding: 0.22em 2.22em 0.22em 3.22em; 
}
.comment-textarea {
	border: 1px solid silver;
	padding: 3px;
	width: 99%;
	color:#555;
	background-color: #eee;
	font-size: 11px; 
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 댓글 수정 폼 디자인 결과" src="<c:url value="/resources/images/bbs-view-modify-form-result.png"/>" style="border: 1px solid grey;" /><br />
</p>

<h3>댓글 쓰기 폼 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 댓글 쓰기 폼 디자인 전" src="<c:url value="/resources/images/bbs-view-add-comments.png"/>" style="border: 1px solid grey;" /><br />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
	&lt;div id="addComment"&gt;
		&lt;textarea style="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
	&lt;/div&gt;
	&lt;div style="text-align: right;"&gt;
		&lt;input type="submit" value="댓글 쓰기" /&gt;
	&lt;/div&gt;
&lt;/form&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#addComment {
	margin-bottom: 5px;
	padding: 0.22em;
	border: 1px solid #eee;
	background-color: #fafbf7;
}
#addComment textarea {
	width: 99%;
	padding: 3px;
	border: 0;
	color: #555;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 댓글 쓰기 폼 디자인 결과" src="<c:url value="/resources/images/bbs-view-next-prev-result.png"/>" style="border: 1px solid grey;" /><br />
</p>

<h3>다음 글, 이전 글 스타일</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 다음 글 이전 글 디자인 전" src="<c:url value="/resources/images/next-prev-before.png"/>" style="border: 1px solid grey;" /><br />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div id="next-prev"&gt;
	&lt;p&gt;다음 글 : &lt;a href="#"&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
	&lt;p&gt;이전 글 : &lt;a href="#"&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#next-prev {
	margin: 7px 0;
	border-top: 1px solid #e1e1e1;
}
#next-prev &gt; p {
	margin: 0;
	padding: 5px;
	border-bottom: 1px solid #e1e1e1;
	font-size: 12px;
	color: #333;
}
#next-prev &gt; p &gt; a {
	color: #333;
	text-decoration: none;
}
#next-prev &gt; p &gt; a:hover {
	color: #333;
	text-decoration: underline;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 다음 글 이전 글 디자인 결과" src="<c:url value="/resources/images/next-prev.png"/>" style="border: 1px solid grey;" /><br />
</p>

<h3>수정, 삭제, 다음 글, 이전 글, 목록, 새 글쓰기 버튼 위치 조정</h3>

<p>
[디자인 전]<br />
<img alt="게시판 상세보기 수정*삭제*다음 글*이전 글*목록*새 글쓰기 버튼 디자인 전" src="<c:url value="/resources/images/bbs-view-buttons.png"/>" style="border: 1px solid grey;" /><br />
</p>

<p>
HTML에서 아래와 같은 코드가 두 군데가 있다.
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div class="view-menu" ..&gt;
	&lt;div class="fl"&gt;
		&lt;input type="button" value="수정" /&gt;
		&lt;input type="button" value="삭제" /&gt;
	&lt;/div&gt;
	&lt;div class="fr"&gt;
		&lt;input type="button" value="다음 글" /&gt;
		&lt;input type="button" value="이전 글" /&gt;
		&lt;input type="button" value="목록" /&gt;
		&lt;input type="button" value="새 글쓰기" /&gt;
	&lt;/div&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#view-menu {
    height: 22px;
}
.fl {
    float: left;
}
.fr {
    float: right;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 상세보기 수정*삭제*다음 글*이전 글*목록*새 글쓰기 버튼 디자인 결과" src="<c:url value="/resources/images/bbs-view-file.png"/>"/>
</p>


<h1>게시판 글쓰기와 회원가입 스타일 지정</h1>

<h3>게시판 글쓰기 페이지</h3>

<p>
view.html 파일을 에디터에서 '다른 이름으로 저장하기' 메뉴를 사용하여 write_form.html 파일을 생성한다.<br />
#content 엘리먼트의 기존 내용을 모두 삭제하고 대신 다음 코드를 붙여넣는다.
</p>

<pre class="prettyprint">&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;자유 게시판&lt;/div&gt;
&lt;h3&gt;새 글쓰기&lt;/h3&gt;
&lt;form id="writeForm" action="write_proc.jsp" method="post" enctype="multipart/form-data"&gt;
&lt;input type="hidden" name="boardCd" value="chat" /&gt;
&lt;table id="write-form" class="bbs-table"&gt;
&lt;tr&gt;
	&lt;td&gt;제목&lt;/td&gt;
	&lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td colspan="2"&gt;
		&lt;textarea name="content" rows="17" cols="50"&gt;&lt;/textarea&gt;
	&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;첨부 파일&lt;/td&gt;
	&lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
	&lt;input type="submit" value="전송" /&gt;
	&lt;input type="button" value="취소" /&gt;
	&lt;input type="button" value="목록" /&gt;
&lt;/div&gt;
&lt;/form&gt;
&lt;!-- 본문 끝 --&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint"><strong>#write-form td {
	border: none;
}
#write-form textarea {
	width: 99%;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 글쓰기 디자인 결과" src="<c:url value="/resources/images/bbs-write-form-result.png"/>" />
</p>

<h4>#extra 디자인</h4>

<p>
#extra 부분은 웹사이트 기획자가 상상력을 발휘하는 곳이다.<br />
다음 이미지를 내려받아 images 폴더에 저장한다.<br />
</p>

<ol>
	<li><img src="<c:url value="/resources/images/youtube.png"/>" alt="youtube" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/gmail.gif"/>" alt="gmail" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/google-drive.png"/>" alt="google drive" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/gcp-logo.png"/>" alt="gcp" style="border: 1px solid grey;width: 203px;" /></li>
</ol>

<p>
write_from.html의 #extra에 다음 코드를 추가한다.
</p>

<pre class="prettyprint">&lt;div id="extra"&gt;
	<strong>&lt;a href="http://www.youtube.com"&gt;&lt;img src="images/youtube.png" alt="youtube" /&gt;&lt;/a&gt;
	&lt;a href="http://gmail.com"&gt;&lt;img src="images/gmail.gif" alt="gmail" /&gt;&lt;/a&gt;
	&lt;a href="http://drive.google.com"&gt;&lt;img src="images/google-drive.png" alt="google drive" /&gt;&lt;/a&gt;
	&lt;a href="https://cloud.google.com/"&gt;&lt;img src="images/gcp-logo.png" alt="google cloud" /&gt;&lt;/a&gt;</strong>
&lt;/div&gt;
</pre>

<p>
/*** Just for Looks ***/를 모두 지운다.<br />
</p>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#extra img {
	width: 203px;
}
#extra a {
	display: block;
	border: 1px solid #DAEAAA;
	margin-bottom: 7px;
}
#extra a:hover {
	opacity: 0.7;
}</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 글쓰기 디자인 결과" src="<c:url value="/resources/images/bbs-write-form-result2.png"/>" />
</p>

<h3>회원가입 페이지</h3>

<p>
write_form.html 파일을 에디터에서 '다른 이름으로 저장하기' 메뉴를 이용하여 signUp.html 파일을 만든다.<br />
#content의 내용을 다음 코드로 바꾼다.
</p>

<pre class="prettyprint"><strong>&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h3&gt;회원 가입&lt;/h3&gt;
&lt;form id="signUpForm" action="signUp_proc.jsp" method="post"&gt;
&lt;table&gt;
&lt;tr&gt;
	&lt;td style="width: 200px;"&gt;이름&lt;/td&gt;
	&lt;td style="width: 390px;"&gt;&lt;input type="text" name="name" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;비밀번호&lt;/td&gt;
	&lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
	Email이 아이디로 쓰이므로 비밀번호는 Email 계정 비밀번호와 같게 하지 마세요.
	&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;확인&lt;/td&gt;
	&lt;td&gt;&lt;input type="password" name="confirm" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;Email&lt;/td&gt;
	&lt;td&gt;&lt;input type="text" name="email" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
	&lt;td&gt;이동전화&lt;/td&gt;
	&lt;td&gt;&lt;input type="text" name="mobile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
	&lt;input type="submit" value="전송" /&gt;
&lt;/div&gt;
&lt;/form&gt;</strong>
</pre>

<p>
[결과 화면]<br />
<img alt="게시판 글쓰기 디자인 결과" src="<c:url value="/resources/images/sign-up-form.png"/>" />
</p>

<p>
지금까지 게시판 디자인을 작업했다.<br />
다음 장 'JSP 프로젝트'는 여기서 만든 최종 디자인을 가지고 진행한다.
</p>

<p>
<a href="https://github.com/kimjonghoon/css-layout">최종 소스</a>
</p>

<p>
구현하려는 프로젝트는 모델 1 게시판이다.<br />
모델 1은 클라이언트가 직접 JSP를 요청한다.<br />
다음은 모델 1 게시판 프로젝트에 필요한 JSP 파일 목록이다.
</p>

<p>
<strong>도큐먼트 베이스</strong>
</p>

<ul>
	<li>/index.jsp : 홈페이지</li>
	<li>/error.jsp : 에러 페이지</li>
</ul>

<p>
<strong>/inc</strong>
</p>

<ul>
	<li>header.jsp : 로고와 회원메뉴 버튼(로그인, 회원 가입 또는 로그아웃, 내 정보 수정)을 담는다.</li>
	<li>main-menu.jsp : 메인 메뉴</li>
	<li>extra.jsp : 화면 오른쪽에 위치하며 외부 링크를 담는다.</li>
	<li>footer.jsp : 카피라이트, 주소, 연락처 표시</li>
	<li>loginCheck.jsp : 로그인이 필요한 페이지에서 인클루드하는 파일로, 로그인하지 않은 사용자는 로그인 페이지로 이동시킨다.</li>
</ul>

<p>
<strong>/users</strong>
</p>

<ul>
	<li>user-sub.jsp : 회원 관련 메뉴</li>
	<li>login.jsp : 로그인 폼</li>
	<li>login_proc.jsp : 로그인 처리</li>
	<li>logout_proc.jsp : 로그아웃 처리</li>
	<li>signUp.jsp : 회원 가입 폼</li>
	<li>signUp_proc.jsp : 회원 가입 처리</li>
	<li>welcome.jsp : 회원 가입 환영</li>
	<li>editAccount.jsp : 내 정보 수정 폼</li>
	<li>editAccount_proc.jsp : 내 정보 수정 처리</li>
	<li>changePasswd.jsp : 비밀번호 변경 폼</li>
	<li>changePasswd_proc.jsp : 비밀번호 변경 처리</li>
	<li>changePasswd_confirm.jsp : 비밀번호 변경 확인</li>
	<li>bye.jsp : 탈퇴 폼</li>
	<li>bye_proc.jsp : 탈퇴 처리</li>
	<li>bye_confirm.jsp : 탈퇴 확인</li>
</ul>

<p>
<strong>/bbs</strong>
</p>

<ul>
	<li>bbs-sub.jsp : 게시판 메뉴</li>
	<li>list.jsp : 게시판 목록</li>
	<li>write.jsp : 글쓰기 폼</li>
	<li>write_proc.jsp : 글쓰기 처리</li>
	<li>view.jsp : 상세보기</li>
	<li>addComment_proc.jsp : 댓글 쓰기 처리</li>
	<li>updateComment_proc.jsp : 댓글 수정 처리</li>
	<li>deleteComment_proc.jsp : 댓글 삭제 처리</li>
	<li>deleteAttachFile_proc.jsp : 첨부 파일 삭제 처리</li>
	<li>del_proc.jsp : 게시글 삭제 처리</li>
	<li>modify.jsp : 게시글 수정 폼</li>
	<li>modify_proc.jsp : 게시글 수정 처리</li>
</ul>

<p>
<strong>/java</strong>
</p>

<ul>
	<li>index.jsp : 서브페이지 예제</li>
</ul>

<h2>메인 페이지, 서브 페이지</h2>

<p>
메인 페이지와 서브 페이지 디자인이 웹사이트 프로토타입의 첫 번째 작업이다.<br />
메인 페이지는 웹사이트를 방문할 때 보이는 페이지를 말하는데, 홈페이지라고도 한다.<br />
서브 페이지는 메인 페이지 외의 모든 페이지다.<br />
<img src="<c:url value="/resources/images/prototype-dir.png"/>" alt="Prototype Directory Structure" style="width: 178px;" /><br />
</p>

<p>
여기서 도큐먼트 베이스(DocumentBase)는 C:\www\JSPProject\WebContent 이다.
</p>

<h3>스타일 시트과 이미지</h3>

<p>
스타일 시트와 이미지 파일은 CSS Layout 최종 결과물을 사용한다.<br />
(<a href="https://github.com/kimjonghoon/css-layout">https://github.com/kimjonghoon/css-layout</a> 참조)<br />
내려받은 압축 파일을 풀고 스타일 시트와 이미지 파일을 css와 images 폴더에 복사하고 HTML 파일은 도큐먼트 베이스에 복사한다.
</p>

<h3>메인 페이지</h3>

<p>
로그인 로직을 프로토타입에 추가하겠다.<br />
따라서 메인 페이지를 작성하기 전에 다음 User 클래스가 먼저 생성한다.<br />
</p>

<h6 class="src">User.java</h6>
<pre class="prettyprint">package net.java_school.user;

public class User {
    private String email;
    private String passwd;
    private String name;
    private String mobile;
    
    public User() {}

    public User(String email, String passwd) {
        this.email = email;
        this.passwd = passwd;
    }
    
    public User(String email, String passwd, String name, String mobile) {
        this.email = email;
        this.passwd = passwd;
        this.name = name;
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswd() {
        return passwd;
    }
    
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

}
</pre>

<p>
User 클래스에 아이디가 없다.<br />
아이디로 이메일을 사용할 것이다.<br />
</p>

<h3>로그인 정책</h3>

<ul>
	<li>로그인이 필요한 페이지에 로그인하지 않은 사용자가 방문하면 사용자를 로그인 페이지로 보낸다. 이때 처음 방문하려던 URL를 로그인 페이지로 전달한다.</li>
	<li>로그인이 성공하면 전달받은 URL로 이동한다.</li>
	<li>로그인 페이지에서 로그인하면 자유 게시판 목록의 첫 번째 페이지로 이동한다.<br />
	<li>로그아웃하면 홈페이지로 이동한다.</li>
</ul>

<p>
도큐먼트베이스의 index.html을 index.jsp로 파일명을 변경한 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/index.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="<strong>메인 페이지</strong>" /&gt;
&lt;meta name="Description" content="<strong>메인 페이지</strong>" /&gt;
&lt;title&gt;<strong>메인 페이지</strong>&lt;/title&gt;
&lt;link rel="stylesheet" href=<strong>"/css/screen.css"</strong> type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;h1 <strong>style="float: left; width: 150px;"</strong>&gt;&lt;a href=<strong>"/"</strong>&gt;&lt;img src=<strong>"/images/ci.gif"</strong> alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
        <strong>&lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;   
            &lt;input type="button" value="로그인" onclick="location.href='/users/login.jsp'" /&gt;
            &lt;input type="button" value="회원 가입" onclick="location.href='/users/signUp.jsp'" /&gt;
&lt;%
} else {
%&gt;
            &lt;input type="button" value="로그아웃" onclick="location.href='/users/logout_proc.jsp'" /&gt;
            &lt;input type="button" value="내 정보 수정" onclick="location.href='/users/editAccount.jsp'" /&gt;
&lt;%
}
%&gt;
        &lt;/div&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;ul id="nav"&gt;
            &lt;li&gt;&lt;a href="<strong>/java</strong>"&gt;Java&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jdbc</strong>"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jsp</strong>"&gt;JSP&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/css-layout</strong>"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jsp-pjt</strong>"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/spring</strong>"&gt;Spring&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/javascript</strong>"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/bbs/list.jsp?boardCd=chat&amp;curPage=1</strong>"&gt;BBS&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;

&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;h1&gt;Main&lt;/h1&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;a href="http://www.youtube.com"&gt;&lt;img src="<strong>/images/youtube.png</strong>" alt="youtube.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.twitter.com"&gt;&lt;img src="<strong>/images/twitter.png</strong>" alt="twitter.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.facebook.com"&gt;&lt;img src="<strong>/images/facebook.png</strong>" alt="facebook.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.gmail.com"&gt;&lt;img src="<strong>/images/gmail.png</strong>" alt="gmail.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.java-school.net"&gt;&lt;img src="<strong>/images/java-school.png</strong>" alt="java-school.net" /&gt;&lt;/a&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;ul&gt;
            &lt;li&gt;&lt;a href="#"&gt;이용약관&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;개인정보보호정책&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;이메일무단수집거부&lt;/a&gt;&lt;/li&gt;
            &lt;li id="company-info"&gt;전화 : 02-123-5678, FAX : 02-123-5678&lt;br /&gt;
            people@ggmail.org&lt;br /&gt;
            Copyright java-school.net All Rights Reserved.&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;찾아오시는 길&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>서브 페이지</h3>

<p>
홈페이지 /index.jsp를 Save As... 메뉴를 이용하여 java 서브 디렉터리에 index.jsp 파일을 만든 후 아래와 같이 수정한다.
홈페이지와 달리 이 페이지는 서브 디렉터리에 있으므로 상대 경로를 수정해야 한다.
</p>
    
<h6 class="src">/java/index.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;</strong>    
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="자바 홈" /&gt;
&lt;meta name="Description" content="자바 홈" /&gt;
&lt;title&gt;자바 홈&lt;/title&gt;
&lt;link rel="stylesheet" href="<strong>/css/screen.css</strong>" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;h1 style="float: left; width: 150px;" &gt;&lt;a href="<strong>/</strong>"&gt;&lt;img src="<strong>/images/ci.gif</strong>" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
        &lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;   
            &lt;input type="button" value="로그인" onclick="location.href='<strong>/users/login.jsp</strong>'" /&gt;
            &lt;input type="button" value="회원 가입" onclick="location.href='<strong>/users/signUp.jsp</strong>'" /&gt;
&lt;%
} else {
%&gt;
            &lt;input type="button" value="로그아웃" onclick="location.href='<strong>/users/logout_proc.jsp'</strong>" /&gt;
            &lt;input type="button" value="내 정보 수정" onclick="location.href='<strong>/users/editAccount.jsp</strong>'" /&gt;
&lt;%
}
%&gt;
        &lt;/div&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;ul id="nav"&gt;
            &lt;li&gt;&lt;a href="<strong>/java</strong>"&gt;Java&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jdbc</strong>"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jsp</strong>"&gt;JSP&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/css-layout</strong>"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/jsp-pjt</strong>"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/spring</strong>"&gt;Spring&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/javascript</strong>"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="<strong>/bbs/list.jsp?boardCd=chat&amp;curPage=1</strong>"&gt;BBS&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;


    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;

&lt;!-- 본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;h1&gt;Java&lt;/h1&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;a href="http://www.youtube.com"&gt;&lt;img src="<strong>/images/youtube.png</strong>" alt="youtube.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.twitter.com"&gt;&lt;img src="<strong>/images/twitter.png</strong>" alt="twitter.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.facebook.com"&gt;&lt;img src="<strong>/images/facebook.png</strong>" alt="facebook.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.gmail.com"&gt;&lt;img src="<strong>/images/gmail.png</strong>" alt="gmail.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.java-school.net"&gt;&lt;img src="<strong>/images/java-school.png</strong>" alt="java-school.net" /&gt;&lt;/a&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;ul&gt;
            &lt;li&gt;&lt;a href="#"&gt;이용약관&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;개인정보보호정책&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;이메일무단수집거부&lt;/a&gt;&lt;/li&gt;
            &lt;li id="company-info"&gt;전화 : 02-123-5678, FAX : 02-123-5678&lt;br /&gt;
            people@ggmail.org&lt;br /&gt;
            Copyright java-school.net All Rights Reserved.&lt;/li&gt;
            &lt;li&gt;&lt;a href="#"&gt;찾아오시는 길&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>공통 JSP 페이지</h3>

<p>
화면 배치가 같으면 JSP 인클루드 지시어를 사용하여 코드를 분리할 수 있다.<br />
페이지를 분리하면 유지 보수가 편해진다.<br />
#header에 있는 로고와 로그인/로그아웃 버튼, #main-menu의 메인 메뉴, #extra의 외부 링크, #footer의 글로벌 메뉴는 모든 페이지에서 공통이다.<br />
inc 서브 디렉터리에 다음 JSP 파일을 생성한다.<br />
/java/index.jsp 파일을 참고하여 다음 파일을 생성한다.
</p>

<h6 class="src">/inc/header.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;h1 style="float: left; width: 150px;"&gt;&lt;a href="/"&gt;&lt;img src="/images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
&lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
    &lt;input type="button" value="로그인" onclick="location.href='/users/login.jsp'" /&gt;
    &lt;input type="button" value="회원 가입" onclick="location.href='/users/signUp.jsp'" /&gt;
&lt;%
} else {
%&gt;   
    &lt;input type="button" value="로그아웃" onclick="location.href='/users/logout_proc.jsp'" /&gt;
    &lt;input type="button" value="내 정보 수정" onclick="location.href='/users/editAccount.jsp'" /&gt;
&lt;%
}
%&gt;
&lt;/div&gt;
</pre>

<h6 class="src">/inc/main-menu.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;ul id="nav"&gt;
    &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>

<h6 class="src">/inc/extra.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;a href="http://www.youtube.com"&gt;&lt;img src="/images/youtube.png" alt="youtube.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.twitter.com"&gt;&lt;img src="/images/twitter.png" alt="twitter.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.facebook.com"&gt;&lt;img src="/images/facebook.png" alt="facebook.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.gmail.com"&gt;&lt;img src="/images/gmail.png" alt="gmail.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.java-school.net"&gt;&lt;img src="/images/java-school.png" alt="java-school.net" /&gt;&lt;/a&gt;
</pre>

<h6 class="src">/inc/footer.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;ul&gt;
    &lt;li&gt;&lt;a href="#"&gt;이용약관&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;개인정보보호정책&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;이메일무단수집거부&lt;/a&gt;&lt;/li&gt;
    &lt;li id="company-info"&gt;전화 : 02-123-5678, FAX : 02-123-5678&lt;br /&gt;
    people@ggmail.org&lt;br /&gt;
    Copyright java-school.net All Rights Reserved.&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;찾아오시는 길&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p>
공통 JSP 파일을 만들 때 페이지 지시어의 contentType 속성은 포함하는 페이지와 같아야 한다.<br />
같지 않다면 서블릿으로 변환되지 않는다.<br />
따라서 공통 JSP 파일의 contentType은 다음과 같아야 한다.
</p>

<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
</pre>


<h3>공통 JSP 파일을 이용하여 서브 페이지 수정</h3>

<h6 class="src">/java/index.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="자바 홈" /&gt;
&lt;meta name="Description" content="자바 홈" /&gt;
&lt;title&gt;자바 홈&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;<strong>
        &lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;<strong>
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;!-- 본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;h1&gt;Java&lt;/h1&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;<strong>
        &lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;<strong>
        &lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h2>로그인 폼, 로그인 처리, 로그아웃 처리 페이지 생성</h2>

<p>
로그인 테스트를 위해 로그인 폼, 로그인 처리, 로그아웃 처리 페이지를 생성한다.<br />
모든 회원 관련 페이지가 인클루드해야 하는 회원 메뉴 페이지, user-sub.jsp를 /users 디렉터리에 생성한다.<br />
</p>

<h6 class="src">/users/user-sub.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;h1&gt;회원&lt;/h1&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
&lt;ul&gt;
    &lt;li&gt;&lt;a href="login.jsp"&gt;로그인&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="signUp.jsp"&gt;회원 가입&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;ID 찾기&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;비밀번호 찾기&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;%
} else {
%&gt;
&lt;ul&gt;
    &lt;li&gt;&lt;a href="editAccount.jsp"&gt;내 정보 수정&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="changePasswd.jsp"&gt;비밀번호 변경&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="bye.jsp"&gt;탈퇴&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;%
}
%&gt;
</pre>

<p>
로그인 폼 페이지를 만든다.<br />
/java/index.jsp를 연 상태에서 Save As... 메뉴를 이용하여 login.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/login.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;<strong>
&lt;%
request.setCharacterEncoding("UTF-8");
String url = request.getParameter("url");
if (url == null) url = "";
%&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="로그인" /&gt;
&lt;meta name="Description" content="로그인" /&gt;
&lt;title&gt;로그인&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;로그인&lt;/h2&gt;
&lt;form id="loginForm" action="login_proc.jsp" method="post"&gt;
<strong>&lt;input type="hidden" name="url" value="&lt;%=url %&gt;" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
    &lt;td style="width: 200px;"&gt;Email&lt;/td&gt;
    &lt;td style="width: 390px"&gt;&lt;input type="text" name="email" style="width: 99%;" value="captain@heist.com" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;비밀번호(Password)&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="passwd" style="width: 99%;" value="1111" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-top: 15px;"&gt;
    &lt;input type="submit" value="전송" /&gt;
    &lt;input type="button" value="회원 가입" onclick="location.href='signUp.jsp'" /&gt;
&lt;/div&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;<strong>
        &lt;%@ include file="user-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;<strong>
        &lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;<strong>
        &lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
로그인을 처리하는 페이지를 만든다.<br />
</p>

<h6 class="src">/users/login_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User"%&gt;
&lt;%
String url = request.getParameter("url");
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");

session.setAttribute("user", new User(email, passwd, "홍길동", "010-1234-5678"));
if (url != null &amp;&amp; !url.equals("")) {
    response.sendRedirect(url);
} else {
    response.sendRedirect("../bbs/list.jsp?boarCd=chat&amp;curPage=1");
}
%&gt;
</pre>

<p>
로그아웃을 처리하는 페이지를 만든다.<br />
로그아웃 후 홈페이지로 이동하도록 구현한다.<br />
</p>

<h6 class="src">/users/logout_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
session.removeAttribute("user");

response.sendRedirect("../");
%&gt;
</pre>

<p>
웹 브라우저로 로그인과 로그아웃을 테스트한다.<br />
로그인하면 아직 만들지 않은 게시판으로 이동하여 404 에러를 보게 된다.<br />
다시 상단의 로고를 클릭하여 홈페이지로 이동, 
홈페이지에서 Java 메인 메뉴를 클릭하여 서브 페이지로 이동한 후 로그아웃하면 홈페이지로 이동한다.<br />
</p>

<h2>JSP 에러 핸들링</h2>

<p>
web.xml 파일을 열고 &lt;/web-app&gt; 직전에 다음을 추가한다.<br />
</p>

<h6 class="src">web.xml</h6>
    <pre class="prettyprint">&lt;error-page&gt;
    &lt;error-code&gt;403&lt;/error-code&gt;
    &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
    &lt;error-code&gt;404&lt;/error-code&gt;
    &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
    &lt;error-code&gt;500&lt;/error-code&gt;
    &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
    &lt;exception-type&gt;java.lang.Throwable&lt;/exception-type&gt;
    &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
</pre>

<p>
주요 에러를 모두 /error.jsp가 담당하도록 하는 설정이다.<br />
</p>

<h3>에러 페이지</h3>

<p>
홈페이지를 연 상태에서 Save As... 메뉴를 이용하여 error.jsp라는 새 파일을 도큐먼트 베이스에 만든 후 아래와 같이 수정한다.<br />
</p>
    
<h6 class="src">/error.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Error" /&gt;
&lt;meta name="Description" content="Error" /&gt;
&lt;title&gt;Error&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
//Analyze the servlet exception
Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
String servletName = (String) request.getAttribute("jakarta.servlet.error.servlet_name");

if (servletName == null) {
    servletName = "Unknown";
}

String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");

if (requestUri == null) {
    requestUri = "Unknown";
}
%&gt;
&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;h1 style="float: left; width: 150px;"&gt;&lt;a href="<strong>/</strong>"&gt;&lt;img src="/images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
        &lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
    &lt;input type="button" value="로그인" onclick="location.href='/users/login.jsp'" /&gt;
    &lt;input type="button" value="회원 가입" onclick="location.href='/users/signUp.jsp'" /&gt;
&lt;%
} else {
%&gt;   
    &lt;input type="button" value="로그아웃" onclick="location.href='/users/logout_proc.jsp'" /&gt;
    &lt;input type="button" value="내 정보 수정" onclick="location.href='/users/editAccount.jsp'" /&gt;
&lt;%
}
%&gt;
        &lt;/div&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;ul id="nav"&gt;
            &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;Error&lt;/div&gt;
&lt;h2&gt;Error Page&lt;/h2&gt;
&lt;%
if (statusCode != null &amp;&amp; statusCode != 500) {
  out.write("&lt;h3&gt;Error Details&lt;/h3&gt;");
  out.write("&lt;strong&gt;Status Code&lt;/strong&gt;:" + statusCode + "&lt;br&gt;");
  out.write("&lt;strong&gt;Requested URI&lt;/strong&gt;:"+requestUri);
}    
if (throwable != null) {
  out.write("&lt;h3&gt;Exception Details&lt;/h3&gt;");
  out.write("&lt;ul&gt;&lt;li&gt;Servlet Name:" + servletName + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Name:" + throwable.getClass().getName() + "&lt;/li&gt;");
  out.write("&lt;li&gt;Requested URI:" + requestUri + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Message:" + throwable.getMessage() + "&lt;/li&gt;");
  out.write("&lt;/ul&gt;");
}
%&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;h1&gt;Error&lt;/h1&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;a href="http://www.youtube.com"&gt;&lt;img src="/images/youtube.png" alt="youtube.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.twitter.com"&gt;&lt;img src="/images/twitter.png" alt="twitter.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.facebook.com"&gt;&lt;img src="/images/facebook.png" alt="facebook.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.gmail.com"&gt;&lt;img src="/images/gmail.png" alt="gmail.com" /&gt;&lt;/a&gt;
        &lt;a href="http://www.java-school.net"&gt;&lt;img src="/images/java-school.png" alt="java-school.net" /&gt;&lt;/a&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="./inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
다시 로그인을 시도한다. 아직 만들지 않는 페이지를 요청하게 된다. 에러 페이지가 작동하는지 확인한다.
</p>

<h2>게시판</h2>

<p>
게시판 관련 페이지를 작성한다.<br />
</p>

<h3>게시판 메뉴(bbs-sub.jsp) 페이지</h3>

<p>
게시판 모듈에서 화면을 담당하는 모든 페이지가 인클루드해야 하는 페이지부터 작성한다.<br />
도큐먼트 베이스에 bbs라는 서브 디렉터리를 만들고, /bbs에 bbs-sub.jsp 파일을 만든다.<br />
bbs-sub.jsp 파일은 게시판에 대한 링크를 제공한다.<br />
</p>

<h6 class="src">/bbs/bbs-sub.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;h1&gt;게시판&lt;/h1&gt;
&lt;ul&gt;
    &lt;li&gt;
        &lt;ul&gt;
            &lt;li&gt;&lt;a href="list.jsp?boardCd=chat&amp;curPage=1"&gt;자유 게시판&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="list.jsp?boardCd=qna&amp;curPage=1"&gt;QnA게시판&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href="list.jsp?boardCd=data&amp;curPage=1"&gt;자료실&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/li&gt;
&lt;/ul&gt;
</pre>

<h3>로그인 체크(loginCheck.jsp) 페이지</h3>

<p>
이 페이지는 사용자가 로그인했는지를 검사하고, 로그인하지 않은 사용자는 로그인 페이지로 리다이렉트시킨다.<br />
이때 로그인 후 다시 사용자가 요청한 원래 페이지로 이동하기 위해 url 정보를 로그인 페이지에 전달한다.<br />
공통 인클루드 파일 디렉터리인 /inc에 loginCheck.jsp 파일을 만든다.<br />
이 파일을 공통 인클루드 파일 디렉터리에 생성하는 이유는 게시판 모듈 외에도 사용될 수 있기 때문이다.<br />
</p>
    
<h6 class="src">/inc/loginCheck.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.*"%&gt;
&lt;%@ page import="java.net.URLEncoder"%&gt;
&lt;%   
User user = (User) session.getAttribute("user");
if (user == null) {
    //로그인 후 되돌아갈 URL를 구한다.
    String uri = request.getRequestURI();
    String query = request.getQueryString();
    String url = uri;
    if (query != null) url += "?" + query;
    //로그인 페이지로 리다이렉트
    url = URLEncoder.encode(url, "UTF-8");
    response.sendRedirect("/users/login.jsp?url=" + url);
    return;
}
%&gt;
</pre>

<h3>목록 페이지</h3>

<p>
게시판 목록을 보여주는 페이지를 만든다.<br />
CSS 포지셔닝에서의 만든 list.html 파일을 연 상태에서 Save As... 메뉴를 이용하여 list.jsp라는 이름의 새 파일을 /bbs 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/bbs/list.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="게시판 목록" /&gt;
&lt;meta name="Description" content="게시판 목록" /&gt;
&lt;title&gt;자유 게시판&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;<strong>
&lt;script type="text/javascript"&gt;
function goList(curPage) {
    var form = document.getElementById("listForm");
    form.curPage.value = curPage;
    form.submit();
}

function goView(articleNo) {
    var form = document.getElementById("viewForm");
    form.articleNo.value = articleNo;
    form.submit();
}

function goWrite() {
    var form = document.getElementById("writeForm");
    form.submit();
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;

&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;자유 게시판&lt;/div&gt;
&lt;table class="bbs-table"&gt;
&lt;!--  게시판 목록 머리말 --&gt;
&lt;tr&gt;
    &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
    &lt;th&gt;TITLE&lt;/th&gt;
    &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
    &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 시작 --&gt;
&lt;tr&gt;
    &lt;td style="text-align: center;"&gt;11&lt;/td&gt;
    &lt;td&gt;
        &lt;a href="<strong>javascript:goView('1')"</strong>&gt;제목&lt;/a&gt;
        &lt;img src="/images/attach.png" alt="첨부 파일" style="vertical-align: middle;" /&gt;
        &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;
    &lt;/td&gt;
    &lt;td style="text-align: center;"&gt;2011.11.15&lt;/td&gt;
    &lt;td style="text-align: center;"&gt;4555&lt;/td&gt;
&lt;/tr&gt;
&lt;!--  반복 구간 끝 --&gt;
&lt;/table&gt;
&lt;div id="paging"&gt;
    &lt;a href="<strong>javascript:goList('5')"</strong>&gt;[이전]&lt;/a&gt;
    &lt;span class="bbs-strong"&gt;6&lt;/span&gt;
    &lt;a href="<strong>javascript:goList('7')</strong>"&gt;7&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('8')</strong>"&gt;8&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('9')</strong>"&gt;9&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('10')</strong>"&gt;10&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('11')</strong>"&gt;[다음]&lt;/a&gt;  
&lt;/div&gt;

&lt;div id="list-menu"&gt;
    &lt;input type="button" value="새 글쓰기" <strong>onclick="goWrite()"</strong> /&gt;
&lt;/div&gt;

&lt;div id="search"&gt;
    &lt;form action="list.jsp" method="get"&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;div&gt;
            &lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
            &lt;input type="submit" value="검색" /&gt;
        &lt;/div&gt;
    &lt;/form&gt;
&lt;/div&gt;
&lt;!--  본문 끝 --&gt;

        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
    &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
    &lt;form id="listForm" action="list.jsp" method="get"&gt;
    &lt;p&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/p&gt;
    &lt;/form&gt;
    &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;p&gt;
        &lt;input type="hidden" name="articleNo" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/p&gt;
    &lt;/form&gt;
    &lt;form id="writeForm" action="write.jsp" method="get"&gt;
    &lt;p&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/p&gt;
    &lt;/form&gt;
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>글쓰기 폼 페이지</h3>

<p>
다음은 게시판 글쓰기 폼 페이지를 작성한다.<br />
CSS 포지셔닝에서 만든 write.html 파일을 연 상태에서 Save As... 메뉴를 이용하여 write.jsp라는 이름의 새 파일을 /bbs 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>
    
<h6 class="src">/bbs/write.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;<strong>
&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="글쓰기 화면" /&gt;
&lt;meta name="Description" content="글쓰기 화면" /&gt;
&lt;title&gt;자유 게시판&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
<strong>&lt;script type="text/javascript"&gt;
function goList() {
    var form = document.getElementById("listForm");
    form.submit();
}
function goView() {
    var form = document.getElementById("viewForm");
    form.submit();
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
        
&lt;!--  본문 시작 --&gt;
&lt;div id="content-categories"&gt;자유 게시판&lt;/div&gt;
&lt;h3&gt;새 글쓰기&lt;/h3&gt;
&lt;form id="writeForm" action="write_proc.jsp" method="post" enctype="multipart/form-data"&gt;
&lt;input type="hidden" name="boardCd" value="chat" /&gt;
&lt;table id="write-form" class="bbs-table"&gt;
&lt;tr&gt;
    &lt;td&gt;제목&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2"&gt;
        &lt;textarea name="content" rows="17" cols="50"&gt;&lt;/textarea&gt;
    &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;첨부 파일&lt;/td&gt;
    &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
    &lt;input type="submit" value="전송" /&gt;
    <strong>&lt;input type="button" value="목록" onclick="goList()" /&gt;
    &lt;input type="button" value="상세보기" onclick="goView()" /&gt;</strong>
&lt;/div&gt;
&lt;/form&gt;
&lt;!-- 본문 끝 --&gt;

        &lt;/div&gt;
    &lt;/div&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>   
    &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
    &lt;form id="viewForm" action="view.jsp" method="get"&gt;
        &lt;input type="hidden" name="articleNo" value="5" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="listForm" action="list.jsp" method="get"&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;   
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>글쓰기 처리 페이지</h3>

<p>
글쓰기 처리 페이지를 작성한다.<br />
이 페이지는 글쓰기 폼에서 전달받는 파라미터로 실제로 데이터베이스에 인서트를 담당한다.<br />
</p>

<h6 class="src">/bbs/write_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
새 게시글을 등록하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인 사용자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
로그인 체크를 통과하면
boardCd, title, content, attachFile 파라미터를 가지고 새 글을 인서트한다.

form의 enctype 속성이 "multipart/form-data"인 경우 request.getParameter();로 파라미터의 값을 얻을 수 없다.
이 경우 프로그래밍을 손쉽게 하려면 아파치 commons-fileupload 또는 cos와 같은 외부 라이브러리를 이용한다.

새 글을 등록한 후 목록의 첫 번째 페이지로 되돌아가야 한다.
*/
response.sendRedirect("list.jsp?boardCd=chat&amp;curPage=1");
%&gt;
</pre>

<h3>상세보기 페이지</h3>

<p>
목록에서 제목을 클릭하면 보이게 되는 게시글 상세보기 페이지를 만든다.<br />
CSS 포지셔닝에서 만든 view.html 파일을 연 상태에서 Save As... 메뉴를 이용하여 view.jsp 이름의 새 파일을 /bbs 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/bbs/view.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="게시판 상세보기" /&gt;
&lt;meta name="Description" content="게시판 상세보기" /&gt;
&lt;title&gt;자유 게시판&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;script type="text/javascript"&gt;
function modifyCommentToggle(articleNo) {
    var p_id = "comment" + articleNo;
    var form_id = "modifyCommentForm" + articleNo;
    var p = document.getElementById(p_id);
    var form = document.getElementById(form_id);
    var p_display;
    var form_display;
    
    if (p.style.display) {
        p_display = '';
        form_display = 'none';
    } else {
        p_display = 'none';
        form_display = '';
    }
    
    p.style.display = p_display;
    form.style.display = form_display;
}
<strong>
function goList(curPage) {
    var form = document.getElementById("listForm");
    form.curPage.value = curPage;
    form.submit();
}

function goView(articleNo) {
    var form = document.getElementById("viewForm");
    form.articleNo.value = articleNo;
    form.submit();
}

function goWrite() {
    var form = document.getElementById("writeForm");
    form.submit();
}

function goModify() {
    var form = document.getElementById("modifyForm");
    form.submit();
}

function goDelete() {
    var check = confirm("정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("delForm");
        form.submit();
    }
}

function deleteAttachFile(attachFileNo) {
    var check = confirm("첨부 파일을 정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("deleteAttachFileForm");
        form.attachFileNo.value = attachFileNo;
        form.submit();
    }
}

function deleteComment(commentNo) {
    var check = confirm("댓글을 정말로 삭제하시겠습니까?");
    if (check) {
        var form = document.getElementById("deleteCommentForm");
        form.commentNo.value = commentNo;
        form.submit();
    }
}
</strong>
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;

&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;자유 게시판&lt;/div&gt;
&lt;div class="view-menu" style="margin-top: 15px;margin-bottom: 5px;"&gt;
    &lt;div class="fl"&gt;
        &lt;input type="button" value="수정" <strong>onclick="goModify()</strong>" /&gt;
        &lt;input type="button" value="삭제" <strong>onclick="goDelete()</strong>"/&gt;
    &lt;/div&gt;
    &lt;div class="fr"&gt;
        &lt;input type="button" value="다음 글" <strong>onclick="goView('6')"</strong> /&gt;
        &lt;input type="button" value="이전 글" <strong>onclick="goView('4')"</strong> /&gt;
        &lt;input type="button" value="목록" <strong>onclick="goList('1')"</strong> /&gt;
        &lt;input type="button" value="새 글쓰기" <strong>onclick="goWrite()"</strong> /&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;table class="bbs-table"&gt;
&lt;tr&gt;
    &lt;th style="width: 37px;text-align: left;vertical-align: top;font-size: 1em;"&gt;TITLE&lt;/th&gt;
    &lt;th style="text-align: left;color: #555;font-size: 1em;"&gt;What makes us happy?&lt;/th&gt;
&lt;/tr&gt; 
&lt;/table&gt;
&lt;div id="detail"&gt;
    &lt;div id="date-writer-hit"&gt;<strong>edited 2014-10-09 17:55:30 by 홍길동 hit 1330</strong>&lt;/div&gt;
    &lt;div id="article-content"&gt;
    What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
    What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
    &lt;/div&gt;
    &lt;div id="file-list" style="text-align: right"&gt;
        &lt;div class="attach-file"&gt;
            &lt;a href="#" &gt;TEST.png&lt;/a&gt;
            &lt;a href="javascript:deleteAttachFile('23')"&gt;x&lt;/a&gt;
		&lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;!--  댓글 쓰기 --&gt;
&lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
    &lt;input type="hidden" name="articleNo" value="5"/&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;div id="addComment"&gt;
        &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div style="text-align: right;"&gt;
        &lt;input type="submit" value="댓글 남기기" /&gt;
    &lt;/div&gt;
&lt;/form&gt;
&lt;!--  댓글 반복 시작 --&gt;
&lt;div class="comments"&gt;
    &lt;span class="writer"&gt;xman&lt;/span&gt;
    &lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
    &lt;span class="modify-del"&gt;
        &lt;a href="javascript:modifyCommentToggle('5')"&gt;수정&lt;/a&gt;
         | &lt;a href="javascript:deleteComment('5')"&gt;삭제&lt;/a&gt;
    &lt;/span&gt;
    &lt;p id="comment5"&gt;What makes us happy?&lt;/p&gt;
    &lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
    &lt;input type="hidden" name="commentNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="articleNo" value="12" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;div class="fr"&gt;
            &lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;수정하기&lt;/a&gt;
            | &lt;a href="javascript:modifyCommentToggle('5')"&gt;취소&lt;/a&gt;
    &lt;/div&gt;
    &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;무궁화꽃이 피었습니다.&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;/form&gt;
&lt;/div&gt;
&lt;!--  댓글 반복 끝 --&gt;
&lt;div id="next-prev"&gt;
    &lt;p&gt;다음 글 : &lt;a href="<strong>javascript:goView('6')"</strong>&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
    &lt;p&gt;이전 글 : &lt;a href="<strong>javascript:goView('4')"</strong>&gt;무궁화꽃이 피었습니다.&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class="view-menu" style="margin-bottom: 47px;"&gt;
    &lt;div class="fl"&gt;
        &lt;input type="button" value="수정" <strong>onclick="goModify()</strong>" /&gt;
        &lt;input type="button" value="삭제" <strong>onclick="goDelete()</strong>"/&gt;
    &lt;/div&gt;
    &lt;div class="fr"&gt;
        &lt;input type="button" value="다음 글" <strong>onclick="goView('6')"</strong> /&gt;
        &lt;input type="button" value="이전 글" <strong>onclick="goView('4')"</strong> /&gt;
        &lt;input type="button" value="목록" <strong>onclick="goList('1')"</strong> /&gt;
        &lt;input type="button" value="새 글쓰기" <strong>onclick="goWrite()"</strong> /&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;!-- 목록 --&gt;
&lt;table class="bbs-table"&gt;
&lt;tr&gt;
    &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
    &lt;th&gt;TITLE&lt;/th&gt;
    &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
    &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td style="text-align: center;"&gt;&lt;img src="/images/arrow.gif" alt="현재 글" /&gt;&lt;/td&gt;
    &lt;td&gt;
        &lt;a href="<strong>javascript:goView('1')"</strong>&gt;제목&lt;/a&gt;
        &lt;img src="/images/attach.png" alt="첨부 파일" style="vertical-align: middle;" /&gt;
        &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;
    &lt;/td&gt;
    &lt;td style="text-align: center;"&gt;2011.11.15&lt;/td&gt;
    &lt;td style="text-align: center;"&gt;4555&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div id="paging"&gt;
    &lt;a href="<strong>javascript:goList('5')"</strong>&gt;[이전]&lt;/a&gt;
    &lt;span class="bbs-strong"&gt;6&lt;/span&gt;
    &lt;a href="<strong>javascript:goList('7')"</strong>&gt;7&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('8')"</strong>&gt;8&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('9')"</strong>&gt;9&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('10')"</strong>&gt;10&lt;/a&gt;
    &lt;a href="<strong>javascript:goList('11')"</strong>&gt;[다음]&lt;/a&gt;
&lt;/div&gt;
&lt;div id="list-menu"&gt;
    &lt;input type="button" value="새 글쓰기" <strong>onclick="goWrite()"</strong> /&gt;
&lt;/div&gt;
&lt;div id="search"&gt;
    &lt;form action="list.jsp" method="get"&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;div&gt;
            &lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
            &lt;input type="submit" value="검색" /&gt;
        &lt;/div&gt;
    &lt;/form&gt;
&lt;/div&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
    &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
    &lt;form id="listForm" action="list.jsp" method="get"&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="viewForm" action="view.jsp" method="get"&gt;
      &lt;input type="hidden" name="articleNo" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="writeForm" action="write.jsp" method="get"&gt;
      &lt;input type="hidden" name="articleNo" value="5" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="12" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="modifyForm" action="modify.jsp" method="get"&gt;
      &lt;input type="hidden" name="articleNo" value="5" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="delForm" action="del_proc.jsp" method="post"&gt;
      &lt;input type="hidden" name="articleNo" value="5" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;
    &lt;form id="deleteCommentForm" action="deleteComment_proc.jsp" method="post"&gt;
      &lt;input type="hidden" name="commentNo" /&gt;
      &lt;input type="hidden" name="articleNo" value="12" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;   
    &lt;form id="deleteAttachFileForm" action="deleteAttachFile_proc.jsp" method="post"&gt;
      &lt;input type="hidden" name="attachFileNo" /&gt;
      &lt;input type="hidden" name="articleNo" value="23" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/form&gt;       
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>댓글 쓰기 처리 페이지</h3>

<p>
댓글 쓰기 처리 페이지는 상세보기 페이지에서 새 댓글을 쓰고 확인을 클릭하면 실제 댓글을 데이터베이스에 인서트 하는 페이지이다.<br />
</p>

<h6 class="src">/bbs/addComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
새로운 댓글을 인서트하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
로그인 사용자가 아니면 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
로그인 체크를 통과하면 
먼저 요청의 캐릭터 셋을 UTF-8로 설정한다.
boardCd, articleNo, curPage, searchWord, memo 파라미터를 받아서 댓글을 인서트한다.
댓글을 인서트한 후 상세보기를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<h3>댓글 수정 처리 페이지</h3>

<p>
이 페이지는 상세 보기에서 댓글의 작성자가 자신의 댓글 내용을 수정한 후 확인을 클릭하면 데이터베이스에 있는 댓글의 내용을 수정하는 페이지이다.<br />
</p>

<h6 class="src">/bbs/updateComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
댓글 업데이트를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
작성자 체크를 통과하면
요청의 캐릭터 셋을 UTF-8로 설정한다.
commentNo, boardCd, articleNo, curPage, searchWord, memo 파라미터를 받아서
댓글을 업데이트한다.
댓글을 업데이트 처리한 후 상세보기를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<h3>댓글 삭제 처리 페이지</h3>

<p>
이 페이지는 상세 보기에서 댓글 삭제를 클릭하면 데이터베이스에 있는 해당 댓글을 삭제하는 페이지이다.<br />
</p>

<h6 class="src">/bbs/deleteComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
댓글 삭제를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.

-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자가 아닙니다"); return;
요청의 캐릭터 셋을 UTF-8로 설정해야 한다.
요청에서 참조해야 하는 파라미터는
commentNo, boardCd, articleNo, curPage, searchWord 이다.
댓글을 삭제 후 상세보기를 돌아가기 위해선
searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩한다.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<h3>첨부 파일 삭제 처리 페이지</h3>

<p>
이 페이지는 상세 보기에서 첨부 파일 옆의 x 링크를 클릭하면 데이터베이스에 있는 첨부 파일을 삭제하는 페이지이다.<br />
파일시스템의 파일은 삭제하지 않는다.<br />
</p>

<h6 class="src">/bbs/deleteAttachFile_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
첨부 파일 삭제를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.

-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자가 아닙니다"); return;
요청의 캐릭터 셋을 UTF-8로 설정해야 한다.
요청에서 참조해야 하는 파라미터는
attachFileNo,articleNo,boardCd,curPage,searchWord 이다.
첨부 파일를 삭제 후 상세보기를 돌아가기 위해선
searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩한다.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<h3>게시글 삭제 처리 페이지</h3>

<p>
이 페이지는 상세보기 페이지에서 게시글을 삭제하는 삭제 버튼을 클릭하면 실제 게시글을 데이터베이스에서 삭제 처리한다.<br />
</p>

<h6 class="src">/bbs/del_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
게시글을 삭제하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.
-구현-
작성자가 아니면 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
작성자 체크를 통과하면
요청의 캐릭터 셋을 UTF-8로 설정한다.
articleNo, boardCd, curPage, searchWord 파라미터를 받고
articleNo로 게시글을 삭제한다.
게시글 삭제 후 목록를 돌아가기 위해선
검색어 searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩해야 한다.
*/
response.sendRedirect("list.jsp?boardCd=chat&amp;curPage=1&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<h3>게시글 수정 폼 페이지</h3>

<p>
글 소유자가 자신의 글을 수정하기 위한 페이지를 만든다.<br />
CSS 포지셔닝에서 만든 write.html 파일을 연 상태에서 Save As... 메뉴를 이용하여 modify.jsp라는 이름의 새 파일을 /bbs 폴더에 만든 후 아래와 같이 수정한다.<br /> 
</p>

<h6 class="src">/bbs/modify.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %&gt;
<strong>&lt;%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login User");
    return;
}
request.setCharacterEncoding("UTF-8");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
String boardCd = request.getParameter("boardCd");
String curPage = request.getParameter("curPage");
String searchWord = request.getParameter("searchWord");
//TODO articleNo로 게시글 객체를 얻어서 현재 로그인된 사용자가 글 소유자인지를 검사한다.</strong>
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="게시판 수정하기 폼" /&gt;
&lt;meta name="Description" content="게시판 수정하기 폼" /&gt;
&lt;title&gt;자유 게시판&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function goView() {
    var form = document.getElementById("viewForm");
    form.submit();
}
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;

&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;자유 게시판&lt;/div&gt;
&lt;h3&gt;수정&lt;/h3&gt;
&lt;form id="writeForm" action="<strong>modify_proc.jsp</strong>" method="post" enctype="multipart/form-data"&gt;
<strong>&lt;input type="hidden" name="articleNo" value="5" /&gt;
&lt;input type="hidden" name="boardCd" value="chat" /&gt;
&lt;input type="hidden" name="curPage" value="1" /&gt;
&lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;</strong>
&lt;table id="write-form" class="bbs-table"&gt;
&lt;tr&gt;
    &lt;td&gt;제목&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" value="무궁화꽃" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2"&gt;
        &lt;textarea name="content" rows="17" cols="50"&gt;What makes us happy?&lt;/textarea&gt;
    &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;첨부 파일&lt;/td&gt;
    &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
    &lt;input type="submit" value="전송" /&gt;
    &lt;input type="button" value="상세보기" onclick="goView()" /&gt;
&lt;/div&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;%@ include file="bbs-sub.jsp" %&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;div id="form-group" style="display: none"&gt;
    &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;p&gt;
        &lt;input type="hidden" name="articleNo" value="5" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="무궁화꽃" /&gt;
    &lt;/p&gt;
    &lt;/form&gt;
&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>게시글 수정 처리 페이지</h3>

<p>
게시글 수정 폼에서 전달받은 파라미터를 가지고 실제로 게시글 수정을 처리하는 페이지이다.<br />
</p>

<h6 class="src">/bbs/modify_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
게시글을 수정하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
articleNo, boardCd, curPage, searchWord, title, content, attachFile 파라미터를 받고
게시글을 수정한다.
form의 enctype 속성이 "multipart/form-data"인 경우 request.getParameter()로 파라미터의 값을 얻을 수 없다.
쉽게 프로그래밍하기 위해 아파치 commons-fileupload 또는 cos와 같은 외부 라이브러리를 이용한다.
게시글을 수정한 후 상세보기를 돌아가기 위해 searchWord를 URLEncoder의 encode 메소드를 이용해 UTF-8로 인코딩한다.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;curPage=1&amp;boardCd=chat&amp;searchWord=무궁화꽃");
%&gt;
</pre>

<p>
게시판 관련 프로토타입 작업을 완료했다.<br />
충분히 테스트해야 한다.<br />
테스트 후 회원 관련 프로토타입을 작업한다.<br />
</p>

<h2>회원</h2>

<h3>회원 가입 폼 페이지</h3>

<p>
회원 가입 폼 페이지를 만든다.<br />
CSS 포지셔닝에서 만든 singUp.html 파일을 연 상태에서 Save As... 메뉴를 이용하여 signUp.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/signUp.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="회원 가입" /&gt;
&lt;meta name="Description" content="회원 가입" /&gt;
&lt;title&gt;회원 가입&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
<strong>&lt;script type="text/javascript"&gt;
function check() {
    //var form = document.getElementById("signUpForm");
    //TODO 유효성 검사
    return true;
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;

&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;회원 가입&lt;/h2&gt;
&lt;form id="signUpForm" action="signUp_proc.jsp" method="post" <strong>onsubmit="return check()"</strong>&gt;
&lt;table&gt;
&lt;tr&gt;
    &lt;td style="width: 200px;"&gt;이름(Full Name)&lt;/td&gt;
    &lt;td style="width: 390px"&gt;&lt;input type="text" name="name" style="width: 99%;" <strong>value="홍길동"</strong> /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;비밀번호(Password)&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="passwd" style="width: 99%;" <strong>value="1111"</strong> /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
    Email이 아이디로 쓰이므로 비밀번호는 Email 계정 비밀번호와 같게 하지 마세요.
    &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;비밀번호 확인(Confirm)&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="confirm" style="width: 99%;" <strong>value="1111"</strong> /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;Email&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="email" style="width: 99%;" <strong>value="captain@heist.com"</strong> /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;이동전화(Mobile)&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="mobile" style="width: 99%;" <strong>value="010-1234-5678"</strong> /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
    &lt;input type="submit" value="전송" /&gt;
&lt;/div&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;%@ include file="user-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>회원 가입 처리 페이지</h3>

<p>
실제로 회원 가입을 처리하는 페이지이다.<br />
회원을 데이터베이스에 등록 후 환영 페이지(welcome.jsp)로 이동하게 구현했다.<br />
</p>

<h6 class="src">/users/signUp_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
회원 가입을 처리하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
자동으로 로그인하지 않는다.
회원 가입이 완료되면 환영페이지로 이동한다.
*/
response.sendRedirect("welcome.jsp");
%&gt;
</pre>

<h3>회원 가입 환영 페이지</h3>

<p>
이 페이지는 사용자에게 회원 가입이 성공했음을 알려준다.<br />
실제 회원 가입이 되지 않았는데 이 페이지를 보게 해서는 안 된다.<br />
signUp.jsp 파일을 연 상태에서 Sava As.. 메뉴를 이용하여 welcome.jsp라는 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>
 
<h6 class="src">/users/welcome.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="회원 가입 환영" /&gt;
&lt;meta name="Description" content="회원 가입 환영" /&gt;
&lt;title&gt;회원 가입이 완료되었습니다.&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
        
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
<strong>
&lt;h2&gt;환영합니다.&lt;/h2&gt;
회원 가입시 입력한 Email이 아이디로 사용됩니다.&lt;br /&gt;
&lt;input type="button" value="로그인" onclick="javascript:location.href='login.jsp'" /&gt;</strong>
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;h1&gt;Welcome&lt;/h1&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>내 정보 수정 폼 페이지</h3>

<p>
로그인한 사용자가 자신의 정보를 수정할 수 있도록 양식을 보여주는 페이지이다.<br />
signUp.jsp 파일을 연 상태에서 Save As... 메뉴를 이용하여 editAccount.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/editAccount.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="내 정보 수정" /&gt;
&lt;meta name="Description" content="내 정보 수정" /&gt;
&lt;title&gt;내 정보 수정&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function check() {
    //var form = document.getElementById("editAccountForm");
    //TODO 유효성 검사
    return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;내 정보 수정&lt;/h2&gt;
&lt;p&gt;
비밀번호외의 자신의 계정 정보를 수정할 수 있습니다.&lt;br /&gt;
비밀번호는 &lt;a href="changePasswd.jsp"&gt;비밀번호 변경&lt;/a&gt;메뉴를 이용하세요.&lt;br /&gt;
&lt;/p&gt;
&lt;form id="editAccountForm" action="editAccount_proc.jsp" method="post" onsubmit="return check()"&gt;
&lt;table&gt;
&lt;tr&gt;
    &lt;td&gt;이름(Full Name)&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="name" value="&lt;%=user.getName() %&gt;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;이동전화(Mobile)&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="mobile" value="&lt;%=user.getMobile() %&gt;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;현재 비밀번호(Password)&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2"&gt;&lt;input type="submit" value="전송" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;%@ include file="user-sub.jsp" %&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>내 정보 수정 처리 페이지</h3>

<p>
내 정보 수정 폼 페이지에서 전달된 정보로 회원정보를 실제로 수정하는 페이지이다.<br />
</p>

<h6 class="src">/users/editAccount_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
회원정보를 수정하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
회원정보를 수정한 후 다시 로그인하고 비밀번호 변경화면으로 이동한다.
비밀번호 변경 화면에서는 비밀번호 외에 회원정보를 모두 볼 수 있기 때문이다.
*/
response.sendRedirect("changePasswd.jsp");
%&gt;
</pre>

<h3>비밀번호 변경 폼 페이지</h3>

<p>
비밀번호를 변경하는 페이지를 만든다.<br />
editAccount.jsp 파일을 연 상태에서 Save As... 메뉴를 이용하여 changePasswd.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/changePasswd.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="비밀번호 변경" /&gt;
&lt;meta name="Description" content="비빌번호 변경" /&gt;
&lt;title&gt;비밀번호 변경&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
<strong>           
function check() {
    var form = document.getElementById("changePasswordForm");
    if (form.newPasswd.value == form.confirm.value) {
        return true;    
    } else {
        alert("[변경 비밀번호]와 [변경 비밀번호 확인] 값이 같지 않습니다.");
        return false;
    }
}
</strong>
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;비밀번호 변경&lt;/h2&gt;
&lt;%=user.getName() %&gt;&lt;br /&gt;
이동전화 &lt;%=user.getMobile() %&gt;&lt;br /&gt;
&lt;form id="changePasswordForm" action="<strong>changePasswd_proc.jsp</strong>" method="post" onsubmit="return check()"&gt;
&lt;table&gt;
&lt;tr&gt;
    &lt;td&gt;현재 비밀번호&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="currentPasswd" /&gt;&lt;/td&gt;   
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;변경 비밀번호&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="newPasswd" /&gt;&lt;/td&gt;   
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;변경 비밀번호 확인&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="confirm" /&gt;&lt;/td&gt; 
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2"&gt;&lt;input type="submit" value="전송" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        &lt;%@ include file="user-sub.jsp" %&gt;
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>비밀번호 변경 처리 페이지</h3>

<p>
비밀번호 변경 폼 페이지에서 전달된 비밀번호로 회원 테이블의 비밀번호를 수정하는 페이지이다.<br />
</p>

<h6 class="src">/users/changePasswd_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
비밀번호를 변경하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인 사용자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
비밀번호 변경 후 비밀번호 변경 확인 페이지로 이동한다.
*/
response.sendRedirect("changePasswd_confirm.jsp");
%&gt;
</pre>

<h3>비밀번호 변경 확인 페이지</h3>

<p>
비밀번호 변경이 완료되었음을 알려주는 역할만을 담당하는 페이지를 만든다.<br />
비밀번호 변경이 실패했는데 이 페이지가 보여서는 안 된다.<br />
welcome.jsp 파일을 연 상태에서 Save As... 메뉴를 이용하여 changePasswd_confirm.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>
    
<h6 class="src">/users/changePasswd_confirm.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="비밀번호 변경 확인" /&gt;
&lt;meta name="Description" content="비밀번호 변경 확인" /&gt;
&lt;title&gt;비밀번호 변경 확인&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;비밀번호가 변경되었습니다.&lt;/h2&gt;
변경된 비밀번호로 다시 로그인하실 수 있습니다.&lt;br /&gt;<strong>
&lt;input type="button" value="로그인" onclick="javascript:location.href='login.jsp'" /&gt;</strong>
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;%@ include file="user-sub.jsp" %&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>회원 탈퇴 폼 페이지</h3>

<p>
회원 탈퇴를 위한 이메일과 비밀번호 폼을 보여주는 페이지를 만든다.<br />
editAccount.jsp 파일을 연 상태에서 Save As... 메뉴를 이용하여 bye.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/bye.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ include file="../inc/loginCheck.jsp" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="탈퇴" /&gt;
&lt;meta name="Description" content="탈퇴" /&gt;
&lt;title&gt;탈퇴&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function check() {
    //var form = document.getElementById("byeForm");
    //유효성 검사
    return true;
}
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        &lt;%@ include file="../inc/header.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;

&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;

&lt;h2&gt;탈퇴&lt;/h2&gt;
&lt;form id="byeForm" action="bye_proc.jsp" method="post" onsubmit="return check()"&gt;
&lt;table&gt;
&lt;tr&gt;
    &lt;td&gt;이메일&lt;/td&gt;
    &lt;td&gt;&lt;input type="text" name="email" /&gt;&lt;/td&gt;   
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;비밀번호&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;  
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td colspan="2"&gt;&lt;input type="submit" value="전송" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;

    &lt;div id="sidebar"&gt;
        &lt;%@ include file="user-sub.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>회원 탈퇴 처리 페이지</h3>

<p>
회원 탈퇴를 처리하는 페이지를 만든다.<br />
</p>

<h6 class="src">/users/bye_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
회원탈퇴를 처리하는 페이지로 모델 2에서는 삭제해야 한다.
-구현-
로그인 사용자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
회원테이블에서 회원정보를 지운다.
세션을 지운다.
탈퇴 확인 페이지로 이동한다.
*/
response.sendRedirect("bye_confirm.jsp");
%&gt;
</pre>

<h3>회원 탈퇴 확인 페이지</h3>

<p>
회원 탈퇴가 완료되었음을 확인시켜주는 페이지를 만든다.<br />
welcome.jsp 파일을 연 상태에서 Save As... 메뉴를 이용하여 bye_confirm.jsp라는 이름의 새 파일을 /users 디렉터리에 만든 후 아래와 같이 수정한다.<br />
</p>

<h6 class="src">/users/bye_confirm.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="탈퇴 확인" /&gt;
&lt;meta name="Description" content="탈퇴 확인" /&gt;
&lt;title&gt;탈퇴 확인&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

    &lt;div id="header"&gt;
        
    &lt;/div&gt;

    &lt;div id="main-menu"&gt;
        &lt;%@ include file="../inc/main-menu.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="container"&gt;
        &lt;div id="content"&gt;
&lt;!-- 본문 시작 --&gt;
&lt;div id="content-categories"&gt;회원&lt;/div&gt;
&lt;h2&gt;회원 탈퇴 확인&lt;/h2&gt;
회원님의 모든 정보가 삭제되었습니다.&lt;br /&gt;
&lt;!--  본문 끝 --&gt;
        &lt;/div&gt;&lt;!-- content 끝 --&gt;
    &lt;/div&gt;&lt;!--  container 끝 --&gt;
    
    &lt;div id="sidebar"&gt;
        <strong>&lt;h1&gt;Goodbye&lt;/h1&gt;</strong>
    &lt;/div&gt;
    
    &lt;div id="extra"&gt;
        &lt;%@ include file="../inc/extra.jsp" %&gt;
    &lt;/div&gt;

    &lt;div id="footer"&gt;
        &lt;%@ include file="../inc/footer.jsp" %&gt;
    &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
게시판 화면에 해당하는 페이지는 list.jsp, view.jsp, write.jsp, modify.jsp이다.<br />
이 중에 modify.jsp를 제외하고 모두 loginCheck.jsp 파일을 인클루드하는데, 
modify.jsp만 빠진 이유는 로그인뿐 아니라 글 소유자인지 검사하는 로직이 필요하기 때문이다.<br />
(이 로직은 구현 단계로 넘긴다)<br />
<br />
회원 페이지 중 editAccount.jsp, changePasswd.jsp, bye.jsp는 loginCheck.jsp 파일을 인클루드한다.<br />
<br />
화면을 보여주지 않고 처리만을 담당하는 페이지는 파일명에 _proc를 붙여서 구별했다.<br />
</p>

<h2>로그인 정책 정리</h2>

<p>
구현에 앞서 로그인 정책을 다시 확인한다.<br />
</p>

<ol>
	<li>게시판과 관련된 모든 페이지는 로그인이 필요하다.</li>
	<li>회원 모듈에서 내 정보 수정, 비밀번호 변경, 탈퇴는 로그인이 필요하다.</li>
	<li>로그인이 성공하면 /bbs/list.jsp?boardCd=chat&amp;curPage=1로 이동한다.</li>
	<li>로그인하지 않고 로그인이 필요한 페이지를 방문하면 로그인 페이지로 이동하고, 로그인이 성공하면 원래 방문하려 했던 페이지로 이동한다.</li>
	<li>로그아웃하면 홈페이지로 이동한다.</li>
</ol>

<p>
이로써 프로토타입을 완성했다.
</p>
<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
	<li><a href="http://coding.smashingmagazine.com/2009/07/27/the-definitive-guide-to-using-negative-margins/">http://coding.smashingmagazine.com/2009/07/27/the-definitive-guide-to-using-negative-margins/</a></li>
	<li><a href="http://www.w3.org/QA/2002/04/valid-dtd-list.html">http://www.w3.org/QA/2002/04/valid-dtd-list.html</a></li>
	<li><a href="http://www.css3.info/preview/rounded-border/">http://www.css3.info/preview/rounded-border/</a></li>
	<li><a href="http://border-radius.com/">http://border-radius.com/</a></li>
	<li><a href="http://www.the-art-of-web.com/css/border-radius/">http://www.the-art-of-web.com/css/border-radius/</a></li>
	<li><a href="http://phrogz.net/css/vertical-align/index.html">http://phrogz.net/css/vertical-align/index.html</a></li>
	<li><a href="http://www.homejjang.com/09/border_collapse.php">http://www.homejjang.com/09/border_collapse.php</a></li>
</ul>


<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/jsp/database-design"/>">데이터베이스 설계</a></li>
		<li>이전 : <a href="<c:url value="/jsp/dynamic-web-project"/>">다이나믹 웹 프로젝트</a></li>
	</ul>
</div>
    
</article>