<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Testing the 'Java Web Programming' final source on Windows 11</title>
<meta name="Keywords" content="java,Testing Java Web Programming final source on windows 11" />
<meta name="Description" content="This article describes how to test the 'Java Web Programming' final source on windows 11." />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
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
<div class="last-modified">Last Modified 2.24.2025</div>

<h1>Testing the 'Java Web Programming' final source on Windows 11</h1>

<h2>Install Java</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads">https://www.oracle.com/java/technologies/downloads</a><br />
<img src="https://lh3.googleusercontent.com/pw/ABLVV84Cojkf3FSiTVhFUDzLGQdu6fN192e7rUStPkZXe8OvWf7bT18fg9AYO1FfNPVNxrMIPFejnHLe1smwC4WQzCIBsO50-kNcX1Wxl5dGcUlC5RAe0LV6hK-58VGeJtPVGkgmhB3qDVvCPvZoIJ51darrILMhJysdvyYOywIeNwn_5ptkYN6izIpSqwQKaDMkXvg0PpOou3YUkAezyPFgZfUj59ZnNv2cut111_DsTGLHAccc8TbSPQ72UgrQgVBqkPfUvsZuDJzZsMeEzmaA-43eNj0_zWJukS-0CjEv0lYj7xf327w2JOwyvsUmdYhUBJ_HMsc1sKcD3Ggm93OHNlMxWv-kL_ELmbEqaLHSVpeiydrV1DvKmeytqI4olpyazQPCDdlnPNxTe4dTD0-mkZgv3PPDQo725c6QIKIz2gYwvalLphHH4wzJXZPbyrAfPRT6lzMElBFJA-3j_9-HWzIZLA-C-zprf49oHKaZpj9ezHLBX796Ez8jHp6yGSiRAJ0oJZbZCmMHxjNrUYhWs21JX5bt5enFDII5IrwdafLbyQxqiWLsHtiq-t_oKqQzp7CFPNrAEr2xDikjJASizwMzo6UlX8jkjBsIAxHg6uI-0qMfcyfJaTqIjF7b1xJarrfe1J-PTAQfDAJA8EAjndhmQs5EeSnW3c8ou55ggHwJWohYKSUG002Wwspo62UE7IDRya_XspRgNJB9LeQoSnL6ykdnwGPCRV4a260dMAs7ARfQfDmIIYG1i15PF0E2KGkuc4Wm5AJeFQJans4JMcbfsj3jq-y6KE2rzmZBTRODLjDCVRMYI92tsqnBeGnH6Vn_-uoxGG_MqriEaLQg-ztFhfPeTfMXWHmlgB-uAFy8i5veBoYlmXOX3FRfe-WzZp9-ijhp8fLBZpZ2mIpIYJ4=w1262-h507-s-no-gm?authuser=0" alt="Download JDK 21" /><br />
Run the JDK Installer.<br />
You can complete the installation simply by clicking the Next button.<br />
The installed JDK directory is <strong>C:\Program Files\Java\jdk-21</strong>.
</p>

<p>
Create the JAVA_HOME environment variable as follows:
</p>

<pre>
Open <strong>Start</strong>
<strong>System</strong>
<strong>Advanced System Settings</strong>
<strong>Environment Variables(N)...</strong>
Under the "User variables for someson" section, click the <strong>New</strong> button.
Type JAVA_HOME in the "Variable name" setting.
Type C:\Program Files\Java\jdk-21 in the "Variable values" setting.
Click the OK button.
Click the OK button.
</pre>

<h2>Install Maven</h2>

<p>
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a><br />
Download and unzip the latest binary version, copy the created directory to the location you want, and add Maven's bin directory to the Path of the system variable.
</p>

<h2>Install Git</h2>

<p>
<a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a><br />
Download 64-bit Git for Windows Setup.<br />
You can complete the installation simply by clicking the Next button.
</p>

