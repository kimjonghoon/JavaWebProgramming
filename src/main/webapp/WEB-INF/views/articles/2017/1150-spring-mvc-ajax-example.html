<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>스프링 MVC에서 동작하는 간단한 에이잭스 예제</title>
<meta name="Keywords" content="java,자바,ajax,에이젝스,spring mvc,스프링 MVC" />
<meta name="Description" content="스프링 MVC에서 동작하는 간단한 에이잭스 예제" />
<link rel="stylesheet" href="../../../static/css/korean.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 2025.6.21</div>

<h1>스프링 MVC에서 동작하는 간단한 에이잭스 예제</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/simpleAjaxExampleOnSpringMVC</span>
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;

  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;net.java_school&lt;/groupId&gt;
  &lt;artifactId&gt;simpleAjaxExampleOnSpringMVC&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;packaging&gt;war&lt;/packaging&gt;

  &lt;name&gt;simpleAjaxExampleOnSpringMVC Maven Webapp&lt;/name&gt;
  &lt;url&gt;http://www.java_school.net&lt;/url&gt;

  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;21&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;21&lt;/maven.compiler.target&gt;
    &lt;spring.version&gt;6.2.8&lt;/spring.version&gt;
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;junit&lt;/groupId&gt;
      &lt;artifactId&gt;junit&lt;/artifactId&gt;
      &lt;version&gt;4.11&lt;/version&gt;
      &lt;scope&gt;test&lt;/scope&gt;
    &lt;/dependency&gt;
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
      <strong>&lt;version&gt;4.0.0&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    &lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core --&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
      &lt;artifactId&gt;jackson-core&lt;/artifactId&gt;
      &lt;version&gt;2.19.0&lt;/version&gt;
    &lt;/dependency&gt;
    &lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind --&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
      &lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;
      &lt;version&gt;2.19.0&lt;/version&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework&lt;/groupId&gt;
      &lt;artifactId&gt;spring-context&lt;/artifactId&gt;
      &lt;version&gt;${spring.version}&lt;/version&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework&lt;/groupId&gt;
      &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;
      &lt;version&gt;${spring.version}&lt;/version&gt;
    &lt;/dependency&gt;
  &lt;/dependencies&gt;

  &lt;build&gt;
    &lt;finalName&gt;simpleAjaxExampleOnSpringMVC&lt;/finalName&gt;
    &lt;pluginManagement&gt;
      &lt;plugins&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.1.0&lt;/version&gt;
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
          &lt;configuration&gt;
            &lt;failOnMissionWebXml&gt;false&lt;/failOnMissionWebXml&gt;
          &lt;/configuration&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.5.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.8.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
          &lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
          &lt;version&gt;1!.0.25&lt;/version&gt;
        &lt;/plugin&gt;
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;

&lt;/project&gt;
</pre>

<h3>모델</h3>

<h6 class="src">Post.java</h6>
<pre class="prettyprint">
package net.java_school.blog;

public class Post {
  private String title;
  private String keywords;
  private String description;
  private String content;
    
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getKeywords() {
    return keywords;
  }
  public void setKeywords(String keywords) {
    this.keywords = keywords;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
}
</pre>

<h3>컨트롤러</h3>

<h6 class="src">BlogController.java</h6>
<pre class="prettyprint">
package net.java_school.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BlogController {

  @RequestMapping(method=RequestMethod.GET)
  public String home() {
    return "index";
  }
	
  @RequestMapping(value="java", method=RequestMethod.GET)
  public String javaIndex() {
    return "java/index";
  }

  @RequestMapping(value="java/{id}", method=RequestMethod.GET)
  @ResponseBody
  public Post getPost(@PathVariable String id) {
    Post post = new Post();

    switch (id) {
    case "jdk-install":
      post.setTitle("자바 설치");
      post.setKeywords("JDK,Java 8");
      post.setDescription("자바 8 설치에 대해 설명합니다.");
      post.setContent("http://www.oracle.com을 방문합니다. ..");
      break;
    default:
      post.setTitle("해당 문서가 없습니다.");
      post.setKeywords("해당 문서가 없습니다.");
      post.setDescription("해당 문서가 없습니다.");
      post.setContent("해당 문서가 없습니다.");
    }
    return post;
  }
}
</pre>

<h3>JSP</h3>

<h6 class="src">/WEB-INF/views/index.jsp</h6>
<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
&lt;h2&gt;Hello World!&lt;/h2&gt;
&lt;a href="/java"&gt;Go to Java Tutorial&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/WEB-INF/views/java/index.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="keywords" /&gt;
&lt;meta name="Description" content="description" /&gt;
&lt;title&gt;제목&lt;/title&gt;
&lt;script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"&gt;&lt;/script&gt; 
&lt;script type="text/javascript"&gt;
$(document).ready(function() {
  $('#jdk-install a').click(function() {
    var url = '/java/jdk-install';
    $.getJSON(url, function(data) {
      $('title').empty();
      $('title').append(data.title);
      $("meta[name='Keywords']").attr("content", data.keywords);
      $("meta[name='Description']").attr("content", data.description);
      $('article').empty();
      $('article').append(data.content);
      console.log(data);            
      console.log($("meta[name='Keywords']").attr("content"));
      console.log($("meta[name='Description']").attr("content"));
    });
    return false;
  });
});
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;ul&gt;
  &lt;li id="home"&gt;&lt;a href="/"&gt;홈&lt;/a&gt;&lt;/li&gt;
  &lt;li id="jdk-install"&gt;&lt;a href="#"&gt;JDK 설치&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;article&gt;
본문
&lt;/article&gt;

&lt;/body&gt;&lt;/html&gt;
</pre>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;
  
