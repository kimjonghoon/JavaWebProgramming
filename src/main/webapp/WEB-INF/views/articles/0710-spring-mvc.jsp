<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
<h1>스프링 MVC</h1>

<p style="color: 777;">
아래 글은 워크스페이스를 C:\www라고 가정합니다.
</p>

<h3>아키타입 생성</h3>

<p>
원형이란 사전적 의미를 가진 아키타입은, 자바에선 프로젝트 프로토타입을 뜻한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\www&gt;<span class="prompt-selection">mvn archetype:generate -Dfilter=maven-archetype-webapp</span>

Choose archetype:
1: remote -&gt; com.haoxuer.maven.archetype:maven-archetype-webapp
2: remote -&gt; com.lodsve:lodsve-maven-archetype-webapp
3: remote -&gt; org.apache.maven.archetypes:maven-archetype-webapp
4: remote -&gt; org.bytesizebook.com.guide.boot:maven-archetype-webapp
Choose a number or apply filter: : <span class="prompt-selection">3</span>
Choose org.apache.maven.archetypes:maven-archetype-webapp version: 
1: 1.0-alpha-1
2: 1.0-alpha-2
3: 1.0-alpha-3
4: 1.0-alpha-4
5: 1.0
6: 1.3
7: 1.4
Choose a number: 7: ↵ 
Define value for property 'groupId': <span class="prompt-selection">net.java_school</span>
Define value for property 'artifactId': <span class="prompt-selection">spring-bbs</span>
Define value for property 'version' 1.0-SNAPSHOT: : ↵ 
Define value for property 'package' net.java_school: : ↵
Confirm properties configuration:
groupId: net.java_school
artifactId: spring-bbs
version: 1.0-SNAPSHOT
package: net.java_school
 Y: : ↵
</pre>

<p>
빌드가 완료되면 C:\www에 spring-bbs라는 폴더가 생긴다.
C:\www\spring-bbs가 프로젝트 루트 디렉터리이다.
</p>

<h3>Spring MVC 테스트</h3> 

<p>
pom.xml 수정
</p>
 
