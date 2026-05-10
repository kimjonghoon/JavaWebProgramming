<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>웹 애플리케이션이란?</h1>

<p>
톰캣과 같은 서버를 서블릿 컨테이너라고 부른다.<br />
서블릿 컨테이너가 담아서 관리하는 것이 바로 <strong>웹 애플리케이션</strong>이다.<br />
서블릿 컨테이너는 웹 애플리케이션이 선의 서블릿/JSP 스펙에 따라서 동작하는 것을 보장해야 한다.<br />
</p>

<h2>웹 애플리케이션의 구성 요소</h2>

<p>
자바 진영에서 말하는 웹 애플리케이션은 다음과 같은 파일들로 구성된다.<br />
</p>

<ul>
	<li>HTML, 이미지, CSS, 자바스크립트</li>
	<li>JSP</li>
	<li>서블릿</li>
	<li>자바 클래스, 자바 아카이브 파일(jar)</li>
	<li>web.xml</li>
</ul>

<p>
위의 구성 요소 중 어떤 것은 위치해야 할 디렉토리가 정해져 있다.<br />
서블릿과 자바 클래스는 WEB-INF/classes,<br />
자바 아카이브 파일은 WEB-INF/lib,<br />
web.xml 파일은 WEB-INF 에 두어야 한다.<br />
</p>

<h2>웹 애플리케이션 디렉토리</h2>

<p>
톰캣에서 웹 애플리케이션의 디폴트 위치는 CATALINA_HOME/webapps 이다.<br />
새로운 웹 애플케이션을 추가하고자 한다면 CATALINA_HOME/webapps 바로 아래 서브 디렉토리<sup><a href="#comments">1</a></sup>를 만들고,<br /> 
서브 디렉토리안에 다음과 같은 폴더를 만든다.<br />
</p>

<h3>WEB-INF</h3>

<p>
웹 애플리케이션 배치 정의자, web.xml 이 위치한다.<br />
WEB-INF 디렉토리 안에 있는 파일은 웹브라우저를 통해 직접 접근할 수 없다.<br />
</p>

<h3>WEB-INF/classes</h3>

<p>
서블릿을 포함한 자바 클래스 파일(바이트 코드)이 이곳에 위치한다.<br />
</p>

<h3>WEB-INF/lib</h3>

<p>
자바 아카이브 파일(jar)이 이곳에 위치한다.<br /><br />
똑같은 바이트 코드가 WEB-INF/classes 과 WEB-INF/lib 안의 자바 아카이브 파일 안에 동시에 있을 수 있다는 것에 유의해야 한다.<br />
이런 경우, 톰캣 클래스 로더는 먼저 검색하는 WEB-INF/classes 를 뒤져서 클래스를 찾아 메모리에 로딩한다.<br /> 
해당하는 클래스를 찾았으므로 WEB-INF/lib 에 있는 클래스는 당연히 무시된다.<br />
</p>

<dl class="note">
<dt>톰캣 클래스로더</dt>
<dd>
톰캣의 클래스로더는 환경변수 CLASSPATH 를 참조하지 않는다.<br />
톰캣의 클래스로더는 아래 순서대로 클래스를 찾는다.<br />
<ol>
	<li>자바 코어 라이브러리</li>
	<li>웹 애플리케이션 WEB-INF/classes</li>
	<li>웹 애플리케이션 WEB-INF/lib</li>
	<li>CATALINA_HOME/lib</li>
</ol>
</dd>
</dl>


<h2>배치 정의자 (Deployment Descriptor): web.xml</h2>

<p>
웹 애플리케이션의 심장은 배치 정의자 (Deployment Descriptor)라고 불리는 web.xml 파일이다.<br />
배치 정의자 web.xml 은 WEB-INF 디렉토리에 위치한다.<br />
배치 정의자는 웹 애플리케이션의 모든 설정 정보를 담는다.<br />	
</p>

<h3>배치 정의자로 할 수 있는 주요 설정 항목</h3>

<ul>
	<li>서블릿컨텍스트 초기화 파라미터</li>
	<li>필터</li>
	<li>리스너</li>
	<li>servlet 정의</li>
	<li>servlet 초기화 파라미터</li>
	<li>servlet 매핑</li>
	<li>session 설정</li>
	<li>welcome 파일 리스트</li>
	<li>에러 페이지</li>
