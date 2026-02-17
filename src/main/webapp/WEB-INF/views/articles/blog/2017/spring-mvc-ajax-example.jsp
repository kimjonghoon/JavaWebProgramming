<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
<div class="last-modified">Last Modified 2020.2.6</div>

<h1>스프링 MVC에서 동작하는 간단한 에이잭스 예제</h1>

<p>
예제 소스 : <a href="https://github.com/kimjonghoon/simpleAjaxExampleOnSpringMVC">https://github.com/kimjonghoon/simpleAjaxExampleOnSpringMVC</a>
</p>

<h3>아키타입 생성 과정과 소스 설명</h3>

<div>
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn archetype:generate -Dfilter=maven-archetype-webapp</pre>
</div>

<div style="margin-top: 1em;">
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
Define value for property 'groupId': : net.java_school
Define value for property 'artifactId': : simpleAjaxExampleOnSpringMVC
Define value for property 'version':  1.0-SNAPSHOT: : 
Define value for property 'package':  net.java_school: : net.java_school.simpleAjaxExampleOnSpringMVC
</pre>
</div>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;

	&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
	&lt;groupId&gt;net.java_school&lt;/groupId&gt;
	&lt;artifactId&gt;simpleAjaxExampleOnSpringMVC&lt;/artifactId&gt;
	&lt;packaging&gt;war&lt;/packaging&gt;
	&lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
	&lt;name&gt;simpleAjaxExampleOnSpringMVC&lt;/name&gt;
	&lt;url&gt;http://maven.apache.org&lt;/url&gt;

	&lt;properties&gt;
		&lt;jdk.version&gt;11&lt;/jdk.version&gt;
	&lt;/properties&gt;

	&lt;dependencies&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;junit&lt;/groupId&gt;
			&lt;artifactId&gt;junit&lt;/artifactId&gt;
			&lt;version&gt;3.8.1&lt;/version&gt;
			&lt;scope&gt;test&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;!-- Servlet JSP JSTL --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;javax.servlet&lt;/groupId&gt;
			&lt;artifactId&gt;javax.servlet-api&lt;/artifactId&gt;
			&lt;version&gt;4.0.1&lt;/version&gt;
			&lt;scope&gt;provided&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;javax.servlet.jsp&lt;/groupId&gt;
			&lt;artifactId&gt;javax.servlet.jsp-api&lt;/artifactId&gt;
			&lt;version&gt;2.3.3&lt;/version&gt;
			&lt;scope&gt;provided&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;jstl&lt;/groupId&gt;
			&lt;artifactId&gt;jstl&lt;/artifactId&gt;
			&lt;version&gt;1.2&lt;/version&gt;
		&lt;/dependency&gt;
		&lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
			&lt;artifactId&gt;jackson-core&lt;/artifactId&gt;
			&lt;version&gt;2.12.0&lt;/version&gt;
		&lt;/dependency&gt;
		&lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
			&lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;
			&lt;version&gt;2.12.0&lt;/version&gt;
		&lt;/dependency&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;org.springframework&lt;/groupId&gt;
			&lt;artifactId&gt;spring-context&lt;/artifactId&gt;
			&lt;version&gt;5.3.2&lt;/version&gt;
		&lt;/dependency&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;org.springframework&lt;/groupId&gt;
			&lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;
			&lt;version&gt;5.3.2&lt;/version&gt;
		&lt;/dependency&gt;
	&lt;/dependencies&gt;

	&lt;build&gt;
		&lt;finalName&gt;simpleAjaxExampleOnSpringMVC&lt;/finalName&gt;
		&lt;pluginManagement&gt;
			&lt;plugins&gt;
				&lt;plugin&gt;
					&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
					&lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
					&lt;version&gt;2.6&lt;/version&gt;
					&lt;configuration&gt;
						&lt;failOnMissingWebXml&gt;false&lt;/failOnMissingWebXml&gt;
					&lt;/configuration&gt;
				&lt;/plugin&gt;
				&lt;plugin&gt;
					&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
					&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
					&lt;version&gt;3.6.2&lt;/version&gt;
					&lt;configuration&gt;
						&lt;source&gt;${jdk.version}&lt;/source&gt;
						&lt;target&gt;${jdk.version}&lt;/target&gt;
						&lt;encoding&gt;UTF-8&lt;/encoding&gt;
					&lt;/configuration&gt;
				&lt;/plugin&gt;
				&lt;plugin&gt;
					&lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
					&lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
					&lt;version&gt;10.0.0&lt;/version&gt;
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
&lt;!--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--&gt;
&lt;web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
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
<img src="<c:url value="/resources/images/spring-mvc-ajax-example-1.png"/>" alt="Home" style="width: 400px;" />
<img src="<c:url value="/resources/images/spring-mvc-ajax-example-2.png"/>" alt="Java Index" style="width: 400px;" />
<img src="<c:url value="/resources/images/spring-mvc-ajax-example-3.png"/>" alt="JDK Install" style="width: 400px;" />
</p>

</article>