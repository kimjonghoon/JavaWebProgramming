<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Building Spring MVC with Maven</h1>

<p style="color: 777;">
This article assumes that your workspace is C:\www.
</p>

<h2>Generating archetype</h2>

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
Maven creates the spring-bbs folder in C:\www through the build process. C:\www\spring-bbs is the root directory of your project. The src/main/webapp folder, just above WEB-INF, is the document base.
</p>

<p>
Create a Tomcat context file as follows.
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/spring-bbs/<strong>src/main/webapp</strong>"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Copy the ROOT.xml file to the CATALINA_HOME/conf/Catalina/localhost folder. After restart Tomcat, visit http://localhost:8080 to see the ROOT application is working.
</p>

<h2>Spring MVC Test</h2> 

<p>
Modify pom.xml like below.
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
Modify web.xml like below.
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
Of the filters above, the one that executes the setCharacterEncoding("UTF-8") code on every request is essential for non-English websites. You should declare it before any other filters.
</p>

<p>
Since we set Spring MVC DispatcherServlet configuration file as /WEB-INF/spring/mvc.xml in web.xml, we need to create a spring configuration file named mvc.xml in /WEB-INF/spring/ folder.
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
<strong>Design the homepage</strong>
</p>

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
&lt;style&gt;
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
&lt;/style&gt;
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

<p>
The src/main/java folder is the default maven folder.
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
@Controller and @GetMapping are Spring annotations used to pass information to Spring.
@Controller placed above the class declaration tells Spring that the Java bean is a controller.
@GetMapping("/") located above the controller method indicates that this method handles the GET "/" request.
If it is the root application, that "/" will be http://localhost:8080/.
</p>

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
<strong>Build and deploy</strong><br />
Execute the following in the maven root directory:<br />
mvn compile war:inplace<br />
The war:inplace option creates bytecode in src/main/WEB-INF/classes and dependent libraries in src/main/WEB-INF/lib.
</p>

<p>
<strong>Test</strong><br />
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
<strong>View</strong><br />
src/main/webapp/WEB-INF/views/index.jsp
</p>

<p>
Modify the content of the body element as below.
</p>

<pre class="prettyprint">&lt;div id="wordcard"&gt;
&lt;h1&gt;<strong>\${wordCard.word }</strong>&lt;/h1&gt;
&lt;p&gt;
<strong>\${wordCard.definitions }</strong>
&lt;/p&gt;
&lt;/div&gt;
</pre>

<p>
<strong>Test</strong><br />
mvn compile war:inplace<br />
http://localhost:8080<br />
<img alt="Test 2" src="https://lh3.googleusercontent.com/dwkIwv1hRRscdrRCo-2qZASfWcc4MWtvULEVv5kebNRq77iKjhPzKpM4_ACRXyZdyF9rhXYWSX7lIcwZq6BgyzRx24kLHwVMaQaNUddQkLpKFjQQ6OfVsT7Vs8BjtPoLr5QGscFWf9xhOLXTO3qIsD1SvFH-d3GCunNzjjV60TyG9yJTEDIPeMEqgHpK5b3jft77ylfgU3Cb7h0DFeV7VAKi6vS0ursE75tLjogrdRhU4TwHobQxK-f349JOguSsP3q8c2sxdcEgVxsG5A3wx2hDDHCxkVQKoj1jq0ueLy1jQsMCV2XC9X31qqt-RNKyVhMzL6s1tgxeWJtLFIiAAIYBTbNT7gy2SU8tNaCPf12hBoGmaIGxb9nVn39oqaGVy-1wzFCkaRukjrYwI-w-nFw5TM279GpFgxO5N4SnvKKD-YyEb3NFALiiXW3n0QMwsq9kOb5B6mzxoP4QO2ktqSkxlW8x78RUp2Bx89lI4UsFaj7HkUtrQ8SH18gzIpHJrI4GN-TJBhoiRGIOFLaeNTyykftCTMAFFm5XQBCiaLlzpMvGW6R5HR2Zjbg-EYpG4p_E3nXQ0aqjyWte0fdBzuf5LTXQ7bbSKRLQwYJtw3z2paTU3xcEqo6e0K8hCY5Sz4-pR70qBv_HWUD_m3_51E_Tqp_VW98NtiZY-fa_6BeFHluIxBm57NEIRm61pAy_pft-Ds0-Rd3FqIkLlgtWwJtuZIl0Qd0iUFtCuYRcG-F3-gLmQDwrV6jsrYiWkV5zFPpYgrB8XgzOeBSj7GSevZYhBAs-a9qZOPWra_jL4gW8r28NfACJCytmzlGuwjKZW1mtbojYMlpyLksr96C8g8Dj11Mc2aZcG2zFZTtSFYqH_M-k3rEMY_qM78jpo6X6ln6u4r_ohaT-QMs8Gs3bwpGzS-bZwZtRgHQ4fLtwFCZi=w747-h310-no?authuser=0" />
</p>

<h3>MyBatis-Spring Example</h3>

