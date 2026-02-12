<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Creating a new web application</h1>

<p>
You already know how to add a new web application to CATALINA_HOME/webapps.
This chapter describles how to make Tomcat serve web applications that are not in CATALINA_HOME/webapps.
</p>

<p>
Create C:/www/myapp directory.
Create subdirectories under myapp as shown below.
</p>

<ul>
	<li>WEB-INF</li>
	<li>WEB-INF/classes</li>
	<li>WEB-INF/lib</li>
</ul>

<p>
C:/www/myapp is not Tomcat's default web application directory, 
Tomcat does not know the existence of myapp application.
There is something you need to do to make Tomcat serve myapp web application.
The task is to create one XML file that Tomcat needs to manage the web application.
The root element of this XML file is Context. 
In Tomcat, Context represents a Web application.
So, we call it a context file.
</p>

<p>
The essential information in a context file is the top-level directory (called DocumentBase or Context Root) of the Web application and the Context Path, URL for accessing the web application with a web browser.
The docBase attribute of the Context element has DocumentBase information.
The path attribute of the Context element has Context Path information.
</p>

<p>
You create a Context file and place it in CATALINA_HOME/conf/Catalina/localhost.
Then Tomcat will recognize and load your web application.
If the context file is incorrect, Tomcat will not load your web application and write the cause of the failure to a log file in CATALINA_HOME/logs.
</p>

<h3>How to create a Tomcat Context file</h3>

<p>
Let's create a context file for the myapp web application.
</p>

<h6 class="src">myapp.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/myapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Copy myapp.xml file to CATALINA_HOME/conf/Catalina/localhost.
If you name your Context file as myapp.xml as above and omit the path attribute, Tomcat determines the context path as myapp.
</p>
<p>
For testing, create a test.html file in the C:/www/myapp directory.
</p>

<h6 class="src">test.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;myapp TEST&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;myapp TEST&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Restart Tomcat and visit http://localhost:8080/myapp/test.html.
If not 404, Tomcat is servicing myapp.
</p>

<h3>Three primary attributes of the Context element</h3>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 100px;">Attribute</th>
	<th class="table-in-article-th" style="width: 60px;">Default</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td"><strong>docBase</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">It specifies the root directory (called the Document Base or Context Root).</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>path</strong></td>
	<td class="table-in-article-td">&nbsp;</td>
	<td class="table-in-article-td">It determines the URL path to connect to the web application.
This path is called the context path.
Tomcat specifies the context file's name as the path attribute's value if you omit the Context element's path attribute.
	</td>
</tr>
<tr>
	<td class="table-in-article-td"><strong>reloadable</strong></td>
	<td class="table-in-article-td">false</td>
	<td class="table-in-article-td">
Set to true if you want Tomcat to monitor classes in WEB-INF/classes and WEB-INF/lib for changes, and automatically reload the web application if a change is detected. 
This feature is helpful during application development, but it requires significant runtime overhead. Therefore set to true is not recommended for deployed production applications. 
	</td>
</tr>
</table>

<p>
For more information, please visit: <a href="https://tomcat.apache.org/tomcat-8.5-doc/config/context.html">https://tomcat.apache.org/tomcat-8.5-doc/config/context.html</a>
</p>

<h3>Changing the ROOT application</h3>

<p>
The web application that responds when accessing http://localhost:8080/ is the ROOT application.
Stop Tomcat and rename myapp.xml to ROOT.xml.
Restart Tomcat and visit http://localhost:8080/test.html.
If there is a problem with the ROOT.xml file, then the previous ROOT web application could work.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://tomcat.apache.org/tomcat-8.5-doc/config/context.html">http://tomcat.apache.org/tomcat-8.5-doc/config/context.html</a></li>
</ul>

</article>