<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>XML 설정을 Java 설정으로 변경</title>
<meta name="Keywords" content="java,spring,mybatis,simple mybatis example,xml config,java config" />
<meta name="Description" content="XML 설정을 Java 설정으로 변경하는 방법을 설명합니다" />
<link rel="stylesheet" href="../../../static/css/korean.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/xml2java.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 2025.6.21</div>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\www&gt; <span class="prompt-selection">mvn archetype:generate -Dfilter=maven-archetype-webapp</span>

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
8: 1.5
Choose a number: 8: ↵ 
Define value for property 'groupId': <span class="prompt-selection">net.java_school</span>
Define value for property 'artifactId': <span class="prompt-selection">mybatisspring</span>
Define value for property 'version' 1.0-SNAPSHOT: : ↵ 
Define value for property 'package' net.java_school: : ↵
Confirm properties configuration:
groupId: net.java_school
artifactId: mybatisspring
version: 1.0-SNAPSHOT
package: net.java_school
 Y: : ↵
</pre>

<p>
빌드가 완료되면 C:\www에 mybatisspring라는 폴더가 생긴다. 
C:\www\mybatisspring이 프로젝트 루트 디렉터리이다.
</p>

<h3>Spring MVC 테스트</h3>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;

  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;net.java_school&lt;/groupId&gt;
  &lt;artifactId&gt;mybatisspring&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;packaging&gt;war&lt;/packaging&gt;
  &lt;name&gt;mybatisspring Maven Webapp&lt;/name&gt;
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
    &lt;finalName&gt;mybatisspring&lt;/finalName&gt;
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
        <strong>&lt;!-- https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin --&gt;</strong>
        <strong>&lt;plugin&gt;</strong>
          <strong>&lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;</strong>
          <strong>&lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;</strong>
          <strong>&lt;version&gt;11.0.25&lt;/version&gt;</strong>
        <strong>&lt;/plugin&gt;</strong>
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
src/main/webapp/WEB-INF/web.xml
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

  &lt;display-name&gt;Mybatis Spring&lt;/display-name&gt;
        
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
    &lt;servlet-name&gt;mybatisspring&lt;/servlet-name&gt;
    &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;
      &lt;param-value&gt;<strong>/WEB-INF/app-config.xml</strong>&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
    
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;mybatisspring&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  
&lt;/web-app&gt;
</pre>

<p>
src/main/webapp/WEB-INF/app-config.xml
</p>

<h6 class="src">app-config.xml</h6> 
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;

<strong>&lt;mvc:resources mapping="/resources/**" location="/resources/" /&gt;</strong>

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
<strong>홈페이지</strong>
</p>

<p>
src/main/webapp/resources/css/styles.css
</p>

<h6 class="src">styles.css</h6>
<pre class="prettyprint">@CHARSET "UTF-8";
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
</pre>

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
&lt;link href="<strong>./resources/css/styles.css</strong>" rel="stylesheet" /&gt;
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

<pre class="prettyprint">package net.java_school.english;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

<strong>@Controller</strong>
public class HomeController {

  <strong>@GetMapping("/")</strong>
  public String homepage() {
    return "index";
  }
}
</pre>

<p>
<strong>src/main/webapp/index.jsp 파일 삭제</strong><br />
컨트롤러를 통해 홈페이지("/")가 서비스되도록 하려면 홈페이지 경로로 매핑된 다른 서블릿이 없어야 한다.
src/main/webapp/index.jsp 파일을 삭제한다.
</p>

<p>
<strong>스프링 설정 파일에 컨트롤러 추가</strong>
</p>

<pre class="prettyprint">&lt;bean id="homeController" class="net.java_school.english.HomeController" /&gt;
</pre>

<h3>테스트</h3>

<p>
루트 디렉터리에서 다음을 실행한다.<br />
</p>

<pre class="shell-prompt">
mvn clean jetty:run
</pre>

