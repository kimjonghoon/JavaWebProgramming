<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<article>
<div class="last-modified">Last Modified 2021.11.29</div>

<h1>Migrating to Spring Security 4</h1>

<p>
Modify pom.xml as follows.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;properties&gt;
  &lt;spring.version&gt;5.3.13&lt;/spring.version&gt;
  &lt;spring.security.version&gt;<strong>5.6.0</strong>&lt;/spring.security.version&gt;
  &lt;jdk.version&gt;11&lt;/jdk.version&gt;
&lt;/properties&gt;
</pre>

<pre class="prettyprint">
&lt;dependency&gt;
	&lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
	&lt;artifactId&gt;spring-security-web&lt;/artifactId&gt;
	&lt;version&gt;<strong>${fn:escapeXml("${spring.security.version}")}</strong>&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
	&lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
	&lt;artifactId&gt;spring-security-taglibs&lt;/artifactId&gt;
	&lt;version&gt;<strong>${fn:escapeXml("${spring.security.version}")}</strong>&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
	&lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
	&lt;artifactId&gt;spring-security-config&lt;/artifactId&gt;
	&lt;version&gt;<strong>${fn:escapeXml("${spring.security.version}")}</strong>&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
After building the project and rerunning Tomcat, go to the login page and try to log in. A blank screen is displayed, and there are no log messages about it. The cause of the blank screen is that the CSRF protection in Spring Security 4 is working. Spring Security 4 enables this feature by default. So, to migrate from Spring Security 3 to 4, you must include the CSRF token in all PATCH, POST, PUT and DELETE requests in your project.
</p>

<p>
Open the login.jsp file and add the following to the form:
</p>

<pre class="prettyprint">
<strong>&lt;input type="hidden" name=${fn:escapeXml("${_csrf.parameterName}")} value=${fn:escapeXml("${_csrf.token}")} /&gt;</strong>
</pre>

<p>
Try to log in again. This time you will get a 404 error that the server can not find /j_spring_security_check.
</p>

<h3>Attributes of form-login with default values changed in Spring Security 4</h3>

<h4>login-processing-url</h4>

<p>
/j_spring_security_check --&gt; /login (of POST method)
</p>

<h4>username-parameter</h4>

<p>
j_username --&gt; username
</p>

<h4>password-parameter</h4>

<p>
j_password --&gt; password
</p>

<h4>authentication-failure-url</h4>

<p>
/login?error=1
</p>

<p>
Modify security.xml as follows.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;form-login 
  login-page="/users/login"
  authentication-failure-url="/users/login?<strong>error=1</strong>"  
  default-target-url="/bbs/list?boardCd=chat&amp;page=1" /&gt;
</pre>

<p>
The default value of the login-page attribute is /login, and the default value of the authentication-failure-url attribute is /login?error=1. If you omit these attributes from the configuration file, Spring Security uses these default values.
</p>

<p>
To use a custom login page, you must specify the login-page and the authentication-failure-url attributes in the security configuration file, and then also add the following:
</p>

<pre class="prettyprint">
&lt;http use-expressions="true"&gt;
  &lt;intercept-url pattern="/users/login" access="permitAll" /&gt;
</pre>

<p>
The default value of use-expressions has been changed from false to true so that you can omit it like below.
</p>

<pre class="prettyprint">
&lt;http&gt;
  &lt;intercept-url pattern="/users/login" access="permitAll" /&gt;
</pre>

<p>
Modify login.jsp as follows.
</p>

<h6 class="src">/users/login.jsp</h6>
<pre class="prettyprint">
&lt;c:if test=<strong>${fn:escapeXml("${param.error != null }")}</strong>&gt;
        &lt;h2&gt;Username/Password not corrrect&lt;/h2&gt;
