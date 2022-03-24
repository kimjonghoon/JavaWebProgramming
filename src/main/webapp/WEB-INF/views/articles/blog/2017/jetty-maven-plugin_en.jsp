<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.11.30</div>
	
<h1>Jetty Maven Plugin</h1>

<p>
With the Jetty Maven Plugin, you can test web apps without installing a server. 
</p>

<p>
Create a webapp archetype.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
mvn archetype:generate -Dfilter=maven-archetype-webapp

- - - - - - - - -

1: remote -&gt; com.haoxuer.maven.archetype:maven-archetype-webapp (a simple maven archetype)
2: remote -&gt; com.lodsve:lodsve-maven-archetype-webapp (Lodsve Maven Archetype Webapp)
3: remote -&gt; org.apache.maven.archetypes:maven-archetype-webapp (An archetype which contains a sample Maven Webapp project.)
4: remote -&gt; org.bytesizebook.com.guide.boot:maven-archetype-webapp
(An archetype to create the starting code for the first three chapters of Guide to Web Development with Java, 2nd edition.)
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): : <strong>3</strong>

- - - - - - - - -

1: 1.0-alpha-1
2: 1.0-alpha-2
3: 1.0-alpha-3
4: 1.0-alpha-4
5: 1.0
6: 1.3
7: 1.4
Choose a number: 7:<em>Just Enter</em> 

- - - - - - - - -

Define value for property 'groupId': : <strong>net.java_school.servlet</strong>
Define value for property 'artifactId': : <strong>initParam</strong>
Define value for property 'version':  1.0-SNAPSHOT: : <em>Just Enter</em>
Define value for property 'package':  net.java_school.hello: : <em>Just Enter</em>
</pre>

<p>
Create an initParamServlet.java in the example directory.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
cd initParam
mkdir -p src/main/java/example
</pre>

<pre lang="en">
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

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    out.println("user: " + user + "&lt;br /&gt;
    out.println("passwd: " + passwd + "&lt;br /&gt;
    out.println("driver: " + driver);

  }

}
</pre>

<p>
Modify web.xml as follows.
</p>

<strong class="filename">web.xml</strong>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
    http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
    version="4.0"
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
Modify pom.xml as follows.
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
    <strong>&lt;dependency&gt;
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
    &lt;/dependency&gt;</strong>
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
          &lt;version&gt;10.0.2&lt;/version&gt;
	&lt;/plugin&gt;</strong>
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
Go to the root directory and run the Jetty server with the following command:
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
mvn jetty:run
</pre>

<p>
Visit http://localhost:8080/initParam.
</p>

<p>
If you are using Java 8, modify pom.xml and web.xml by referring to the following.
</p>

<strong class="filename">pom.xml</strong>
<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;javax.servlet&lt;/groupId&gt;
  &lt;artifactId&gt;javax.servlet-api&lt;/artifactId&gt;
  &lt;version&gt;3.1.0&lt;/version&gt;
  &lt;scope&gt;provided&lt;/scope&gt;
&lt;/dependency&gt;
</pre>

<strong class="filename">web.xml</strong>
<pre class="prettyprint">
&lt;web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
  http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"&gt;
</pre>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin">https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin</a></li>
  <li><a href="https://maven.apache.org/plugins/maven-compiler-plugin/usage.html">https://maven.apache.org/plugins/maven-compiler-plugin/usage.html</a></li>
</ul>

</article>