<p>
http://localhost:8080을 요청한다.<br />
<img alt="Spring MVC 테스트 화면" src="https://lh3.googleusercontent.com/NRifv0pi6RzESWKOkwJWag5_8FMQrkB3iowvmKAxfK71bsQDqmhukhW2Lhgl1oZ3fzkh6VowhDEfijKV-lMNDhcyNfiwfdZDNjw4YGQDSQSEM8RWtt4wJAOuhVKpDCIjsf0qZgPEA04l5N2NqS7znuj_PclIxHoX9_7z4xe2_PsQ68ZGqdGU5t67OYcId79B_kLwpuDQdBfyC9QkD2ujPH93U3sUS_C9N1krG3t2TJrfMPHAnWI0x81A1UXNomSKjQ4BYznNCDH93a_zFISR81TtYKHAkuThhgWeedPwdmIvSevAL30rFp5LdqkWTJDis94oMNMo0BB_2fXsIzIufdk6jKfEyEmj8Z5oiVpnSSapXMBxucGCXrvuFwa-aONOPryvpxpk37IU4Sy1Jb4td43bAE8GFmhvq9SWfxkxwHjWaNvP95X7h3O-kZA8aevQ-TLfGHB-07KijJYwkDV32X9dq9Zhg4pmdDjkug4kNE4xNXhNd4nEKRWQPomDp4SunyOQiTH1ieB3e0qslMqe97x2rnr1SIyoDO-L5Po2P2q9g8ye5QE_Yvnf6MSSEdCsiA9Klbvtht94bYGUWihnL0HMwVKGcWjqPf9yK3Eq-wHdVz-AL8VmgsFT0w6FcE1w1n0MLzCJJ1UQs8xxldT8dxZtfd2UeyLIF5SZNGU4kwyHXwVKP8E22F1l8Cq6oDiyDbguf0Cg2Ut9EgIVPHtw0pD7D5SSqOnirK_Lqu5hHEvkyfBBCnMJ4I0Rc4QndCLhtIsM_Ikcn9gA5P79rxYwUcnH9UigsRKixCSOOOxS5QMXwSvaOKNXPxhIu7tpfk_j7KxHuLndcc26GZaXxmWl4oIIP1x3FMJGIW-599yGOTQXnBtleRNY2agzMc2GiCGsS-itySXh12PjkEmK9dWCqPd9Qhsc3tWv6_kaUXG-tHm0=w605-h304-no?authuser=0" />
</p>

