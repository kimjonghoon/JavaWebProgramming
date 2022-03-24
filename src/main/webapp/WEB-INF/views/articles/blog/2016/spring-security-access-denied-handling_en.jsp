<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.11.29</div>

<h1>Spring Security - Handling access denial</h1>

<p>
Add the following to redirect access denied user requests to the /WEB-INF/views/403.jsp page.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;http&gt;
  <strong>&lt;access-denied-handler error-page="/403" /&gt;</strong>
  &lt;intercept-url pattern="/users/bye_confirm" access="permitAll"/&gt;
  &lt;intercept-url pattern="/users/welcome" access="permitAll"/&gt;
  &lt;intercept-url pattern="/users/signUp" access="permitAll"/&gt;
  &lt;intercept-url pattern="/users/login" access="permitAll"/&gt;
  &lt;intercept-url pattern="/images/**" access="permitAll"/&gt;
  &lt;intercept-url pattern="/css/**" access="permitAll"/&gt;
  &lt;intercept-url pattern="/js/**" access="permitAll"/&gt;
  &lt;intercept-url pattern="/admin/**" access="hasRole('ROLE_ADMIN')"/&gt;
  &lt;intercept-url pattern="/users/**" access="hasAnyRole('ROLE_ADMIN','ROLE_USER')"/&gt;
  &lt;intercept-url pattern="/bbs/**" access="hasAnyRole('ROLE_ADMIN','ROLE_USER')"/&gt;
	
  &lt;!-- omit --&gt;
	  
</pre>

<p>
You need to declare a handler for "/403" in the controller with the above configuration. Otherwise, you will get a 404 error.
</p>

<p>
Create a 403.jsp file and add the following method to your HomeController.
</p>

<h6 class="src">/403.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;403&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;script type="text/javascript" src="/js/jquery-3.2.1.min.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="main-menu"&gt;
    &lt;%@ include file="inc/main-menu.jsp" %&gt;
  &lt;/div&gt;
    
  &lt;div id="container"&gt;
    &lt;div id="content" style="min-height: 800px;"&gt;
      &lt;div id="content-categories"&gt;Error&lt;/div&gt;
      &lt;h1&gt;403&lt;/h1&gt;
      Access is Denied.
    &lt;/div&gt;
  &lt;/div&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Error&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="inc/extra.jsp" %&gt;    
  &lt;/div&gt;
    
  &lt;div id="footer"&gt;
    &lt;%@ include file="inc/footer.jsp" %&gt;
  &lt;/div&gt;
        
&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint">
@RequestMapping(value="/403", method={RequestMethod.GET,RequestMethod.POST})
public String error403() {
  return "403";
}
</pre>

<p>
Exclude 403 error from error page configuration in web.xml.
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;error-page&gt;
  &lt;error-code&gt;404&lt;/error-code&gt;
  &lt;location&gt;/WEB-INF/views/404.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;error-code&gt;500&lt;/error-code&gt;
  &lt;location&gt;/WEB-INF/views/500.jsp&lt;/location&gt;
&lt;/error-page&gt;
</pre>

<p>
Run <strong>mvn clean compile war:inplace</strong>, rerun Tomcat, and visit http://localhost:8080/admin. If the user has only the ROLE_USER privilege, /WEB-INF/views/403.jsp will be displayed.
</p>

<h3>Implementing AccessDeniedHandler</h3>

<p>
If you have business logic to perform before showing the user an error page, you should configure your access denied handler by implementing the org.springframework.security.web.access.AccessDeniedHandler.
</p>

<p>
Create a MyAccessDeniedHandler that implements AccessDeniedHandler.
</p>

<h6 class="src">MyAccessDeniedHandler.java</h6>
<pre class="prettyprint">
package net.java_school.spring;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class MyAccessDeniedHandler implements AccessDeniedHandler {

  private String errorPage;

  public void setErrorPage(String errorPage) {
    this.errorPage = errorPage;
  }

  @Override
  public void handle(HttpServletRequest req, HttpServletResponse resp, AccessDeniedException e)
      throws IOException, ServletException {
    //TODO: business logic
    req.getRequestDispatcher(errorPage).forward(req, resp);
  }
}
</pre>

<p>
Add the following to security.xml.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;beans:bean id="my403" class="net.java_school.spring.MyAccessDeniedHandler"&gt;
    &lt;beans:property name="errorPage" value="403" /&gt;
&lt;/beans:bean&gt;
</pre>

<p>
Modify the security.xml file as follows:
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;access-denied-handler <strong>ref="my403"</strong> /&gt;
</pre>

<p>
The Spring Security tag does not work for error pages set in web.xml because the request is forwarded to these error pages before the view-level security filter works.
</p>

<h2>Method Security</h2>

<p>
The simplest way to map an exception to an error page in Spring MVC is to use the SimpleMappingExceptionResolver. The following configuration maps to error-403 when the org.springframework.security.access.AccessDeniedException occurs, and to error when any other exception occurs. The view resolver interprets error-403 and error as /WEB-INF/views/error-403.jsp and /WEB-INF/views/error.jsp respectively.
</p>

<h6 class="src">spring-bbs-servlet.xml</h6>
<pre class="prettyprint">
&lt;bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver"&gt;
  &lt;property name="defaultErrorView" value="<b>error</b>" /&gt;
  &lt;property name="exceptionMappings"&gt;
    &lt;props&gt;
      &lt;prop key="AccessDeniedException"&gt;
      <b>error-403</b>
      &lt;/prop&gt;
    &lt;/props&gt;
  &lt;/property&gt;
&lt;/bean&gt;
</pre>

<p>
After signing up and logging in with janedoe@gmail.org/1111, try to withdraw membership with johndoe@gmail.org/1111 from the Bye menu.
</p>

<h6 class="src">UserService.java</h6>
<pre class="prettyprint">
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER') and <strong>#user.email == principal.username</strong>")
public void bye(User user);
</pre>

<p>
The highlighted part above will work and occur an org.springframework.security.access.AccessDeniedException, and you will see /WEB-INF/views/error-403.jsp.
</p>

<p>
On the Bye page, try to withdraw membership with janedoe@gmail.org and the wrong password.
</p>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">
@Override
public void bye(User user) {
  String encodedPassword = this.getUser(user.getEmail()).getPasswd();
  boolean check = this.bcryptPasswordEncoder.matches(user.getPasswd(), encodedPassword);
	
  if (check == false) {
    <strong>throw new AccessDeniedException("Wrong password!");</strong>
  }
	
  userMapper.deleteAuthority(user.getEmail());
  userMapper.delete(user);
}
</pre>

<p>
The highlighted part above will occur an org.springframework.security.access.AccessDeniedException, and you will see /WEB-INF/views/error-403.jsp.
</p>

</article>
