<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Dynamic Web Project</h1>

<p style="padding-left: 1em;">
You must first install the Eclipse IDE for Java EE Developers and Tomcat on your system.<br />
See <a href="<c:url value="/java/package#Install-Eclipse"/>">Eclipse Instll</a> and <a href="<c:url value="/jsp/tomcat-install"/>">Tomcat Install</a>. 
</p>

<p>
Start Eclipse.(suppose the workspace is C:/www)<br />
In the Java EE perspective, select File, New, Dynamic Web Project as shown below.<br />
<img src="<c:url value="/resources/images/new-dynamic-web-project.png"/>" alt="1. New - Dynamic Web Project" /><br />
Click Next button.<br />
<img src="<c:url value="/resources/images/dynamic-web-project.png"/>" alt="2. Dynamic Web Proejct" /><br />
In the 'Project name:' text box, type <em>JSPProject</em>.<br />
I will not run Tomcat in Eclipse, so leave all the values except the project name as default and click 'Finish'.<br />
<img src="<c:url value="/resources/images/jspproject.png"/>" alt="3. Dynamic WebProject - JSPProject" /><br />
In the Package Explorer view, select the JSPProject project with the mouse and click the right mouse button and select Build Path, Configure Build Path ... as shown below.<br />
<img src="<c:url value="/resources/images/build-path.png"/>" alt="5. Dynamic WebProject's output folder, build - WEB-INF/classes" /><br />
Click the Source tab.<br />
<img src="<c:url value="/resources/images/source-tab-select.png"/>" alt="source tab"/><br />
Click the Browse... button of the Default output folder.<br />
Click the Create New Folder... button to create the WEB-INF/classes folder.<br />
Set the WEB-INF/classes folder to be the Default output folder.
<img src="<c:url value="/resources/images/classes.png"/>" alt="Build Path - source tab - Default output Folder's Browser click - Create New Folder click - WEB-INF/classes" /><br />
Make sure the Default output folder is JSPProject/WebContent/WEB-INF/classes.
<img src="<c:url value="/resources/images/build-path-result.png"/>" alt="Build Path, JSPProject/WebContent/WEB-INF/classes" />
</p>

<h2>Loading JSPProject into Tomcat</h2>

<p>
Create the ROOT.xml file as shown below and save it to CATALINA_HOME/conf/Catalina/localhost and then restart Tomcat.<br />
(Where CATALINA_HOME is the directory where Tomcat is installed)
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
	<strong>docBase="C:/www/JSPProject/WebContent"</strong>
	reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
If the ROOT.xml file are correct, Tomcat loads the ROOT application.<br />
Note that the docBase value in ROOT.xml is not C:/www/JSPProject.<br />
The parent directory of WEB-INF is the Document Base.
</p>

<h3>WEB-INF/web.xml</h3>

<p>
web.xml is the configuration file for the web application.<br />
If you created a Dynamic Web Project in Eclipse, web.xml can be created automatically.<br />
If not, copy the web.xml file of the ROOT application in CATALINA_HOME/webapps and paste it into the WEB-INF directory of JSPProject.<br />
Then, open the web.xml and delete all within the web-app element as follows. 
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

&lt;/web-app&gt;
</pre>

<h3>Test</h3>

<p>
Create a test.html file on the Document Base.<br />
With the WebContent selected as shown below, right-click and select New, then HTML File.<br />
<img src="<c:url value="/resources/images/test-html.png"/>" alt="웹 애플리케이션이 톰캣에 등록한 후에 테스트하기 위해서 웹 애플리케이션의 루트 디렉토리에 test.html 이라는 파일을 만드는 화면이다." /><br />
Visit http://localhost:8080/test.html.<br />
Where port is the port number used by Tomcat, you can find the port number in the CATALINA_HOME/conf/server.xml file.
</p>

<pre class="prettyprint">
&lt;Connector port=<strong>"8080"</strong> protocol="HTTP/1.1" 
	connectionTimeout="20000" 
	<strong>URIEncoding="UTF-8"</strong>
	redirectPort="8443" /&gt;
</pre>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/prototype"/>">Prototype</a></li>
		<li>Prev : <a href="<c:url value="/jsp/model-2-bbs"/>">Model 2 Board</a></li>
	</ul>
</div>

</article>