<p>
컨트롤러가 어떻게 동작하는지 확인했다.<br />
다음은 컨트롤러가 뷰에 데이터를 어떻게 세팅하는지 알아보자.<br />
예제를 간단하게 유지하기 위해 데이터베이스는 사용하지 않겠다.
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
  public String homepage(<strong>Model model</strong>) {
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
mvn clean compile war:inplace<br />
http://localhost:8080<br />
<img alt="테스트 화면2" src="https://lh3.googleusercontent.com/hW0QzwSpzH2l2oMAebvF9B24WGnXwWeLAME3bhVzpktVeJ1BYius55o6oMwZBI8lzU3o-AjBqVIAMTwKh3NA5Y2rHFgGsi1BslxZxP19VBOZgZzFdAetyixnf8sxiyPsDAlNzzHKRnLqF_zu0FPlV_sxXa2aNPjuFEIoSgDcepUxNN4Gyw7od4ffXXgk04c3g0rXDLeIo0pc4HW35BwjQ0GCFXN1qapRi1EiTFxEw-1wXUMKyUYRfg7lro_9ylceX7Ajz9cFxfu0sSV3o9jwtj5LS325438DsdFpqDBNlVT8rfxRhW36vJ_Oto0_M4nNFW0OcUrQm1fp4lB7jSzmLUmMAsJOwqPvWsOrtJ6DJbswOfDTQtPXmEt9V1iztRJ4FBcLBq114wHQRpeJ5DHNFwbCZEDz_VarFzHm4jHCdnNjqBrKW1kW_soIkE2VdOMskSjnl-no6npqVVxamo5beEdmBD3L4tBjlsmBOJfFpFZhN_pikh-vs9z5EdRX_4_SEt8UiyjCw1Ym_ztyVgeQg4fhHpJpuAEy1t-iy3Oiw1Z4ZQsdIGjuyTGsyfTE93IvCXFZriUyUt-YTOkXR5DQZ0v-pqj8m3Uk3j77vtoqCNgHkGSJi-xdFTdn0cuzE0hWeVw2G7hjfYjx8glHUJIgzYvCUHH4BRJQkO_ihxKxmo1t6mHjNY0wyjLVFBsEDqiKoi7atOqOe4a23HoYi4Ip4Qbr-w9X5Mraaa6-Vphvv6nNKQKKsCNUhlezWOpnuDW5VX7yJ9sACVfglzF65qemihot0Nrk3USAEZtDOz6RGZKdoVTxXEU1PTNHAjsyRLEp41lgPUSZwA2p3RDpL4HokmoUzRNF-yeILTgsq6QzX3ncGPGahkSQhHYHAvBZtw3pzON0B1rm9OyVi7Yc18AVlZEfFm-VEiiNLT64gi_j4hOb=w605-h298-no?authuser=0" />
</p>

<h3>데이터베이스 다루기</h3>

<p>
MyBatis-Spring을 사용하여 앱이 데이터베이스를 사용하도록 수정해 보자.<br />
MyBatis-Spring은 스프링에서 MyBatis를 편리하게 사용하기 위한 연동 모듈이다.<br />
MyBatis는 SQL 매핑 퍼시스턴스 프레임워크이다.
</p>

<p>
https://mybatis.org/spring/ko/getting-started.html<br />
아래 내용은 공식 사이트 시작하기와 순서를 같게 했다.
</p>

<p>
<strong>홈페이지 디자인 수정</strong><br />
새 단어를 추가하기 위한 폼을 #wordcard 다음에 추가한다.
</p>

<pre class="prettyprint">&lt;form id="new-form" method="post"&gt;
  &lt;input type="text" name="word" /&gt;
  &lt;input type="text" name="definitions" /&gt;
  &lt;input type="submit" value="Add" style="color: grey;" /&gt;
&lt;/form&gt;
</pre>

<p>
다음 스타일을 추가한다.
</p>

<p>
src/main/webapp/resources/css/styles.css
</p>

<pre class="prettyprint">#new-form {
  margin: 7px auto;
  padding-left: 2em;
  width: 600px;
  text-align: right;
  font-size: 0.8em;
}
</pre>

<p>
scott 계정에 접속해 다음 테이블을 생성한다.
</p>

<pre class="prettyprint">create table wordcard (
word varchar2(45),
definitions varchar2(4000),
constraint pk_wordcard primary key(word)
);
</pre>

<p>
mybatis-spring과 함께 스프링 JDBC, 오라클 JDBC 드라이버, 아파치 DBCP 그리고 MyBatis 라이브러리를 함께 추가한다.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc11 --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;ojdbc11&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;23.7.0.25.01&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/org.apache.commons/commons-dbcp2 --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.apache.commons&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;commons-dbcp2&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;2.13.0&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.mybatis&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;mybatis&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;3.5.19&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
<strong>&lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring --&gt;</strong>
<strong>&lt;dependency&gt;</strong>
  <strong>&lt;groupId&gt;org.mybatis&lt;/groupId&gt;</strong>
  <strong>&lt;artifactId&gt;mybatis-spring&lt;/artifactId&gt;</strong>
  <strong>&lt;version&gt;3.0.4&lt;/version&gt;</strong>
<strong>&lt;/dependency&gt;</strong>
</pre>

