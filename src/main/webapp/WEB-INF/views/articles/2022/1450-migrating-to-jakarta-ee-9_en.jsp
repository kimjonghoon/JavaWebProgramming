<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Jakarta EE 9</title>
<meta name="Keywords" content="java,jakarta ee 9" />
<meta name="Description" content="Migrating to Jakarta EE 9" />
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
<div class="last-modified">Last Modified 3.31.2024</div>

<h1>Jakarta EE 9</h1>

<p>
<b>Tested on JDK 11 LTS and Jetty 11</b>
</p>

<pre lang="en" class="tree">
ee9exam
├── pom.xml
└── src
    └── main
        └── webapp
            ├── WEB-INF
            │   └── web.xml
            └── index.jsp
</pre>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
    http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;

&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

&lt;groupId&gt;net.java_school&lt;/groupId&gt;
&lt;artifactId&gt;ee9exam&lt;/artifactId&gt;
&lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
&lt;packaging&gt;war&lt;/packaging&gt;

&lt;name&gt;ee9exam Maven Webapp&lt;/name&gt;
&lt;url&gt;http://localhost:8080&lt;/url&gt;

&lt;properties&gt;
	&lt;project.build.sourceEncoding&gt;utf-8&lt;/project.build.sourceEncoding&gt;
	&lt;project.reporting.outputEncoding&gt;utf-8&lt;/project.reporting.outputEncoding&gt;
&lt;/properties&gt;

&lt;dependencies&gt;
	&lt;dependency&gt;
		&lt;groupId&gt;junit&lt;/groupId&gt;
		&lt;artifactId&gt;junit&lt;/artifactId&gt;
		&lt;version&gt;4.11&lt;/version&gt;
		&lt;scope&gt;test&lt;/scope&gt;
	&lt;/dependency&gt;
	<strong>&lt;!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api --&gt;
	&lt;dependency&gt;
		&lt;groupId&gt;jakarta.servlet&lt;/groupId&gt;
		&lt;artifactId&gt;jakarta.servlet-api&lt;/artifactId&gt;
		&lt;version&gt;5.0.0&lt;/version&gt;
		&lt;scope&gt;provided&lt;/scope&gt;
	&lt;/dependency&gt;</strong>
&lt;/dependencies&gt;

&lt;build&gt;
	&lt;finalName&gt;ee9exam&lt;/finalName&gt;
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
			<strong>&lt;!-- https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin --&gt;
			&lt;plugin&gt;
				&lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
				&lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
				&lt;version&gt;11.0.12&lt;/version&gt;
			&lt;/plugin&gt;</strong>
		&lt;/plugins&gt;
	&lt;/pluginManagement&gt;
&lt;/build&gt;
&lt;/project&gt;
</pre>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app version="5.0"
    xmlns="https://jakarta.ee/xml/ns/jakartaee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
    https://jakarta.ee/xml/ns/jakartaee/web-app_5_0.xsd"&gt;

&lt;/web-app&gt;
</pre>

<p>
src/main/webapp/
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;jakartaEE 9 Examples&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;c:choose&gt;
    &lt;c:when test="${empty param.name }"&gt;
        &lt;h4&gt;Hello, World!&lt;/h4&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt;
        &lt;h4&gt;Hello, ${param.name }!&lt;/h4&gt;
    &lt;/c:otherwise&gt;
&lt;/c:choose&gt;
&lt;/table&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<pre class="shell-prompt">
mvn jetty:run 
</pre>