<p>
We haven't covered the database yet.<br />
Model 2 bulletin board uses JDBC as it is. But code that uses JDBC as-is is unproductive due to repetitive code.
</p>

<p>
Using the persistence framework--it uses JDBC as an internal source--reduces the amount of code you have to write.
</p>

<p>
MyBatis is a SQL mapping persistence framework.<br />
MyBatis-Spring is an interlocking module for conveniently using MyBatis in Spring.<br />
See https://mybatis.org/spring/ko/getting-started.html
</p>

<p>
Connect to your JAVA account and create the following table and sequence.
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
Add Spring JDBC, Oracle JDBC driver, Apache DBCP, and MyBatis with mybatis-spring.
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
commons-dbcp is a database connection pool provided by Apache.<br />
Since ojdbc6.jar is a JDBC 4 driver,  we need the DBCP 1.4 version.<br />
See https://dlcdn.apache.org//commons/dbcp/
</p>

<p>
Add datasource and SqlSessionFactoryBean to the spring configuration.
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
If you are using commons-dbcp2, you need to change the maxActive and maxWait parameters to maxTotal and maxWaitMillis.
</p>

<p>
<strong>Java Beans</strong><br />
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
<strong>Mapper Interface</strong><br />
It is better to put the mapper interface in a separate package from other Spring components.
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
Add the mapper interface to the spring configuration using MapperFactoryBean.
</p>

<pre class="prettyprint">&lt;bean id="photoMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.PhotoMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>Service</strong><br />
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

<pre class="prettyprint">&lt;bean id="photoService" class="net.java_school.photostudio.PhotoServiceImpl"&gt;
  &lt;constructor-arg ref="photoMapper" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>Controller</strong><br />
Add @RequestMapping("photo") annotation on the class declaration to create a controller that handles requests with "photo" appended to the ContextPath.
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

<pre class="prettyprint">&lt;bean id="photoController" class="net.java_school.photostudio.PhotoController"&gt;
  &lt;constructor-arg ref="photoService" /&gt;
&lt;/bean&gt;
</pre>

<p>
<strong>View</strong><br />
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
<strong>Test</strong>
</p>

<p>
mvn compile war:inplace<br />
http://localhost:8080/photo<br />
Paste the web image link into the text field and click the send button.
Connect to SQL*PLUS and check if there are any records in the table.
</p>

<p>
<strong>Logging</strong><br />
See https://mybatis.org/mybatis-3/ko/logging.html
</p>

<p>
Add the apache commons-logging and log4j2 libraries to dependencies in pom.xml.
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
Create a log4j2 configuration file with the name log4j2.xml in the src/main/resources/ folder. That is the default maven folder.
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
Run mvn compile war:inplace to compile and check the log message.
</p>

