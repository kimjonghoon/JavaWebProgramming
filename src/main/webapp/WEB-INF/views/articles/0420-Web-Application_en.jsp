<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Web Application?</title>
<meta name="Keywords" content="Java,web application components,WEB-INF,WEB-INF/classes,WEB-INF/lib,Tomcat class Loader,web.xml,packing,jar cvf" />
<meta name="Description" content="This article introduces java web application" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>Web Application?</h1>

<p>
A server like Tomcat is called a servlet container.
These are web applications that a servlet container carries and manages.
A servlet container must ensure that the web applications operate following Sun's Servlets/JSP Spec.
</p>

<h2>Components of a web application</h2>

<p>
Java web application consists of the following files.
</p>

<ul>
	<li>HTML, Images, Style Sheets, JavaScript</li>
	<li>JSPs</li>
	<li>Servlets</li>
	<li>Java Classes, Java archive file(jar)</li>
	<li>web.xml</li>
</ul>

<p>
Some of the above components have a specified location.
</p>

<ul>
	<li>Servlets and Java classes in WEB-INF/classes</li>
	<li>Java archive files in WEB-INF/lib</li>
	<li>The web.xml in WEB-INF</li>
</ul>

<h2>Directories of Web application</h2>

<p>
The default location for web applications in Tomcat is CATALINA_HOME/webapps.
If you want to add a new web application, create a subdirectory with the appropriate name in CATALINA_HOME/webapps.
This subdirectory is the root directory of the web application. 
For Tomcat, this directory is called DocumentBase.
You have to create the following subdirectories in DocumentBase.
</p>

<h3>WEB-INF</h3>

<p>
The web application deployment descriptor, web.xml file must be here.
Users cannot access files in the WEB-INF directory and its subdirectory through their web browser.
</p>

<h3>WEB-INF/classes</h3>

<p>
Java class files (bytecode) must be here.
</p>

<h3>WEB-INF/lib</h3>

<p>
Java archive file (jar) must be here.
Note that the same bytecode can be in the WEB-INF/classes and the WEB-INF/lib.
In this case, the Tomcat class loader first searches WEB-INF/classes and loads it into memory.
The class loader ignores the bytecode of the Java archive file in the WEB-INF/lib.
Hence that bytecode cannot participate in the program.
</p>

<dl class="note">
<dt>Tomcat Class Loader</dt>
<dd>
Tomcat Classloader does not refer to the environment variable, CLASSPATH.
It looks for classes in the following order:
<ol>
	<li>Java API</li>
	<li>WEB-INF/classes directory of a web application</li>
	<li>WEB-INF/lib directory of a web application</li>
	<li>CATALINA_HOME/lib</li>
</ol>
</dd>
</dl>


<h2>web.xml</h2>

<p>
The heart of the web application is the web.xml file, called the deployment descriptor.
A web.xml must be in the WEB-INF directory.
A web.xml contains all the configuration information on a web application.
</p>

<h3><a href="http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">Main configuration items in web.xml</a></h3>
<ul>
	<li>ServletContext initialization parameter</li>
	<li>Filter</li>
	<li>Listener</li>
	<li>Servlet Definition</li>
	<li>Servlet Initialization parameters</li>
	<li>Servlet Mapping</li>
	<li>Session Configuration</li>
	<li>welcome file list</li>
	<li>error file list</li>
</ul>

<h3>Example and description of web.xml</h3>

<p>
Copy the CATALINA_HOME/webapps/ROOT/WEB-INF/web.xml file and paste it into the WEB-INF of your web application.
Then open the web.xml file and delete everything in the web-app root element.
You can configure your web application by adding subelements like below.
</p>

<h6 class="src">web.xml<sup><a href="#comments">2</a></sup></h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;  
  <strong>
  &lt;servlet&gt;
    &lt;servlet-name&gt;TestServlet&lt;/servlet-name&gt;
    &lt;servlet-class&gt;net.java_school.TestServlet&lt;/servlet-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;name&lt;/param-name&gt;
      &lt;param-value&gt;value&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
	
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;TestServlet&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/Test&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
	  
  &lt;session-config&gt;
    &lt;session-timeout&gt;30&lt;/session-timeout&gt;
  &lt;/session-config&gt;
  </strong>

&lt;/web-app&gt;
</pre>

<p>
To test a web application that has this web.xml, you need to create the TestServlet. 
How to create a servlet is covered later.
</p>

<p>
The servlet element sets the servlet definition and its initial parameters.
</p>

<p>
If the load-on-startup has zero or positive value, Tomcat creates the servlet object when the web application starts. And then Tomcat calls the init() method of the servlet object to make its service available.
</p>

<p>
The servlet-mapping element is for servlet-to-URL mapping.
As above settings, if you visit http://localhost:8080/<em>contextPath</em>/<strong>Test</strong>, the net.java_school.TestServlet servlet will respond.
</p>

<p>
The session-timeout element controls the lifetime of the HttpSession object.
If session-timeout is 30, the servlet container will destroy the HttpSession object if it has no action for 30 minutes.
</p>

<h2>Packing</h2>

<p>
You can use the jar tool (jar.exe) to make your web application a single file.
Once development is complete, you can bundle your web application and distribute it to other servlet containers.
To do this, you need to create a file with the extension war.
If the web application's document base is C:\www\test, go to the document base and run the following:
</p>

<pre>
C:\www\test&gt;<strong>jar -cvf test.war .</strong>
</pre>

<p>
You put the test.war into the default web application folder of another servlet container, 
the servlet container will automatically deploy and load the test web application.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://stackoverflow.com/questions/809775/what-does-the-servlet-load-on-startup-value-of-0-zero-signify">http://stackoverflow.com/questions/809775/what-does-the-servlet-load-on-startup-value-of-0-zero-signify</a></li>
</ul>

</article>

</body>
</html>