<p>
<img src="https://lh3.googleusercontent.com/cA3uG4FsaPL1eAZiKAdv-SRMc7wI13KRp0_yCWI47RqYQInnRWiPz7NjnxaMijZs8yMVHXwkv5W1OD8rbHtmylcRMuqVAupNk_WLqA0gOsS3kucQh56cVcQVRuHuWZ-EX8uVyX5OmVBXTM1E4Pt8Wm0-ffUZIMz1DBB2jQDMHGC3oJT8V0EOWMApsa-LBu5VVNJfXPpTiYfXbUE1TW7Mkby1urpyU8YwE7y1UrPflB4mL0-2m0WrKHKwZ_I5Z9KOSgnI5Vg2zFoAV5K433vMjNrpgnnRA5X9mR9VPqHETE19LhW9MKqEbdDKjRTtoIWtIroC_oyyo0ouiD_xOSN_Mv_TceH-Vpu-BG2H6RUwlBuwybIHMc70XWWMccrRAf3ogsSsjPgQ2I_KteWKcbhTjULrrfW3f2E8EVIujfIKQ7Kp9mp4tUgjK10KBq4-QgUXrUCnSBPbpLw3rXsCQblINRcZvf7Z9xc5jRtZ1Cq5rijxxW-jWJaC1-Ac_4_Zrcz0SlEmsgHX2Nb9oeHq0Tz3mJxHdAwE4KlGPuu5TX5rfsLh3LDFt-tqJzrTUL5tK40uiapL8SzjxtSc2PzkdkBpjPzzN_wchw4l4pNcaTz_le_O_CrhtCWAWED3AW2ePKjpOF1jBoqovN01dm97h4WPu_Y7yDFzxp0E2lcxaGdUshxMxNZxOiuhVRjSjzxz8caJ92xA5yzDjT-b5PG1GdOs8Qpd1RiyCJz3Y_rr-Bqd2z12b3t2Pl7u5ZHyUoqRroclxLhcwYILBT08A_rNFyLodmUbH4AqEdU0k9eqOd1_EpqZBMhRKZEmYM-iqlq4-xtBHm4gF3KIR2RWWxU6x51Tbs_WkMuf3AvkD2ZLeaCpixrsudh8fCdD6GFBOLbYR_6-p4O1iwHPhnxD7dPj7eLE0_r5kqVrqim66wRglg=w556-h197-no?authuser=0" alt="Hello, World!" />
</p>

<p>
<img src="https://lh3.googleusercontent.com/y4UUiUJ2VIJteR2IepsqaQ4lsLuXMYGUESQUfT3I9Dgo-F1dyooMkBSbV8cl3qr3iEpII87ANyV9PD7FH4695eCzqwCATY7dCaGZEoi3ttawvaimPLOEvJRTbV-jLGBJiaCW6U5kkAVolSkz99ezTvgBl6mBtbWilUFpFvdzIm9c3Qs4KV8-EFI4mmJjdRxR3pDG1K8kYIewn5chkU9HfYdzEAVfd4klS7kdlH75bOcL8nC_M0ylMjWz__uZOs-ZsMl6LOR2yOZYwOrjz31Qy-KqfZsJilrRTX4GjV5gzmKrqK_iE7LcZiU2W_pbOOs-fHREmhTWKQpXHah4TXRyB8dFMaWsec2RZZ7alAcOlE3iUvSpH7bqhZhZKPY3eiwRwZEpWdZAl8PURuJ95qJmiKzQNtVXhyeE9XtTYcU90YQBCegdxvtKYoBEdCyOWsImOSJCJwWlwbxYx1mfBTP3XXyeXge5rJ3XdOZuvFD-Iz-RWBN6bWYvquKUZe-lXRiUDXE-gwiLdfOCohPKzwuBPlsoigbgh9eKIg3LSHgn-ABeXVsFju0ozbeE2VqT7Yh6rOrV0l_8kxAqjIieum9dEfD6ESqN8eXZnvbEHPN9EFYfcLHZRap-X8MWZXbVWZgpraujg1jvvDS1ADDZVMck05BHvWdCn1dSJL_5DTlrPMXttnAa0oDJta923rM0RW1geZmw7QonpDgM1_y0ozWk-F7DsYQiow8yVr6RJVqjvJod24iSyrV3VR4X7vRnZg4aem0Jh5Gw6oEhJYd0_d-Y9DUxrmY871wSCs4pR-bsqNQXvJJCUc77dmJf_oTTrdHDyNzcAx29cln7A8Muwkw-Xg4WrIxy3GQsKDu0XpFxPogmaRKDeXGD5n9yZCZ_Q3SDYqKgp0zMZpsuMXNc_hbzPzCQBB6AwDZHqf-SqQ=w558-h180-no?authuser=0" alt="Hello, John!" />
</p>

<pre class="shell-prompt">
mkdir -p src/main/java/example

vi src/main/java/example/InitParamServlet.java
</pre>

<p>
Use jakarta.* instead of javax.* in the package names. 
</p>

<h6 class="src">InitParamServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.IOException;
import java.io.PrintWriter;

import <strong>jakarta.servlet</strong>.ServletConfig;
import <strong>jakarta.servlet</strong>.ServletException;
import <strong>jakarta.servlet</strong>.http.HttpServlet;
import <strong>jakarta.servlet</strong>.http.HttpServletRequest;
import <strong>jakarta.servlet</strong>.http.HttpServletResponse;

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

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app version="5.0"
    xmlns="https://jakarta.ee/xml/ns/jakartaee"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
    https://jakarta.ee/xml/ns/jakartaee/web-app_5_0.xsd"&gt;
