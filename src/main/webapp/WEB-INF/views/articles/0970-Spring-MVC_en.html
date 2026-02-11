<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Spring MVC</title>
<meta name="Keywords" content="java,google app engine,google cloud,spring mvc,mvn appengine:run,mvn appengine:deploy" />
<meta name="Description" content="Google App Engine Projects on Spring MVC" />
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

<h1>Spring MVC</h1>

<p>
Change the guestbook directory structure by referring to the below.
</p>

<p>
<img alt="before_after" src="https://lh3.googleusercontent.com/_U2-CnVyiw-HAakNmEHMHBAc9_2bJqZsHmsvUCGfmB2N2ilnVes_Q1kykNI-GHzQh4sTl_xPNmFZ37E2RdZ6GnBCoe9vdWain3BCf-SdiVMraqZzjRhfvvIzk4ndVEhMGIZ-fRpvmICbMViQrl1_NvpWNPr2PB6YD2HVxdj2USNaTqrdVsTTiuRuuvO4IhOaiqm8pf9-_bwJcfF6LBIDUGpgGyxAnyBjZkJP-k8XWVOXTa8a_riYp5LdTV-FjFHu_F9UBd-t_Dl6OnHPQ0ogPa6wX_i96ztdiTIjZoavzew4VvWEysMadaUxp5DaiLDet47xSjda_LcsFDF0ZsFwq_-JbhYEyL10jJMy6xnNvTZuBLduQFMTAUXcdTgTqFSdX68wppQ_5iv8v_doNozs0j7unyashJy-JRiAicGPC6PYxMsoozNYNlmHx-QEZ2mYR33-YMmipAgeHf6WxMpNgec-SPVg7E9sOnJCW7-XEfP0343Z4ZC23nCoDn3yerEbfceeMog8JQ_Hetet0J2Nx0yQu8TxvwupeJQTvG-d6TFYcPXyCEK4zvHNAEMOPkB2KcT3djWKryNyJAMBj6CcMWStpA-NqAjUlilsdgQ0_Q=w468-h291-no" style="width: 100%;" />
</p>

<pre>
webapp/resources/
</pre>

<p>
/webapp/resources is the directory for our web application's static resources. The static resources of a web application are images, style sheets, JavaScript, and HTML files.
</p>

<pre>
webapp/WEB-INF/views/
</pre>

<p>
/webapp/WEB-INF/views is the directory for JSP files. Note that the guestbook.jsp file has been moved to /webapp/WEB-INF/views/guestbook.
</p>

<p>
For Spring MVC projects, you need to do the following:
</p>

<ul>
	<li>Adding Spring Dependencies to pom.xml</li>
	<li>Adding dispatcher servlet configuration to web.xml</li>
	<li>[Adding encoding filter to web.xml to support multiple languages]</li>
	<li>Creating a Spring configuration file based on the dispatcher servlet name (e.g., "dispatcher servlet name"<strong>-servlet.xml</strong>)</li>
</ul>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;properties&gt;
  &lt;!--  omit --&gt;
  <strong>&lt;spring.version&gt;6.2.8&lt;/spring.version&gt;</strong>
&lt;/properties&gt;

&lt;!--  omit --&gt;
<strong>
&lt;!-- [START Spring_Dependencies] --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-context&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- [END Spring_Dependencies] --&gt;</strong>

&lt;!--  omit --&gt;
</pre>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;
  <strong>
  &lt;filter&gt;
    &lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
    &lt;filter-class&gt;org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;encoding&lt;/param-name&gt;
      &lt;param-value&gt;UTF-8&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;forceEncoding&lt;/param-name&gt;
      &lt;param-value&gt;true&lt;/param-value&gt;
    &lt;/init-param&gt;
  &lt;/filter&gt;
  
  &lt;filter-mapping&gt;
    &lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
    &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
  &lt;/filter-mapping&gt;</strong>
  &lt;!-- [START Objectify] --&gt;
	
  &lt;!--  omit --&gt;
    
  &lt;!-- [END Objectify] --&gt;
  <strong>&lt;servlet&gt;
    &lt;servlet-name&gt;guestbook&lt;/servlet-name&gt;
    &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
  
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;guestbook&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;</strong>

