<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Convert XML Config to Java Config</title>
<meta name="Keywords" content="java,spring,mybatis,simple mybatis example,xml config,java config" />
<meta name="Description" content="Convert XML Config to Java Config in Mybatis Spring Example" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
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
<div class="last-modified">Last Modified 6.21.2025</div>

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
Maven creates the mybatisspring folder in C:\www through the build process. C:\www\mybatisspring is the root directory of your project. The src/main/webapp folder, just above WEB-INF, is the document base.
</p>

<h3>Spring MVC Test</h3>

<p>
Modify pom.xml like below.
</p>
 
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
        &lt;!-- https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin --&gt;
        &lt;plugin&gt;
          &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
          &lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
          &lt;version&gt;11.0.25&lt;/version&gt;
        &lt;/plugin&gt;
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

  &lt;display-name&gt;MyBatis Spring&lt;/display-name&gt;

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
<strong>Homepage</strong>
</p>

<p>
src/main/webapp/resources/css/styles.css
</p>

<h6 class="src">styles.css</h6>
<pre class="prettyprint">
html, body {
  margin: 0;
  padding: 0;
  background-color: #FFF;
  font-family: "Liberation Sans", Helvetica, sans-serif;
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
&lt;html lang="en"&gt;
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
total number of words which (with rules for combining them) make up a language
&lt;/p&gt;
&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
The screen shows words and their meanings.
</p>

<p>
When the design is complete, it is common to start with database design, then implement JavaBeans, DAO, service, and controller in that order.<br />
To experience Spring MVC more quickly, let's omit most of these and create an example that works only with controllers and views.
</p>

<p>
<strong>Controller</strong><br />
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
For the homepage ("/") to be served through the controller, you should not declare any other servlets mapped to the homepage.
However, the archetype has the index.jsp in the src/main/webapp folder. This file will respond to homepage requests.
Delete the JSP file created by Maven when creating the archetype.
</p>

<p>
<strong>Register the controller</strong>
</p>

<pre class="prettyprint">&lt;bean id="homeController" class="net.java_school.english.HomeController" /&gt;
</pre>

<p>
<strong>ROOT Application</strong><br />
Create a ROOT.xml file in the CATALINA_HOME/conf/Catalina/localhost folder.<br />
CATALINA_HOME: Represents the root of your Tomcat installation, for example C:\apache-tomcat-9.0.87.
</p>

<h3>테스트</h3>

<pre class="shell-prompt">
mvn clean jetty:run
</pre>

<p>
Visit http://localhost:8080<br />
<img alt="Spring MVC" src="https://lh3.googleusercontent.com/pw3G1JuQZkD7kpbQcRLpZUY7Bui_4djjPdXV7NdkhKI2aHKzBuuf7e3zIiYdWM7QjoBIa84d9pAUjuEOWkcUVWEn5u1blfwQSQcUPOGjwNANkDsftpIag9zQ7-NCHKIO9Y0wTkbLUZxCjh-udCHOJBPPI1eBJmU-lhUJDhOPKoY9B5UEU_n4by-rPichRv1vSQRjgyq8DEvftXLr-3ea7gerzHI2yqk8pM99XaY_lkdh5zYYBANLdsMnbqEELqyJpyO52IoPab_b75960w54koADWOhiq0Xs_x-KU7NR3xPAm_ww4tRmLFu3GrFHtfu1zRYVU6sWjVWSdS2lRdGDKUr9NMR7vKL_YlrU5v1FyXpN7saQZtnuKS8WGiX7k5VcKDN0la_rV2lQTf-nvA9yqha0zIg4qB0SWcTVAjRyzGUW8O0YoZUUGZPg2Y4Fj7lqmIkttbaaLdYOtMRAFp2CDc6Qf0lHegzCYiPZxCIK7hFKUJ19idrnBtobVUT2A6oWA2vZd0Q3ktpIXy8mNwaxubuhvdJlfl8SkOr0sDWPJ7XGKYVrpFpMyazrqY4EhspzM5Ui4jN23Yzo8qKcZhnFqdbuLH3_I0095i5sMwm-M75xKXaOanxIZvKhkAvnommTtL8V_TMxvAk1L-ynmFo8UzlpTIkdyKGQRtiOuRwOB0dIErvUHkBLY6jz0iKXR_4FHZx28vUgC5HqlpRF-LEFfQie_4BDTz6cZSeSGD8yIfr1Rzzxjrip948f1HyXqnoi48_Fx9f3qjXVI_NK-OLCaMcucaCDeuRmhAsdq1rSjy5ot6WhtadCahIKCFjrU3HLVPNTdNHBwKWK0tndylFEzqyAdZlNmZ-JQAvocxm3dRtRBBteTJX_48yqOMnUXisr4kAJ4fDzDfMFrovXXomxk4ToS8oAhfGpxaIIKYrr0IQ8=w689-h310-no?authuser=0" />
</p>

<p>
We figured out how Spring MVC works.<br />
Next, practice how the controller delivers data to a view.<br />
We won't use a database to keep the example simple.
</p>

<p>
<strong>Java Beans</strong><br />
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
    {"illegible",
    	"difficult or impossible to read"}, 
    {"vulnerable",
    	"that is liable to be damaged; not protected against attack"}, 
    {"abate",
    	"(of winds, storms, floods, pain, etc) make or become less"}, 
    {"clandestine",
    	"secret; done secretly; kept secret"}, 
    {"sojourn",
    	"(make a) stay (with sb, at or in) for a time"}, 
    {"defiance",
    	"open disobedience or resistance; refusal to recognize authority; defyling"}, 
    {"infraction",
    	"breaking of a rule, law, etc; instance of this"}
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
<strong>Service</strong><br />
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
<strong>Controller</strong>
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
<strong>View</strong><br />
src/main/webapp/WEB-INF/views/index.jsp
</p>

<p>
Modify the content of the body element as below.
</p>

<pre class="prettyprint">&lt;div id="wordcard"&gt;
&lt;h1&gt;<strong>${wordCard.word }</strong>&lt;/h1&gt;
&lt;p&gt;
<strong>${wordCard.definitions }</strong>
&lt;/p&gt;
&lt;/div&gt;
</pre>

<p>
<strong>Test</strong><br />
</p>

<pre class="commandLine">
mvn clean jetty:run
</pre>

<p>
http://localhost:8080<br />
<img alt="Test 2" src="https://lh3.googleusercontent.com/dwkIwv1hRRscdrRCo-2qZASfWcc4MWtvULEVv5kebNRq77iKjhPzKpM4_ACRXyZdyF9rhXYWSX7lIcwZq6BgyzRx24kLHwVMaQaNUddQkLpKFjQQ6OfVsT7Vs8BjtPoLr5QGscFWf9xhOLXTO3qIsD1SvFH-d3GCunNzjjV60TyG9yJTEDIPeMEqgHpK5b3jft77ylfgU3Cb7h0DFeV7VAKi6vS0ursE75tLjogrdRhU4TwHobQxK-f349JOguSsP3q8c2sxdcEgVxsG5A3wx2hDDHCxkVQKoj1jq0ueLy1jQsMCV2XC9X31qqt-RNKyVhMzL6s1tgxeWJtLFIiAAIYBTbNT7gy2SU8tNaCPf12hBoGmaIGxb9nVn39oqaGVy-1wzFCkaRukjrYwI-w-nFw5TM279GpFgxO5N4SnvKKD-YyEb3NFALiiXW3n0QMwsq9kOb5B6mzxoP4QO2ktqSkxlW8x78RUp2Bx89lI4UsFaj7HkUtrQ8SH18gzIpHJrI4GN-TJBhoiRGIOFLaeNTyykftCTMAFFm5XQBCiaLlzpMvGW6R5HR2Zjbg-EYpG4p_E3nXQ0aqjyWte0fdBzuf5LTXQ7bbSKRLQwYJtw3z2paTU3xcEqo6e0K8hCY5Sz4-pR70qBv_HWUD_m3_51E_Tqp_VW98NtiZY-fa_6BeFHluIxBm57NEIRm61pAy_pft-Ds0-Rd3FqIkLlgtWwJtuZIl0Qd0iUFtCuYRcG-F3-gLmQDwrV6jsrYiWkV5zFPpYgrB8XgzOeBSj7GSevZYhBAs-a9qZOPWra_jL4gW8r28NfACJCytmzlGuwjKZW1mtbojYMlpyLksr96C8g8Dj11Mc2aZcG2zFZTtSFYqH_M-k3rEMY_qM78jpo6X6ln6u4r_ohaT-QMs8Gs3bwpGzS-bZwZtRgHQ4fLtwFCZi=w747-h310-no?authuser=0" />
</p>

<h3>Using Database</h3>

<p>
Let's modify our app to use MyBatis-Spring.<br />
MyBatis-Spring is an interlocking module for conveniently using MyBatis in Spring.<br />
MyBatis is a SQL mapping persistence framework.<br />
See https://mybatis.org/spring/getting-started.html
</p>

<p>
<strong>Modify Homepage</strong><br />
Add the following form after #wordcard in the index.jsp.
</p>

<p>
src/main/webapp/WEB-INF/views/index.jsp
</p>

<pre class="prettyprint">&lt;form id="new-form" method="post"&gt;
  &lt;input type="text" name="word" /&gt;
  &lt;input type="text" name="definitions" /&gt;
  &lt;input type="submit" value="Add" style="color: grey;" /&gt;
&lt;/form&gt;
</pre>

<p>
Add the following styles to your stylesheet.
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
Connect to your SCOTT account and create the following table.
</p>

<pre class="prettyprint">create table wordcard (
word varchar2(45),
definitions varchar2(4000),
constraint pk_wordcard primary key(word)
);
</pre>

<p>
Add Spring JDBC, Oracle JDBC driver, Apache DBCP, and MyBatis with mybatis-spring.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint"><strong>&lt;dependency&gt;</strong>
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
Add datasource and SqlSessionFactoryBean to the spring configuration.
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
<strong>Java Beans</strong><br />
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
<strong>Mapper Interface</strong><br />
It is better to put the mapper interface in a separate package from other Spring components.
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
Add the mapper interface to the spring configuration using MapperFactoryBean.
</p>

<pre class="prettyprint">&lt;bean id="wordMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.WordMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>Service</strong><br />
</p>

<p>
Modify the WordCardService class to an interface.
</p>

<p>
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
<strong>Controller</strong><br />
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

<h3>Logging</h3>

<p>
See https://mybatis.org/mybatis-3/logging.html
</p>

<p>
Add the apache commons-logging and log4j2 libraries to dependencies in pom.xml.
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
Create a log4j2 configuration file with the name log4j2.xml in the src/main/resources/ folder.
</p>

<p>
src/main/resources/log4j2.xml
</p>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration&gt;
&lt;Configuration xmlns="http://logging.apache.org/log4j/2.0/config&gt;
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
Run mvn clean jetty:run and check the log message.
</p>

<p>
<strong>Mapper XML Files</strong><br />
MyBatis provides a way to separate queries into XML files. This file is the Mapper XML file.
</p>

<p>
So far, we have not created a MyBatis configuration file.<br />
If you put the Mapper XML file and the mapper interface on the same classpath, you don't need a MyBatis configuration file.<br />
See https://mybatis.org/spring/mappers.html#register
</p>

<p>
Create a Mapper XML file named WordMapper.xml in the src/main/resources/net/java_school/mybatis folder.
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
Using the typeAlias element of the MyBatis configuration file can shorten resultType="net.java_school.english.WordCard" to resultType="WordCard" in the Mapper XML file.<br />
See https://mybatis.org/mybatis-3/sqlmap-xml.html<br />
</p>

<pre class="prettyprint">&lt;-- MyBatis XML Configuration --&gt;
&lt;typeAlias type="net.java_school.english.WordCard" alias="WordCard"/&gt;
</pre>

<p>
Proceed without creating a MyBatis configuration file since only one Java Bean.
</p>

<p>
Remove queries from the WordMapper interface.
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
<strong>Spring Auto Scan</strong>
</p>

<p>
You can use Spring's auto-scan to reduce configuration file content.<br />
&lt;context:component-scan /&gt; scans Spring's components like Controllers, services, and Repositories.<br />
&lt;mybatis:scan /&gt; scans mapper instances.
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
&lt;context:component-scan /&gt; lets you to use @Autowired annotation.
</p>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint"><strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Controller
public class HomeController {

  <strong>@Autowired</strong>
  private WordCardService wordCardService;

  /* remove constructors
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

  /* reomve constructors
  public WordCardServiceImpl(WordMapper wordMapper) {
    this.wordMapper = wordMapper;
  }
  */

  //..omit..
}
</pre>

<h3>Java Based Configuration</h3>

<p>
Create the following java file.
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
Complete the AppConfig.java file by referring to the following.
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
Create a Java-based configuration file to replace web.xml.
</p>

<p>
src/main/java/net/java_school/config/MyWebAppInitializer.java
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

<p>
You can also set it as below.<br />
See https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-servlet-context-hierarchy
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
Because Java-based configuration cannot map error pages, you better leave a minimal web.xml file for later error page mapping.<br />
See https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-ann-customer-servlet-container-error-page
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

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-servlet-context-hierarchy">servlet context hierarchy</a></li>
	<li><a href="https://mybatis.org/spring/getting-started.html">MyBatis getting started</a></li>
	<li><a href="https://mybatis.org/mybatis-3/logging.html">MyBatis Logging</a></li>
	<li><a href="https://dlcdn.apache.org/commons/dbcp/">DBCP</a></li>
	<li><a href="https://mybatis.org/spring/mappers.html#register">Register Mappers</a></li>
	<li><a href="https://mybatis.org/mybatis-3/sqlmap-xml.html">Mapper XML Files</a></li>
	<li><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-ann-customer-servlet-container-error-page">Why do we still need a web.xml?</a></li>
</ul>
</article>

</body>
</html>
