<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
<h1>메이븐으로 스프링 MVC 개발</h1>

<p style="color: 777;">
아래 글은 워크스페이스를 C:\www라고 가정합니다.
</p>

<h2>아키타입 생성</h2>

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

<h2>Spring MVC 테스트</h2> 

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
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
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
<img alt="Spring MVC 테스트 화면" src="https://lh3.googleusercontent.com/NRifv0pi6RzESWKOkwJWag5_8FMQrkB3iowvmKAxfK71bsQDqmhukhW2Lhgl1oZ3fzkh6VowhDEfijKV-lMNDhcyNfiwfdZDNjw4YGQDSQSEM8RWtt4wJAOuhVKpDCIjsf0qZgPEA04l5N2NqS7znuj_PclIxHoX9_7z4xe2_PsQ68ZGqdGU5t67OYcId79B_kLwpuDQdBfyC9QkD2ujPH93U3sUS_C9N1krG3t2TJrfMPHAnWI0x81A1UXNomSKjQ4BYznNCDH93a_zFISR81TtYKHAkuThhgWeedPwdmIvSevAL30rFp5LdqkWTJDis94oMNMo0BB_2fXsIzIufdk6jKfEyEmj8Z5oiVpnSSapXMBxucGCXrvuFwa-aONOPryvpxpk37IU4Sy1Jb4td43bAE8GFmhvq9SWfxkxwHjWaNvP95X7h3O-kZA8aevQ-TLfGHB-07KijJYwkDV32X9dq9Zhg4pmdDjkug4kNE4xNXhNd4nEKRWQPomDp4SunyOQiTH1ieB3e0qslMqe97x2rnr1SIyoDO-L5Po2P2q9g8ye5QE_Yvnf6MSSEdCsiA9Klbvtht94bYGUWihnL0HMwVKGcWjqPf9yK3Eq-wHdVz-AL8VmgsFT0w6FcE1w1n0MLzCJJ1UQs8xxldT8dxZtfd2UeyLIF5SZNGU4kwyHXwVKP8E22F1l8Cq6oDiyDbguf0Cg2Ut9EgIVPHtw0pD7D5SSqOnirK_Lqu5hHEvkyfBBCnMJ4I0Rc4QndCLhtIsM_Ikcn9gA5P79rxYwUcnH9UigsRKixCSOOOxS5QMXwSvaOKNXPxhIu7tpfk_j7KxHuLndcc26GZaXxmWl4oIIP1x3FMJGIW-599yGOTQXnBtleRNY2agzMc2GiCGsS-itySXh12PjkEmK9dWCqPd9Qhsc3tWv6_kaUXG-tHm0=w605-h304-no?authuser=0" />
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
&lt;h1&gt;<strong>${wordCard.word }</strong>&lt;/h1&gt;
&lt;p&gt;
<strong>${wordCard.definitions }</strong>
&lt;/p&gt;
&lt;/div&gt;
</pre>