  &lt;display-name&gt;Simple Ajax Example On Spring MVC&lt;/display-name&gt;
    
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
    &lt;servlet-name&gt;ajaxexample&lt;/servlet-name&gt;
    &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
    
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;ajaxexample&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
 
&lt;/web-app&gt;
</pre>

<h6 class="src">ajaxexample-servlet.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:p="http://www.springframework.org/schema/p"
    xsi:schemaLocation="http://www.springframework.org/schema/beans 
        http://www.springframework.org/schema/beans/spring-beans.xsd
		 http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;
        
  &lt;mvc:annotation-driven /&gt;
        
  &lt;context:component-scan base-package="net.java_school.blog" /&gt;
            
  &lt;bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
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
    
&lt;/beans&gt;
</pre>

<h3>테스트</h3>

<p>
pom.xml이 있는 디렉터리에서 <b>mvn jetty:run</b>을 실행한 후, http://localhost:8080을 방문한다.
</p>

<p>
<img src="https://lh3.googleusercontent.com/EuWzAiyzsRYleoEKFaCa7GpddmHuHdRWcfEPFyI0T1svx0SAZ70eLfFhy5MT_dxshGnZPbwj582Kdl6f-4cV0jdeMFRRWzaRYIiihe5sLA4d1V1B9Pu38hyu88w-bsHe1_7DHScjH-ziouYLv2mTsn3-0iltsbrWqmTE2ukJhubP08ZLGxIyWleqHTIIWrY4T_h3DiAUjpZ5OdyZwiJloCuiFj42yzzNueexcotfov7P3idYe-ihse6teSn8mr1Hfd8mTigORJ6Q_0YtgQsEPGqVU96tMJRl2FmEF4yxjPDVvy2ojIZNmB_CV9MWbrVUwHF25E0Uz4McMleU3nE8QBsbJ-Uu7ArT1mdlgj54rrvvPeTlvW4xpx4HyWmmNlpAJ9XZGSXwLLrRxfKcdsNo_xwCpgoXpz_2P_ytlTjT0axd6yaa39VbIGCMoybxIDqX8U03zAJUzWtNHQGQPuSGdmjE7YiSxjZDLMucujtp_yXvm3cskmQ7s1Ur84lRjBaOnOlQteZEyx6An9y8qPJzPgiJcyB86U09rgRm4ctlvPqp2zscgBDoarIdHEhGryMleIkqmNvWcVbwABrAlUPuKFPN0LPqMwBEEhIIl64=w299-h148-no" alt="Home" /><br />
<img src="https://lh3.googleusercontent.com/HE-Y8rFMbIWy1GiDOYCcBlv7AwFnQETc5JK5j4ek0lw2zWKtixuI2NobDa6LdZJDBJ1yM9i3d7mAXO2DEnf_-zvVMaza88U7Wrl-ikfpJDEreTKg0hcLXvS1ePfvIeRv2sNxX7ASgoFMOIsmW3bZZwv6JwryAq0sj8jgrtWdhL6Ok56CBr3YhU-P7ZWZaRnjPV3n9bs8o-SNM9GZL2po8MQoOwM8Qj-EV_6xFshKPbsweBhLgYfEyo0TKN5AtbZxJit337bZ12KFwleULYVN3ZjY5dg8F6ZZYvgZB89EdbZ2Bk3fy4g1plsZSDBaIle2MXkXu8PO7Tq0Qs_yC0CJyR6P8Ht1-3KzCap5gdksm6rzD1A6vowVTTRtnqqQeuAeOSApwqzmEEi6iNvT0RHQjPMvTTQ-fVvI39lKXN4S6sN-x-XrjExrA0b6MuKvaMTmGfOCKfdRfJTrMdn9WF4k47YKa8U-wFfE1s5cJ6K3C1JVyzYeW7LhmaZpc3lnQVuwDcPMNMG3nKZG6UcQRjlQp3Gc6EzzLu1HboWKOhtIFgb5NMIJtJHj17sFWKgQYpPKw34SfP2l8sN075zLcbv6mAW-yY3Xjb6sCUa5VH0=w330-h155-no" alt="Java Index" /><br />
<img src="https://lh3.googleusercontent.com/wwxmRzKcrdSjnWt7XUMKCbXOvVcHnBCpQLEti9ySb9dR3vOX1IPxxuCI26SYMtFSrdHqW5jBHuN8hRPOIPfsKqIAsEa6tsNXwDm1VVZ5EE_13kRa83zTeoPTsCt7nhs5LA7HK4d3br6eIc0uKsyd4anmzZ0t38yIAEj1UUHROzZMWia23jnHABe2Eh5fF1yRZ-UxzBSFSO8scnn-7iu12hHbFK-HHot39U141uPgy9eVqyhX9jLjcrnh1FlqwQkyy13_CpaeD5HsynuN1688Km1HrC0qCrDOP7be9CwGIBLJCkFfk6zw2UgJztBZds62vYCc1PYDVKkbX36mg1hkHQeVmSBljVrdWLjk9wlf7TufeiIXgZmeU7jjTnaZE5BR73By6PQl8kmRiNTj_z0GY5F7M3s7wPBMsf1KNkndR_IqIYZwIy3n5LeXh4umuTYFSr99R86v-hql8TfJvzaq5RBTsawQ6-4dyGxbi4pPu-1pX1KWi0DZkwjjm_LFPScNnhkrNVQyTHKWEwsWV6kOs7kP7PBz-8ZQaeRzKxQaK1FUe2dH-Fy_q-I_qDZPMB6dUt1mH8q1BE_ZvYG4782wvIUIA_maoLBdgUN0tK4=w303-h158-no" alt="JDK Install" /><br />
</p>

</article>

</body>
</html>