</ul>

<h3>web.xml 파일의 예와 설명</h3>

<p>
web.xml 파일을 새로 만들때는 CATALINA_HOME/webapps 에서 디폴트로 설치되어 있는 
다른 웹 애플케이션의 web.xml 파일을 복사하여 자신의 웹 애플리케이션의 WEB-INF에 붙여넣는다.<br />
그런 다음 web.xml 파일을 열고 web-app 루트 엘리먼트안의 모든 내용을 지운후 사용한다.<br />
아래 강조된 부분처럼 web-app 엘리먼트의 서브 엘리먼트가 웹 애플리케이션의 설정이 된다.<br />
</p>

<h6 class="src">web.xml<sup><a href="#comments">2</a></sup></h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;
	<strong>
	&lt;servlet&gt;
		&lt;servlet-name&gt;TestServlet&lt;/servlet-name&gt;
		&lt;servlet-class&gt;net.java_school.TestServlet&lt;/servlet-class&gt;
		&lt;init-param&gt;
			&lt;param-name&gt;name&lt;/param-name&gt;
			&lt;param-value&gt;value&lt;/param-value&gt;
		&lt;/init-param&gt;
		&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
	&lt;/servlet&gt;
	
	&lt;servlet-mapping&gt;
		&lt;servlet-name&gt;TestServlet&lt;/servlet-name&gt;
		&lt;url-pattern&gt;/Test&lt;/url-pattern&gt;
	&lt;/servlet-mapping&gt;
	  
	&lt;session-config&gt;
		&lt;session-timeout&gt;30&lt;/session-timeout&gt;
	&lt;/session-config&gt;
	</strong>
&lt;/web-app&gt;
</pre>

<p>
servlet 엘리먼트는 서블릿 정의와 해당 서블릿의 초기 파라미터를 설정한다.<br />
load-on-startup 엘리먼트의 값이 0이거나 양수이면 톰캣은 웹 애플리케이션이 시작하는 시점에 
해당 서블릿 객체를 생성하고 init()메소드를 호출하여 바로 서비스를 할 수 있는 상태로 만든다.<br />
servlet-mapping 엘리먼트는 서블릿과 URL 매핑을 하기 위해 사용한다.<br />
위의 설정에 의해서 http://localhost:포트번호/컨텍스트패스<strong>/Test</strong>를 방문하면 net.java_school.TestServlet 서블릿이 응답한다.<br />
session-timeout 엘리먼트는 HttpSession 객체의 라이프타임을 컨트롤한다.<br /> 
session-timeout 이 30으로 설정되었다면 서블릿 컨테이너는 HttpSession 객체가 30분 동안 아무런 움직임이 없다면 소멸시킨다.<br /> 
</p>

<h2>팩킹 (Packing)</h2>

<p>
웹 애플리케이션은 jar 툴(jar.exe)로 하나의 파일로 만들 수 있다.<br />
이 파일은  다양한 서블릿 컨테이너에서 작동할 수 있다.<br />
개발이 완료되었다면 웹 애플리케이션을 번들화하여 다른 서블릿 컨테이너에 배포를 할 수 있다.<br />
배포를 하기 위해서는 웹 애플리케이션의 루트 디렉토리에서 다음과 같은 명령을 내려 확장자가 war인 파일을 만들어야 한다.
확장자가 jar 이 아닌 war 인 것에 주의한다.<br />
새로 만든 웹 애플리케이션의 도큐먼트베이스가<br />
C:\apache-tomcat-9.0.87\webapps\test라면, 아래와 같이 이동하여 jar -cvf test.war . 명령을 수행한다.
</p>

<pre lang="en">
C:\apache-tomcat-9.0.87\webapps\test&gt;<strong>jar -cvf test.war .</strong>
</pre>

<p>
생성된 test.war 파일은 다른 톰캣서버나 다른 벤더의 서블릿 컨테이너의 디폴트 웹 애플리케이션 폴더에 복사만 하면, 
해당 서블릿 컨테이너가 자동으로 test 애플리케이션을 배치하고 로드한다.<br />
</p>

<h2>웹 애플리케이션 작성 실습</h2>