<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;

  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;net.java_school&lt;/groupId&gt;
  &lt;artifactId&gt;spring-bbs&lt;/artifactId&gt;
  &lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
  &lt;packaging&gt;war&lt;/packaging&gt;

  &lt;name&gt;spring-bbs Maven Webapp&lt;/name&gt;
  &lt;url&gt;<strong>http://localhhost:8080</strong>&lt;/url&gt;

  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;<strong>21</strong>&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;<strong>21</strong>&lt;/maven.compiler.target&gt;
    <strong>&lt;spring.version&gt;6.2.8&lt;/spring.version&gt;</strong>
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;junit&lt;/groupId&gt;
      &lt;artifactId&gt;junit&lt;/artifactId&gt;
      &lt;version&gt;4.11&lt;/version&gt;
      &lt;scope&gt;test&lt;/scope&gt;
    &lt;/dependency&gt;
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-context&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;\${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;\${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;jakarta.servlet&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;jakarta.servlet-api&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;6.1.0&lt;/version&gt;</strong>
      <strong>&lt;scope&gt;provided&lt;/scope&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>       
    <strong>&lt;!-- https://mvnrepository.com/artifact/jakarta.servlet.jsp.jstl/jakarta.servlet.jsp.jstl-api --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;jakarta.servlet.jsp.jstl&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;jakarta.servlet.jsp.jstl-api&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;3.0.2&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/org.glassfish.web/jakarta.servlet.jsp.jstl --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.glassfish.web&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;jakarta.servlet.jsp.jstl&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;3.0.1&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>    
  &lt;/dependencies&gt;

  &lt;build&gt;
    &lt;finalName&gt;spring-bbs&lt;/finalName&gt;
    &lt;pluginManagement&gt;
      &lt;plugins&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.1.0&lt;/version&gt;
          <strong>&lt;configuration&gt;</strong>
            <strong>&lt;filesets&gt;</strong>
               <strong>&lt;fileset&gt;</strong>
                  <strong>&lt;directory&gt;src/main/webapp/WEB-INF/classes&lt;/directory&gt;</strong>
               <strong>&lt;/fileset&gt;</strong>
               <strong>&lt;fileset&gt;</strong>
                  <strong>&lt;directory&gt;src/main/webapp/WEB-INF/lib&lt;/directory&gt;</strong>
               <strong>&lt;/fileset&gt;</strong>
            <strong>&lt;/filesets&gt;</strong>
          <strong>&lt;/configuration&gt;</strong>
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-resources-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.0.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.8.0&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.22.1&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.2.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.5.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.8.2&lt;/version&gt;
        &lt;/plugin&gt;
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>
<p>
web.xml 수정
</p>

<h6 class="src">web.xml</h6> 
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;

  &lt;display-name&gt;Spring BBS&lt;/display-name&gt;
        
  &lt;filter&gt;
    &lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
    &lt;filter-class&gt;org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;encoding&lt;/param-name&gt;
      &lt;param-value&gt;UTF-8&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;forceEncoding&lt;/param-name&gt;
      &lt;param-value&gt;true&lt;/param-value&gt;
    &lt;/init-param&gt;
  &lt;/filter&gt;
        
  &lt;filter-mapping&gt;
    &lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
    &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
  &lt;/filter-mapping&gt;
    
  &lt;servlet&gt;
    &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
    &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;
      &lt;param-value&gt;/WEB-INF/spring/mvc.xml&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
    
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  
  &lt;session-config&gt;
    &lt;session-timeout&gt;-1&lt;/session-timeout&gt;
  &lt;/session-config&gt;

  &lt;error-page&gt;
    &lt;error-code&gt;404&lt;/error-code&gt;
    &lt;location&gt;/WEB-INF/views/404.jsp&lt;/location&gt;
  &lt;/error-page&gt;

  &lt;error-page&gt;
    &lt;error-code&gt;500&lt;/error-code&gt;
    &lt;location&gt;/WEB-INF/views/500.jsp&lt;/location&gt;
  &lt;/error-page&gt; 

&lt;/web-app&gt;
</pre>

<p>
모든 요청에 대해 setCharacterEncoding("UTF-8");를 호출하는 필터가 작동하도록 설정했다.
비영어권 웹 사이트에선 이 필터가 필요하다.
이 필터는 다른 필터보다 먼저 작동하도록 선언한다.
</p>

<p>
web.xml에서 DispatcherServlet의 설정 파일을 /WEB-INF/spring/mvc.xml이라 정했다.
/WEB-INF/spring/ 폴더에 mvc.xml 파일을 아래 내용으로 생성한다.
</p>

<h6 class="src">mvc.xml</h6> 
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;

<strong>&lt;mvc:annotation-driven /&gt;</strong>

&lt;bean id="<strong>internalResourceViewResolver</strong>"
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
  &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
  &lt;property name="prefix" value="<strong>/WEB-INF/views/</strong>" /&gt;
  &lt;property name="suffix" value="<strong>.jsp</strong>" /&gt;
&lt;/bean&gt;

&lt;/beans&gt;
</pre>
<p>
<strong>페이지 디자인</strong>
</p>

<p>
홈페이지로 사용할 페이지를 생성한다.
</p>

<p>
src/main/webapp/WEB-INF/views/index.jsp
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Spring MVC Test&lt;/title&gt;
&lt;meta name="viewport" content="width=device-width, initial-scale=1" /&gt;
&lt;meta name="Keywords" content="Spring MVC Test" /&gt;
&lt;meta name="Description" content="This is web app for Spring MVC Test" /&gt;
&lt;style&gt;
@CHARSET "UTF-8";
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

html, body {
  margin: 0;
  padding: 0;
  background-color: #FFF;
  font-family: "Noto Sans KR", "Liberation Sans", Helvetica, "돋움", dotum, sans-serif;
}
#wordcard {
  margin: 7px auto;
  padding: 1em;
  border: 3px solid grey;
  width: 600px;
  text-align: center;
}
&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wordcard"&gt;
&lt;h1&gt;Vocabulary&lt;/h1&gt;
&lt;p&gt;
어휘
&lt;/p&gt;
&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
영어 단어와 그 의미를 보여주는 화면이다.
</p>

<p>
화면이 나오면, 데이터베이스 설계를 시작으로, 자바 빈즈, DAO, 서비스, 컨트롤러 순으로 구현하는 게 일반적이지만, 대부분을 생략하고 컨트롤러와 뷰만으로 동작하는 예제를 만들어 보자.
</p>

<p>
<strong>컨트롤러</strong><br />
src/main/java/net/java_school/english/HomeController.java
</p>

<p>
src/main/java 폴더는 메이븐 기본 폴더다. 없으면 생성한다.
</p>

<pre class="prettyprint">package net.java_school.english;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

<strong>@Controller</strong>
public class HomeController {

  <strong>@GetMapping("/")</strong>
  public String index() {
    return "index";
  }
}
</pre>

<p>
@Controller, @GetMapping은 스프링 어노테이션로, 스프링에 정보를 전달하기 위해 사용된다.<br />
클래스 선언부 위에 위치한 @Controller는 해당 자바 빈이 컨트롤러임을 스프링에게 알린다.
컨트롤러의 메소드 위에 위치하는 @GetMapping("/")은 이 메소드가 GET 방식의 "/" 요청--ROOT 애플리케이션이라면 http://localhost:8080/--을 처리함을 나타낸다.<br />
</p>

<p>
컨트롤러를 통해 홈페이지("/")가 서비스되도록 하려면 홈페이지 경로로 매핑된 다른 서블릿이 없어야 한다.<br />
하지만 아키타입은 src/main/webapp 디렉터리에 index.jsp 파일을 가지고 있다. 그냥 두면 홈페이지 요청을 이 파일이 응답하게 된다.<br />
src/main/webapp/index.jsp 파일을 삭제한다.
</p>

<p>
<strong>루트 애플리케이션의 홈페이지 요청 시나리오</strong><br />
사용자가 홈페이지("/")를 요청한다.<br />
서블릿 컨테이너는 요청을 DispatcherServlet에 전달한다.<br />
DispatcherServlet은 컨트롤러의 홈페이지 경로로 매핑된 메소드에 요청을 전달한다.<br />
메소드는 홈페이지에 보일 데이터를 요청에 세팅하고--이 부분은 첫 번째 테스트에선 생략하고, 두 번째 테스트에서 다룬다--, "index" 문자열을 반환한다.<br />
DispatcherServlet은 뷰 리졸버가 해석한 /WEB-INF/views/index.jsp 페이지의 서비스 메소드를 실행해 사용자에게 응답한다.
</p>

<p>
<strong>컨트롤러 등록</strong><br />
스프링 설정 파일에 다음을 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="homeController" class="net.java_school.english.HomeController" /&gt;
</pre>

<p>
<strong>ROOT 애플리케이션 변경</strong><br />
톰캣을 중지하고 ROOT.xml 파일을 아래처럼 작성한 후 {Tomcat}\Catalina\localhost 디렉터리 복사한다. --{Tomcat}은 톰캣이 설치된 디렉터리를 의미한다-- 
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/spring-bbs<strong>/src/main/webapp</strong>"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
WEB-INF 바로 위 디렉터리가 도큐먼트베이스다.<br />
docBase 값으로 메이븐 프로젝트 루트 디렉터리(C:/www/spring-bbs)를 추가하지 않도록 주의한다.
</p>

<p>
<strong>빌드와 배치</strong><br />
메이븐 루트 디렉터리에서 다음을 실행한다.<br />
mvn compile war:inplace<br />
war:inplace 옵션은 src/main/WEB-INF/classes에 바이트코드를, src/main/WEB-INF/lib에 의존 라이브러리를 생성시킨다.
</p>

<p>
<strong>테스트</strong><br />
톰캣을 시작한다.<br />
http://localhost:8080을 요청한다.<br />
<img alt="Spring MVC 테스트 화면" src="<c:url value="/resources/images/spring-mvc-test.png"/>"/>
</p>

<p>
컨트롤러가 어떻게 동작하는지 확인했다.<br />
다음은 컨트롤러가 뷰에 전달할 데이터를 어떻게 세팅하는 지를 실습한다.<br />
예제를 간단하게 만들기 위해 데이터베이스 연동은 하지 않는다.
</p>

<p>
<strong>자바 빈즈</strong><br />
src/main/java/net/java_school/english/WordCard.java
</p>

<h6 class="src">WordCard.java</h6>
<pre class="prettyprint">package net.java_school.english;

public class WordCard {
  private String word;
  private String definitions;

  public WordCard() {}

  public WordCard(String word, String definitions) {
    this.word = word;
    this.definitions = definitions;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public String getDefinitions() {
    return definitions;
  }

  public void setDefinitions(String definitions) {
    this.definitions = definitions;
  }
}
</pre>

<p>
<strong>DAO</strong><br />
src/main/java/net/java_school/english/WordCardDao.java
</p>

<h6 class="src">WordCardDao.java</h6>
<pre class="prettyprint">package net.java_school.english;

public class WordCardDao {

  private final String[][] words = {
    {"illegible","읽기 어려운"}, 
    {"vulnerable","취약한"}, 
    {"abate","감소시키다"}, 
    {"clandestine","은밀한"}, 
    {"sojourn","잠시 머무름, 체류"}, 
    {"defiance","도전, 저항, 반항"}, 
    {"infraction","위반"}
  }; 
	
  public WordCard selectOne() {
    int no = (int)(Math.random() * 7) + 1;
    WordCard wordCard = new WordCard();
    wordCard.setWord(words[no - 1][0]);
    wordCard.setDefinitions(words[no - 1][1]);
    return wordCard;
  }
}
</pre>

<pre class="prettyprint">&lt;bean id="wordCardDao" class="net.java_school.english.WordCardDao" /&gt;
</pre>

<p>
<strong>서비스</strong><br />
src/main/java/net/java_school/english/WordCardService.java
</p>

<h6 class="src">WordCardService.java</h6>
<pre class="prettyprint">package net.java_school.english;

public class WordCardService {
  private WordCardDao wordCardDao;

  public WordCardService(WordCardDao wordCardDao) {
    this.wordCardDao = wordCardDao;
  }

  public WordCard getWordCard() {
    return wordCardDao.selectOne();
  }
}
</pre>

<pre class="prettyprint">&lt;bean id="wordCardService" class="net.java_school.english.WordCardService"&gt;
  &lt;constructor-arg ref="wordCardDao" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>컨트롤러 수정</strong>
</p>

<pre class="prettyprint">package net.java_school.english;

<strong>import org.springframework.ui.Model;</strong>

import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {

  <strong>private WordCardService wordCardService;</strong>

  <strong>public HomeController(WordCardService wordCardService) {</strong>
    <strong>this.wordCardService = wordCardService;</strong>
  <strong>}</strong>

  @GetMapping("/")
  public String index(<strong>Model model</strong>) {
    <strong>WordCard wordCard = wordCardService.getWordCard();</strong>
    <strong>model.addAttribute("wordCard", wordCard);</strong>
    return "index";
  }
}
</pre>

<pre class="prettyprint">&lt;bean id="homeController" class="net.java_school.english.HomeController"&gt;
  <strong>&lt;constructor-arg ref="wordCardService" /&gt;</strong>
&lt;/bean&gt;
</pre>

<p>
<strong>뷰 수정</strong><br />
src/main/webapp/WEB-INF/views/index.jsp
</p>

<p>
body 엘리먼트 내용을 아래처럼 수정한다.
</p>

<pre class="prettyprint">&lt;div id="wordcard"&gt;
&lt;h1&gt;<strong>\${wordCard.word }</strong>&lt;/h1&gt;
&lt;p&gt;
<strong>\${wordCard.definitions }</strong>
&lt;/p&gt;
&lt;/div&gt;
</pre>

<p>
<strong>테스트</strong><br />
mvn compile war:inplace<br />
http://localhost:8080<br />
<img alt="테스트 화면2" src="<c:url value="/resources/images/spring-mvc-test2.png"/>"/>
</p>

<h3>MyBatis-Spring 연동 모듈</h3>

<p>
아직 데이터베이스를 다루지 않았다.<br />
모델 2 게시판은 JDBC를 그대로 사용했다. JDBC를 그대로 사용하는 코드는 반복되는 코드가 많아 생산성이 떨어진다.<br />
퍼시스턴스 프레임워크--내부 소스에서 JDBC 사용--를 사용하면 사용자가 작성해야 할 코드의 양을 줄여준다.
</p>

<p>
MyBatis는 SQL 매핑 퍼시스턴스 프레임워크이다.<br />
MyBatis-Spring는 스프링에서 마이바티스를 편리하게 사용하기 위한 연동 모듈이다.<br />
spring-bbs 프로젝트에 MyBatis-Spring을 사용할 것이다.<br />
MyBatis-Spring를 파악하기 위한 간단한 예제를 준비했다.
</p>

<p>
https://mybatis.org/spring/ko/getting-started.html<br />
아래 내용을 공식 사이트의 시작하기와 순서를 같게 했다.
</p>

<p>
JAVA 계정에 접속해 다음 테이블과 시퀀스를 생성한다.
</p>

<pre class="prettyprint">create table photo (
no number,
content varchar2(4000) not null,
constraint pk_photo primary key(no),
constraint uq_photo unique(content)
);

create sequence seq_photo
increment by 1
start with 1;
</pre>

<p>
mybatis-spring과 함께 스프링 JDBC, 오라클 JDBC 드라이버, 아파치 DBCP 그리고 MyBatis 라이브러리를 함께 추가한다.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint"><strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;\${spring.version}&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc6 --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;ojdbc6&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;11.2.0.4&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/commons-dbcp/commons-dbcp --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;commons-dbcp&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;commons-dbcp&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;1.4&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.mybatis&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;mybatis&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;3.5.11&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.mybatis&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;mybatis-spring&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;2.1.0&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
</pre>

<p>
commons-dbcp는 아파치에서 제공하는 데이터베이스 커넥션 풀이다.<br />
ojdbc6.jar는 JDBC 4 드라이버이므로 DBCP 1.4 버전을 추가했다.<br />
https://dlcdn.apache.org//commons/dbcp/
</p>

<p>
스프링 설정 파일에 데이터소스와 SqlSessionFactoryBean을 추가한다.
</p>

<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;

  &lt;mvc:annotation-driven /&gt;

  &lt;bean id="internalResourceViewResolver" 
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
    &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
    &lt;property name="prefix" value="/WEB-INF/views/" /&gt;
    &lt;property name="suffix" value=".jsp" /&gt;
  &lt;/bean&gt;

  &lt;bean id="wordCardDao" class="net.java_school.english.WordCardDao" /&gt;

  &lt;bean id="wordCardService" class="net.java_school.english.WordCardService"&gt;
    &lt;constructor-arg ref="wordCardDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="homeController" class="net.java_school.english.HomeController"&gt;
    &lt;constructor-arg ref="wordCardService" /&gt;
  &lt;/bean&gt;

  <strong>&lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" 
      destroy-method="close"&gt;</strong>
    <strong>&lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;</strong>
    <strong>&lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;</strong>
    <strong>&lt;property name="username" value="java" /&gt;</strong>
    <strong>&lt;property name="password" value="school" /&gt;</strong>
    <strong>&lt;property name="maxActive" value="100" /&gt;</strong>
    <strong>&lt;property name="maxWait" value="1000" /&gt;</strong>
    <strong>&lt;property name="poolPreparedStatements" value="true" /&gt;</strong>
    <strong>&lt;property name="defaultAutoCommit" value="true" /&gt;</strong>
    <strong>&lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;</strong>
  <strong>&lt;/bean&gt;</strong>

  <strong>&lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;</strong>
    <strong>&lt;property name="dataSource" ref="dataSource" /&gt;</strong>
  <strong>&lt;/bean&gt;</strong>
&lt;/beans&gt;
</pre>

<p>
commons-dbcp2를 사용한다면, maxActive와 maxWait 파라미터는 maxTotal과 maxWaitMillis로 바꿔야 한다.
</p>

<p>
<strong>자바 빈즈</strong><br />
src/main/java/net/java_school/photostudio/Photo.java
</p>

<h6 class="src">Photo.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

public class Photo {
  private int no;
  private String content;

  public Photo() {}

  public Photo(int no, String content) {
    this.no = no;
    this.content = content;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }
}
</pre>

<p>
<strong>매퍼 인터페이스</strong><br />
매퍼 인터페이스를 다른 스프링 컴포넌트와 구별되는 패키지로 만드는 게 좋다.
</p>

<p>
src/main/java/net/java_school/mybatis/PhotoMapper.java
</p>

<h6 class="src">PhotoMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Insert;

public interface PhotoMapper {
  @Insert("INSERT INTO photo VALUES (seq_photo.nextval, \#{content})")
  public void insert(@Param("content") String content);
}
</pre>

<p>
매퍼 인터페이스를 MapperFactoryBean을 사용해 스프링에 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="photoMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.PhotoMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>서비스</strong><br />
서비스 인터페이스와 서비스 구현 클래스를 작성한다.
</p>

<p>
src/main/java/net/java_school/photostudio/PhotoService.java
</p>

<h6 class="src">PhotoService.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

public interface PhotoService {
  public void add(String content);
}
</pre>

<p>
src/main/java/net/java_school/photostudio/PhotoServiceImpl.java
</p>

<h6 class="src">PhotoServiceImpl.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

import net.java_school.mybatis.PhotoMapper;

import org.springframework.stereotype.Service;

@Service
public class PhotoServiceImpl implements PhotoService {

  private PhotoMapper photoMapper;

  public PhotoServiceImpl(PhotoMapper photoMapper) {
    this.photoMapper = photoMapper;
  }

  @Override
  public void add(String content) {
    photoMapper.insert(content);
  }
}
</pre>

<p>
서비스를 스프링에 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="photoService" class="net.java_school.photostudio.PhotoServiceImpl"&gt;
  &lt;constructor-arg ref="photoMapper" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>컨트롤러</strong><br />
클래스 선언 위에 @RequestMapping("photo") 어노테이션을 두어, ContextPath 다음에 photo가 붙는 요청을 담당하는 컨트롤러를 작성한다.
</p>

<p>
src/main/java/net/java_school/photostudio/PhotoController.java
</p>

<h6 class="src">PhotoController.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

import org.springframework.stereotype.Controller;

<strong>import org.springframework.web.bind.annotation.RequestMapping;</strong>
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
<strong>@RequestMapping("photo")</strong>
public class PhotoController {

  private PhotoService photoService;

  public PhotoController(PhotoService photoService) {
    this.photoService = photoService;
  }
  
  @GetMapping
  public String index() {
    return "photo/index";
  }

  @PostMapping
  public String add(String content) {
    photoService.add(content);	
    return "redirect:/photo/?page=1";
  }
}
</pre>

<p>
컨트롤러를 스프링에 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="photoController" class="net.java_school.photostudio.PhotoController"&gt;
  &lt;constructor-arg ref="photoService" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>뷰</strong><br />
src/main/webapp/WEB-INF/views/photo/index.jsp
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;mybatis-spring Test&lt;/title&gt;
&lt;meta name="viewport" content="width=device-width, initial-scale=1" /&gt;
&lt;meta name="Keywords" content="MyBatis Spring Test" /&gt;
&lt;meta name="Description" content="This is web app for mybatis-spring Test" /&gt;
&lt;style&gt;
html, body {
  margin: 0;
  padding: 0;
  background-color: #FFF;
  font-family: "Liberation Sans", Helvetica, sans-serif;
}
&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
  &lt;form id="addForm" method="post"&gt;
    &lt;input type="text" name="content" /&gt;
    &lt;input id="submit" type="submit" value="Send" /&gt; 
  &lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<strong>테스트</strong>
</p>

<p>
mvn compile war:inplace<br />
http://localhost:8080/photo<br />
웹 상의 이미지 링크를 텍스트필드에 붙여 넣고 전송<br />
SQL*PLUS로 인서트가 되었는지 확인
</p>

<p>
<strong>로깅</strong><br />
아래 내용은 https://mybatis.org/mybatis-3/ko/logging.html 사이트를 참조했다.
</p>

<p>
아파치 commons-logging과 log4j 2 라이브러리를 의존성에 추가한다.
</p>

<pre class="prettyprint">&lt;!-- Logging --&gt;                
&lt;!-- https://mvnrepository.com/artifact/commons-logging/commons-logging --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;commons-logging&lt;/groupId&gt;
  &lt;artifactId&gt;commons-logging&lt;/artifactId&gt;
  &lt;version&gt;1.2&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-api --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-api&lt;/artifactId&gt;
  &lt;version&gt;2.19.0&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-core&lt;/artifactId&gt;
  &lt;version&gt;2.19.0&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-jcl --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-jcl&lt;/artifactId&gt;
  &lt;version&gt;2.19.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
log4j2.xml라는 이름으로 log4j 2 설정 파일을 src/main/resources/ 디렉터리에 생성한다.<br />
src/main/resources 디렉터리는 메이븐 기본 디렉터리이니 없으면 생성한다.
</p>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration&gt;
&lt;Configuration&gt;
  &lt;Appenders&gt;
    &lt;File name="A1" fileName="A1.log" append="false"&gt;
      &lt;PatternLayout pattern="%t %-5p %c{2} - %m%n" /&gt;
    &lt;/File&gt;
    &lt;Console name="STDOUT" target="SYSTEM_OUT"&gt;
      &lt;PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n" /&gt;
    &lt;/Console&gt;
  &lt;/Appenders&gt;
  &lt;Loggers&gt;
    &lt;Logger name="<strong>net.java_school</strong>" level="DEBUG"&gt;
      &lt;AppenderRef ref="A1" /&gt;
    &lt;/Logger&gt;
    &lt;Root level="INFO"&gt;
      &lt;AppenderRef ref="STDOUT" /&gt;
    &lt;/Root&gt;
  &lt;/Loggers&gt;
&lt;/Configuration&gt;
</pre>

<p>
mvn compile war:inplace 실행해 컴파일하고 로그 메시지를 확인한다.
</p>

<pre>http-nio-8080-exec-14 DEBUG PhotoMapper.insert - ==&gt;  Preparing: INSERT INTO photo VALUES (seq_photo.nextval, ?
http-nio-8080-exec-14 DEBUG PhotoMapper.insert - ==&gt; Parameters: https://cdn.pixabay.com/house_720.jpg(String)
</pre>

<p>
insert 구문에 오른쪽 괄호가 빠져있다.<br />
괄호를 추가하고 다시 컴파일한다.<br />
로그 메시지를 확인한다.
</p>

<pre>http-nio-8080-exec-26 DEBUG PhotoMapper.insert - ==&gt;  Preparing: INSERT INTO photo VALUES (seq_photo.nextval, ?<strong>)</strong>
http-nio-8080-exec-26 DEBUG PhotoMapper.insert - ==&gt; Parameters: https://cdn.pixabay.com/house_720.jpg(String)
http-nio-8080-exec-26 DEBUG PhotoMapper.insert - &lt;==    <strong>Updates: 1</strong>
</pre>

<p>
<strong>XML 매퍼</strong><br />
여러 줄로 구성된 복잡한 쿼리는 XML 파일로 따로 분리하면 유지 보수에 좋다.<br />
이 파일이 XML 매퍼 파일이다.
</p>

<p>
지금까지 마이바티스 설정 파일을 만들지 않았다.<br />
XML 매퍼 파일과 매퍼 인터페이스를 같은 클래스패스에 둔다면, 마이바티스 설정 파일이 필요 없다.<br />
참조: https://mybatis.org/spring/ko/mappers.html#register
</p>

<p>
PhotoMapper 인터페이스와 같은 클래스패스에 파일이 위치하도록, src/main/resources/net/java_school/mybatis 디렉터리에, PhotoMapper.xml 매퍼 파일을 생성한다.
</p>

<p>
src/main/resources/net/java_school/mybatis/PhotoMapper.xml 
</p>

<h6 class="src">PhotoMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.PhotoMapper"&gt;

  &lt;insert id="insert"&gt;
    INSERT INTO photo VALUES (seq_photo.nextval, \#{content})
  &lt;/insert&gt;
	
&lt;/mapper&gt;
</pre>

<p>
PhotoMapper 인터페이스에서 쿼리를 제거한다.
</p>

<h6 class="src">PhotoMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;

public interface PhotoMapper {
  public void insert(@Param("content") String content);
}
</pre>

<p>
<strong>저장된 이미지 보이기</strong><br />
저장된 이미지를 4개씩 묶어 뷰에 보여주려 한다.<br />
그룹별로 레코드를 가져오는 여러 줄로 구성된 쿼리를 사용해야 한다.
</p>

<p>
index.jsp 파일의 body 엘리먼트 내용을 아래처럼 수정한다.
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">&lt;div id="photos"&gt;
  &lt;img width="640" alt="p_1" src="https://cdn.pixabay.com/photo/2022/10/09/02/16/haunted-house-7508035_960_720.jpg" /&gt;
  &lt;img width="640" alt="p_2" src="https://cdn.pixabay.com/photo/2022/10/09/02/16/haunted-house-7508035_960_720.jpg" /&gt;
  &lt;img width="640" alt="p_3" src="https://cdn.pixabay.com/photo/2022/10/09/02/16/haunted-house-7508035_960_720.jpg" /&gt;
  &lt;img width="640" alt="p_4" src="https://cdn.pixabay.com/photo/2022/10/09/02/16/haunted-house-7508035_960_720.jpg" /&gt;
&lt;/div&gt;

&lt;div id="paging"&gt;
  &lt;a href="?page=10" title="10"&gt;◁ back&lt;/a&gt;
  &lt;a href="?page=1" title="1"&gt;1&lt;/a&gt;
  &lt;a href="?page=10" title="10"&gt;...&lt;/a&gt;
  &lt;strong&gt;11&lt;/strong&gt;
  &lt;a href="?page=12" title="12"&gt;12&lt;/a&gt;
  &lt;a href="?page=13" title="3"&gt;3&lt;/a&gt;
  &lt;a href="?page=14" title="4"&gt;4&lt;/a&gt;
  &lt;a href="?page=15" title="5"&gt;5&lt;/a&gt;
  &lt;a href="?page=16" title="6"&gt;6&lt;/a&gt;
  &lt;a href="?page=17" title="7"&gt;7&lt;/a&gt;
  &lt;a href="?page=18" title="8"&gt;8&lt;/a&gt;
  &lt;a href="?page=19" title="9"&gt;9&lt;/a&gt;
  &lt;a href="?page=20" title="10"&gt;10&lt;/a&gt;
  &lt;a href="?page=21" title="11"&gt;...&lt;/a&gt;
  &lt;a href="?page=407" title="407"&gt;407&lt;/a&gt;
  &lt;a href="?page=12" title="12"&gt;next▷ &lt;/a&gt;

  &lt;form id="addForm" method="post"&gt;
    &lt;input type="text" name="content" <strong>width="500"</strong> /&gt;
    &lt;input id="submit" type="submit" value="Send" /&gt; 
  &lt;/form&gt;

&lt;/div&gt;
</pre>

<p>
index.jsp 파일의 style 엘리먼트에 다음을 추가한다.
</p>

<pre class="prettyprint">#paging {
  width: 640px;
  float: left;
  font-size: 1em;
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
}
</pre>

<p>
PhotoMapper 인터페이스에 총 레코드 수와 페이지에 보여줄 아이템을 가져오는 메소드를 추가한다.
</p>

<h6 class="src">PhotoMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

<strong>import net.java_school.photostudio.Photo;</strong>

<strong>import java.util.HashMap;</strong>
<strong>import java.util.List;</strong>

import org.apache.ibatis.annotations.Param;

public interface PhotoMapper {
  
  public void insert(@Param("content") String content);

  <strong>public int selectCountOfPhotos();</strong>//총 레코드 수

  <strong>public List&lt;Photo&gt; selectPhotos(HashMap&lt;String, String&gt; hashmap);</strong>//뷰에 보여줄 아이템
}
</pre>

<p>
매퍼 인터페이스에 추가한 메소드 이름을 id 값으로 갖는 엘리먼트를 XML 매퍼 파일에 추가한다.
</p>

<h6 class="src">PhotoMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.PhotoMapper"&gt;

  &lt;insert id="insert"&gt;
    NSERT INTO photo VALUES (seq_photo.nextval, \#{content})
  &lt;/insert&gt;

  <strong>&lt;select id="selectCountOfPhotos" resultType="int"&gt;</strong>
    <strong>SELECT count(*) FROM photo</strong>
  <strong>&lt;/select&gt;</strong>

  <strong>&lt;select id="selectPhotos" parameterType="hashmap" resultType="net.java_school.photostudio.Photo"&gt;</strong>
    <strong>SELECT no,content</strong>
    <strong>FROM (</strong>
      <strong>SELECT rownum R,A.*</strong>
      <strong>FROM (</strong>
        <strong>SELECT </strong>
          <strong>no,content</strong>
        <strong>FROM </strong>
          <strong>photo</strong>
        <strong>ORDER BY no DESC</strong>
      <strong>) A</strong>
    <strong>)</strong>
    <strong>WHERE R BETWEEN \#{start} AND \#{end}</strong>
  <strong>&lt;/select&gt;</strong>
	
&lt;/mapper&gt;
</pre>

<p>
마이바티스 설정 파일에서 typeAlias 요소를 사용하면 XML 매퍼 파일에서 resultType="net.java_school.photostudio.Photo"를 resultType="Photo"처럼 간단히 줄일 수 있다.
</p>

<pre class="prettyprint">&lt;-- XML 설정 파일에서 --&gt;
&lt;typeAlias type="net.java_school.photostudio.Photo" alias="Photo"/&gt;
</pre>

<p>
하지만 지금껏 생략했던 마이바티스 설정 파일을 추가해야 한다.<br />
참고: https://mybatis.org/mybatis-3/ko/sqlmap-xml.html<br />
자바 빈즈가 하나뿐이니, 마이바티스 설정 파일을 만들지 않고 진행한다.
</p>

<p>
<strong>서비스 수정</strong><br />
총 레코드 수와 페이지에 보일 레코드를 구하는 메소드를 서비스에 추가한다.
</p>

<h6 class="src">PhotoService.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

<strong>import java.util.List;</strong>

public interface PhotoService {

  public void add(String content);

  <strong>public int getTotalRecordCount();</strong>	
  
  <strong>public List&lt;Photo&gt; getPhotos(Integer startRecord, Integer endRecord);</strong>
}
</pre>

<h6 class="src">PhotoServiceImpl.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

<strong>import java.util.List;</strong>
<strong>import java.util.HashMap;</strong>

import net.java_school.mybatis.PhotoMapper;

public class PhotoServiceImpl implements PhotoService {

  private PhotoMapper photoMapper;

  public PhotoServiceImpl(PhotoMapper photoMapper) {
    this.photoMapper = photoMapper;
  }

  @Override
  public void add(String content) {
    photoMapper.insert(content);
  }

  <strong>@Override</strong>
  <strong>public int getTotalRecordCount() {</strong>
	<strong>return photoMapper.selectCountOfPhotos();</strong>
  <strong>}</strong>

  <strong>@Override</strong>
  <strong>public List&lt;Photo&gt; getPhotos(Integer startRecord, Integer endRecord) {</strong>
    <strong>HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();</strong>
    <strong>hashmap.put("start", startRecord.toString());</strong>
    <strong>hashmap.put("end", endRecord.toString());</strong>
    
    <strong>return photoMapper.selectPhotos(hashmap);</strong>
  <strong>}</strong>
}
</pre>

<p>
<strong>컨트롤러 수정</strong><br />
컨트롤러에 총 레코드 수와 페이지에 보일 레코드를 구하는 메소드를 추가한다.<br />
페이지 분할 기능에 필요한 숫자를 구하는 기능을 분리하여 메소드에 구현했다.
</p>

<h6 class="src">PhotoController.java</h6>
<pre class="prettyprint">package net.java_school.photostudio;

import org.springframework.stereotype.Controller;

<strong>import org.springframework.ui.Model;</strong>

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

<strong>import java.util.List;</strong>
<strong>import java.util.Map;</strong>
<strong>import java.util.HashMap;</strong>

@Controller
@RequestMapping("/photo")
public class PhotoController {

  private PhotoService photoService;

  public PhotoController(PhotoService photoService) {
    this.photoService = photoService;
  }

  @PostMapping
  public String add(String content) {
    photoService.add(content);	
    return "redirect:/photo/?page=1";
  }

  <strong>private Map&lt;String, Integer&gt; getNumbersForPaging(int totalRecordCount, int page, int recordsPerPage, int pagesPerBlock) {</strong>

    <strong>Map&lt;String, Integer&gt; map = new HashMap&lt;String, Integer&gt;();</strong>

    <strong>int totalPageCount = totalRecordCount / recordsPerPage;</strong>
    <strong>if (totalRecordCount % recordsPerPage != 0) totalPageCount++;</strong>

    <strong>int totalBlockCount = totalPageCount / pagesPerBlock;</strong>
    <strong>if (totalPageCount % pagesPerBlock != 0) totalBlockCount++;</strong>

    <strong>int block = page / pagesPerBlock;</strong>
    <strong>if (page % pagesPerBlock != 0) block++;</strong>

    <strong>int firstPage = (block - 1) * pagesPerBlock + 1;</strong>
    <strong>int lastPage = block * pagesPerBlock;</strong>

    <strong>int prevBlock = 0;</strong>//previus block's last page
    <strong>if (block &gt; 1) prevBlock = firstPage - 1;</strong>

    <strong>int nextBlock = 0;</strong>//next blcok's first page
    <strong>if (block &lt; totalBlockCount) nextBlock = lastPage + 1;</strong>
    <strong>if (block &gt;= totalBlockCount) lastPage = totalPageCount;</strong>
		
    <strong>int listItemNo = totalRecordCount - (page - 1) * recordsPerPage;</strong>
    <strong>int startRecord = (page - 1) * recordsPerPage + 1;</strong>
    <strong>int endRecord = page * recordsPerPage;</strong>

    <strong>map.put("finalPage", totalPageCount);</strong>
    <strong>map.put("firstPage", firstPage);</strong>
    <strong>map.put("lastPage", lastPage);</strong>
    <strong>map.put("prevBlock", prevBlock);</strong>
    <strong>map.put("nextBlock", nextBlock);</strong>
    <strong>map.put("startRecord", startRecord);</strong>
    <strong>map.put("endRecord", endRecord);</strong>

    <strong>return map;</strong>
  <strong>}</strong>

  @GetMapping
  public String index(<strong>Integer page, Model model</strong>) {
    <strong>if (page == null) return "redirect:/photo/?page=1";</strong>

    <strong>int recordsPerPage = 4;</strong>
    <strong>int pagesPerBlock = 10;</strong>

    <strong>int totalRecordCount = photoService.getTotalRecordCount();</strong>

    <strong>Map&lt;String, Integer&gt; map = getNumbersForPaging(totalRecordCount, page, recordsPerPage, pagesPerBlock);</strong>
    <strong>Integer startRecord = map.get("startRecord");</strong>
    <strong>Integer endRecord = map.get("endRecord");</strong>

    <strong>List&lt;Photo&gt; photos = photoService.getPhotos(startRecord, endRecord);</strong>

    <strong>Integer prevBlock = map.get("prevBlock");</strong>
    <strong>Integer nextBlock = map.get("nextBlock");</strong>
    <strong>Integer firstPage = map.get("firstPage");</strong>
    <strong>Integer lastPage = map.get("lastPage");</strong>
    <strong>Integer finalPage = map.get("finalPage");</strong>

    <strong>model.addAttribute("photos", photos);</strong>
    <strong>model.addAttribute("prevBlock", prevBlock);</strong>
    <strong>model.addAttribute("nextBlock", nextBlock);</strong>
    <strong>model.addAttribute("firstPage", firstPage);</strong>
    <strong>model.addAttribute("lastPage", lastPage);</strong>
    <strong>model.addAttribute("finalPage", finalPage);</strong>

    return "photo/index";
  }
}
</pre>

<p>
<strong>뷰 수정</strong><br />
JSTL을 사용하기 위해선 index.jsp 파일에 다음을 추가한다.
</p>

<pre>&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;</pre>

<p>
JSTL 코드를 사용하여 전달된 데이터와 페이지  분할 기능에 필요한 숫자를 뷰에 세팅한다.
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">&lt;div id="photos"&gt;
  <strong>&lt;c:forEach var="photo" items="\${photos }" varStatus="status"&gt;</strong>
  &lt;img width="640" alt="p_<strong>\${photo.no }</strong>" src="<strong>\${photo.content }</strong>" /&gt;
  <strong>&lt;/c:forEach&gt;</strong>
&lt;/div&gt;

&lt;div id="paging"&gt;
  <strong>&lt;c:if test="&#36;{param.page &gt; 1 }"&gt;</strong>
  &lt;a href="?page=<strong>\${param.page - 1 }</strong>" title="<strong>\${param.page - 1}</strong>"&gt;&lt; Back&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:if test="&#36;{prevBlock &gt; 0}"&gt;</strong>
  &lt;a href="?page=1" title="1"&gt;1&lt;/a&gt;
  &lt;a href="?page=<strong>\${prevBlock }</strong>" title="<strong>\${prevBlock }</strong>"&gt;...&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:forEach var="i" begin="\${firstPage }" end="\${lastPage }" varStatus="status"&gt;</strong>
  <strong>&lt;c:choose&gt;</strong>
    <strong>&lt;c:when test="\${param.page == i}"&gt;</strong>
    &lt;strong&gt;<strong>\${i }</strong>&lt;/strong&gt;
    <strong>&lt;/c:when&gt;</strong>
    <strong>&lt;c:otherwise&gt;</strong>
    &lt;a href="?page=<strong>\${i }</strong>" title="<strong>\${i }</strong>"&gt;<strong>\${i }</strong>&lt;/a&gt;
    <strong>&lt;/c:otherwise&gt;</strong>
  <strong>&lt;/c:choose&gt;</strong>
  <strong>&lt;/c:forEach&gt;</strong>

  <strong>&lt;c:if test="&#36;{nextBlock &gt; 0 }"&gt;</strong>
  &lt;a href="?page=<strong>\${nextBlock }</strong>" title="<strong>\${nextBlock }</strong>"&gt;...&lt;/a&gt;
  &lt;a href="?page=<strong>\${finalPage }</strong>" title="<strong>\${finalPage }</strong>"&gt;\${finalPage }&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:if test="&#36;{param.page &lt; finalPage }"&gt;</strong>
  &lt;a href="?page=<strong>\${param.page + 1 }</strong>" title="<strong>\${param.page + 1 }</strong>"&gt;Next&gt; &lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  &lt;form id="addForm" method="post"&gt;
    &lt;input type="text" name="content" width="500" /&gt;
    &lt;input id="submit" type="submit" value="Send" /&gt; 
  &lt;/form&gt;

&lt;/div&gt;
</pre>

<p>
<strong>스프링 자동 스캔</strong>
</p>

<p>
스프링의 자동 스캔 기능을 사용하면 설정 파일 내용을 줄일 수 있다.<br />
컨트롤러와 서비스는 &lt;context:component-scan ... /&gt;로 스캔할 수 있다.<br />
매퍼 인스턴스는 마이바티스가 생성하는 것이기에 위 설정으로 스캔할 수 없다.<br />
&lt;mybatis:scan ... /&gt;로 매퍼 인스턴스를 스캔한다.
</p>

<h6 class="src">mvc.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    <strong>xmlns:context="http://www.springframework.org/schema/context"</strong>
    <strong>xmlns:mybatis="http://mybatis.org/schema/mybatis-spring"</strong>
    xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd
    <strong>http://www.springframework.org/schema/context</strong>
    <strong>http://www.springframework.org/schema/context/spring-context.xsd</strong>
    <strong>http://mybatis.org/schema/mybatis-spring</strong>
    <strong>http://mybatis.org/schema/mybatis-spring.xsd</strong>"&gt;

  &lt;mvc:annotation-driven /&gt;

  <strong>&lt;context:component-scan base-package="net.java_school.english,
      net.java_school.photostudio" /&gt;</strong>

  <strong>&lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;</strong>

  &lt;bean id="internalResourceViewResolver" 
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
    &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
    &lt;property name="prefix" value="/WEB-INF/views/" /&gt;
    &lt;property name="suffix" value=".jsp" /&gt;
  &lt;/bean&gt;

  &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" 
      destroy-method="close"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
    &lt;property name="username" value="java" /&gt;
    &lt;property name="password" value="school" /&gt;
    &lt;property name="maxActive" value="100" /&gt;
    &lt;property name="maxWait" value="1000" /&gt;
    &lt;property name="poolPreparedStatements" value="true" /&gt;
    &lt;property name="defaultAutoCommit" value="true" /&gt;
    &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
  &lt;/bean&gt;

  &lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
  &lt;/bean&gt;
&lt;/beans&gt;
</pre>

<p>
&lt;context:component-scan /&gt;를 사용하면 @Autowired 어노테이션도 함께 사용할 수 있다.
</p>

<h6 class="src">PhotoController.java</h6>
<pre class="prettyprint"><strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Controller
public class PhotoController {

  <strong>@Autowired</strong>
  private PhotoService photoService;

  /* 생성자 제거
  public PhotoController(PhotoService photoService) {
    this.photoService = photoService;
  }
  */

  //..omit..
}
</pre>

<h6 class="src">PhotoServiceImpl.java</h6>
<pre class="prettyprint">import org.springframework.stereotype.Service;
<strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Service
public class PhotoServiceImpl implements PhotoService {

  <strong>@Autowired</strong>
  private PhotoMapper photoMapper;

  /* 생성자 제거
  public PhotoServiceImpl(PhotoMapper photoMapper) {
    this.photoMapper = photoMapper;
  }
  */

  //..omit..
}
</pre>

<p>
자동 스캔 적용할 때는 스프링 컴포넌트는 클래스 선언 어노테이션을 생략해선 안 된다.<br />
홈페이지 요청에 동작하는 WordCardDao, WordCardService, HomeController를 수정한다.
</p>

<p>
src/main/java/net/java_school/english/WordCardDao.java
</p>

<h6 class="src">WordCardDao.java</h6>
<pre class="prettyprint"><strong>import org.springframework.stereotype.Repository;</strong>

<strong>@Repository</strong>
public class WordCardDao {

  //..omit..
}
</pre>

<p>
src/main/java/net/java_school/english/WordCardService.java
</p>

<h6 class="src">WordCardService.java</h6>
<pre class="prettyprint"><strong>import org.springframework.stereotype.Service;</strong>
<strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

<strong>@Service</strong>
public class WordCardService {

  <strong>@Autowired</strong>
  private WordCardDao wordCardDao;

  //..omit..
}
</pre>

<p>
src/main/java/net/java_school/english/HomeController.java
</p>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint"><strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Controller
public class HomeController {

  <strong>@Autowired</strong>
  private WordCardService wordCardService;
  
  //..omit..
}
</pre>

<h3>이클립스 작업환경 구축</h3>

<p>
이클립스를 시작하고 워크스페이스를 <em class="path">C:\www</em>로 선택한다.
Project Explorer 뷰에서 마우스 오른쪽 버튼을 사용하여 컨텍스트 메뉴를 보이게 한다.
Import를 사용하여 spring-bbs 프로젝트를 이클립스로 불러온다.<br />
<img alt="컨텍스트 메뉴에서 Import" src="<c:url value="/resources/images/maven-project-import.png"/>"/><br />
<img alt="이클립스에서 메이븐 프로젝트 Import" src="<c:url value="/resources/images/eclipse-with-maven.png"/>"/><br />
진행하면서 pom.xml 파일이 바뀌면 이클립스 설정과 동기화를 해주어야 한다.<br />
<img alt="pom과 이클립스 설정 동기화" src="<c:url value="/resources/images/maven-update-project-configuration.png"/>"/><br />
</p>

<h2>스프링 MVC 게시판</h2>

<p>
JSP 프로젝트의 최종 결과물에 스프링 MVC를 적용하는 실습을 할 것이다.
모델 2 게시판은 다음을 실행하면 얻을 수 있다. (시스템에 git이 설치되어 있어야 한다)
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\www&gt; <span class="prompt-selection">git clone https://github.com/kimjonghoon/model2</span>
</pre>

<h3>데이터베이스 디자인</h3>

<p>
참조: <a href="../jsp/database-design">데이터베이스 설계</a>
</p>

<h3>CSS 파일과 이미지 복사</h3>

<p>
모델 2게시판의 C:/www/model2/WebContent에서 css/와 images/ 폴더를 복사하여, 도큐먼트
베이스인 C:/www/spring-bbs/src/main/webapp 디렉터리에 붙여넣는다.
</p>

<h3>JSP 파일 복사</h3>

<p>
C:/www/spring-bbs/src/main/webapp/WEB-INF/views/ 폴더를 만들고, 모델 2 게시판의
C:/www/model2/WebContent에서 index.jsp(홈페이지)와 error.jsp(에러 페이지) 그리고 JSP
파일 폴더인 bbs/, inc/, java/, users/를 복사하여 붙여넣는다.
</p>

<p>
JSP를 WEB-INF/ 아래에 두는 이유는 웹 브라우저로 JSP에 바로 접근하지 못 하게 하기 위해서다. 스프링 MVC는
모든 요청을 디스패처 서블릿을 거쳐 컨트롤러에 전달되도록 하는 것을 권장한다. JSP를 바로 요청할 수 있으면서 어떤 요청은
디스패처 서블릿을 거치도록 프로그래밍하는 것은 프로그램을 복잡하게 하고 유지 보수에도 좋지 않다.
</p>

<h3>자바 소스 복사</h3>

<p>
C:/www/spring-bbs/src/main/java에 모델 2 게시판의 C:/www/model2/src/net/java_school에서 모든 자바 소스 폴더를 복사하여 붙여넣는다.
만약 C:/www/spring-bbs/src/main/java 폴더가 없다면 메이븐 프로젝트의 기본 디렉터리이니 만든다.
</p>

<p>
복사한 자바 소스 중 action 클래스와 컨트롤러 역할을 수행하는 서블릿은 더이상 사용하지 않으므로 삭제해도 된다.
</p>


<h3>JSP 수정</h3>

<p>
스프링은 디스패처 서블릿이 모든 요청을 담당하도록 설정할 것을 권장한다.
web.xml의 다음 부분이 디스패처 서블릿이 모든 요청을 담당토록 하는 설정이다.
</p>

<pre class="prettyprint">
&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<h3>JSP에서 요청 문자열 변경</h3>

<p>
모델 2 게시판에서는 컨트롤러는 .do로 끝나는 요청만을 담당했다.
따라서 모델 2 게시판의 뷰에서 .do로 끝나는 모든 요청 문자열을 수정해야 한다.
예를 들어, header.jsp안의 ../users/login.do를 ../users/login으로 수정하는 식이다.
이렇게 모든 JSP에서 .do로 끝나는 요청 문자열에서 .do를 제거한다.
</p>

<h3>목록과 상세보기에서 날짜 포맷 변경</h3>

<p>
list.jsp와 view.jsp에서의 날짜 포맷을 다르게 할 것이다.
두 파일에 다음 태그 라이브러리를 추가한다.
</p>

<pre class="prettyprint">
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %&gt;
</pre>

<p>
list.jsp에서 날짜를 출력하는 부분을 찾아 다음과 같이 수정한다.
</p>

<pre class="prettyprint">
&lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
</pre>

<p>
view.jsp에서 날짜를 출력하는 부분을 찾아 다음과 같이 수정한다.
</p>

<pre class="prettyprint">
&lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="\${regdate }" /&gt;
&lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
</pre>

<h3>첨부 파일을 내려받는 JSP 추가</h3>

<p>
모델 2 게시판은 상세보기(view.jsp)에서 첨부 파일을 단순히 링크 거는 것으로 구현했다.
스프링 MVC 게시판에서는 /WEB-INF/views/inc/download.jsp를 이용하여 첨부 파일을 내려받는 것으로 변경할 것이다.
이 경우 웹 브라우저가 접근하지 못하는 경로에 첨부 파일이 있어도 상관없다.
</p>

<h6 class="src">/WEB-INF/views/inc/download.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;    
    
&lt;%@ page import="java.io.File" %&gt;
&lt;%@ page import="java.net.URLEncoder" %&gt;
&lt;%@ page import="java.io.OutputStream" %&gt;
&lt;%@ page import="java.io.FileInputStream" %&gt;
&lt;%@ page import="java.io.IOException" %&gt;
&lt;%@ page import="org.springframework.util.FileCopyUtils" %&gt;
&lt;%@ page import="net.java_school.commons.WebContants" %&gt;
&lt;%
//request.setCharacterEncoding("UTF-8");//이 작업은 필터가 한다.
String filename = request.getParameter("filename");

File file = new File(<strong>WebContants.UPLOAD_PATH</strong> + filename);

String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());

if (filetype.trim().equalsIgnoreCase("txt")) {
  response.setContentType("text/plain");
} else {
  response.setContentType("application/octet-stream");
}

response.setContentLength((int) file.length());

boolean ie = request.getHeader("User-Agent").indexOf("MSIE") != -1;
if (ie) {
  filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
} else {
  filename = new String(filename.getBytes("UTF-8"), "8859_1");
}

response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

OutputStream outputStream = response.getOutputStream();
FileInputStream fis = null;

try {
  fis = new FileInputStream(file);
  FileCopyUtils.copy(fis, outputStream);
} finally {
  if (fis != null) {
    try {
      fis.close();
    } catch (IOException e) {}
  }
}

out.flush();
%&gt;
</pre>

<p>
위에서 <strong>WebContants.UPLOAD_PATH</strong>는 첨부 파일이 있는 디렉터리를 상수화 한 것이다.
WebContants.java에 첨부 파일이 저장되는 디렉터리의 전체 경로 UPLOAD_PATH를 추가한다.
</p>

<p>
모델 2에서는 웹 브라우저로 접근할 수 있는 디렉터리였으나 여기서는 접근할 수 없는 디렉터리를 선택했다. 
따라서 단순히 링크로 파일을 내려받을 수 없다. view.jsp의 첨부 파일 다운로드 코드가 변경되어야 한다는 점을 기억하자.
</p>

<h6 class="src">WebContants.java</h6>
<pre class="prettyprint">package net.java_school.commons;

public class WebContants {
  //Session key
  public final static String USER_KEY = "user";
  //Error Message
  public final static String NOT_LOGIN = "Not Login";
  public final static String AUTHENTICATION_FAILED = "Authentication Failed";
  //Line Separator
  public final static String LINE_SEPARATOR = System.getProperty("line.separator");
  //Upload Path
  <strong>public final static String UPLOAD_PATH = "C:/www/spring-bbs/upload/";</strong>
}
</pre>


<h3>로그</h3>

<h6 class="src">commons-logging.properties</h6>
<pre class="prettyprint">
org.apache.commons.logging.Log = org.apache.commons.logging.impl.Log4JLogger
</pre>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Configuration&gt;
  &lt;Appenders&gt;
    &lt;File name="A1" fileName="A1.log" append="true"&gt;
      &lt;PatternLayout pattern="%t %-5p %c{2} - %m%n" /&gt;
    &lt;/File&gt;
    &lt;Console name="STDOUT" target="SYSTEM_OUT"&gt;
      &lt;PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n" /&gt;
    &lt;/Console&gt;
  &lt;/Appenders&gt;
  &lt;Loggers&gt;
    &lt;Logger name="net.java_school" level="debug"&gt;
      &lt;AppenderRef ref="A1" /&gt;
    &lt;/Logger&gt;
    &lt;Root level="debug"&gt;
      &lt;AppenderRef ref="STDOUT" /&gt;
    &lt;/Root&gt;
  &lt;/Loggers&gt;
&lt;/Configuration&gt;
</pre>

<p>
위 두 개의 파일을 C:/www/spring-bbs/src/main/resources에 생성한다.<br />
C:/www/spring-bbs/src/main/resources 폴더가 없다면 만들고, 컨텍스트 메뉴에서 Maven - Update Project... 를 실행하여 동기화한 후 작업한다.<br />
</p>

<h3>회원</h3>

<p>
데이터베이스 관련 코드는 MyBatis-Spring 라이브러리를 사용하도록 수정할 것이다.
MyBatis-Spring 공식 문서에는 스프링과 마이바티스의 연동에 관한 여러 가지 방법을 소개하고 있다.
여기서는 DAO 패턴을 이용하지 않는 방법을 선택했다.
</p>

<p>
UserService.java를 인터페이스로 변경한다.
</p>

<h6 class="src">UserService.java</h6>

<pre class="prettyprint">package net.java_school.user;

public interface UserService {
    
  //회원 가입
  public void addUser(User user);

  //로그인
  public User login(String email, String passwd);

  //내 정보 수정
  public int editAccount(User user);

  //비밀번호 변경
  public int changePasswd(String currentPasswd, String newPasswd, String email);

  //탈퇴
  public void bye(User user);

  //회원 찾기
  public User getUser(String email);
    
}
</pre>

<p>
net.java_school.mybatis 패키지에 UserMapper.java를 작성한다.
(모델 2 게시판의 UserDao와 일관성을 위해 메소드 이름은 될 수 있으면 그대로 유지했다)
</p>

<h6 class="src">UserMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;

import net.java_school.user.User;

public interface UserMapper {
    
  public void insert(User user);

  public User login(
    @Param("email") String email, 
    @Param("passwd") String passwd);

  public int update(User user);

  public int <strong>updatePasswd</strong>(
    @Param("currentPasswd") String currentPasswd, 
    @Param("newPasswd") String newPasswd, 
    @Param("email") String email);

  public int delete(User user);

  public User selectOne(String email);
    
}
</pre>

<p>
비밀번호 변경을 위한 메소드 명은 UserDao에서의 update가 아닌 updatePasswd로 변경했다.
UserMapper.xml에 UserMapper.java의 메소드 이름으로 id를 설정해야 하는데, update라고 그대로 쓰면 내 정보 수정의 update와 이름이 같아져서 id가 중복되기 때문이다.
(UserMapper.xml은 곧 다루는데, 마이바티스 설정 파일로 매퍼라 부른다)
</p>

<p>
net.java_school.user 패키지에 UserServiceImpl.java를 만든다.
</p>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">
package net.java_school.user;

import net.java_school.mybatis.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    
  @Autowired
  private UserMapper userMapper;
    
  public void addUser(User user) {
    userMapper.insert(user);
  }

  public User login(String email, String passwd) {
    return userMapper.login(email, passwd);
  }

  public int editAccount(User user) {
    return userMapper.update(user);
  }

  public int changePasswd(String currentPasswd, String newPasswd, String email) {
    return userMapper.updatePasswd(currentPasswd, newPasswd, email);
  }

  public void bye(User user) {
    userMapper.delete(user);
  }

  public User getUser(String email) {
    return userMapper.selectOne(email);
  }
    
}
</pre>

<p>
src/main/resources에 net.java_school.mybatis 패키지를 만들고, 이 패키지에 마이바티스 관련 설정 파일인 Congifuration.xml을 만든다.
이 파일은 타입의 별칭과 매퍼 파일의 위치를 설정한다.
메이븐 프로젝트에서 클래스 패스에 생성되어야 할 설정 파일은 반드시 src/main/resources에 생성해야 한다.
설정 파일을 소스 디렉터리에 만들어도 클래스 패스에 복사되지 않기 때문이다. 
</p>

<h6 class="src">Configuration.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration 
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-config.dtd"&gt;

&lt;configuration&gt; 

  &lt;settings&gt;
    &lt;setting name="logImpl" value="LOG4J2"/&gt;
  &lt;/settings&gt;
        
  &lt;typeAliases&gt;
    &lt;typeAlias type="net.java_school.board.AttachFile" alias="AttachFile" /&gt;
    &lt;typeAlias type="net.java_school.board.Comment" alias="Comment" /&gt;
    &lt;typeAlias type="net.java_school.board.Board" alias="Board" /&gt;
    &lt;typeAlias type="net.java_school.board.Article" alias="Article" /&gt;
    &lt;typeAlias type="net.java_school.user.User" alias="User" /&gt;
  &lt;/typeAliases&gt;

  &lt;mappers&gt;
    &lt;mapper resource="net/java_school/mybatis/BoardMapper.xml" /&gt;
    <strong>&lt;mapper resource="net/java_school/mybatis/UserMapper.xml" /&gt;</strong>
  &lt;/mappers&gt;

&lt;/configuration&gt;
</pre>

<p>
Configuration.xml와 같은 위치에 UserMapper.xml 파일을 만든다.
UserMapper.java의 메소드 이름과 id 값이 일치해야 한다.
</p>

<h6 class="src">UserMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.UserMapper"&gt;
    
  &lt;insert id="insert" parameterType="User"&gt;
    INSERT INTO member VALUES (\#{email}, \#{passwd}, \#{name}, \#{mobile})
  &lt;/insert&gt;

  &lt;select id="login" resultType="User"&gt;
    SELECT email, passwd, name, mobile FROM member 
    WHERE email = \#{email} AND passwd = \#{passwd}
  &lt;/select&gt;

  &lt;update id="update" parameterType="User"&gt;
    UPDATE member SET name = \#{name}, mobile = \#{mobile} 
    WHERE email = \#{email} AND passwd = \#{passwd}
  &lt;/update&gt;

  &lt;update id="updatePasswd"&gt;
    UPDATE member SET passwd = \#{newPasswd} 
    WHERE passwd = \#{currentPasswd} AND email = \#{email}
  &lt;/update&gt;

  &lt;delete id="delete"&gt;
    DELETE FROM member 
    WHERE email = \#{email}
  &lt;/delete&gt;

  &lt;select id="selectOne" parameterType="string" resultType="User"&gt;
    SELECT email, passwd, name, mobile 
    FROM member
    WHERE email = \#{email}
  &lt;/select&gt;
    
&lt;/mapper&gt;
</pre>

<p>
net.java_school.controller 패키지에 UsersController.java를 작성한다.
이 컨트롤러가 "/users"를 포함하는 모든 요청을 처리하도록 하려면,
클래스를 선언하는 곳 위에 @Controller 어노테이션을 사용하여 이 클래스가 컨트롤러 컴포넌트임을 표시해주고 
@Controller 어노테이션 바로 아래 @RequestMapping("users") 어노테이션을 적용하여 "/users로 시작하는 모든 요청을 담당한다고 표시한다.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import java.net.URLEncoder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import net.java_school.commons.WebContants;
import net.java_school.exception.AuthenticationException;
import net.java_school.user.User;
import net.java_school.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<strong>
@Controller
@RequestMapping("users")</strong>
public class UsersController {
    
  <strong>@Autowired</strong>
  private UserService userService;

  <strong>@RequestMapping(value="signUp", method=RequestMethod.GET)</strong>
  public String signUp() {
    return "users/signUp";
  }

  @RequestMapping(value="signUp", method=RequestMethod.POST)
  public String signUp(User user) {
    userService.addUser(user);
    return "<strong>redirect:/users/welcome</strong>";
  }

  @RequestMapping(value="<strong>welcome</strong>", method=RequestMethod.GET)
  public String welcome() {
    return "users/welcome";
  }

  @RequestMapping(value="login", method=RequestMethod.GET)
  public String login() {
    return "users/login";
  }
    
  @RequestMapping(value="login", method=RequestMethod.POST)
  public String login(String email, String passwd, String url, HttpSession session) {
    User user = userService.login(email, passwd);
        
    if (user == null) {
      return "redirect:/users/login?url=" + url + "&amp;msg=Login-Failed";
    } else {
      session.setAttribute(WebContants.USER_KEY, user);
      if (!url.equals("")) {
        return "redirect:" + url;
      }
      
      return "redirect:/";
    }
        
  }
        
  @RequestMapping(value="editAccount", method=RequestMethod.GET)
  public String editAccount(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User) session.getAttribute(WebContants.USER_KEY);

    if (user == null) {
      //로그인 후 다시 돌아오기 위해
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      
      return "redirect:/users/login?url=" + url;
    }

    return "users/editAccount";
  }
    
  @RequestMapping(value="editAccount", method=RequestMethod.POST)
  public String editAccount(User user, HttpSession session) {
    User loginUser = (User) session.getAttribute(WebContants.USER_KEY);
    if (loginUser == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    user.setEmail(loginUser.getEmail());
        
    int check = userService.editAccount(user);
    if (check &lt; 1) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }
    
    session.setAttribute(WebContants.USER_KEY, user);

    return "users/changePasswd";
        
  }
    
  @RequestMapping(value="changePasswd", method=RequestMethod.GET)
  public String changePasswd(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User) session.getAttribute(WebContants.USER_KEY);
        
    if (user == null) {
      //로그인 후 다시 돌아오기 위해
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;     
    }
        
    return "users/changePasswd";
  }
    
  @RequestMapping(value="changePasswd", method=RequestMethod.POST)
  public String changePasswd(String currentPasswd, String newPasswd, HttpSession session) {
    String email = ((User)session.getAttribute(WebContants.USER_KEY)).getEmail();
        
    int check = userService.changePasswd(currentPasswd, newPasswd, email);
    if (check &lt; 1) {
        throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    } 
    
    return "redirect:/users/changePasswd_confirm";
        
  }
    
  @RequestMapping(value="changePasswd_confirm", method=RequestMethod.GET)
  public String changePasswd_confirm() {
    return "users/changePasswd_confirm";
  }
    
  @RequestMapping(value="bye", method=RequestMethod.GET)
  public String bye(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User)session.getAttribute(WebContants.USER_KEY);
        
    if (user == null) {
      //로그인 후 다시 돌아오기 위해
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      
      return "redirect:/users/login?url=" + url;     
    }
        
    return "users/bye";
  }

  @RequestMapping(value="bye", method=RequestMethod.POST)
  public String bye(String email, String passwd, HttpSession session) {
    User user = (User)session.getAttribute(WebContants.USER_KEY);

    if (user == null || !user.getEmail().equals(email)) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }
    
    user = userService.login(email, passwd);
    userService.bye(user);
    session.removeAttribute(WebContants.USER_KEY);
    
    return "redirect:/users/bye_confirm";
        
  }
  
  @RequestMapping(value="bye_confirm", method=RequestMethod.GET)
  public String bye_confirm() {
  
    return "users/bye_confirm";    
  } 
    
  @RequestMapping(value="logout", method=RequestMethod.GET)
  public String logout(HttpSession session) {
    session.removeAttribute(WebContants.USER_KEY);

    return "redirect:/";

  }

}
</pre>