<p>
스프링 설정 파일에 데이터소스와 SqlSessionFactoryBean을 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" 
    destroy-method="close"&gt;
  &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
  &lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
  &lt;property name="username" value="scott" /&gt;
  &lt;property name="password" value="tiger" /&gt;
  &lt;property name="maxTotal" value="100" /&gt;
  &lt;property name="maxWaitMillis" value="1000" /&gt;
  &lt;property name="poolPreparedStatements" value="true" /&gt;
  &lt;property name="defaultAutoCommit" value="true" /&gt;
  &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
&lt;/bean&gt;

&lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
  &lt;property name="dataSource" ref="dataSource" /&gt;
&lt;/bean&gt;
</pre>

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

  public int getWord() {
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
<strong>매퍼 인터페이스</strong><br />
매퍼 인터페이스를 다른 스프링 컴포넌트와 구별되는 패키지로 만드는 게 좋다.
</p>

<p>
src/main/java/net/java_school/mybatis/WordMapper.java
</p>

<h6 class="src">WordMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface WordMapper {
  @Insert("INSERT INTO wordcard VALUES (#{word}, #{definitions})")
  public void insert(@Param("word") String word, @Param("definitions") String definitions);

  @Select("select * from (select * from wordcard order by dbms_random.value) where rownum = 1")
  public WordCard selectOne();
}
</pre>

<p>
매퍼 인터페이스를 MapperFactoryBean을 사용해 스프링에 추가한다.
</p>

<pre class="prettyprint">&lt;bean id="wordMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.WordMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>서비스</strong><br />
</p>

<p>
WordCardService 클래스를 인터페이스로 바꾼다.<br />
src/main/java/net/java_school/english/WordCardService.java
</p>

<h6 class="src">WordCardService.java</h6>
<pre class="prettyprint">package net.java_school.english;

public interface WordCardService {
  public void add(String word, String definitions);
  public WordCard getWordCard();
}
</pre>

<p>
src/main/java/net/java_school/english/WordCardServiceImpl.java
</p>

<h6 class="src">WordCardServiceImpl.java</h6>
<pre class="prettyprint">package net.java_school.english;

import net.java_school.mybatis.WordMapper;
import org.springframework.stereotype.Service;

@Service
public class WordCardServiceImpl implements WordCardService {
  private WordMapper wordMapper;

  public WordCardServiceImpl(WordMapper wordMapper) {
    this.wordMapper = wordMapper;
  }

  @Override
  public void add(String content) {
    wordMapper.insert(content);
  }

  @Override
  public WordCard getWordCard() {
    return wordMapper.selectOne(); 
}
</pre>

<pre class="prettyprint">&lt;bean id="wordCardService" class="net.java_school.english.<strong>WordCardServiceImpl</strong>"&gt;
  &lt;constructor-arg ref="<strong>wordMapper</strong>" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>컨트롤러</strong><br />
</p>

<p>
src/main/java/net/java_school/english/HomeController.java
</p>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint">package net.java_school.english;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
  private WordCardService wordCardService;

  public HomeController(WordCardService wordCardService) {
    this.wordCardService = wordCardService;
  }
  
  @GetMapping("/")
  public String homepage(Model model) {
    WordCard wordCard = wordCardService.getWordCard();
    model.addAttribute("wordCard", wordCard);
    return "index";
  }

  @PostMapping("/")
  public String add(@RequestParam(name="word") String word, @RequestParam(name="definitions") String definitions) {
    wordCardService.add(word, definitions);
    return "redirect:/";
  }
}
</pre>

<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;

&lt;mvc:resources mapping="/resources/**" location="/resources/" /&gt;

&lt;mvc:annotation-driven /&gt;

&lt;bean id="internalResourceViewResolver" 
    class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
  &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
  &lt;property name="prefix" value="/WEB-INF/views/" /&gt;
  &lt;property name="suffix" value=".jsp" /&gt;
&lt;/bean&gt;

<strong>&lt;!-- &lt;bean id="wordCardDao" class="net.java_school.english.WordCardDao" /&gt; --&gt;</strong>

<strong>&lt;bean id="wordMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;</strong>
  <strong>&lt;property name="mapperInterface" value="net.java_school.mybatis.WordMapper" /&gt;</strong>
  <strong>&lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;</strong>
<strong>&lt;/bean&gt;</strong>

&lt;bean id="wordCardService" class="net.java_school.english.<strong>WordCardServiceImpl</strong>"&gt;
  &lt;constructor-arg ref="<strong>wordMapper</strong>" /&gt;
&lt;/bean&gt;

&lt;bean id="homeController" class="net.java_school.english.HomeController"&gt;
  &lt;constructor-arg ref="wordCardService" /&gt;
&lt;/bean&gt;

<strong>&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" 
    destroy-method="close"&gt;</strong>
  <strong>&lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;</strong>
  <strong>&lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;</strong>
  <strong>&lt;property name="username" value="scott" /&gt;</strong>
  <strong>&lt;property name="password" value="tiger" /&gt;</strong>
  <strong>&lt;property name="maxTotal" value="100" /&gt;</strong>
  <strong>&lt;property name="maxWaitMillis" value="1000" /&gt;</strong>
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
<strong>실행</strong><br />
</p>

<pre class="commandLine">
mvn clean jetty:run
</pre>

<h3>로깅</h3>

<p>
참고: https://mybatis.org/mybatis-3/ko/logging.html
</p>

<p>
log4j 2 라이브러리를 의존성에 추가한다.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-api --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-api&lt;/artifactId&gt;
  &lt;version&gt;2.24.3&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-core&lt;/artifactId&gt;
  &lt;version&gt;2.24.3&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-jcl --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
  &lt;artifactId&gt;log4j-jcl&lt;/artifactId&gt;
  &lt;version&gt;2.24.3&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
log4j2.xml라는 이름으로 log4j 2 설정 파일을 src/main/resources/ 디렉터리에 생성한다.
</p>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration&gt;
&lt;Configuration xmlns="http://logging.apache.org/log4j/2.0/config"&gt;
  &lt;Appenders&gt;
    &lt;File name="MyBatisSpring" fileName="MyBatisSpring.log" append="false"&gt;
      &lt;PatternLayout pattern="%t %-5p %c{2} - %m%n" /&gt;
    &lt;/File&gt;
    &lt;Console name="STDOUT" target="SYSTEM_OUT"&gt;
      &lt;PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n" /&gt;
    &lt;/Console&gt;
  &lt;/Appenders&gt;
  &lt;Loggers&gt;
    &lt;Logger name="<strong>net.java_school</strong>" level="DEBUG"&gt;
      &lt;AppenderRef ref="MyBatisSpring" /&gt;
    &lt;/Logger&gt;
    &lt;Root level="INFO"&gt;
      &lt;AppenderRef ref="STDOUT" /&gt;
    &lt;/Root&gt;
  &lt;/Loggers&gt;
&lt;/Configuration&gt;
</pre>

<p>
mvn clean jetty:run 실행해 컴파일하고 로그 메시지를 확인한다.
</p>

<p>
<strong>매퍼 XML 파일</strong><br />
여러 줄로 구성된 복잡한 쿼리는 XML 파일로 따로 분리하면 유지 보수에 좋다.<br />
이 파일이 매퍼 XML 파일이다.
</p>

<p>
지금까지 마이바티스 설정 파일을 만들지 않았다.<br />
매퍼 XML 파일과 매퍼 인터페이스를 같은 클래스패스에 둔다면, 마이바티스 설정 파일이 필요 없다.<br />
참고: https://mybatis.org/spring/ko/mappers.html#register
</p>

<p>
WordMapper 인터페이스와 같은 클래스패스에 파일이 위치하도록, src/main/resources/net/java_school/mybatis 디렉터리에, WordMapper.xml 매퍼 파일을 생성한다.
</p>

<p>
src/main/resources/net/java_school/mybatis/WordMapper.xml 
</p>

<h6 class="src">WordMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.WordMapper"&gt;

  &lt;insert id="insert"&gt;
    insert into wordcard values (#{word}, #{definitions})
  &lt;/insert&gt;

  &lt;select id="selectOne" resultType="net.java_school.english.WordCard"&gt;
    select *
    from
    (select * from wordcard order by dbms_random.value)
    where rownum = 1
  &lt;/select&gt;
	
&lt;/mapper&gt;
</pre>

<p>
마이바티스 설정 파일에서 typeAlias 요소를 사용하면 매퍼 XML 파일에서 resultType="net.java_school.english.WordCard"를 resultType="WordCard"처럼 간단히 줄일 수 있다.
</p>

<pre class="prettyprint">&lt;-- XML 설정 파일에서 --&gt;
&lt;typeAlias type="net.java_school.english.WordCard" alias="WordCard"/&gt;
</pre>

<p>
하지만 지금껏 생략했던 마이바티스 설정 파일을 추가해야 한다.<br />
참고: https://mybatis.org/mybatis-3/ko/sqlmap-xml.html<br />
자바 빈즈가 하나뿐이니, 마이바티스 설정 파일을 만들지 않고 진행한다.
</p>

<p>
WordMapper 인터페이스에서 쿼리를 제거한다.
</p>

<h6 class="src">WordMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import net.java_school.english.WordCard;
import org.apache.ibatis.annotations.Param;

public interface WordMapper {
  public void insert(@Param("word") String word, @Param("definitions") String definitions);
  public WordCard selectOne();
}
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

&lt;mvc:resources mapping="/resources/**" location="/resources/" /&gt;

&lt;mvc:annotation-driven /&gt;

<strong>&lt;context:component-scan base-package="net.java_school.english" /&gt;</strong>

<strong>&lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;</strong>

&lt;bean id="internalResourceViewResolver" 
    class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
  &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
  &lt;property name="prefix" value="/WEB-INF/views/" /&gt;
  &lt;property name="suffix" value=".jsp" /&gt;
&lt;/bean&gt;

&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" 
    destroy-method="close"&gt;
  &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
  &lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
  &lt;property name="username" value="java" /&gt;
  &lt;property name="password" value="school" /&gt;
  &lt;property name="maxTotal" value="100" /&gt;
  &lt;property name="maxWaitMillis" value="1000" /&gt;
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

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint"><strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Controller
public class HomeController {
  <strong>@Autowired</strong>
  private WordCardService wordCardService;

  /* 생성자 제거
  public HomeController(WordCardService wordCardService) {
    this.wordCardSerivce = wordCardService;
  }
  */

  //..omit..
}
</pre>

<h6 class="src">WordCardServiceImpl.java</h6>
<pre class="prettyprint">import org.springframework.stereotype.Service;
<strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Service
public class WordCardServiceImpl implements WordCardService {

  <strong>@Autowired</strong>
  private WordMapper wordMapper;

  /* 생성자 제거
  public WordCardServiceImpl(WordMapper wordMapper) {
    this.wordMapper = wordMapper;
  }
  */

  //..omit..
}
</pre>

<h3>자바 기반 스프링 설정</h3>

<p>
다음 자바 파일을 생성한다.
</p>

<h6 class="src">AppConfig.java</h6>
<pre class="prettyprint">package net.java_school.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

<strong>@Configuration</strong>
public class AppConfig implements <strong>WebMvcConfigurer</strong> {
  //TODO
}
</pre>

<p>
아래를 참고해 스프링 자바 설정 파일을 완성한다.
</p>

<div class="xml2java">
<pre class="prettyprint">&lt;mvc:annotation-driven /&gt;</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Configuration
<strong>@EnableWebMvc</strong>
public class WebConfig implements WebMvcConfigurer {
</pre>
</div>

<div class="xml2java">
<pre class="prettyprint">&lt;mvc:resources mapping="/resources/**"
    location="/resources/"
    cache-period="31556926" /&gt;</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Configuration
@EnableWebMvc
public class AppConfig implements WebMvcConfigurer {
  <strong>@Override</strong>
  <strong>public void addResourceHandlers(ResourceHandlerRegistry registry) {</strong>
    <strong>registry.addResourceHandler("/resources/**")
            .addResourceLocations("/resources/")
            .setCacheControl(CacheControl.maxAge(Duration.ofDays(365)));</strong>
  <strong>}</strong>
}
</pre>
</div>

<div class="xml2java">
<pre class="prettyprint">&lt;context:component-scan 
    base-package="net.java_school.english" /&gt;
</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Configuration
@EnableWebMvc
<strong>@ComponentScan("net.java_school.english")</strong>
public class AppConfig implements WebMvcConfigurer {
</pre>
</div>

<div class="xml2java">
<pre class="prettyprint">&lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;
</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Configuration
@EnableWebMvc
@ComponentScan("net.java_school.english")
<strong>@MapperScan("net.java_school.mybatis")</strong>
public class AppConfig implements WebMvcConfigurer {
</pre>
</div>

<div class="xml2java">
<pre class="prettyprint">&lt;bean id="internalResourceViewResolver" 
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
  &lt;property name="prefix" value="/WEB-INF/views/" /&gt;
  &lt;property name="suffix" value=".jsp" /&gt;
  &lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
&lt;/bean&gt;
</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Bean
public ViewResolver configureViewResolver() {
  InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
  viewResolver.setPrefix("/WEB-INF/views/");
  viewResolver.setSuffix(".jsp");
  viewResolver.setViewClass(JstlView.class);
  return viewResolver;
} 
</pre>
</div>

<div class="xml2java">
<pre class="prettyprint">&lt;bean id="dataSource"
    class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close"&gt;
  &lt;property name="driverClassName"
    value="oracle.jdbc.driver.OracleDriver" /&gt;
  &lt;property name="url"
    value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
  &lt;property name="username" value="scott" /&gt;
  &lt;property name="password" value="tiger" /&gt;
  &lt;property name="maxTotal" value="100" /&gt;
  &lt;property name="maxWaitMillis" value="1000" /&gt;
  &lt;property name="poolPreparedStatements" value="true" /&gt;
  &lt;property name="defaultAutoCommit" value="true" /&gt;
  &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
&lt;/bean&gt;

&lt;bean id="sqlSessionFactory"
    class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
  &lt;property name="dataSource" ref="dataSource" /&gt;
&lt;/bean&gt;
</pre>

<p>
⇩
</p>

<pre class="prettyprint">@Bean(destroyMethod = "close")
public DataSource dataSource() {
  BasicDataSource dataSource = new BasicDataSource();
  dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
  dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
  dataSource.setUsername("scott");
  dataSource.setPassword("tiger");
  dataSource.setMaxTotal(100);
  dataSource.setMaxWaitMillis(1000);
  dataSource.setPoolPreparedStatements(true);
  dataSource.setDefaultAutoCommit(true);
  dataSource.setValidationQuery("SELECT 1 FROM DUAL");
  return dataSource;
}

@Bean
public SqlSessionFactory sqlSessionFactory() throws Exception {
  SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
  sessionFactory.setDataSource(dataSource());
  return sessionFactory.getObject();
}
</pre>
</div>

<h6 class="src">AppConfig.java</h6>
<pre class="prettyprint">package net.java_school.config;

import java.time.Duration;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan("net.java_school.english")
@MapperScan("net.java_school.mybatis")
public class AppConfig implements WebMvcConfigurer {

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/resources/**")
            .addResourceLocations("/resources/")
            .setCacheControl(CacheControl.maxAge(Duration.ofDays(365)));
  }

  @Bean
  public ViewResolver configureViewResolver() {
    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
    viewResolver.setPrefix("/WEB-INF/views/");
    viewResolver.setSuffix(".jsp");
    viewResolver.setViewClass(JstlView.class);
    return viewResolver;
  }

  @Bean(destroyMethod = "close")
  public DataSource dataSource() {
    BasicDataSource dataSource = new BasicDataSource();
    dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
    dataSource.setUsername("scott");
    dataSource.setPassword("tiger");
    dataSource.setMaxTotal(100);
    dataSource.setMaxWaitMillis(1000);
    dataSource.setPoolPreparedStatements(true);
    dataSource.setDefaultAutoCommit(true);
    dataSource.setValidationQuery("SELECT 1 FROM DUAL");

    return dataSource;
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory() throws Exception {
    SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
    sessionFactory.setDataSource(dataSource());
    return sessionFactory.getObject();
  }
}
</pre>

<p>
web.xml 파일을 대신할 자바 설정 파일을 생성한다.
</p>

<h6 class="src">MyWebAppInitializer.java</h6>
<pre class="prettyprint">package net.java_school.config;

import jakarta.servlet.Filter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class&lt;?&gt;[] getRootConfigClasses() {
    <strong>return null</strong>;
  }

  @Override
  protected Class&lt;?&gt;[] getServletConfigClasses() {
    return new Class&lt;?&gt;[] { <strong>AppConfig.class</strong> };
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] { "/" };
  }

  @Override
  protected Filter[] getServletFilters() {
    return new Filter[] { new HiddenHttpMethodFilter() };
  }
}
</pre>


화면이 나오면, 데이터베이스 설계를 시작으로, 자바 빈즈, DAO, 서비스, 컨트롤러 순으로 구현하는 게 일반적이지만, 대부분을 생략하고 컨트롤러와 뷰만으로 동작하는 예제를 만들어 보자.

컨트롤러
<p>
다음처럼 설정해도 된다.<br />
참고: https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-servlet-context-hierarchy
</p>

<pre class="prettyprint">package net.java_school.config;

import jakarta.servlet.Filter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class&lt;?&gt;[] getRootConfigClasses() {
    return new Class&lt;?&gt;[] { <strong>AppConfig.class</strong> };
  }

  @Override
  protected Class&lt;?&gt;[] getServletConfigClasses() {
    <strong>return null</strong>;
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] { "/" };
  }

  @Override
  protected Filter[] getServletFilters() {
    return new Filter[] { new HiddenHttpMethodFilter() };
  }
}
</pre>

<p>
에러 페이지 매핑은 자바 설정으로 할 수 없기에, 추후 에러 페이지 매핑을 위해, web.xml 파일을 최소한의 내용으로 남겨둔다.<br />
참고: https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-ann-customer-servlet-container-error-page
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;

&lt;/web-app&gt;
</pre>

<p>
<span class="repository">https://github.com/kimjonghoon/mybatisspring</span>
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-servlet-context-hierarchy">서블릿 컨텍스트 계층</a></li>
	<li><a href="https://mybatis.org/spring/ko/getting-started.html">MyBatis 시작하기</a></li>
	<li><a href="https://mybatis.org/mybatis-3/ko/logging.html">MyBatis에서 로그 사용</a></li>
	<li><a href="https://dlcdn.apache.org//commons/dbcp/">DBCP</a></li>
	<li><a href="https://mybatis.org/spring/ko/mappers.html#register">매퍼 등록</a></li>
	<li><a href="https://mybatis.org/mybatis-3/ko/sqlmap-xml.html">매퍼 XML 파일</a></li>
	<li><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-ann-customer-servlet-container-error-page">여전히 web.xml 파일이 필요한 이유</a></li>
</ul>

</article>
</body>
</html>