<p>
CATALINA_HOME/webapps에 새로운 웹 애플리케이션을 추가하는 방법은 이미 알고 있다.<br />
이번 과정에서는 톰캣 디폴트 웹 애플리케이션 디렉토리에 있지 않는 웹 애플리케이션을 톰캣이 서비스하도록 하는 방법을 알아볼 것이다.<br />
</p>

<p>
C:/www/myapp 란 디렉토리를 만든다.<br />
myapp 아래 아래와 같이 서브 디렉토리를 만든다.
</p>

<ul lang="en">
	<li>WEB-INF</li>
	<li>WEB-INF/classes</li>
	<li>WEB-INF/lib</li>
</ul>

<p>
C:/www/myapp 는 톰캣의 웹 애플리케이션이 있어야 하는 디폴트 디렉토리가 아니므로 톰캣은 myapp 애플리케이션의 존재를 알지 못한다.<br />
따라서 톰캣이 myapp 웹 애플리케이션을 서비스하도록 우리가 뭔가 해야 할 일이 남아 있다.<br />
이 작업은 XML 파일을 하나 만든는 것이다.<br />
작성할 XML 파일은 톰캣에서 웹 애플리케이션을 관리하기 위한 용도의 파일이다.<br />
이 XML파일을 루트 엘리먼트가 Context 이기에 컨텍스트 파일이라 한다.<br />
(톰캣에서 Context는 웹 애플리케이션을 의미한다.)<br />
컨텍스트 파일을 작성할 때 가장 중요한 정보는 웹 애플리케이션의 소스가 위치하는 
최상위 디렉토리(DocumentBase 또는 Context Root 라 한다.)와 URL 로 접근하는 경로 정보(Context Path)이다.<br />
이 정보는 Context 엘리먼트의 docBase 와 path 속성으로 설정한다.<br />
Context 파일을 작성한 다음 {톰캣 홈}/conf/Catalina/localhost 에 위치시키면 톰캣이 해당 웹 애플리케이션을 자동으로 인식하여 로드한다.<br />
만약 컨텍스트 파일이 잘못 작성되었다면 톰캣은 해당 자바 웹 애플리케이션을 로드하지 못하며, 
실패 원인을 {톰캣 홈}/logs 에 있는 로그파일에 쓸 것 이다.<br />
에러 메시지는 따로 공부하는 것이 아니다.<br />
사람마다 다양한 에러 메시지를 만날 수 있다.<br />
일단 보고 추측해보고 수정하고, 그래도 안돼면 구글링도 해야 한다<br />
JSP 에러 역시 마찬가지다.<br />
되는 코드를 그대로 복사해서 테스트하는 것은 프로그래밍을 학습하는 것이 아니다.<br />
프로그래밍 학습의 90%는 다양한 에러를 접하고 에러를 수정하는 과정이다.<br />
</p>

<h3>톰캣 Context 파일 작성</h3>

<p>
myapp 자바 웹 애플리케이션을 위한 Context 파일을 만든다.<br />
</p>

<h6 class="src">myapp.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="C:/www/myapp"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Context 파일명이 위와 같이 myapp.xml 이고  path 속성은 생략하면 context path 는 /myapp 로 결정된다.<br />
myapp.xml 파일을 만든 후 {톰캣 홈}/conf/Catalina/localhost 에 복사한다.<br />
테스트를 위해서C:/www/myapp 디렉토리에 test.html 파일을 만든다.<br />
톰캣을 재가동 한 후 http://localhost:8080/myapp/test.html를 방문하여 실행이 되는지 확인한다.<br />
</p>

<table class="table-in-article">
<caption class="table-in-article-caption">Context 주요 속성</caption>
<tr>
	<th class="table-in-article-th" style="width: 100px;">속성</th>
	<th class="table-in-article-th" style="width: 60px;">기본값</th>
	<th class="table-in-article-th">설명</th>