&lt;/web-app&gt;
</pre>

<h3>Added to the guestbook archetype's web.xml</h3>

<p>
<strong>CharacterEncodingFilter</strong>: It encodes the request string in UTF-8 to support multiple languages.
</p>

<p>
<strong>DispatcherServlet</strong>: Named guestbook in servlet declaration and mapped to / in servlet mapping.
</p>

<h3>Removed from the guestbook archetype's web.xml</h3>

<ul>
	<li>The welcome-file-list element</li>
	<li>The guestbook servlet declaration and its mapping</li>
</ul>

<p>
We will implement the functionality of the guestbook servlet in a method of a Spring Controller.
</p>

<p>
Since the name of the dispatcher servlet is a guestbook, create a Spring configuration file called guestbook-servlet.xml in the location of the web.xml file.
</p>

<h6 class="src">guestbook-servlet.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:context="http://www.springframework.org/schema/context"
  xmlns:mvc="http://www.springframework.org/schema/mvc" 
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
      http://www.springframework.org/schema/beans/spring-beans.xsd
      http://www.springframework.org/schema/context
      http://www.springframework.org/schema/context/spring-context.xsd
      http://www.springframework.org/schema/mvc
      http://www.springframework.org/schema/mvc/spring-mvc.xsd"&gt;
        
  <b><span>&lt;!--</span>1.Handling requests for static resources<span>--&gt;</span></b>    
  &lt;mvc:resources mapping="/resources/**" location="/resources/" /&gt;
  <b><span>&lt;!--</span>2.To drive the spring based on the annation<span>--&gt;</span></b>
  &lt;mvc:annotation-driven /&gt;
  <b><span>&lt;!--</span>3.Component scan<span>--&gt;</span></b>
  &lt;context:component-scan base-package="net.java_school.guestbook" /&gt;
  <b><span>&lt;!--</span>4.View resolver<span>--&gt;</span></b>
  &lt;bean id="internalResourceViewResolver" 
        class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
      &lt;property name="viewClass"&gt;
        &lt;value&gt;org.springframework.web.servlet.view.JstlView&lt;/value&gt;
      &lt;/property&gt;
      &lt;property name="<strong>prefix</strong>"&gt;
        &lt;value&gt;<strong>/WEB-INF/views/</strong>&lt;/value&gt;
      &lt;/property&gt;
      &lt;property name="<strong>suffix</strong>"&gt;
        &lt;value&gt;<strong>.jsp</strong>&lt;/value&gt;
      &lt;/property&gt;
  &lt;/bean&gt;
&lt;/beans&gt;
</pre>

<ol>
	<li>This configuration causes the static content handler inside Spring to handle requests for static content (stylesheets, images, JavaScript, HTML, etc.) located in /webapp/resources or subdirectories.</li>
	<li>This configuration drives the Spring based on the annotation.</li>
	<li>This configuration causes Spring to scan components from the specified package and automatically register them in the container.</li>
	<li>This configuration is for a view resolver. A view resolver interprets the string from the controller to determine the view. If the controller returns "guestbook/guestbook," the view resolver set above will use prefix and suffix to interpret the view as <strong>/WEB-INF/views/</strong>guestbook/guestbook<strong>.jsp</strong>.</li>
</ol>

<p>
Create a controller dedicated to the guestbook. 
</p>