&lt;/c:if&gt;
&lt;c:url var="loginUrl" value="<strong>/login</strong>" /&gt;
&lt;form action="<strong>${fn:escapeXml("${loginUrl }")}</strong>" method="post"&gt;
&lt;p style="margin:0; padding: 0;"&gt;
<strong>&lt;input type="hidden" name=${fn:escapeXml("${_csrf.parameterName}")} value=${fn:escapeXml("${_csrf.token}")} /&gt;</strong>
&lt;/p&gt;
&lt;table&gt;
&lt;tr&gt;
    &lt;td style="width: 200px;"&gt;&lt;spring:message code="user.email" /&gt;&lt;/td&gt;
    &lt;td style="width: 390px"&gt;&lt;input type="text" name="<strong>username</strong>" style="width: 99%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
    &lt;td&gt;&lt;spring:message code="user.password" /&gt;&lt;/td&gt;
    &lt;td&gt;&lt;input type="password" name="<strong>password</strong>" style="width: 99%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
</pre>

<p> 
Build the project and rerun Tomcat. Try to log in and log out.
</p>

<p>
When you log out, you will see a blank screen again because the default value of the logout-url attribute is changed from /j_spring_security_logout to /logout of POST method.
</p>

<p>
Open the header.jsp file and modify the code of the logout button between &lt;head&gt; and &lt;/head&gt; by referring to the following.
</p>

<pre class="prettyprint">
<strong>&lt;input type="button" value="&lt;spring:message code="user.logout" /&gt;" id="logout" /&gt;</strong>
</pre>

<p>
Add the following at the bottom of header.jsp.
</p>

<pre class="prettyprint">
<strong>&lt;form id="logoutForm" action="/logout" method="post" style="display:none"&gt;
	&lt;input type="hidden" name=${fn:escapeXml("${_csrf.parameterName}")} value=${fn:escapeXml("${_csrf.token}")} /&gt;
&lt;/form&gt;

&lt;script&gt;
$(document).ready(function() {
  $('#logout').click(function() {
    $('#logoutForm').submit();
    return false;
  });
});
&lt;/script&gt;</strong>
</pre>

<p>
Add the following code to all JSP page that shows the screen.
</p>

<pre class="prettyprint">
&lt;script type="text/javascript" src="/js/jquery-3.2.1.min.js"&gt;&lt;/script&gt;
</pre>

<h3>How to add CSRF token parameter when uploading files</h3>

<p>
When uploading attachments in a new post, you need to include the CSRF token in the query string even if you use Springform tags.
</p>

<p>
Open the write.jsp and modify.jsp files and delete the <b>&lt;input type="hidden" name=${fn:escapeXml("${_csrf.parameterName}")} value=${fn:escapeXml("${_csrf.token}")} /&gt;</b> in both files.
</p>

<p>
Modify the form's action attribute as shown below.
</p>

<h6 class="src">write.jsp</h6>
<pre class="prettyprint">
&lt;sf:form action="write?<strong>${fn:escapeXml("${_csrf.parameterName}")}=${fn:escapeXml("${_csrf.token}")}</strong> method="post" ...
</pre>

<h6 class="src">modify.jsp</h6>
<pre class="prettyprint">
&lt;sf:form action="modify?<strong>${fn:escapeXml("${_csrf.parameterName}")}=${fn:escapeXml("${_csrf.token}")}</strong> method="post" ...
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://docs.spring.io/spring-security/site/migrate/current/3-to-4/html5/migrate-3-to-4-xml.html#m3to4-xmlnamespace-defaults">http://docs.spring.io/spring-security/site/migrate/current/3-to-4/html5/migrate-3-to-4-xml.html#m3to4-xmlnamespace-defaults</a></li>
	<li><a href="http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#nsa-logout-attributes">http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#nsa-logout-attributes</a></li>
	<li><a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec15.html#sec15.1.3">http://www.w3.org/Protocols/rfc2616/rfc2616-sec15.html#sec15.1.3</a></li>	
</ul>

</article>