<p>
Add your name and email to your git config.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global user.name "Jo Maso"
git config --global user.email jo@gmail.org
</pre>

<p>
Verify.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global --list 
</pre>

<h2>Install Oracle Database 11gR2 Express Edition</h2>

<p>
<a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a><br />
If you have a 64-bit Windows system -- most systems are 64-bit systems -- download Oracle Database 11gR2 Express Edition for Windows x64. You need an account on the Oracle website to download this version. After registering as a member and logging in, the download will start.
</p>

<p>
After unpacking the downloaded compressed file, run setup.exe in the Disk1 subdirectory created and click the Next button to install it. You can install Oracle easily since Oracle 11g version officially supports Windows 10. Do not forget the administrator password you entered during the installation.
</p>

<p>
Since Oracle Application Express, one of the 11g XE components, uses port 8080, stop Tomcat if it is in service before installation.
</p>

<p>
For Windows, the default port of Oracle Application Express, 8080, cannot be changed during installation. After installation, the method to change the 8080 port of Apex to 9090 is as follows:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users&gt; sqlplus
Enter user-name: system
Enter password:
Connected.

SQL&gt; Exec DBMS_XDB.SETHTTPPORT(9090);

PL/SQL procedure successfully completed.

SQL&gt;
</pre>

<h2>Install Tomcat 10.1.xx</h2>

<p>
<a href="https://tomcat.apache.org/download-10.cgi">https://tomcat.apache.org/download-10.cgi</a><br />
Download <strong>64-bit Windows zip</strong> of the 10.1.xx version.<br />
Unpack the downloaded file, copy the created directory to the location you want.<br />
Tomcat start: run startup.bat of the bin folder.<br />
Tomcat stop: run shutdown.bat of the bin folder.
</p>

<h2>Test</h2>

<p>
Clone the Java Web Programming final source.
</p>

<pre>git clone https://github.com/kimjonghoon/JavaWebProgramming</pre>

<p>
Move the created JavaWebProgramming folder to the C:\. (C:\JavaWebProgramming)
</p>

<h3>Edit the upload directory</h3>

<p>
Open the WebContants.java file in the net.java_school.commons package and modify the upload directory to match your system.
</p>

<h3>Edit the log file path</h3>

<p>
Open the log4j2.xml file in the src/main/resources folder and modify the log file path to match your system.
</p>

<h3>Oracle database schema</h3>

<div th:replace="~{articles/commons/database-design :: content}"></div>

<h3>Create ROOT.xml</h3>

<p>
C:\JavaWebProgramming is the progject's root directory.<br />
Create ROOT.xml as shown below and copy it to the conf/Catalina/localhost folder of Tomcat.
(Create this folder if it doesn't exist)
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="<strong>C:/JavaWebProgramming</strong>/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Compile.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean compile war:inplace
</pre>

<p>
Restart Tomcat.
</p>

<p>
Visit http://localhost:8080 to sign up and test the bulletin board.
</p>

<h3>Test Admin mode</h3>

<p>
Grant the admin role to a registered someone.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">sqlplus java/school

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
Log in as a member with an administrator role and check if the administrator menu is visible.
</p>

<h3>Test in Jetty</h3>

<p>
Stop Tomcat and run the following.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean jetty:run
</pre>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/java/JDK-Install}">Java Install</a></li>
	<li><a href="#" th:href="@{/spring/building-java-projects-with-maven}">Building Java Projects with Maven</a></li>
	<li><a href="#" th:href="@{/blog/2017/jetty-maven-plugin}">Jetty Maven Plugin</a></li>
	<li><a href="#" th:href="@{/jdbc/How-to-install-Oracle}">Oracle Install</a></li>
	<li><a href="https://pureinfotech.com/create-custom-environment-variables-windows-10/">https://pureinfotech.com/create-custom-environment-variables-windows-10/</a></li>
</ul>

</article>
</body>
</html>