<h6 class="src">GuestbookController.java</h6>
<pre class="prettyprint">
package net.java_school.guestbook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class GuestbookController {

  <b><span>//</span>1."/guestbook" reqeust handler</b>
  <strong>@GetMapping</strong>("<strong>/guestbook</strong>")
  public String guestbook(String guestbookName, Model model) {
    model.addAttribute("guestbookName", guestbookName);
    return "guestbook/guestbook";
  }
	
  <b><span>//</span>2."/guestbook/sign" request handler</b>
  <strong>@PostMapping</strong>("<strong>/guestbook/sign</strong>")
  public String sign(HttpServletRequest req, HttpServletResponse resp) {
    Greeting greeting;
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    String guestbookName = req.getParameter("guestbookName");
    String content = req.getParameter("content");
    if (user != null) {
      greeting = new Greeting(guestbookName, content, user.getUserId(), user.getEmail());
    } else {
      greeting = new Greeting(guestbookName, content);
    }
    // Use Objectify to save the greeting and now() is used to make the call synchronously as we
    // will immediately get a new page using redirect and we want the data to be present.
    ObjectifyService.ofy().save().entity(greeting).now();
    return "redirect:/guestbook/?guestbookName=" + guestbookName;
  }
}
</pre>

<ol>
  <li>The guestbook() method is responsible for the /guestbook request of the GET method.</li>
  <li>The sign() method is responsible for the /guestbook/sign request of the POST method. The implementation of the sign() method is the same as that of the SignGuestbookServlet.java servlet.</li>
</ol>

<p>
For the controller to work correctly, you should delete the servlets classes(GuestbookServlet.java, SignGuestbookServlet.java). You should also delete the Java classes for tests in the src/test/java/ directory.
</p>

<h3>Modify guestbook.jsp</h3>

<p>
Because the style sheet file location has changed, modify the stylesheet path in the guestbook.jsp like below.
</p>

<pre class="prettyprint">
&lt;link type="text/css" rel="stylesheet" href="<strong>/resources</strong>/stylesheets/main.css"/&gt;  
</pre>

<p>
Modify the form action attribute in guestbook.jsp to match the request handler in GuestbookController as follows.
</p>

<pre class="prettyprint">
&lt;form action="<strong>/guestbook/sign</strong>" method="post"&gt;
</pre>

<pre class="prettyprint">
&lt;form action="<strong>/guestbook</strong>" method="get"&gt;
</pre>

<p>
Since the location of guestbook.jsp has changed, the methods createLogoutURL() and createLoginURL() in guestbook.jsp will return /WEB-INF/views/guestbook/guestbook.jsp and eventually occur a 404 error. So, modify the arguments of the two methods from request.getRequestURI() to <strong>"/guestbook/?GuestbookName=" + guestbookName</strong>.
</p>

<pre class="prettyprint">
&lt;p&gt;Hello, ${fn:escapeXml(user.nickname)}! (You can
  &lt;a href="&lt;%= userService.createLogoutURL(<strong>"/guestbook/?guestbookName=" + guestbookName)</strong> %&gt;"&gt;sign out&lt;/a&gt;.)&lt;/p&gt;
&lt;%
  } else {
%&gt;
&lt;p&gt;Hello!
  &lt;a href="&lt;%= userService.createLoginURL(<strong>"/guestbook/?guestbookName=" + guestbookName)</strong> %&gt;"&gt;Sign in&lt;/a&gt;
  to include your name with greetings you post.&lt;/p&gt;
&lt;%
  }
%&gt;
</pre>

<p>
To run an app in the Java 8 environment, you need the following configuration in appengine-web.xml:
</p>
 
<pre class="prettyprint">
&lt;runtime&gt;java8&lt;/runtime&gt;
</pre>

<h3>Local Test</h3>

<pre class="cmd">
mvn clean
mvn appengine:run
</pre>

<p>
Visit http://localhost:8080/guestbook.
</p>

<h3>Remote Test</h3>

<pre class="cmd">
mvn appengine:deploy
</pre>

<p>
Visit http://<em>your-app-id</em>.appspot.com/guestbook.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://cloud.google.com/appengine/docs/standard/java/runtime-java8">https://cloud.google.com/appengine/docs/standard/java/runtime-java8</a></li>
</ul>
</article>

</body>
</html>