</tr>
<tr>
	<td class="table-in-article-td"><strong>docBase</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">웹 애플리케이션의 소스가 위치할 루트 디렉토리(이를 Document Base 또는 Context Root 라 한다.)를 지정한다.</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>path</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">웹 애플리케이션에 접속할 URL 를 지정한다.<br />
	이를 다른 말로 context path 라 한다.<br />
	만일 path 속성값이 확장자를 뺀 Context 파일명과 같다면 path 를 생략할 수 있다. 
	</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>reloadable</strong></td>
	<td class="table-in-article-td">false</td>
	<td class="table-in-article-td">
	WEB-INF/classes 와  WEB-INF/lib 안에 있는 클래스가 변경되면 자동으로 웹 애플리케이션을 다시 로딩한다.<br />
	새로운 웹 애플리케이션을 개발하는 단계에서는 true 로 설정해야 작업이 편리하지만 실제 서비스에서는 성능문제로 false 로 설정한다.
	</td>
</tr>
</table>

<h3>ROOT 애플리케이션 변경</h3>

<p>
http://localhost:포트번호/로 접근할 수 있는 웹 애플리케이션이 ROOT 애플리케이션이다.<br />
톰캣을 멈추고 myapp.xml 파일를 ROOT.xml 로 파일명을 바꾼다.<br />
톰캣을 재실행하고 http://localhost:8080/test.html를 방문하여 테스트한다.<br />
만일 ROOT.xml 파일에 문제가 있다면 고양이가 보이는 ROOT 웹 애플리케이션이 작동할 것이다.<br />
</p>

<span id="comments">주석</span>
<ol>
	<li>이 서브 디렉토리는 새로 만들 웹 애플리케이션의 루트 디렉토리이다.<br />
	톰캣의 경우 이 디렉토리를 DocumentBase 라고 한다.<br />
	DocumentBase 에는 주로 웹 애플리케이션의 구성 요소 중 정적인 요소가 위치하게 된다.<br />
	DocumentBase 아래 css 서브디렉토리에는 스타일 시트 파일를, js 에는 자바스크립트 파일을, images 에는 이미지 파일을 두는 식이다.<br />
	동적인 요소중 JSP는 DocumentBase 에 두어도 된다.<br />
	하지만 정책상 WEB-INF 아래에 WEB-INF/jsp 와 같은 디렉토리를 만들어서 그곳에 위치시키는 경우가 많다.<br />
	</li>
	<li>이 web.xml 파일의 설정대로 지금 테스트할 수 없다.<br />
	테스트하려면 TestServlet를 만들어야 한다.<br />
	서블릿 관련 예제는 <a href="servlets">서블릿</a>에서 본격적으로 다룰 것이다.</li>
</ol>

<h2 id="creating-a-new-web-application">웹 애플리케이션 작성 실습</h2>

<p>
CATALINA_HOME/webapps에 새로운 웹 애플리케이션을 추가하는 방법은 이미 알고 있다.<br />
이번 과정에서는 톰캣 디폴트 웹 애플리케이션 디렉토리에 있지 않는 웹 애플리케이션을 톰캣이 서비스하도록 하는 방법을 알아볼 것이다.<br />
</p>

<p>
C:/www/myapp 란 디렉토리를 만든다.<br />
myapp 아래 아래와 같이 서브 디렉토리를 만든다.
</p>

<ul lang="en">
	<li>WEB-INF</li>
	<li>WEB-INF/classes</li>
	<li>WEB-INF/lib</li>
</ul>

<p>
C:/www/myapp 는 톰캣의 웹 애플리케이션이 있어야 하는 디폴트 디렉토리가 아니므로 톰캣은 myapp 애플리케이션의 존재를 알지 못한다.<br />
따라서 톰캣이 myapp 웹 애플리케이션을 서비스하도록 우리가 뭔가 해야 할 일이 남아 있다.<br />
이 작업은 XML 파일을 하나 만든는 것이다.<br />
작성할 XML 파일은 톰캣에서 웹 애플리케이션을 관리하기 위한 용도의 파일이다.<br />
이 XML파일을 루트 엘리먼트가 Context 이기에 컨텍스트 파일이라 한다.<br />
(톰캣에서 Context는 웹 애플리케이션을 의미한다.)<br />
컨텍스트 파일을 작성할 때 가장 중요한 정보는 웹 애플리케이션의 소스가 위치하는 
최상위 디렉토리(DocumentBase 또는 Context Root 라 한다.)와 URL 로 접근하는 경로 정보(Context Path)이다.<br />
이 정보는 Context 엘리먼트의 docBase 와 path 속성으로 설정한다.<br />
Context 파일을 작성한 다음 {톰캣 홈}/conf/Catalina/localhost 에 위치시키면 톰캣이 해당 웹 애플리케이션을 자동으로 인식하여 로드한다.<br />
만약 컨텍스트 파일이 잘못 작성되었다면 톰캣은 해당 자바 웹 애플리케이션을 로드하지 못하며, 
실패 원인을 {톰캣 홈}/logs 에 있는 로그파일에 쓸 것 이다.<br />
에러 메시지는 따로 공부하는 것이 아니다.<br />
사람마다 다양한 에러 메시지를 만날 수 있다.<br />
일단 보고 추측해보고 수정하고, 그래도 안돼면 구글링도 해야 한다<br />
JSP 에러 역시 마찬가지다.<br />
되는 코드를 그대로 복사해서 테스트하는 것은 프로그래밍을 학습하는 것이 아니다.<br />
프로그래밍 학습의 90%는 다양한 에러를 접하고 에러를 수정하는 과정이다.<br />
</p>