<strong>
&lt;servlet&gt;
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
&lt;/servlet-mapping&gt;
</strong>
&lt;/web-app&gt;
</pre>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
http://localhost:8080/initParam
</p>

<p>
<img src="https://lh3.googleusercontent.com/TW86Le0o3mHIscCTfbTSnJVFEfMene9sbHku3tUTMvPl8xfgJ3qjeuiJNpvwMzzLaqK-0O74wVLZ9klD8cgAKn4Crp5GwXYIWSIhFTLIMMwo_jvevvGmHk4V_TicY-PfZ5KLFiQAYnZinMjoAPSMo5mOXOB3KGDSWYgTHsoBFK4onix9NODDv1VnIm40T7X-EiYJL1Yf9NkR3F_hP1YyMpcFX4LUYtRG9upfxJsItMgSRCF3dTbsCh1Sbt1U-bKHn7Dy8sc3_CUsh1YCQTI61q-zAl4Sy7ll-NVkYUlQPL4Kz0Rhjp6jQ-2c4LdApNjdSKMbaIXl1f59DAkZZXrAiYcwiiXtAe6odV5dYzCydjiRLM8lfKFY7ok5KTJvSCNVoRvRtnwfwPmzSWOSbk07NjoOJ-kgeG5z7IxyhNSprGs9fQ3X_TVmPfSC0EfCwu0J04AKKMDJta8mLV06KmEmM4TEIoTGXIT32syXNQKDAMKPnOCA9ndOXNqDN_j4wrWnW_1yl7dD6uKnPneEW9-36BMuYNW3ijSR7m9zMG0o_vqqm5A_fO-_ayvIi_duiufp56NrlRYk6CZlaCGZDbxiNBk-E3vRbwdyz4PDnSUbVC1LKUZ3oFY5rfWPA2w1wpJrQblfojHzOFep-N4FzpjpHsDtOImkExOVXOsr31tI96ug-04GjLf4SzTU6nyV_r60CC7aLlCbGWTFZb7S7CwwyibgKPr8ryAmEAES58BNoL0vgjqJFCDYVivOsB_NpUyVXitdH2LndklxpNJImORUGNEoTaeyICU8Eq-Uw8h9Yct5n4F2pIcmf0q1ff3jQvIOvZYnIyAQgiPFlXkZO7nr3n4ZsAG69ByAK-UHF5YY4QwhyPGLc7T7X9mEYglCAVh48klhZGL79QYCqSmOOcLs-goMQNHdQz72aQIY6Q=w536-h216-no?authuser=0" alt="InitParam Servlet Test" />
</p>

<p>
Java EE 7-8 in the Spring Framework 5.3.x line<br />
Jakarta EE 9+ in the Spring Framework 6 line<br />
Spring Framework 6 based applications will require a minimum of <b>JDK 17</b> at runtime, as well as a minimum of Tomcat 10/Jetty 11. 
</p>

<h3>Migrating the book source to Jakarta EE 9</h3>

<p>
Test: JDK 17, Jetty 11, Spring 6, Spring-Security 6, Servlet 3 File Upload, DBCP2, MyBatis 3.5.x, Hibernate Validator 8
</p>

<p>
Source: <a href="https://github.com/kimjonghoon/JavaWebProgramming2">https://github.com/kimjonghoon/JavaWebProgramming2</a>
</p>

<p>
<strong>How to run</strong><br />
Open the log4j2.xml file in the src/main/resources folder and modify the log file path to match your system.<br />
Open the WebContants.java in the net.java_school.commons package and modify the upload directory to match your system.<br />
After stopping Tomcat, run the following:<br />
mvn jetty:run
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://jakarta.ee/specifications/servlet/">Jakarta Servlet</a></li>
	<li><a href="https://jakarta.ee/specifications/pages/">Jakarta Server Pages</a></li>
	<li><a href="https://www.eclipse.org/jetty/download.php">Jetty Versions</a></li>
	<li><a href="https://tomcat.apache.org/whichversion.html">Apache Tomcat Versions</a></li>
	<li><a href="https://jakarta.ee/specifications/servlet/5.0/jakarta-servlet-spec-5.0.html#a-basic-example">Basic Deployment Descriptor Example</a></li>
	<li><a href="https://spring.io/blog/2021/09/02/a-java-17-and-jakarta-ee-9-baseline-for-spring-framework-6">A Java 17 and Jakarta EE 9 baseline for Spring Framework 6</a></li>
</ul>

</article>
</body>
</html>
