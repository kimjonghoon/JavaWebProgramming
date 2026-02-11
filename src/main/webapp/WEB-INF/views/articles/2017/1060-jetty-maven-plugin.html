<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>제티 메이븐 플러그인</title>
<meta name="Keywords" content="java,자바,jetty,jetty maven plugin,제티 메이븐 플러그인,mvn jetty:run" />
<meta name="Description" content="제티 메이븐 플러그인" />
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
<div class="last-modified">Last Modified 2025.5.5</div>
	
<h1>제티 메이븐 플러그인</h1>

<p>
제티 메이븐 플러그인(Jetty Maven Plugin)을 사용하면 서버 설치없이 웹 앱을 테스트할 수 있다. 
</p>

<p>
메이븐 아키타입을 생성한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
mvn archetype:generate -Dfilter=maven-archetype-webapp
</pre>

<div style="margin: 1.5em 0;">
<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
Choose archetype:
1: remote -&gt; com.haoxuer.maven.archetype:maven-archetype-webapp (a simple maven archetype)
2: remote -&gt; com.lodsve:lodsve-maven-archetype-webapp (Lodsve Maven Archetype Webapp)
3: remote -&gt; org.apache.maven.archetypes:maven-archetype-webapp (An archetype which contains a sample Maven Webapp project.)
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): : 3
</pre>
</div>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
Define value for property 'groupId': : net.java_school.servlet
Define value for property 'artifactId': : initParam
Define value for property 'version':  1.0-SNAPSHOT: : 
Define value for property 'package':  net.java_school.servlet: : 
</pre>

<p>
아래처럼 디텍터리를 생성한 후, initParamServlet.java 파일을 생성한다.
</p>

<pre lang="en" class="tree">
initParam
  └── src
       └── main
            └── java
                 └── example
                       └── InitParamServlet.java
</pre>

<strong class="filename">InitParamServlet.java</strong>
<pre class="prettyprint">
package example;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InitParamServlet extends HttpServlet {
  private String url;
  private String user;
  private String passwd;
  private String driver;

  @Override
  public void init() throws ServletException {
    url = this.getInitParameter("url");
    user = this.getInitParameter("user");
    passwd = this.getInitParameter("passwd");
    driver = this.getInitParameter("driver");
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) 
      throws IOException, ServletException {

    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();

    out.println("url: " + url + "&lt;br /&gt;");
    out.println("user: " + user + "&lt;br /&gt;");
    out.println("passwd: " + passwd + "&lt;br /&gt;");
    out.println("driver: " + driver);
  }
}
</pre>

<p>
web.xml 파일을 수정한다.
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

  <strong>&lt;servlet&gt;
    &lt;servlet-name&gt;InitParamServlet&lt;/servlet-name&gt;
    &lt;servlet-class&gt;example.InitParamServlet&lt;/servlet-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;driver&lt;/param-name&gt;
      &lt;param-value&gt;oracle.jdbc.driver.OracleDriver&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;url&lt;/param-name&gt;
      &lt;param-value&gt;jdbc:oracle:thin:@127.0.0.1:1521:XE&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;user&lt;/param-name&gt;
      &lt;param-value&gt;scott&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;passwd&lt;/param-name&gt;
      &lt;param-value&gt;tiger&lt;/param-value&gt;
    &lt;/init-param&gt;
  &lt;/servlet&gt;

  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;InitParamServlet&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/initParam&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;</strong>

&lt;/web-app&gt;
</pre>

<p>
pom.xml 파일을 수정한다.
</p>

<strong class="filename">pom.xml</strong>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
    http://maven.apache.org/maven-v4_0_0.xsd"&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;<strong>net.java_school.servlet</strong>&lt;/groupId&gt;
  &lt;artifactId&gt;<strong>initParam</strong>&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;packaging&gt;war&lt;/packaging&gt;
  &lt;name&gt;initParam Maven Webapp&lt;/name&gt;
  &lt;url&gt;<strong>http://www.java-school.net</strong>&lt;/url&gt;

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
      <strong>&lt;version&gt;3.0.1&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  &lt;/dependencies&gt;
  &lt;build&gt;
    &lt;finalName&gt;<strong>initParam</strong>&lt;/finalName&gt;
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
        <strong>&lt;plugin&gt;
          &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
          &lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
          &lt;version&gt;11.0.25&lt;/version&gt;
        &lt;/plugin&gt;</strong>
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
initParam 디렉터리로 이동하여 다음 명령으로 제티 서버를 실행한다.
</p>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
http://localhost:8080/initParam 을 방문하여 테스트한다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin">https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin</a></li>
	<li><a href="https://www.eclipse.org/jetty/download.php">https://www.eclipse.org/jetty/download.php</a></li>
</ul>

</article>

</body>
</html>
