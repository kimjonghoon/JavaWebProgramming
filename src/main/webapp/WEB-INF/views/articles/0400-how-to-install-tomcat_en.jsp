<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Tomcat Install</h1>

<p>
On Windows systems, download the Windows zip file from the following address:<br />
<a href="http://tomcat.apache.org/download-11.cgi">http://tomcat.apache.org/download-11.cgi</a><br />
<img src="<c:url value="/resources/images/tomcat-binary-distributions-windows-zip.png"/>" alt="tomcat binary distributions windows zip" style="width: 465px;" />
</p>

<p>
Unzip the downloaded file and move the created directory to a location of your choice.
</p>

<p>
Run Tomcat.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\apache-tomcat-11.0.6\bin&gt; <strong>.\startup.bat</strong>
</pre>

<p>
Visit http://localhost:8080.
</p>

<p>
<img src="<c:url value="/resources/images/tomcat-default-root.png"/>" alt="Tomcat default ROOT App" />
</p>

<p>
If you see a cat, installation is a success.
The screen showing the cat is the homepage of Tomcat's ROOT application.
The location of the ROOT application is CATALINA_HOME/webapps/ROOT.
</p>

<p>
Stop Tomcat.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\apache-tomcat-11.0.6\bin&gt; <strong>.\shutdown.bat</strong>
</pre>

<h3>Tomcat administrator</h3>

<p>
To set the Tomcat administrator's name and password,
open the tomcat-users.xml in CATALINA_HOME/conf directory to add the followings.
</p>

<pre class="prettyprint">
&lt;user username="admin" password="must-be-changed" roles="manager-gui" /&gt;
</pre>

<p>
Change <i>must-be-changed</i> to the desired value.<br />
</p>

<p>
CATALINA_HOME represents the root directory of your Tomcat installation.<br />
<strong>C:\apache-tomcat-11.0.6</strong><br />
</p>

<p>
Restart Tomcat.<br />
Visit http://localhost:8080/manager<br />
</p>

<p>
<img alt="login to tomcat web application manager" src="<c:url value="/resources/images/login-to-tomcat-manager-app.png"/>" style="width: 321px;" />
</p>

<p>
<img alt="tomcat web application manager" src="<c:url value="/resources/images/tomcat-manager-application.png"/>" />
</p>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/namecard-webapp"/>">Namecard Web Application</a></li>
		<li>Prev : <a href="<c:url value="/jdbc/javabank"/>">Java Bank</a></li>
	</ul>
</div>

</article>