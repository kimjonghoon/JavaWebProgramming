<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2026.2.23</div>
	
<h1>제티 메이븐 플러그인</h1>

<p>
제티 메이븐 플러그인(Jetty Maven Plugin)을 사용하면 서버 설치없이 웹 앱을 테스트할 수 있다. 
</p>

<p>
메이븐 아키타입 생성
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
mvn archetype:generate -Dfilter=maven-archetype-webapp
</pre>

<div style="margin-top: 2em;">
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
Define value for property 'groupId': : net.java_school.test
Define value for property 'artifactId': : hello
Define value for property 'version':  1.0-SNAPSHOT: : 
Define value for property 'package':  net.java_school.hello: : 
</pre>
</div>

<p>
생성한 메이븐 프로젝트를 Import - Import - Existing Maven Project 선택하여 이클립스에 임포트
</p>

<p>
web.xml 파일 수정
</p>

<strong class="filename">web.xml</strong>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;
</pre>

<p>
pom.xml 파일 수정
</p>

<strong class="filename">pom.xml</strong>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;
	&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
	&lt;groupId&gt;net.java_school.test&lt;/groupId&gt;
	&lt;artifactId&gt;examples&lt;/artifactId&gt;
	&lt;packaging&gt;war&lt;/packaging&gt;
	&lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
	&lt;name&gt;hello&lt;/name&gt;
	&lt;url&gt;http://maven.apache.org&lt;/url&gt;

	&lt;properties&gt;
		&lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;	
		&lt;maven.compiler.source&gt;25&lt;/maven.compiler.source&gt;
		&lt;maven.compiler.target&gt;25&lt;/maven.compiler.target&gt;
	&lt;/properties&gt;

	&lt;dependencies&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;junit&lt;/groupId&gt;
			&lt;artifactId&gt;junit&lt;/artifactId&gt;
			&lt;version&gt;4.11&lt;/version&gt;
			&lt;scope&gt;test&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;jakarta.servlet&lt;/groupId&gt;
			&lt;artifactId&gt;jakarta.servlet-api&lt;/artifactId&gt;
			&lt;version&gt;${servletVer }&lt;/version&gt;
			&lt;scope&gt;provided&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;!-- https://mvnrepository.com/artifact/jakarta.servlet.jsp.jstl/jakarta.servlet.jsp.jstl-api --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;jakarta.servlet.jsp.jstl&lt;/groupId&gt;
			&lt;artifactId&gt;jakarta.servlet.jsp.jstl-api&lt;/artifactId&gt;
			&lt;version&gt;${jstlApiVer }&lt;/version&gt;
		&lt;/dependency&gt;
		&lt;!-- https://mvnrepository.com/artifact/org.glassfish.web/jakarta.servlet.jsp.jstl --&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;org.glassfish.web&lt;/groupId&gt;
			&lt;artifactId&gt;jakarta.servlet.jsp.jstl&lt;/artifactId&gt;
			&lt;version&gt;${jstlVer }&lt;/version&gt;
		&lt;/dependency&gt;
	&lt;/dependencies&gt;

	&lt;build&gt;
		&lt;finalName&gt;hello&lt;/finalName&gt;
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
				&lt;/plugin&gt;
				&lt;plugin&gt;
					&lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
					&lt;version&gt;2.5.2&lt;/version&gt;
				&lt;/plugin&gt;
				&lt;plugin&gt;
					&lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
					&lt;version&gt;2.8.2&lt;/version&gt;
				&lt;/plugin&gt;
				<strong>&lt;plugin&gt;</strong>
					<strong>&lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;</strong>
					<strong>&lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;</strong>
					<strong>&lt;version&gt;${jettyMavenPluginVer }&lt;/version&gt;</strong>
				<strong>&lt;/plugin&gt;</strong>
			&lt;/plugins&gt;
		&lt;/pluginManagement&gt;
	&lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
<a href="https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin">https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin</a>
에서 가장 최신 jetty-maven-plugin 배포본을 선택하고 의존성이 아닌 플러그인에 추가 (위에서 강조한 부분)
</p>

<p>
jetty 실행
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
mvn jetty:run
</pre>

<p>
http://localhost:8080을 방문하여 <strong>Hello World!</strong> 확인
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin">https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin</a></li>
</ul>

</article>