<p>
메소드 선언 위의 @RequestMapping(value="signUp", method=RequestMethod.GET)는 메소드가 GET 방식의 "/users/signUp" 요청을 처리한다는 것을 표시한다.
("/users/signUp"에서 "/users" 부분은 UsersController 클래스 이름 위의 @RequestMapping("users") 어노테이션 때문이다.)
메소드 선언 위의 @RequestMapping(value="/signUp", method=RequestMethod.POST)는 메소드가 POST 방식의 "/users/signUp" 요청을 처리한다는 것을 표시한다.
이처럼 요청 문자열이 같더라도 HTTP 메소드로 구분하여 요청을 각각 처리할 수 있다.
POST 방식의 /users/signUp 요청 시 호출되는 메소드는 회원 가입을 처리한 후에는 return "redirect:/users/welcome";로 리다이렉트한다.
여기서 포워드를 쓴다면 사용자가 F5버튼 등으로 재로딩할때 회원 가입이 똑같은 정보로 다시 시도될 수 있다.
리다이렉트는 그런 일이 발생하지 않는다.
이점이 포워딩과 리다이렉트를 선택할 때 중요한 선택 기준이다.
리다이렉트를 선택할 때는 컨트롤러에 리다이렉트 요청에 대한 매핑을 추가해야 한다.
@RequestMapping(value="welcome", method="RequestMethod.GET")
</p>