<pre>http-nio-8080-exec-14 DEBUG PhotoMapper.insert - ==&gt;  Preparing: INSERT INTO photo VALUES (seq_photo.nextval, ?
http-nio-8080-exec-14 DEBUG PhotoMapper.insert - ==&gt; Parameters: https://cdn.pixabay.com/house_720.jpg(String)
</pre>

<p>
The right parenthesis is missing in the insert statement.<br />
Add parentheses and compile again.<br />
Check the log message.
</p>

<pre>http-nio-8080-exec-26 DEBUG PhotoMapper.insert - ==&gt;  Preparing: INSERT INTO photo VALUES (seq_photo.nextval, ?<strong>)</strong>
http-nio-8080-exec-26 DEBUG PhotoMapper.insert - ==&gt; Parameters: https://cdn.pixabay.com/house_720.jpg(String)
http-nio-8080-exec-26 DEBUG PhotoMapper.insert - &lt;==    <strong>Updates: 1</strong>
</pre>

<p>
<strong>XML Mapper</strong><br />
MyBatis provides a way to separate queries into XML files. This file is the XML mapper file.
이 파일이 XML 매퍼 파일이다.
</p>

<p>
So far, we have not created a MyBatis configuration file.<br />
If you put the XML mapper file and the mapper interface on the same classpath, you don't need a MyBatis configuration file.<br />
See https://mybatis.org/spring/ko/mappers.html#register
</p>

<p>
Create a PhotoMapper.xml mapper file in the src/main/resources/net/java_school/mybatis folder.
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
Remove the query from the PhotoMapper interface.
</p>

<h6 class="src">PhotoMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;

public interface PhotoMapper {
  public void insert(@Param("content") String content);
}
</pre>

<p>
<strong>Show saved images</strong><br />
Let's try to show four images per page.
</p>

<p>
Modify the contents of the body element of the index.jsp file as follows.
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
Add the following to the style element of the file.
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
Add methods to the PhotoMapper interface to get the total number of records and items to display on the page.
</p>

<h6 class="src">PhotoMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

<strong>import net.java_school.photostudio.Photo;</strong>

<strong>import java.util.HashMap;</strong>
<strong>import java.util.List;</strong>

import org.apache.ibatis.annotations.Param;

public interface PhotoMapper {
  
  public void insert(@Param("content") String content);

  <strong>public int selectCountOfPhotos();</strong>//Total Record Count

  <strong>public List&lt;Photo&gt; selectPhotos(HashMap&lt;String, String&gt; hashmap);</strong>//Itemsfor view
}
</pre>

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
Using the typeAlias element of the MyBatis configuration file can shorten resultType="net.java_school.photostudio.Photo" to resultType="Photo" in the XML mapper file.<br />
See https://mybatis.org/mybatis-3/ko/sqlmap-xml.html<br />
</p>

<pre class="prettyprint">&lt;-- MyBatis XML Configuration --&gt;
&lt;typeAlias type="net.java_school.photostudio.Photo" alias="Photo"/&gt;
</pre>

<p>
Proceed without creating a MyBatis configuration file since only one Java Bean.
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
<strong>View</strong><br />
To use JSTL, add the following to the index.jsp file.
</p>

<pre class="prettyprint">&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;</pre>

<p>
Use the JSTL code to set the passed data in the view.
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">&lt;div id="photos"&gt;
  <strong>&lt;c:forEach var="photo" items="\${photos }" varStatus="status"&gt;</strong>
  &lt;img width="640" alt="p_<strong>\${photo.no }</strong>" src="<strong>\${photo.content }</strong>" /&gt;
  <strong>&lt;/c:forEach&gt;</strong>
&lt;/div&gt;

&lt;div id="paging"&gt;
  <strong>&lt;c:if test="&#36;{param.page &gt; 1 }"&gt;</strong>
  &lt;a href="?page=<strong>\${param.page - 1 }</strong>" title="<strong>\${param.page - 1}</strong>"&gt;◁ Back&lt;/a&gt;
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
  &lt;a href="?page=<strong>\${param.page + 1 }</strong>" title="<strong>\${param.page + 1 }</strong>"&gt;Next▷ &lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>

  &lt;form id="addForm" method="post"&gt;
    &lt;input type="text" name="content" width="500" /&gt;
    &lt;input id="submit" type="submit" value="Send" /&gt; 
  &lt;/form&gt;

&lt;/div&gt;
</pre>

<p>
<strong>Spring Auto Scan</strong>
</p>

<p>
You can use Spring's auto-scan to reduce configuration file content.<br />
&lt;context:component-scan /&gt; scans Spring's components like Controllers, services, and Repositories.<br />
&lt;mybatis:scan /&gt; scans mapper instances.
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
&lt;context:component-scan /&gt; lets you to use @Autowired annotation.
</p>

<h6 class="src">PhotoController.java</h6>
<pre class="prettyprint"><strong>import org.springframework.beans.factory.annotation.Autowired;</strong>

@Controller
public class PhotoController {

  <strong>@Autowired</strong>
  private PhotoService photoService;

  /* Remove the Constructor.
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

  /* Remove a Constructor
  public PhotoServiceImpl(PhotoMapper photoMapper) {
    this.photoMapper = photoMapper;
  }
  */

  //..omit..
}
</pre>

<p>
Add annotations to WordCardDao, WordCardService, and HomeController so that &lt;context:component-scan /&gt; can scan them.
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

<h3>Set up the project in eclipse</h3>

<p>
Start Eclipse and select your workspace as C:\www. In the Project Explorer view, use the right mouse button to display context menus. Import the spring-bbs project into Eclipse.
</p>

<p>
<img alt="Context menu Import" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png" />
</p>

<p>
<img alt="Maven Project Import" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png" />
</p>

<p>
If the pom.xml file changes, you need to synchronize pom.xml with Eclipse.
</p>

<p>
<img alt="eclipse and pom.xml synchronized" src="https://lh3.googleusercontent.com/-CB-gDjPd5BQ/VYYdFhRh0WI/AAAAAAAACiE/GDH5LExU4FI/s640/maven-update-project-configuration.png" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method">http://stackoverflow.com/questions/14004308/spring-autowiring-not-able-to-hit-my-dao-class-method</a></li>
  <li><a href="http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/">http://static.springsource.org/spring/docs/current/spring-framework-reference/pdf/</a></li>
  <li><a href="https://maven.apache.org/guides/mini/guide-naming-conventions.html">Guide to naming conventions on groupId, artifactId and version</a></li>
  <li><a href="http://maven.apache.org/plugins/maven-war-plugin/usage.html">4 ways to use the WAR Plugin</a></li>
  <li><a href="https://github.com/spring-projects/spring-mvc-showcase/blob/master/pom.xml">https://github.com/spring-projects/spring-mvc-showcase/blob/master/pom.xml</a></li>
  <li><a href="http://stackoverflow.com/questions/793983/jsp-el-expression-is-not-evaluated">https://stackoverflow.com/questions/793983/jsp-el-expression-is-not-evaluated</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/spring/spring-security"/>">Spring Security</a></li>
		<li>Prev : <a href="<c:url value="/jsp/building-java-projects"/>">Building Java Projects</a></li>
	</ul>
</div>

</article>