<h3>톰캣 Context 파일 작성</h3>

<p>
myapp 자바 웹 애플리케이션을 위한 Context 파일을 만든다.<br />
</p>

<h6 class="src">myapp.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="C:/www/myapp"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Context 파일명이 위와 같이 myapp.xml 이고  path 속성은 생략하면 context path 는 /myapp 로 결정된다.<br />
myapp.xml 파일을 만든 후 {톰캣 홈}/conf/Catalina/localhost 에 복사한다.<br />
테스트를 위해서C:/www/myapp 디렉토리에 test.html 파일을 만든다.<br />
톰캣을 재가동 한 후 http://localhost:8080/myapp/test.html를 방문하여 실행이 되는지 확인한다.<br />
</p>

<table class="table-in-article">
<caption class="table-in-article-caption">Context 주요 속성</caption>
<tr>
	<th class="table-in-article-th" style="width: 100px;">속성</th>
	<th class="table-in-article-th" style="width: 60px;">기본값</th>
	<th class="table-in-article-th">설명</th>
</tr>
<tr>
	<td class="table-in-article-td"><strong>docBase</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">웹 애플리케이션의 소스가 위치할 루트 디렉토리(이를 Document Base 또는 Context Root 라 한다.)를 지정한다.</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>path</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">웹 애플리케이션에 접속할 URL 를 지정한다.<br />
	이를 다른 말로 context path 라 한다.<br />
	만일 path 속성값이 확장자를 뺀 Context 파일명과 같다면 path 를 생략할 수 있다. 
	</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>reloadable</strong></td>
	<td class="table-in-article-td">false</td>
	<td class="table-in-article-td">
	WEB-INF/classes 와  WEB-INF/lib 안에 있는 클래스가 변경되면 자동으로 웹 애플리케이션을 다시 로딩한다.<br />
	새로운 웹 애플리케이션을 개발하는 단계에서는 true 로 설정해야 작업이 편리하지만 실제 서비스에서는 성능문제로 false 로 설정한다.
	</td>
</tr>
</table>

<h3>ROOT 애플리케이션 변경</h3>

<p>
http://localhost:포트번호/로 접근할 수 있는 웹 애플리케이션이 ROOT 애플리케이션이다.<br />
톰캣을 멈추고 myapp.xml 파일를 ROOT.xml 로 파일명을 바꾼다.<br />
톰캣을 재실행하고 http://localhost:8080/test.html를 방문하여 테스트한다.<br />
만일 ROOT.xml 파일에 문제가 있다면 고양이가 보이는 ROOT 웹 애플리케이션이 작동할 것이다.<br />
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://stackoverflow.com/questions/809775/what-does-the-servlet-load-on-startup-value-of-0-zero-signify">http://stackoverflow.com/questions/809775/what-does-the-servlet-load-on-startup-value-of-0-zero-signify</a></li>
	<li><a href="http://tomcat.apache.org/tomcat-7.0-doc/config/context.html">http://tomcat.apache.org/tomcat-7.0-doc/config/context.html</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/jsp/servlets"/>">서블릿</a></li>
		<li>이전 : <a href="<c:url value="/jsp/namecard-webapp"/>">명함관리 웹 애플리케이션</a></li>
	</ul>
</div>

</article>