<p>
아래는 HomeController은 홈페이지 요청을 담당하는 컨트롤러이다.
</p>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping(method=RequestMethod.GET)
    public String index() {
        return "index";
    }
}
</pre>

<p>
JavaController은 "/java"가 포함된 모든 요청을 처리하는 컨트롤러이다.
</p>

<h6 class="src">JavaController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("java")
public class JavaController {

    @RequestMapping(method=RequestMethod.GET)
    public String index() {
        return "java/index";
    }
    
    @RequestMapping(value="jdk-install", method=RequestMethod.GET)
    public String basic() {
        return "java/jdk-install";
    }

}
</pre>

<p>
JavascriptController은 "/javascrit"가 포함된 모든 요청을 처리하는 컨트롤러이다.
</p>

<h6 class="src">JavascriptController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("javascript")
public class JavascriptController {

    @RequestMapping(method=RequestMethod.GET)
    public String index() {
        return "javascript/index";
    }
    
}
</pre>

<h6 class="src">mvc.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xmlns:mvc="http://www.springframework.org/schema/mvc"
  xmlns:p="http://www.springframework.org/schema/p"
  xmlns:mybatis="http://mybatis.org/schema/mybatis-spring"
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd
    http://mybatis.org/schema/mybatis-spring 
    http://mybatis.org/schema/mybatis-spring.xsd"&gt;
            
  &lt;!-- 스프링의 DispatcherServet에게 정적인 자원을 알려준다.  --&gt;
  &lt;mvc:resources location="/images/" mapping="/images/**" /&gt;
  &lt;mvc:resources location="/css/" mapping="/css/**" /&gt;
        
  &lt;mvc:annotation-driven /&gt;
    
  &lt;context:component-scan
    base-package="net.java_school.controller,
      net.java_school.board, 
      net.java_school.user, " /&gt;

  &lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;

  &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE"/&gt;
    &lt;property name="username" value="java"/&gt;
    &lt;property name="password" value="school"/&gt;
    &lt;property name="maxActive" value="100"/&gt;
    &lt;property name="maxWait" value="1000"/&gt;
    &lt;property name="poolPreparedStatements" value="true"/&gt;
    &lt;property name="defaultAutoCommit" value="true"/&gt;
    &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
  &lt;/bean&gt;
    
  &lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
    &lt;property name="configLocation" value="classpath:net/java_school/mybatis/Configuration.xml" /&gt;
  &lt;/bean&gt;

  &lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;
    &lt;property name="maxUploadSize" value="2097152" /&gt;
  &lt;/bean&gt;
    
  &lt;!-- ViewResolver --&gt;
  &lt;bean id="internalResourceViewResolver" 
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
    &lt;property name="viewClass"&gt;
      &lt;value&gt;org.springframework.web.servlet.view.JstlView&lt;/value&gt;
    &lt;/property&gt;
    &lt;property name="prefix"&gt;
      &lt;value&gt;/WEB-INF/views/&lt;/value&gt;
    &lt;/property&gt;
    &lt;property name="suffix"&gt;
      &lt;value&gt;.jsp&lt;/value&gt;
    &lt;/property&gt;
  &lt;/bean&gt;
  
  &lt;bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver"&gt;
    &lt;property name="defaultErrorView" value="error" /&gt;
    &lt;property name="exceptionMappings"&gt;
      &lt;props&gt;
        &lt;prop key="net.java_school.exception.AuthenticationException"&gt;
          <strong>403-error</strong>
        &lt;/prop&gt;
      &lt;/props&gt;
    &lt;/property&gt;
  &lt;/bean&gt;