<p>
<strong>테스트</strong><br />
mvn compile war:inplace<br />
http://localhost:8080<br />
<img alt="테스트 화면2" src="https://lh3.googleusercontent.com/hW0QzwSpzH2l2oMAebvF9B24WGnXwWeLAME3bhVzpktVeJ1BYius55o6oMwZBI8lzU3o-AjBqVIAMTwKh3NA5Y2rHFgGsi1BslxZxP19VBOZgZzFdAetyixnf8sxiyPsDAlNzzHKRnLqF_zu0FPlV_sxXa2aNPjuFEIoSgDcepUxNN4Gyw7od4ffXXgk04c3g0rXDLeIo0pc4HW35BwjQ0GCFXN1qapRi1EiTFxEw-1wXUMKyUYRfg7lro_9ylceX7Ajz9cFxfu0sSV3o9jwtj5LS325438DsdFpqDBNlVT8rfxRhW36vJ_Oto0_M4nNFW0OcUrQm1fp4lB7jSzmLUmMAsJOwqPvWsOrtJ6DJbswOfDTQtPXmEt9V1iztRJ4FBcLBq114wHQRpeJ5DHNFwbCZEDz_VarFzHm4jHCdnNjqBrKW1kW_soIkE2VdOMskSjnl-no6npqVVxamo5beEdmBD3L4tBjlsmBOJfFpFZhN_pikh-vs9z5EdRX_4_SEt8UiyjCw1Ym_ztyVgeQg4fhHpJpuAEy1t-iy3Oiw1Z4ZQsdIGjuyTGsyfTE93IvCXFZriUyUt-YTOkXR5DQZ0v-pqj8m3Uk3j77vtoqCNgHkGSJi-xdFTdn0cuzE0hWeVw2G7hjfYjx8glHUJIgzYvCUHH4BRJQkO_ihxKxmo1t6mHjNY0wyjLVFBsEDqiKoi7atOqOe4a23HoYi4Ip4Qbr-w9X5Mraaa6-Vphvv6nNKQKKsCNUhlezWOpnuDW5VX7yJ9sACVfglzF65qemihot0Nrk3USAEZtDOz6RGZKdoVTxXEU1PTNHAjsyRLEp41lgPUSZwA2p3RDpL4HokmoUzRNF-yeILTgsq6QzX3ncGPGahkSQhHYHAvBZtw3pzON0B1rm9OyVi7Yc18AVlZEfFm-VEiiNLT64gi_j4hOb=w605-h298-no?authuser=0" />
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
  <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
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
  @Insert("INSERT INTO photo VALUES (seq_photo.nextval, #{content})")
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
</p>

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
    INSERT INTO photo VALUES (seq_photo.nextval, #{content})
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
    NSERT INTO photo VALUES (seq_photo.nextval, #{content})
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
    <strong>WHERE R BETWEEN #{start} AND #{end}</strong>
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
  <strong>&lt;c:forEach var="photo" items="${photos }" varStatus="status"&gt;</strong>
  &lt;img width="640" alt="p_<strong>${photo.no }</strong>" src="<strong>${photo.content }</strong>" /&gt;
  <strong>&lt;/c:forEach&gt;</strong>
&lt;/div&gt;

&lt;div id="paging"&gt;
  <strong>&lt;c:if test="${param.page &gt; 1 }"&gt;</strong>
  &lt;a href="?page=<strong>${param.page - 1 }</strong>" title="<strong>${param.page - 1}</strong>"&gt;◁ Back&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:if test="${prevBlock &gt; 0}"&gt;</strong>
  &lt;a href="?page=1" title="1"&gt;1&lt;/a&gt;
  &lt;a href="?page=<strong>${prevBlock }</strong>" title="<strong>${prevBlock }</strong>"&gt;...&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:forEach var="i" begin="${firstPage }" end="${lastPage }" varStatus="status"&gt;</strong>
  <strong>&lt;c:choose&gt;</strong>
    <strong>&lt;c:when test="${param.page == i}"&gt;</strong>
    &lt;strong&gt;<strong>${i }</strong>&lt;/strong&gt;
    <strong>&lt;/c:when&gt;</strong>
    <strong>&lt;c:otherwise&gt;</strong>
    &lt;a href="?page=<strong>${i }</strong>" title="<strong>${i }</strong>"&gt;<strong>${i }</strong>&lt;/a&gt;
    <strong>&lt;/c:otherwise&gt;</strong>
  <strong>&lt;/c:choose&gt;</strong>
  <strong>&lt;/c:forEach&gt;</strong>

  <strong>&lt;c:if test="${nextBlock &gt; 0 }"&gt;</strong>
  &lt;a href="?page=<strong>${nextBlock }</strong>" title="<strong>${nextBlock }</strong>"&gt;...&lt;/a&gt;
  &lt;a href="?page=<strong>${finalPage }</strong>" title="<strong>${finalPage }</strong>"&gt;${finalPage }&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  <strong>&lt;c:if test="${param.page &lt; finalPage }"&gt;</strong>
  &lt;a href="?page=<strong>${param.page + 1 }</strong>" title="<strong>${param.page + 1 }</strong>"&gt;Next▷ &lt;/a&gt;
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

<h2>이클립스 작업환경 구축</h2>

<p>
이클립스를 시작하고 워크스페이스를 <em class="path">C:\www</em>로 선택한다.
Project Explorer 뷰에서 마우스 오른쪽 버튼을 사용하여 컨텍스트 메뉴를 보이게 한다.
Import를 사용하여 spring-bbs 프로젝트를 이클립스로 불러온다.<br />
<img alt="컨텍스트 메뉴에서 Import" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png" /><br />
<img alt="이클립스에서 메이븐 프로젝트 Import" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png" /><br />
진행하면서 pom.xml 파일이 바뀌면 이클립스 설정과 동기화를 해주어야 한다.<br />
<img alt="pom과 이클립스 설정 동기화" src="https://lh3.googleusercontent.com/-CB-gDjPd5BQ/VYYdFhRh0WI/AAAAAAAACiE/GDH5LExU4FI/s640/maven-update-project-configuration.png" /><br />
</p>

<span id="refer">참고</span>
<ul id="references">
  <li><a href="http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method">http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method</a></li>
  <li><a href="http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/">http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/</a></li>
  <li><a href="https://maven.apache.org/guides/mini/guide-naming-conventions.html">Guide to naming conventions on groupId, artifactId and version</a></li>
  <li><a href="http://maven.apache.org/plugins/maven-war-plugin/usage.html">4 ways to use the WAR Plugin</a></li>
  <li><a href="http://whiteship.tistory.com/1890">4 ways to use the WAR Plugin 한글 해설</a></li>
  <li><a href="https://github.com/spring-projects/spring-mvc-showcase/blob/master/pom.xml">스프링 웹 애플리케이션을 위한 pom.xml 참조</a></li>
  <li><a href="http://stackoverflow.com/questions/793983/jsp-el-expression-is-not-evaluated">메이븐의 만들어준 web.xml 파일을 쓰면 EL이 해석되지 않는 경우</a></li>
</ul>
</article>