&lt;/beans&gt;
</pre>

<h3>mvc.xml 설명</h3>

<pre class="prettyprint">
<strong>&lt;mvc:resources location=".." /&gt;</strong>
</pre>

<p>
이 설정은 디스패쳐 서블릿에 정적 자원의 위치를 알려준다.
</p>

<pre class="prettyprint">
<strong>&lt;context:component-scan base-package=".." /&gt;</strong>
</pre>

<p>
이 설정은 자동으로 빈을 스캔하여 빈 컨테이너에 등록한다.
스캔 되는 빈은 스프링 설정 파일에서 bean 엘리먼트를 사용하여 따로 등록하지 않아도 된다.
빈이 자동 스캔되려면 base-package 패키지에 속하면서, 동시에 클래스 선언 위에 컴포넌트임을 표시하는 어노테이션이 있어야 한다.
이때, 클래스 선언 위에 @Controller, @Repository 어노테이션이 있는 클래스는 어노테이션의 이름대로 취급된다.
@Repository는 DAO 클래스에 사용한다.
클래스 선언 위에 @Component와 @Service 어노테이션은 클래스가 단지 자동 스캔 대상이라는 사실만을 표시하며, 그 외 특별하게 취급되는 사항은 없다.
</p>

<pre class="prettyprint">
<strong>&lt;mvc:annotation-driven /&gt;</strong>
</pre>

<p>
어노테이션 기반으로 동작하는 스프링 애플리케이션은 이 설정이 필요하다.
</p>

<pre class="prettyprint">
<strong>&lt;mybatis:scan base-package=".." /&gt;</strong>
</pre>

<p>
base-package 속성에 매퍼 인터페이스의 패키지를 지정하면, 마이바티스 스프링 연동 빈즈가 스캔된다.
이 설정을 이용하면 아래 설정을 생략할 수 있다.
</p>

<pre class="prettyprint">
&lt;bean id="boardMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.BoardMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<pre class="prettyprint">
<strong>&lt;bean id="dataSource" ..&gt;</strong>
</pre>

<p>
dataSource 정의는 스프링 JDBC를 사용하든지 마이바티스를 사용하든지 상관없이 언제나 필요하다.
</p>

<pre class="prettyprint">
<strong>&lt;bean id="sqlSessionFactory" ..&gt;</strong>
</pre>

<p>
모든 MyBatis 애플리케이션은 SqlSessionFactory 인터테이스 타입의 인스턴스를 사용해야 한다.
마이바티스 스프링 연동모듈에서는 SqlSessionFactoryBean를 사용한다.
</p>

<pre class="prettyprint">
<strong>&lt;bean id="multipartResolver" ..&gt;</strong>
</pre>

<p>
파일 업로드를 위한 설정이다.
파일을 업로드할 때 HttpServletRequest의 래퍼가 컨트롤러에 전달된다.
컨트롤러에서 업로드된 파일을 처리하는 메소드는 래퍼를 MultiPartHttpServletRequest 인터페이스로 캐스팅해야 서버로 전달된 멀티파트 파일을 다룰 수 있게 된다.
</p>

<p>
&lt;!-- ViewResolver --&gt; 부분은 컨트롤러가 반환하는 문자열로부터 뷰를 해석하는 방법이다.
</p>

<pre class="prettyprint">
&lt;bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver"&gt;
</pre>

<p>
스프링 MVC 예외 처리에 대한 설정이다.
스프링 MVC에는 여러 가지 예외 처리 방법이 있다.
이 중에서 SimpleMappingExceptionResolver를 이용하는 것이 가장 사용하기 쉽다.
설정대로라면 AuthenticationException 예외가 발생하면 선택되는 뷰는 403-error이다.
403-error 역시 뷰리졸브의 의해 /WEB-INF/views/403-error.jsp로 해석된다.
이 파일은 정확한 위치에 생성한다. 간단히 "접근거부"라고 보여주면 된다.
참고로, /403-error에 대한 요청은 컨트롤러에서 매핑하지 않아도 된다.
이 밖의 다른 예외가 발생하면 다음 설정이 에러를 처리한다. 
</p>

<pre class="prettyprint">
&lt;property name="defaultErrorView" value="error" /&gt;
</pre>

<p>
/WEB-INF/views/error.jsp는 이전 예제의 error.jsp 파일이다.
이밖에 404와 500 HTTP 상태 코드에 대해서는 web.xml에서 error-page 엘리먼트로 설정했다.
</p>

<h3>게시판</h3>

<p>
Configuration.xml의 설정대로, BoardMapper.xml 파일을 UserMapper.xml와 같은 위치에 만든다.
</p>

<h6 class="src">BoardMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.BoardMapper"&gt;

    &lt;select id="selectListOfArticles" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title, regdate, hit, name, attachfileNum, commentNum 
    FROM (
        SELECT rownum r,a.* 
            FROM (
                SELECT 
                    a.articleno, a.title, a.regdate, a.hit, m.name,
                    COUNT(DISTINCT(f.attachfileno)) attachfileNum, 
                    COUNT(DISTINCT(c.commentno)) commentNum
                FROM 
                    article a, attachfile f, comments c, member m
                WHERE
                    a.articleno = f.articleno(+)
                    AND a.articleno = c.articleno(+)
                    AND a.email = m.email(+)
                    AND a.boardcd = \#{boardCd}
                    &lt;if test="searchWord != null and searchWord != ''"&gt;
                    AND (title LIKE '%\${searchWord}%' OR DBMS_LOB.INSTR(content, \#{searchWord}) &gt; 0)
                    &lt;/if&gt;
                GROUP BY a.articleno, title, a.regdate, hit, m.name
                ORDER BY articleno DESC
                ) a
        )
    WHERE r BETWEEN \#{start} AND \#{end}
    &lt;/select&gt;

    &lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
        SELECT count(*) FROM article WHERE boardcd = \#{boardCd}
            &lt;if test="searchWord != null and searchWord != ''"&gt;
            AND (title LIKE '%\${searchWord}%' OR DBMS_LOB.INSTR(content, \#{searchWord}) &gt; 0)
            &lt;/if&gt;
    &lt;/select&gt;

    &lt;insert id="insert" parameterType="Article" useGeneratedKeys="true"&gt;
        &lt;selectKey keyProperty="articleNo" resultType="int" order="BEFORE"&gt;
            SELECT seq_article.nextval FROM dual
        &lt;/selectKey&gt;
        INSERT INTO article (articleNo, boardCd, title, content, email, hit, regdate)
        VALUES
        (\#{articleNo}, \#{boardCd}, \#{title}, \#{content}, \#{email}, 0, sysdate)
    &lt;/insert&gt;

    &lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
        INSERT INTO attachfile (attachfileno, filename, filetype, filesize, articleno, email)
        VALUES
        (seq_attachfile.nextval, \#{filename}, \#{filetype}, \#{filesize}, \#{articleNo}, \#{email})
    &lt;/insert&gt;
    
    &lt;update id="update" parameterType="Article"&gt;
        UPDATE article 
        SET title = \#{title}, content = \#{content} 
        WHERE articleno = \#{articleNo}
    &lt;/update&gt;
    
    &lt;delete id="delete" parameterType="int"&gt;
        DELETE FROM article WHERE articleno = \#{articleNo}
    &lt;/delete&gt;
    
    &lt;update id="updateHitPlusOne" parameterType="int"&gt;
        UPDATE article SET hit = hit + 1 WHERE articleno = \#{articleNo}
    &lt;/update&gt;
    
    &lt;select id="selectOne" parameterType="int" resultType="Article"&gt;
        SELECT 
            articleno, 
            title, 
            content, 
            a.email, 
            NVL(name, 'Anonymous') name, 
            hit, 
            regdate
        FROM article a, member m
        WHERE a.email = m.email(+) AND articleno = \#{articleNo}
    &lt;/select&gt;
    
    &lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
        SELECT articleno, title
        FROM
            (SELECT rownum r,a.*
            FROM
                (SELECT articleno, title 
                FROM article 
                WHERE 
                    boardCd = \#{boardCd} 
                    AND articleno &gt; \#{articleNo}
                &lt;if test="searchWord != null and searchWord != ''"&gt;
                    AND (title LIKE '%\${searchWord}%' OR DBMS_LOB.INSTR(content, \#{searchWord}) &gt; 0)
                &lt;/if&gt;
                ORDER BY articleno) 
            a)
        WHERE r = 1
    &lt;/select&gt;
    
    &lt;select id="selectPrevOne" parameterType="hashmap" resultType="Article"&gt;
        SELECT articleno, title
        FROM
            (SELECT rownum r,a.*
            FROM
                (SELECT articleno, title 
                FROM article 
                WHERE 
                    boardCd = \#{boardCd} 
                    AND articleno &lt; \#{articleNo}
                &lt;if test="searchWord != null and searchWord != ''"&gt;
                    AND (title LIKE '%\${searchWord}%' OR DBMS_LOB.INSTR(content, \#{searchWord}) &gt; 0)
                &lt;/if&gt; 
                ORDER BY articleno DESC)
            a)
        WHERE r = 1
    &lt;/select&gt;
    
    &lt;select id="selectListOfAttachFiles" parameterType="int" resultType="AttachFile"&gt;
        SELECT 
            attachfileno, 
            filename, 
            filetype, 
            filesize, 
            articleno, 
            email
        FROM attachfile 
        WHERE articleno = \#{articleNo} 
        ORDER BY attachfileno
    &lt;/select&gt;
    
    &lt;delete id="deleteFile" parameterType="int"&gt;
        DELETE FROM attachfile WHERE attachfileno = \#{attachFileNo}
    &lt;/delete&gt;
    
    &lt;select id="selectOneBoard" parameterType="string" resultType="string"&gt;
        SELECT * FROM board WHERE boardcd = \#{boardCd}
    &lt;/select&gt;
    
    &lt;insert id="insertComment" parameterType="Comment"&gt;
        INSERT INTO comments (commentno, articleno, email, memo, regdate)
        VALUES (seq_comments.nextval, \#{articleNo}, \#{email}, \#{memo}, sysdate)
    &lt;/insert&gt;
    
    &lt;update id="updateComment" parameterType="Comment"&gt;
        UPDATE comments SET memo = \#{memo} WHERE commentno = \#{commentNo}
    &lt;/update&gt;
    
    &lt;delete id="deleteComment" parameterType="int"&gt;
        DELETE FROM comments WHERE commentno = \#{commentNo}
    &lt;/delete&gt;

    &lt;select id="selectListOfComments" parameterType="int" resultType="Comment"&gt;
        SELECT 
            commentno, 
            articleno, 
            c.email, 
            NVL(name,'Anonymous') name, 
            memo, 
            regdate
        FROM comments c, member m
        WHERE 
            c.email = m.email(+)
            AND articleno = \#{articleNo}
        ORDER BY commentno DESC
    &lt;/select&gt;

    &lt;select id="selectOneAttachFile" parameterType="int" resultType="AttachFile"&gt;
        SELECT 
            attachfileno, 
            filename, 
            filetype, 
            filesize, 
            articleno, 
            email
        FROM attachfile
        WHERE attachfileno = \#{attachFileNo}
    &lt;/select&gt;
    
    &lt;select id="selectOneComment" parameterType="int" resultType="Comment"&gt;
        SELECT 
            commentno,
            articleno,
            email,
            memo,
            regdate 
        FROM comments 
        WHERE commentno = \#{commentNo}
    &lt;/select&gt;

&lt;/mapper&gt;
</pre>

<h3>MyBatis에서 인서트 후 고유번호가 반환되게 하는 방법</h3>

<p>
<em>&lt;insert id="insert" ..&gt;</em>부분이 새 글을 추가할 때 쓰인다.<br />
모델 2 게시판의 BoardDao.insert() 메소드는<br />
<em>INSERT INTO article (articleno, boardcd, title, content, email, hit, regdate)<br />
VALUES (<strong>SEQ_ARTICLE.nextval</strong>, ?, ?, ?, ?, 0, sysdate);</em><br />
문이 성공한 후 첨부 파일이 있으면<br />
<em>INSERT INTO attachfile (attachfileno, filename, filetype, filesize, articleno, email)<br />
VALUES (SEQ_ATTACHFILE.nextval, ?, ?, ?, <strong>SEQ_ARTICLE.currval</strong>, ?)</em>문을 이어서 실행하는 것으로 글쓰기를 구현했다.<br />
이렇듯 JDBC를 쓰는 상황에서는 모든 것이 분명하다.
하지만 JDBC 위에서 동작하는 프레임워크를 사용하는 상황에서는 JDBC를 사용할 때 분명해 보이던 것에 대한 해법을 찾기가 쉽지 않다.
</p>

<p>
마이바티스에서 DML은 일반적으로 바뀐 행수가 반환한다.
인서트 문장이 실행된 후 고유번호가 반환되기를 원한다면 useGeneratedKeys="true" 속성이 있어야 하고, 오라클과 같이 자동 증가 칼럼이 없는 경우엔 selectKey 서브 엘리먼트를 사용해야 한다.
</p>

<pre class="prettyprint">
&lt;insert id="insert" parameterType="Article" useGeneratedKeys="true"&gt;
    &lt;selectKey keyProperty="articleNo" resultType="int" order="BEFORE"&gt;
        SELECT seq_article.nextval FROM dual
    &lt;/selectKey&gt;
    INSERT INTO article (articleNo, boardCd, title, content, email, hit, regdate)
    VALUES
    (\#{articleNo}, \#{boardCd}, \#{title}, \#{content}, \#{email}, 0, sysdate)
&lt;/insert&gt;
</pre>

<p>
이외에도 MyBatis와 연동하면서 바뀐 내용은 다음과 같다.<br />
모델 2의 게시글 수정 메소드는<br />
<em>UPDATE article SET title = ?, content = ? WHERE articleno = ?</em><br />
을 실행한 후에 첨부 파일이 있다면<br />
<em>INSERT INTO attachfile<br />
(attachfileno, filename, filetype, filesize, articleno, email)<br />
VALUES (SEQ_ATTACHFILE.nextval, ?, ?, ?, ?, ?)</em>을 연이어 실행하는 구조였으나 Spring MVC 프로젝트에서는 update()와 insertAttachFile() 메소드의 조합으로 이를 대신했다.
</p>

<p>
모델 2의 게시글 삭제 메소드는<br />
DELETE FROM comments WHERE articleno = ?<br />
DELETE FROM attachfile WHERE articleno = ?<br />
DELETE FROM article WHERE articleno = ?을 하나의 트랜잭션으로 실행하는 것이었다.<br />
Spring MVC 프로젝트에서는 간단한 구현을 위해<br />
DELETE FROM article WHERE articleno = ?만 실행하는 것으로 구현한다.<br />
</p>

<p>
BoardMapper.xml에 맞게 BoardMapper.java를 아래와 같이 만든다.
</p>

<h6 class="src">BoardMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import java.util.HashMap;
import java.util.List;

import net.java_school.board.Article;
import net.java_school.board.AttachFile;
import net.java_school.board.Comment;

public interface BoardMapper {

  //목록
  public List&lt;Article&gt; selectListOfArticles(HashMap&lt;String, String&gt; hashmap);  

  //총 레코드
  public int selectCountOfArticles(HashMap&lt;String, String&gt; hashmap);

  //글쓰기
  public int insert(<strong>Article article</strong>);   

  <strong>//첨부 파일 추가
  public void insertAttachFile(AttachFile attachFile);</strong>

  //글수정
  public void update(<strong>Article article</strong>);  

  //글삭제
  public void delete(int articleNo);

  //조회 수 증가
  public void updateHitPlusOne(int articleNo);  

  //상세보기
  public Article selectOne(int articleNo);

  //다음 글
  public Article selectNextOne(<strong>HashMap&lt;String, String&gt; hashmap</strong>); 

  //이전 글 
  public Article selectPrevOne(<strong>HashMap&lt;String, String&gt; hashmap</strong>);

  //첨부 파일 리스트  
  public List&lt;AttachFile&gt; selectListOfAttachFiles(int articleNo);    

  //첨부 파일 삭제  
  public void deleteFile(int attachFileNo); 

  //게시판
  public String selectOneBoard(String boardCd);

  //댓글 쓰기 
  public void insertComment(Comment comment);   

  //댓글 수정 
  public void updateComment(Comment comment);

  //댓글 삭제
  public void deleteComment(int commentNo);

  //댓글 리스트
  public List&lt;Comment&gt; selectListOfComments(int articleNo);

  //첨부 파일 찾기
  public AttachFile selectOneAttachFile(int attachFileNo);

  //댓글 찾기
  public Comment selectOneComment(int commentNo);

} 
</pre>

<p>
모델 2의 BoardService.java를 인터페이스로 바꾼다.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">package net.java_school.board;

import java.util.List;

public interface BoardService {

  //목록
  public <strong>List&lt;Article&gt;</strong> getArticleList(String boardCd, String searchWord, <strong>Integer startRecord, Integer endRecord</strong>);

  //총 레코드
  public int getTotalRecord(String boardCd, String searchWord);

  //글쓰기
  public int addArticle(<strong>Article article</strong>);

  <strong>//첨부 파일 추가 
  public void addAttachFile(AttachFile attachFile);</strong>

  //글 수정 
  public void modifyArticle(<strong>Article article</strong>);

  //글 삭제 
  public void removeArticle(int articleNo);

  //조회 수 증가 
  public void increaseHit(int articleNo);

  //상세보기 
  public Article getArticle(int articleNo);

  //다음 글 
  public Article getNextArticle(int articleNo, 
      String boardCd, String searchWord);

  //이전 글 
  public Article getPrevArticle(int articleNo, 
      String boardCd, String searchWord);

  //첨부 파일 리스트 
  public <strong>List&lt;AttachFile&gt;</strong> getAttachFileList(int articleNo);

  //첨부 파일 삭제 
  public void removeAttachFile(int attachFileNo);

  //게시판 
  public Board getBoard(String boardCd);

  //댓글 쓰기 
  public void addComment(Comment comment);

  //댓글 수정 
  public void modifyComment(Comment comment);

  //댓글 삭제 
  public void removeComment(int commentNo);

  //댓글 리스트 
  public <strong>List&lt;Comment&gt;</strong> getCommentList(int articleNo);

  //첨부 파일 찾기 
  public AttachFile getAttachFile(int attachFileNo);

  //댓글 찾기 
  public Comment getComment(int commentNo);
}
</pre>

<p>
BoardService 인터페이스의 구현체 BoardServiceImpl.java를 net.java_school.board 패키지에 만든다.
</p>

<h6 class="src">BoardServiceImpl.java</h6>
<pre class="prettyprint">package net.java_school.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.java_school.mybatis.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardMapper boardMapper;

  //목록 
  @Override
  public <strong>List&lt;Article&gt;</strong> getArticleList(String boardCd, String searchWord, <strong>Integer startRecord, Integer endRecord</strong>) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    hashmap.put("start", startRecord.toString());
    hashmap.put("end", endRecord.toString());

    return boardMapper.selectListOfArticles(hashmap);
  }
    
  //총 레코드 
  @Override 
  public int getTotalRecord(String boardCd, String searchWord) {
    HashMap&lt;String,String&gt; hashmap = new HashMap&lt;String,String&gt;();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    
    return boardMapper.selectCountOfArticles(hashmap);
  }
    
  //글쓰기 
  @Override
  public int addArticle(Article article) {
    return boardMapper.insert(article);
  }

  //첨부 파일 추가 
  @Override
  public void addAttachFile(AttachFile attachFile) {
    boardMapper.insertAttachFile(attachFile);
  }

  //글 수정 
  @Override
  public void modifyArticle(Article article) {
    boardMapper.update(article);
  }

  //글 삭제
  @Override
  public void removeArticle(int articleNo) {
    boardMapper.delete(articleNo);
  }

  //조회 수 증가 
  @Override
  public void increaseHit(int articleNo) {
    boardMapper.updateHitPlusOne(articleNo);
  }

  //상세보기 
  @Override
  public Article getArticle(int articleNo) {
    return boardMapper.selectOne(articleNo);
  }

  //다음 글 
  @Override
  public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectNextOne(hashmap);
  }

  //이전 글 
  @Override
  public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectPrevOne(hashmap);
  }

  //첨부 파일 리스트 
  @Override
  public <strong>List&lt;AttachFile&gt;</strong> getAttachFileList(int articleNo) {
    return boardMapper.selectListOfAttachFiles(articleNo);
  }

  //첨부 파일 삭제 
  @Override
  public void removeAttachFile(int attachFileNo) {
    boardMapper.deleteFile(attachFileNo);
  }

  //게시판 
  @Override
  public Board getBoard(String boardCd) {
    return boardMapper.selectOneBoard(boardCd);
  }

  //댓글 쓰기 
  @Override
  public void addComment(Comment comment) {
    boardMapper.insertComment(comment);
  }

  //댓글 수정 
  @Override
  public void modifyComment(Comment comment) {
    boardMapper.updateComment(comment);
  }

  //댓글 삭제 
  @Override
  public void removeComment(int commentNo) {
    boardMapper.deleteComment(commentNo);
  }

  //댓글 리스트 
  @Override
  public <strong>List&lt;Comment&gt;</strong> getCommentList(int articleNo) {
    return boardMapper.selectListOfComments(articleNo);
  }

  //첨부 파일 찾기 
  @Override
  public AttachFile getAttachFile(int attachFileNo) {
    return boardMapper.selectOneAttachFile(attachFileNo);
  }

  //댓글 찾기 
  @Override
  public Comment getComment(int commentNo) {
    return boardMapper.selectOneComment(commentNo);
  }
}
</pre>

<p>
게시판과 관련된 모든 요청을 담당하는 컨트롤러를 만들어야 한다.
그 전에 페이징 처리를 위한 클래스를 작성한다.
</p>

<h6 class="src">NumbersForPaging.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class NumbersForPaging {
  private int totalPage;
  private int firstPage;
  private int lastPage;
  private int prevBlock;
  private int nextBlock;
  private int listItemNo;
  
  public int getTotalPage() {
    return totalPage;
  }
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public int getFirstPage() {
    return firstPage;
  }
  public void setFirstPage(int firstPage) {
    this.firstPage = firstPage;
  }
  public int getLastPage() {
    return lastPage;
  }
  public void setLastPage(int lastPage) {
    this.lastPage = lastPage;
  }
  public int getPrevBlock() {
    return prevBlock;
  }
  public void setPrevBlock(int prevBlock) {
    this.prevBlock = prevBlock;
  }
  public int getNextBlock() {
    return nextBlock;
  }
  public void setNextBlock(int nextBlock) {
    this.nextBlock = nextBlock;
  }
  public int getListItemNo() {
    return listItemNo;
  }
  public void setListItemNo(int listItemNo) {
    this.listItemNo = listItemNo;
  }
  
}
</pre>

<h6 class="src">Paginator.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class Paginator {

  public NumbersForPaging getNumbersForPaging(int totalRecord, int page, int numPerPage, int pagePerBlock) {
    int totalPage = totalRecord / numPerPage;
    if (totalRecord % numPerPage != 0) totalPage++;
    int totalBlock = totalPage / pagePerBlock;
    if (totalPage % pagePerBlock != 0) totalBlock++;
    int block = page / pagePerBlock;
    if (page % pagePerBlock != 0) block++;
    int firstPage = (block - 1) * pagePerBlock + 1;
    int lastPage = block * pagePerBlock;
    int prevPage = 0;
    if (block &gt; 1) {
      prevPage = firstPage - 1;
    }
    int nextPage = 0;
    if (block &lt; totalBlock) {
      nextPage = lastPage + 1;
    }
    if (block &gt;= totalBlock) {
      lastPage = totalPage;
    }
    int listItemNo = totalRecord - (page - 1) * numPerPage;
    
    NumbersForPaging numbers = new NumbersForPaging();
    
    numbers.setTotalPage(totalPage);
    numbers.setFirstPage(firstPage);
    numbers.setLastPage(lastPage);
    numbers.setPrevBlock(prevPage);
    numbers.setNextBlock(nextPage);
    numbers.setListItemNo(listItemNo);
    
    return numbers;
  }

}
</pre>

<p>
BbsController.java 클래스를 net.java_school.controller 패키지에 만든다.
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
package net.java_school.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import net.java_school.board.Article;
import net.java_school.board.AttachFile;
import net.java_school.board.BoardService;
import net.java_school.board.Comment;
import net.java_school.commons.WebContants;
import net.java_school.exception.AuthenticationException;
import net.java_school.user.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/bbs")
public class BbsController <strong>extends Paginator</strong> {

  @Autowired
  private BoardService boardService;

  @RequestMapping(value="/list", method=RequestMethod.GET)
  public String list(String boardCd, 
      Integer page, 
      String searchWord,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      //로그인 후 되돌아갈 URL을 구한다.
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    int numPerPage = 10;
    int pagePerBlock = 10;

    int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

    NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);
    //oracle
    Integer startRecord = (page - 1) * numPerPage + 1;
    Integer endRecord = page * numPerPage;

    HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
    map.put("boardCd", boardCd);
    map.put("searchWord", searchWord);
    map.put("start", startRecord.toString());
    map.put("end", endRecord.toString());
    List&lt;Article&gt; list = boardService.getArticleList(map);
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    
    Integer listItemNo = numbers.getListItemNo();
    Integer prevPage = numbers.getPrevBlock();
    Integer nextPage = numbers.getNextBlock();
    Integer firstPage = numbers.getFirstPage();
    Integer lastPage = numbers.getLastPage();

    model.addAttribute("list", list);
    model.addAttribute("boardName", boardName);
    model.addAttribute("listItemNo", listItemNo);
    model.addAttribute("prevPage", prevPage);
    model.addAttribute("nextPage", nextPage);
    model.addAttribute("firstPage", firstPage);
    model.addAttribute("lastPage", lastPage);

    return "bbs/list";

  }

  @RequestMapping(value="/write", method=RequestMethod.GET)
  public String writeForm(String boardCd,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      //로그인 후 되돌아갈 URL을 구한다.
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    //게시판 이름
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    model.addAttribute("boardName", boardName);

    return "bbs/write";
  }

  @RequestMapping(value="/write", method=RequestMethod.POST)
  public String write(MultipartHttpServletRequest mpRequest,
      HttpSession session) throws Exception {

    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    String boardCd = mpRequest.getParameter("boardCd");
    String title = mpRequest.getParameter("title");
    String content = mpRequest.getParameter("content");

    Article article = new Article();
    article.setBoardCd(boardCd);
    article.setTitle(title);
    article.setContent(content);
    article.setEmail(user.getEmail());

    boardService.addArticle(article);

    //파일 업로드
    Iterator&lt;String&gt; it = mpRequest.getFileNames();
    List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
    while (it.hasNext()) {
      MultipartFile multiFile = mpRequest.getFile((String) it.next());
      if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
      }
    }

    //파일데이터 삽입
    int size = fileList.size();
    for (int i = 0; i &lt; size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(article.getArticleNo());
      attachFile.setEmail(user.getEmail());
      boardService.addAttachFile(attachFile);
    }

    return "redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
  }

  @RequestMapping(value="/view", method=RequestMethod.GET)
  public String view(Integer articleNo, 
      String boardCd, 
      Integer page,
      String searchWord,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      //로그인 후 되돌아갈 URL을 구한다.
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    /*
        상세보기를 할 때마다 조회 수를 1 증가
        하단에 목록에서 조회 수를 제대로 보기 위해서는
        목록 레코드를 페치하기 전에 조회 수를 먼저 증가시켜야 한다.
        TODO : 사용자 IP와 시간을 고려해서 조회 수를 증가하도록
     */
    boardService.increaseHit(articleNo);

    Article article = boardService.getArticle(articleNo);//상세보기에서 볼 게시글
    List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
    Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
    Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
    List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);

    //상세보기에서 볼 게시글 관련 정보
    String title = article.getTitle();//제목
    String content = article.getContent();//내용
    content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
    int hit = article.getHit();//조회 수
    String name = article.getName();//작성자 이름
    String email = article.getEmail();//작성자 ID
    String regdate = article.<strong>getRegdateForView()</strong>;//작성일

    model.addAttribute("title", title);
    model.addAttribute("content", content);
    model.addAttribute("hit", hit);
    model.addAttribute("name", name);
    model.addAttribute("email", email);
    model.addAttribute("regdate", regdate);
    model.addAttribute("attachFileList", attachFileList);
    model.addAttribute("nextArticle", nextArticle);
    model.addAttribute("prevArticle", prevArticle);
    model.addAttribute("commentList", commentList);

    //목록 관련
    int numPerPage = 10;//페이지당 레코드 수
    int pagePerBlock = 10;//블록당 페이지 링크 수

    int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

    NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

    //oracle
    Integer startRecord = (page - 1) * numPerPage + 1;
    Integer endRecord = page * numPerPage;

    HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
    map.put("boardCd", boardCd);
    map.put("searchWord", searchWord);
    map.put("start", startRecord.toString());
    map.put("end", endRecord.toString());
    List&lt;Article&gt; list = boardService.getArticleList(map);
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    
    int listItemNo = numbers.getListItemNo();
    int prevPage = numbers.getPrevBlock();
    int nextPage = numbers.getNextBlock();
    int firstPage = numbers.getFirstPage();
    int lastPage = numbers.getLastPage();

    model.addAttribute("list", list);
    model.addAttribute("listItemNo", listItemNo);
    model.addAttribute("prevPage", prevPage);
    model.addAttribute("firstPage", firstPage);
    model.addAttribute("lastPage", lastPage);
    model.addAttribute("nextPage", nextPage);
    model.addAttribute("boardName", boardName);

    return "bbs/view";
  }

  @RequestMapping(value="/addComment", method=RequestMethod.POST)
  public String addComment(Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      String memo,
      HttpSession session) throws Exception {

    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    Comment comment = new Comment();
    comment.setArticleNo(articleNo);
    comment.setEmail(user.getEmail());
    comment.setMemo(memo);

    boardService.addComment(comment);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/updateComment", method=RequestMethod.POST)
  public String updateComment(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord, 
      String memo,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Comment comment = boardService.getComment(commentNo);

    //로그인 사용자가 댓글 소유자인지  검사
    if (user == null || !user.getEmail().equals(comment.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    //생성된 Comment 객체를 재사용한다.
    comment.setMemo(memo);
    boardService.modifyComment(comment);

    searchWord = URLEncoder.encode(searchWord, "UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/deleteComment", method=RequestMethod.POST)
  public String deleteComment(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Comment comment = boardService.getComment(commentNo);

    //로그인 사용자가 댓글의 소유자인지 검사
    if (user == null || !user.getEmail().equals(comment.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeComment(commentNo);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/modify", method=RequestMethod.GET)
  public String modifyForm(Integer articleNo, 
      String boardCd,
      HttpSession session,
      Model model) {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Article article = boardService.getArticle(articleNo);

    //로그인 사용자가 글 작성자인지 검사
    if (user == null || !user.getEmail().equals(article.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    //수정페이지에서의 보일 게시글 정보
    String title = article.getTitle();
    String content = article.getContent();
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();

    model.addAttribute("title", title);
    model.addAttribute("content", content);
    model.addAttribute("boardName", boardName);

    return "bbs/modify";
  }

  @RequestMapping(value="/modify", method=RequestMethod.POST)
  public String modify(MultipartHttpServletRequest mpRequest,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    int articleNo = Integer.parseInt(mpRequest.getParameter("articleNo"));
    Article article = boardService.getArticle(articleNo);

    //로그인 사용자가 글 작성자인지 검사
    if (!article.getEmail().equals(user.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    String boardCd = mpRequest.getParameter("boardCd");
    int page = Integer.parseInt(mpRequest.getParameter("page"));
    String searchWord = mpRequest.getParameter("searchWord");

    String title = mpRequest.getParameter("title");
    String content = mpRequest.getParameter("content");

    //게시글 수정
    article.setTitle(title);
    article.setContent(content);
    article.setBoardCd(boardCd);
    boardService.modifyArticle(article);

    //파일 업로드
    Iterator&lt;String&gt; it = mpRequest.getFileNames();
    List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
    while (it.hasNext()) {
      MultipartFile multiFile = mpRequest.getFile((String) it.next());
      if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
      }
    }

    //파일데이터 삽입
    int size = fileList.size();
    for (int i = 0; i &lt; size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(articleNo);
      attachFile.setEmail(user.getEmail());
      boardService.addAttachFile(attachFile);
    }

    searchWord = URLEncoder.encode(searchWord,"UTF-8");
    return "redirect:/bbs/view?articleNo=" + articleNo 
        + "&amp;boardCd=" + boardCd 
        + "&amp;page=" + page 
        + "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/download", method=RequestMethod.POST)
  public String download(String filename, HttpSession session, Model model) {
    //로그인 체크
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    model.addAttribute("filename", filename);
    return "inc/download";

  }

  @RequestMapping(value="/deleteAttachFile", method=RequestMethod.POST)
  public String deleteAttachFile(Integer attachFileNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    AttachFile attachFile = boardService.getAttachFile(attachFileNo);

    //로그인 사용자가 첨부 파일 소유자인지 검사
    if (user == null || !user.getEmail().equals(attachFile.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeAttachFile(attachFileNo);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/del", method=RequestMethod.POST)
  public String del(Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    Article article = boardService.getArticle(articleNo);

    //로그인 사용자가 글 작성자인지 검사
    if (user == null || !user.getEmail().equals(article.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeArticle(articleNo);

    searchWord = URLEncoder.encode(searchWord, "UTF-8");

    return "redirect:/bbs/list?boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

}
</pre>

<h3>BbsController.java에 적용된 어노테이션 설명</h3>

<p>
다음은 컨트롤러에 적용된 어노테이션을 정리한 것이다.
</p>

<ul>
  <li>@Controller는 클래스가 컨트롤러 컴포넌트임을 표시한다.</li>
  <li>클래스 레벨의 @RequestMapping("/bbs")는 컨트롤러가 "/bbs"를 포함하는 모든 요청을 담당한다는 것을 표시한다.</li>
  <li>메소드 레벨의 @RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})는<br />
  메소드가 GET이나 POST 방식의 "/bbs/list" 요청에 매핑됨을 표시한다.</li>
  <li>멤버 변수에 @Autowired를 적용하면 변수의 접근자가 private이고 공개된 setter가 없어도 종속객체가 주입된다.</li>
</ul>

<h3>목록 요청</h3>

<p>
목록 요청 URL은 /bbs/list이다.
컨트롤러에서 이 요청을 메소드에 매핑하려면 메소드 레벨로 @RequestMapping을 사용한다.
</p>

<pre class="prettyprint">
@RequestMapping(value="list", method={RequestMethod.GET, RequestMethod.POST})
</pre>

<p>
클래스 레벨로 @RequestMapping("bbs")를 적용했기에, 위 메소드는 HTTP 프로토콜의 METHOD가 GET이나 POST 방식의 /bbs/list 요청에 매핑된다.
목록이라면 GET 방식이 맞을 것이다. GET 방식의 요청만을 매핑하려면 다음과 같이 고친다.
</p>

<pre class="prettyprint">
@RequestMapping(value="/list", method=RequestMethod.GET)
public String list(String boardCd, Integer page, String searchWord,...) {..}
</pre>

<p>
메소드 아규먼트 리스트 boardCd, page, searchWord에는 요청에 실려 오는 파라미터의 값이 할당된다.<br />
만약 파라미터 이름이 curPage이고 이 파라미터의 값을 할당받아야 하는 아규먼트 이름이 page라면 다음과 같이 해결한다.<br />
</p>

<pre>@RequestParam("curPage") String page</pre>

<p>
컨트롤러 메소드의 아규먼트를 파라미터의 이름과 같게 하면 쉽게 파라미터값을 받을 수 있다.<br />
파라미터 중에서 boardCd와 page는 필수적으로 전달되도록 구현해야 한다.<br />
searchWord는 사용자가 검색할 때만 전달된다.<br />
전달되는 파라미터값을 전부 받았음에도 아규먼트 리스트에서 HttpServletRequest가 있는 이유는 요청 URL을 구하기 위해서다.<br />
메소드 구현부에서 로그인 체크를 통과하지 못하면 로그인 페이지로 리다이렉트하면서 현재 요청 URL을 전달해야 하기 때문이다.<br />
HttpSession 타입의 아규먼트는 세션에 접근하기 위해서다.<br />
</p>

<pre class="prettyprint">
//로그인 체크
User user = (User) <strong>session</strong>.getAttribute(WebContants.USER_KEY);
if (user == null) {
    //로그인 후 되돌아갈 URL을 구한다.
    String url = <strong>req</strong>.getServletPath();
    String query = <strong>req</strong>.getQueryString();
    if (query != null) url += "?" + query;
    //로그인 페이지로 리다이렉트
    url = URLEncoder.encode(url, "UTF-8");
    return "redirect:/users/login?url=" + url;
}
</pre>

<p>
로그인 체크를 통과했다면 뷰로 전달할 데이터를 생산하는 비즈니스 로직이 이어진다.
</p>

<pre class="prettyprint">
int numPerPage = 10;
int pagePerBlock = 10;

int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

Integer startRecord = (page - 1) * numPerPage + 1;
Integer endRecord = page * numPerPage;
</pre>

<p>
목록을 구성하는 리스트, 게시판 이름, 목록 아이템의 번호, 이전 링크, 다음 링크, 첫 번째 페이지, 마지막 페이지 데이터를 생산한다.
</p>

<pre class="prettyprint">
HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
map.put("boardCd", boardCd);
map.put("searchWord", searchWord);
map.put("start", startRecord.toString());
map.put("end", endRecord.toString());
List&lt;Article&gt; list = boardService.getArticleList(map);
String boardName = boardService.getBoard(boardCd).getBoardNm_ko();

Integer listItemNo = numbers.getListItemNo();
Integer prevPage = numbers.getPrevBlock();
Integer nextPage = numbers.getNextBlock();
Integer firstPage = numbers.getFirstPage();
Integer lastPage = numbers.getLastPage();
</pre>

<h3>글쓰기 폼 요청</h3>

<p>
writeForm() 메소드는 GET 방식의 /bbs/write 요청에 매핑된다.
</p>

<pre class="prettyprint">
@RequestMapping(value="write", method=RequestMethod.GET)
public String writeForm(String boardCd,HttpServletRequest req,HttpSession session...)
</pre>

<p>
메소드 아규먼트로는 파라미터값을 받는 boardCd와 목록 메소드와 같은 이유로 req와 session이 있다.<br />
boardCd는 게시판 이름을 만드는 데 필요하다.<br />
page와 searchWord는 포워딩 되므로 아규먼트로 받을 특별한 이유가 없다.<br />
게시판은 로그인 사용자만 이용할 수 있으므로 메소드는 먼저 로그인 체크로 시작하고, 로그인 체크가 통과하면 게시판 이름을 생성하고 write.jsp로 포워딩한다.
</p>

<h3>글쓰기 처리 요청</h3>

<p>
write() 메소드는 POST 방식의 /bbs/write 요청에 매핑된다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="write", method=RequestMethod.POST)
public String write(MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception
</pre>

<p>
MultipartHttpServletRequest 타입의 mpRequest 아규먼트는 시스템에 전달된 파일에 접근할 수 있다.
</p>

<p>
메소드는. 먼저 로그인 여부를 판단한다.<br />
로그인되어 있지 않다면 AuthenticationException 예외를 발생시킨다.<br />
mvc.xml에 설정된 예외 리졸브에 의해서 뷰는 /WEB-INF/views/error.jsp가 선택된다.<br />
</p>

<pre class="prettyprint">
//로그인 체크
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<p>
로그인 체크를 통과하면 새 글을 테이블에 삽입한다.<br />
BoardMapper.xml 파일에서 설명했듯이, boardService.addArticle(article);가 실행되면 아규먼트인 article이 가리키는 Article 객체의 setArticleNo()가 호출되어 게시글 고유번호가 세팅된다.
</p>

<pre class="prettyprint">
String boardCd = mpRequest.getParameter("boardCd");
String title = mpRequest.getParameter("title");
String content = mpRequest.getParameter("content");

Article article = new Article();
article.setBoardCd(boardCd);
article.setTitle(title);
article.setContent(content);
article.setEmail(user.getEmail());

<strong>boardService.addArticle(article);</strong>
</pre>

<p>
테이블에 새 글 정보를 삽입한 후, 서버에 전달된 파일을 우리가 원하는 업로드 디렉터리로 옮긴다.<br />
글쓰기 폼 페이지에서는 첨부 파일을 하나만 올릴 수 있지만 메소드는 여러 파일을 올릴 수 있도록 구현했다.<br />
</p>

<pre class="prettyprint">
//파일 업로드
Iterator&lt;String&gt; it = mpRequest.getFileNames();
List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
while (it.hasNext()) {
    MultipartFile multiFile = mpRequest.getFile((String) it.next());
    if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
    }
}
</pre>

<p>
컨트롤러 메소드의 파라미터 중 MultipartHttpServletRequest 타입은 시스템에 전달된 파일에 접근할 수 있다.
위 코드는 전달된 파일을 다루는 방법을 보여준다.
</p>

<p>
스프링 MVC는 파일 업로드를 위해 아파치의 commons-fileupload를 지원한다.
개발자가 해야 할 일은 필요한 의존성을 추가하고, multipartResolver 빈을 설정하는 것이다.
</p>

<p>
파일 업로드를 위한 부분을 다시 살펴본다.
pom.xml에 다음 의존 라이브러리 설정이 필요하다.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/commons-io/commons-io --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;commons-io&lt;/groupId&gt;
  &lt;artifactId&gt;commons-io&lt;/artifactId&gt;
  &lt;version&gt;2.8.0&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;commons-fileupload&lt;/groupId&gt;
  &lt;artifactId&gt;commons-fileupload&lt;/artifactId&gt;
  &lt;version&gt;1.4&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
mvc.xml에 multipartResolver를 설정이 필요하다.
</p>

<pre class="prettyprint">
&lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;
  &lt;property name="maxUploadSize" value="2097152" /&gt;
&lt;/bean&gt;
</pre>

<p>
파일을 업로드 디렉터리에 옮겼다면 첨부 파일 테이블에 파일 정보를 인서트 한다.<br />
article.getArticleNo()로 테이블에 입력된 게시글의 고유번호를 얻을 수 있다.<br />
</p>

<pre class="prettyprint">
//파일데이터 삽입
int size = fileList.size();
for (int i = 0; i &lt; size; i++) {
    MultipartFile mpFile = fileList.get(i);
    AttachFile attachFile = new AttachFile();
    String filename = mpFile.getOriginalFilename();
    attachFile.setFilename(filename);
    attachFile.setFiletype(mpFile.getContentType());
    attachFile.setFilesize(mpFile.getSize());
    attachFile.setArticleNo(<strong>article.getArticleNo()</strong>);
    attachFile.setEmail(user.getEmail());
    boardService.addAttachFile(attachFile);
}
</pre>

<p>
글쓰기를 서버스의 addArticle(article)과 addAttachFile(attachFile) 2개의 메소드를 사용하여 구현하고 있다.
(모델 2에서는 서비스의 addArticle(article, attachFile); 메소드 하나로 구현했었다.)
</p>

<p>
마지막으로 포워딩이 아닌 리다이렉트로 이동해야 한다.
포워딩하면 문제가 발생할 수 있는데, 사용자가 F5키로 웹 브라우저를 리로딩하면 똑같은 정보로 글쓰기 처리가 다시 수행될 수 있기 때문이다.
리다이렉트로 이동할 때는 게시판 코드와 함께 page=1도 함께 전달해야 한다.
</p>

<pre class="prettyprint">
return redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
</pre>


<h3>상세보기 요청</h3>

<p>
상세보기 요청(/bbs/view)에 매핑되는 메소드는 view()이다.<br />
메소드에 전달되는 파라미터는 articleNo, boardCd, page, searchWord이다.<br />
메소드의 아규먼트로 이들 파라미터의 값을 전달받을 변수를 선언했다.<br />
포워드로 이동하지만 view.jsp에 필요한 데이터를 생산하기 위해 전달되는 파라미터 모두 필요하기 때문이다.<br /> 
그럼에도 HttpServletRequest 타입의 아규먼트 변수가 있는 것은 로그인 체크를 통과 못 했을 때 
요청 URL 정보를 로그인 페이지에 전달하기 위해서다.<br />
HttpSession 타입의 아규먼트는 로그인 체크를 하려면 세션의 저장된 값에 접근해야 하기 때문에 필요하다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/view", method=RequestMethod.GET)
public String view(Integer articleNo, 
        String boardCd, 
        Integer page,
        String searchWord,
        HttpServletRequest req,
        HttpSession session,
        Model model) throws Exception {
</pre>

<p>
메소드는 먼저 로그인 체크를 한다.<br />
로그인 체크를 통과하면 조회 수를 증가시킨 후에 상세보기 화면에 필요한 데이터를 생산한다.<br />
조회 수 증가는 사용자가 F5로 재로딩하면 계속 증가하는데, 
나중에 IP와 시간을 고려해서 증가하도록 후에 수정해야 할 것이다.<br />
IP와 시간을 고려한 조회 수 증가는 이 책에서는 다루지 않는다.<br />
</p>

<pre class="prettyprint">
/*
상세보기를 할 때마다 조회 수를 1 증가
하단에 목록에서 조회 수를 제대로 보기 위해서는
목록 레코드를 생산하기 전에 조회 수를 먼저 증가시켜야 한다.
TODO : 사용자 IP와 시간을 고려해서 조회 수를 증가하도록
*/
boardService.increaseHit(articleNo);

Article article = boardService.getArticle(articleNo);//상세보기에서 볼 게시글
List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);
String boardName = boardService.getBoard(boardCd).getBoardNm_ko();

//상세보기에서 볼 게시글 관련 정보
String title = article.getTitle();//제목
String content = article.getContent();//내용
content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
int hit = article.getHit();//조회 수
String name = article.getName();//작성자 이름
String email = article.getEmail();//작성자 ID
String regdate = article.getRegdateForView();//작성일

model.addAttribute("title", title);
model.addAttribute("content", content);
model.addAttribute("hit", hit);
model.addAttribute("name", name);
model.addAttribute("email", email);
model.addAttribute("regdate", regdate);
model.addAttribute("attachFileList", attachFileList);
model.addAttribute("nextArticle", nextArticle);
model.addAttribute("prevArticle", prevArticle);
model.addAttribute("commentList", commentList);
</pre>

<p>
상세보기 화면에도 목록이 있다.
이 부분을 위한 코드는 목록 메소드와 같다.<br />
</p>

<h3>댓글 쓰기 처리 요청</h3>

<p>
addComment() 메소드는 POST방식의 /bbs/addComment 요청에 매핑되는 메소드다.
</p>

<pre class="prettyprint">
@RequestMapping(value="/addComment", method=RequestMethod.POST)
public String addComment(Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        String memo,
        HttpSession session) throws Exception {
</pre>

<p>
댓글 쓰기 처리 후 상세보기 뷰로 리다이렉트될 것이므로 파라미터값을 저장할 아규먼트가 필요하다.<br /> 
로그인되어 있지 않다면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
//로그인 체크
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<p>
로그인 체크를 통과하면 파라미터값으로 댓글을 인서트 한다.<br />
</p>

<pre class="prettyprint">
Comment comment = new Comment();
comment.setArticleNo(articleNo);
comment.setEmail(user.getEmail());
comment.setMemo(memo);

boardService.addComment(comment);
</pre>

<p>
마지막으로 다시 상세보기 화면으로 리다이렉트해야 하는데,<br />
이때 검색어 searchWord는 한글일 수 있으므로 인코딩 작업을 한다.<br />
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord,"UTF-8");
</pre>

<p>
상세보기 뷰로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<h3>댓글 수정 요청</h3>

<p>
updateComment() 메소드는 POST 방식의 댓글 수정 요청 /bbs/updateComment에 매핑된다.
</p>

<pre class="prettyprint">
@RequestMapping(value="/updateComment", method=RequestMethod.POST)
public String updateComment(
        Integer commentNo, 
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord, 
        String memo,
        HttpSession session) throws Exception {
</pre>

<p>
구현은 먼저 로그인 여부와 글 소유자 여부를 동시에 검사한다.<br />
검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

Comment comment = boardService.getComment(commentNo);

//로그인 사용자가 댓글 소유자인지  검사
if (user == null || !user.getEmail().equals(comment.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
검사를 통과하면 파라미터로 댓글을 수정한다.<br />
댓글 수정은 댓글 내용만을 수정할 수 있다.<br />
즉, 관리자가 댓글을 수정하더라도 댓글의 소유자는 변경되지 않는 거로 구현했다.<br />
</p>

<pre class="prettyprint">
//생성된 Comment 객체를 재사용한다.
comment.setMemo(memo);
boardService.modifyComment(comment);
</pre>

<p>
마지막으로 상세보기 화면으로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord, "UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<h3>댓글 삭제 요청</h3>

<p>
deleteComment() 메소드는 POST방식의 /bbs/deleteComment 요청에 매핑되는 메소드다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/deleteComment", method=RequestMethod.POST)
public String deleteComment(
        Integer commentNo, 
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        HttpSession session) throws Exception {
</pre>

<p>
구현은 먼저 로그인 여부와 글 소유자 여부를 동시에 검사한다.<br />
검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

Comment comment = boardService.getComment(commentNo);

//로그인 사용자가 댓글의 소유자인지 검사
if (user == null || !user.getEmail().equals(comment.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
검사를 통과하면 해당 댓글을 삭제한다.<br />
</p>

<pre class="prettyprint">
boardService.removeComment(commentNo);
</pre>

<p>
마지막으로 상세보기 화면으로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord,"UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<h3>글 수정 폼 요청</h3>

<p>
modifyForm() 메소드는 GET 방식의 게시글 수정 폼 요청 /bbs/modify에 매핑되는 메소드다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/modify", method=RequestMethod.GET)
public String modifyForm(
        Integer <strong>articleNo</strong>, 
        String <strong>boardCd</strong>,
        HttpSession session,
        Model model) {
</pre>

<p>
로그인 검사와 글 소유자 검사를 한다.<br />
검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

Article article = boardService.getArticle(<strong>articleNo</strong>);

//로그인 사용자가 글 작성자인지 검사
if (user == null || !user.getEmail().equals(article.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
검사를 통과하면 게시글 수정 폼 화면에 필요한 데이터를 생산한다.<br />
마지막으로 게시글 수정 폼으로 포워드 한다.<br />
</p>

<pre class="prettyprint">
//수정 페이지에서의 보일 게시글 정보
String title = article.getTitle();
String content = article.getContent();
String boardName = boardService.getBoard(<strong>boardCd</strong>).getBoardNm_ko();
        
model.addAttribute("title", title);
model.addAttribute("content", content);
model.addAttribute("boardName", boardName);

return "bbs/modify";
</pre>

<h3>글 수정 처리 요청</h3>

<p>
modify() 메소드는 POST 방식의 글 수정 처리 요청 /bbs/modify에 매핑되는 메소드다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/modify", method=RequestMethod.POST)
public String modify(
        MultipartHttpServletRequest mpRequest,
        HttpSession session) throws Exception {
</pre>

<p>
글 소유자인지 검사한다.<br />
검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

int articleNo = Integer.parseInt(mpRequest.getParameter("articleNo"));
Article article = boardService.getArticle(articleNo);

//로그인 사용자가 글 작성자인지 검사
if (!article.getEmail().equals(user.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
전달된 파라미터 정보로 글을 수정한다.<br />
</p>

<pre class="prettyprint">
String boardCd = mpRequest.getParameter("boardCd");
int page = Integer.parseInt(mpRequest.getParameter("page"));
String searchWord = mpRequest.getParameter("searchWord");

String title = mpRequest.getParameter("title");
String content = mpRequest.getParameter("content");

//게시글 수정
article.setTitle(title);
article.setContent(content);
article.setBoardCd(boardCd);//TODO 게시판 종류 변경
boardService.modifyArticle(article);
</pre>

<p>
서버에 전달된 파일을 원하는 위치로 옮긴다.<br />
</p>

<pre class="prettyprint">
//파일 업로드
Iterator&lt;String&gt; it = mpRequest.getFileNames();
List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
while (it.hasNext()) {
    MultipartFile multiFile = mpRequest.getFile((String) it.next());
    if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
    }
}
</pre>

<p>
첨부 파일 데이터를 인서트 한다.<br />
글쓰기와 달리 게시글의 고유번호는 파라미터 articleNo이다.<br />
</p>

<pre class="prettyprint">
//파일데이터 삽입
int size = fileList.size();
for (int i = 0; i &lt; size; i++) {
    MultipartFile mpFile = fileList.get(i);
    AttachFile attachFile = new AttachFile();
    String filename = mpFile.getOriginalFilename();
    attachFile.setFilename(filename);
    attachFile.setFiletype(mpFile.getContentType());
    attachFile.setFilesize(mpFile.getSize());
    attachFile.setArticleNo(<strong>articleNo</strong>);
    attachFile.setEmail(user.getEmail());
    boardService.addAttachFile(attachFile);
}
</pre>

<p>
마지막으로 상세보기 화면으로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord,"UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo 
    + "&amp;boardCd=" + boardCd 
    + "&amp;page=" + page 
    + "&amp;searchWord=" + searchWord;
</pre>

<h3>첨부 파일 다운로드 요청</h3>

<p>
download() 메소드는 POST 방식의 파일 다운로드 요청 /bbs/download에 매핑되는 메소드다.<br />
사실 다운로드는 게시판이 아닌 다른 모듈에서도 이용될 수 있으므로 파일 다운로드만을 위한 컨트롤러를 
만들어 처리할 수 있다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/download", method=RequestMethod.POST)
    public String download(String filename, HttpSession session, Model model) {
</pre>

<p>
구현은 먼저 로그인을 했는지 검사한다.<br />
검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
//로그인 체크
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
    throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<p>
파일명을 download.jsp에 전달한다.<br />
우리의 프로그램에서는 JSP 페이지가 파일 다운로드를 실행한다.<br />
</p>

<pre class="prettyprint">
model.addAttribute("filename", filename);
return "inc/download";
</pre>

<h3>첨부 파일 삭제 처리 요청</h3>

<p>
deleteAttachFile() 메소드는 POST 방식의 첨부 파일 삭제 요청 /bbs/deleteAttachFile에 매핑되는 메소드다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/deleteAttachFile", method=RequestMethod.POST)
public String deleteAttachFile(
        Integer attachFileNo, 
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        HttpSession session) throws Exception {
</pre>

<p>
첨부 파일의 소유자인지 검사하고 검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
AttachFile attachFile = boardService.getAttachFile(attachFileNo);

//로그인 사용자가 첨부 파일 소유자인지 검사
if (user == null || !user.getEmail().equals(attachFile.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
검사를 통과하면 첨부 파일을 삭제하고 상세보기 화면으로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
boardService.removeAttachFile(attachFileNo);

searchWord = URLEncoder.encode(searchWord,"UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<h3>게시글 삭제 처리 요청</h3>

<p>
del() 메소드는 POST 방식의 게시글 삭제 처리 요청 /bbs/del에 매핑되는 메소드다.<br />
</p>

<pre class="prettyprint">
@RequestMapping(value="/del", method=RequestMethod.POST)
public String del(
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        HttpSession session) throws Exception {
</pre>

<p>
글 소유자 검사하고 검사를 통과하지 못하면 사용자 정의 인증 예외를 던진다.<br />
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
Article article = boardService.getArticle(articleNo);

//로그인 사용자가 글 작성자인지 검사
if (user == null || !user.getEmail().equals(article.getEmail())) {
    throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
검사를 통과하면 게시글을 삭제하고 목록으로 리다이렉트한다.<br />
</p>

<pre class="prettyprint">
boardService.removeArticle(articleNo);

searchWord = URLEncoder.encode(searchWord, "UTF-8");

return "redirect:/bbs/list?boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<h3>view.jsp에서 파일 다운로드 부분 수정</h3>

<p>
모델 2와 달리 첨부 파일을 단순히 링크를 거는 것이 아니라 자바의 입출력 클래스를 이용해서 파일을 다운로드하는 것으로 변경했다.<br />
view.jsp에 다음 자바스크립트 함수를 추가한다.<br />
</p>

<pre class="prettyprint">
function download(filename) {
    var form = document.getElementById("downForm");
    form.filename.value = filename;
    form.submit();
}
</pre>

<p>
하단 #form-group에 폼 엘리먼트를 추가한다.<br />
</p>

<pre class="prettyprint">
&lt;form id="downForm" action="download" method="post"&gt;
&lt;p&gt;
    &lt;input type="hidden" name="filename" /&gt;
&lt;/p&gt;
&lt;/form&gt;
</pre>

<p>
파일 다운로드 부분을 아래와 같이 변경한다.<br />
</p>

<pre class="prettyprint">
&lt;a href="javascript:download('\${file.filename }')"&gt;\${file.filename }&lt;/a&gt;
</pre>


<h3>테스트</h3>

<p>
Proejct Explorer 뷰에서 프로젝트를 선택한다.<br />
메이븐 프로젝트의 루트 디렉터리에서 명령 프롬프트로 다음과 같이 실행한다.<br />
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean compile war:inplace
</pre>

<p>
compile war:inplace은
<em class="path">C:\www\spring-bbs\src\main\webapp\WEB-INF\lib</em>
에 의존 라이브러리를 복사하고 
<em class="path">C:\www\spring-bbs\src\main\webapp\WEB-INF\classes</em>
에 자바 클래스를 컴파일한다.<br />
</p>

<p>
기존 ROOT.xml 톰캣 컨텍스트 파일을 수정한다.<br />
WEB-INF의 바로 위인 src/main/webapp가 DocumentBase이다.<br />
메이븐 프로젝트 루트 디렉터리가 C:/www/spring-bbs라면 컨텍스트 파일을 아래와 같이 작성한다.<br />
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="C:/www/spring-bbs/<strong>src/main/webapp</strong>"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
톰캣을 재실행한 다음<br />
http://localhost:8080/bbs/list?boarCd=chat&amp;page=1을 방문하여 테스트한다.<br />
JSP 프로젝트나 모델 2에서 테스트했던 데이터가 있다면 보일 것이다.<br />
데이터가 있다면 한글 검색을 테스트한다.<br />
한글 검색이 되지 않는다면 CATALINA_HOME/conf/server.xml 파일을 열고 다음 강조된 부분이 있는지 확인한다.<br />
</p>

<h6 class="src">server.xml</h6>
<pre class="prettyprint">&lt;Connector port="8080" protocol="HTTP/1.1"
  connectionTimeout="20000"
  <strong>URIEncoding="UTF-8"</strong>
  redirectPort="8443" /&gt;
</pre>

<p>
강조된 부분이 있어야 한글 검색이 된다.<br />
다음은 테스트 실패 시 검사 항목을 정리한 것이다.<br />
</p>

<ol>
  <li>/WEB-INF/classes에 바이트 코드가 있는가?</li>
  <li>/WEB-INF/lib에 라이브러리 파일이 있는가?</li>
  <li>CATALINA_HOME/lib에 ojdbc6.jar 파일이 있는가?</li>
  <li>JSP 파일의 EL이 해석되지 않는다면 web.xml이 DTD 버전이 2.4버전 이상인가?</li>
</ol>

<h3>Spring MVC 프로젝트에서의 사용자 인증 정리</h3>

<p>
스프링 시큐리티를 적용하기 전에 현재 인증 처리를 어떻게 구현했는지 다시 정리해 볼 필요가 있다.<br />
다음은 게시판 컨트롤러의 메소드에 적용된 인증 코드이다.<br />
</p>

<h3>목록보기, 상세보기, 글쓰기 폼</h3>
<pre class="prettyprint">//로그인 체크
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  //로그인 후 되돌아갈 URL을 구한다.
  String url = req.getServletPath();
  String query = req.getQueryString();
  if (query != null) url += "?" + query;
  //로그인 페이지로 리다이렉트
  url = URLEncoder.encode(url, "UTF-8");
  return "redirect:/users/login?url=" + url;
}
</pre>

<h3>글쓰기, 댓글 쓰기</h3>

<pre class="prettyprint">//로그인 체크
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<h3>댓글 수정, 댓글 삭제</h3>

<pre class="prettyprint">//로그인 사용자가 댓글 소유자인지  검사
if (user == null || !user.getEmail().equals(comment.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<h3>수정 폼, 수정하기, 글 삭제</h3>

<pre class="prettyprint">//로그인 사용자가 글 작성자인지 검사
if (user == null || !user.getEmail().equals(article.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<h3>첨부 파일 삭제</h3>

<pre class="prettyprint">//로그인 사용자가 첨부 파일 소유자인지 검사
if (user == null || !user.getEmail().equals(attachFile.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
다음은 회원 컨트롤러에 적용된 사용자 인증 로직이다.<br />
회원 컨트롤러의 대부분의 메소드는 인증 로직을 포함한다.<br />
</p>

<h3>로그인</h3>

<pre class="prettyprint">User user = userService.login(email, passwd);
if (user == null) {
  return "redirect:/users/login?url=" + url + "&amp;msg=Login-Failed";
} else {
  session.setAttribute(WebContants.USER_KEY, user);
  if (url != null &amp;&amp; !url.equals("")) {
  return "redirect:" + url;
}

return "redirect:/";
</pre>

<h3>내 정보 수정 폼, 비밀번호 변경 폼, 탈퇴</h3>

<pre class="prettyprint">User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  //로그인 후 다시 돌아오기 위해
  String url = req.getServletPath();
  String query = req.getQueryString();
  if (query != null) url += "?" + query;
  //로그인 페이지로 리다이렉트
  url = URLEncoder.encode(url, "UTF-8");
  return "redirect/users/login?url=" + url;
}
</pre>

<h3>내 정보 수정</h3>

<pre class="prettyprint">
User loginUser = (User) session.getAttribute(WebContants.USER_KEY);

if (loginUser == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}

if (userService.login(loginUser.getEmail(), user.getPasswd()) == null) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<h3>비밀번호 변경</h3>

<pre class="prettyprint">
String email = ((User)session.getAttribute(WebContants.USER_KEY)).getEmail();
</pre>

<p>
JSP에 사용자 인증 코드를 적용한 부분을 살펴보자.<br />
이 또한 스프링 시큐리티를 적용하면 바뀐다.<br />
상세보기 view.jsp에 있는 사용자 인증 코드가 핵심이다.<br />
JSP는 인증이 적용된 부분을 선별적으로 랜더링할 것이다.<br />
</p>

<pre class="prettyprint">
&lt;!-- 중략 --&gt;

&lt;p id="file-list" style="text-align: right"&gt;
  &lt;c:forEach var="file" items="\${attachFileList }" varStatus="status"&gt;    
  &lt;a href="javascript:download('\${file.filename }')"&gt;\${file.filename }&lt;/a&gt;
  <strong>&lt;c:if test="\${user.email == file.email }"&gt;</strong>
  &lt;a href="javascript:deleteAttachFile('\${file.attachFileNo }')"&gt;x&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>
  &lt;br /&gt;
  &lt;/c:forEach&gt;
&lt;/p&gt;

&lt;!-- 중략 --&gt;

<strong>&lt;c:if test="\${user.email == comment.email }"&gt;</strong>    
&lt;span class="modify-del"&gt;
  &lt;a href="javascript:modifyCommentToggle('\${comment.commentNo }')"&gt;수정&lt;/a&gt;
  | &lt;a href="javascript:deleteComment('\${comment.commentNo }')"&gt;삭제&lt;/a&gt;
&lt;/span&gt;
<strong>&lt;/c:if&gt;</strong>  

&lt;!-- 중략 --&gt;

<strong>&lt;c:if test="\${user.email == email }"&gt;</strong>
&lt;div class="fl"&gt;
  &lt;input type="button" value="수정" onclick="goModify()" /&gt;
  &lt;input type="button" value="삭제" onclick="goDelete()"/&gt;
&lt;/div&gt;
<strong>&lt;/c:if&gt;</strong>
</pre>

<p>
다음 장에서 사용자 인증을 스프링 시큐리티를 사용하여 구현할 것이다.<br />
스프링 MVC에서 사용한 인증 코드와 스프링 시큐리티를 적용한 코드를 비교하는 것을 잊지 않도록 한다.<br />
<br />
테스트하면서 발생하는 에러는 log4j.xml에서 설정한 로그 파일이나 
CATALINA_HOME/logs에 있는 로그 파일을 뒤져서 해결해야 한다.<br />
로그 메시지 전부를 이해하는 사람은 없을 것이다. 로그 메시지 중에 자신이 작성한 클래스의 어느 라인에서 예외가 발생하고 있는지 파악하고 이를 기초로 추론하는 능력을
키워야 한다.<br />
</p>

<h3>남겨진 과제</h3>
<ol>
  <li>게시글로 유튜브 동영상 소스 코드를 올렸을 때, 동영상를 보면서 댓글은 작성하거나 수정하거나 삭제하면 다시 상세보기 /bbs/view를 요청하므로 동영상이 중지된다. 애이잭스를 이용하여 동영상을 중지시키지 않으면서 댓글을 등록, 수정, 삭제할 수 있게 한다.</li>
  <li>조회 수 증가를 유명 포탈 사이트에서와 같이 구현한다.</li>
</ol>

<span id="refer">참고</span>
<ul id="references">
  <li><a href="http://www.mybatis.org/mybatis-3/logging.html">http://www.mybatis.org/mybatis-3/logging.html</a></li>
  <li><a href="http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method">http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method</a></li>
  <li><a href="http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/">http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/</a></li>
  <li><a href="https://maven.apache.org/guides/mini/guide-naming-conventions.html">Guide to naming conventions on groupId, artifactId and version</a></li>
  <li><a href="http://maven.apache.org/plugins/maven-war-plugin/usage.html">4 ways to use the WAR Plugin</a></li>
  <li><a href="http://whiteship.tistory.com/1890">4 ways to use the WAR Plugin 한글 해설</a></li>
  <li><a href="https://github.com/spring-projects/spring-mvc-showcase/blob/master/pom.xml">스프링 웹 애플리케이션을 위한 pom.xml 참조</a></li>
  <li><a href="http://stackoverflow.com/questions/793983/jsp-el-expression-is-not-evaluated">메이븐의 만들어준 web.xml 파일을 쓰면 EL이 해석되지 않는 경우</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/spring/spring-security"/>">스프링 시큐리티</a></li>
		<li>이전 : <a href="<c:url value="/jsp/building-java-projects"/>">순수 자바</a></li>
	</ul>
</div>

</article>
