<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Filter Security</title>
<meta name="Keywords" content="java,spring security,filter security,authorities table,form-login,login-page,login-processing-url,intercept-url,security:global-method-security," />
<meta name="Description" content="This article describes Filter Security" />
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

<h1>Filter Security</h1>

<p>
This section describes how to apply Spring Security to the Spring MVC bulletin board. (Spring Security is an authentication framework based on Spring framework)
</p>

<p>
Modify pom.xml as shown below.
</p>

<pre class="prettyprint">
&lt;properties&gt;
  &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
  &lt;maven.compiler.source&gt;21&lt;/maven.compiler.source&gt;
  &lt;maven.compiler.target&gt;21&lt;/maven.compiler.target&gt;
  &lt;spring.version&gt;6.2.8&lt;/spring.version&gt;
  &lt;spring.security.version&gt;<strong>6.5.1</strong>&lt;/spring.security.version&gt;
&lt;/properties&gt;
</pre>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
  &lt;artifactId&gt;<strong>spring-security-web</strong>&lt;/artifactId&gt;
  &lt;version&gt;${spring.security.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
  &lt;artifactId&gt;<strong>spring-security-taglibs</strong>&lt;/artifactId&gt;
  &lt;version&gt;${spring.security.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
  &lt;artifactId&gt;<strong>spring-security-config</strong>&lt;/artifactId&gt;
  &lt;version&gt;${spring.security.version}&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>Create authorities table to java account</h3>

<p>
You need the <b>users</b> and the <b>authorities</b> table to use Spring Security. You can use our <b>member</b> as it is instead of the table <b>users</b>.
</p>

<p>
Create an authorities table and insert test data.
</p>

<pre class="prettyprint">
CREATE TABLE authorities (
  email VARCHAR2(60) NOT NULL,
  authority VARCHAR2(20) NOT NULL,
  CONSTRAINT fk_authorities FOREIGN KEY(email) REFERENCES member(email)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(email, authority); 

INSERT INTO member VALUES ('john@gmail.org','1111','John','010-1111-1111');
INSERT INTO member VALUES ('jane@gmail.org','1111','Jane','010-1111-2222');

INSERT INTO authorities VALUES ('john@gmail.org','ROLE_USER');
INSERT INTO authorities VALUES ('john@gmail.org','ROLE_ADMIN');
INSERT INTO authorities VALUES ('jane@gmail.org','ROLE_USER');

commit;
</pre>

<p>
ROLE_USER is the regular user privileges, and ROLE_ADMIN is the administrator privileges. John has both ROLE_USER and ROLE_ADMIN, and Jane has only ROLE_USER.
</p>

<h2>Filter Security</h2>

<p>
Create a spring configuration file only for Spring Security in the /WEB-INF/spring folder named security.xml (no name restriction), as shown below.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans:beans xmlns="http://www.springframework.org/schema/security"
  xmlns:beans="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/security
    http://www.springframework.org/schema/security/spring-security.xsd"&gt;

  &lt;http&gt;
    &lt;access-denied-handler error-page="/403" /&gt;  
    &lt;intercept-url pattern="/users/bye_confirm" access="permitAll" /&gt;
    &lt;intercept-url pattern="/users/welcome" access="permitAll" /&gt;
    &lt;intercept-url pattern="/users/signUp" access="permitAll" /&gt;
    &lt;intercept-url pattern="/users/login" access="permitAll" /&gt;
    &lt;intercept-url pattern="/admin/**" access="hasRole('ROLE_ADMIN')"/&gt;
    &lt;intercept-url pattern="/users/**" access="hasAnyRole('ROLE_ADMIN','ROLE_USER')"/&gt;
    &lt;intercept-url pattern="/bbs/**" access="hasAnyRole('ROLE_ADMIN','ROLE_USER')" /&gt;
    &lt;intercept-url pattern="/**" access="permitAll" /&gt;
    
    &lt;form-login login-page="/users/login" 
      authentication-failure-url="/users/login?error=1" 
      default-target-url="/bbs/list?boardCd=chat&amp;amp;page=1" /&gt;
    
    &lt;logout logout-success-url="/users/login" invalidate-session="true" /&gt;
    
    &lt;session-management&gt;
      &lt;concurrency-control max-sessions="1"
        error-if-maximum-exceeded="true" /&gt;
    &lt;/session-management&gt;
  &lt;/http&gt;

  &lt;global-method-security pre-post-annotations="enabled" /&gt;
  
  &lt;beans:bean id="webexpressionHandler" 
    class="org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler" /&gt; 

  &lt;authentication-manager&gt;
    &lt;authentication-provider&gt;
      &lt;jdbc-user-service 
        data-source-ref="dataSource"
        users-by-username-query="SELECT email as username,passwd as password,1 as enabled 
          FROM member WHERE email = ?"
        authorities-by-username-query="SELECT email as username,authority 
          FROM authorities WHERE email = ?" /&gt;
    &lt;/authentication-provider&gt;
  &lt;/authentication-manager&gt;

&lt;/beans:beans&gt;
</pre>

<p>
Since Spring Security 4, the default values of the following attributes have changed:
</p>

<ul>
	<li>use-expressions: <strong>true</strong></li>
	<li>login-page: <strong>/login</strong></li>
	<li>login-processing-url: <strong>/login</strong> (POST method)</li>
	<li>username-parameter: <strong>username</strong></li>
	<li>password-parameter: <strong>password</strong></li>
	<li>authentication-failure-url: <strong>/login?error=1</strong></li>
</ul>

<p>
If you want to use a non-default login page such as '/users/ login' and go back to the login page in case of a login failure, you must specify the login-page and authentication-failure-url attributes and add <strong>&lt;intercept-url pattern="/users/login" access="permitAll" /&gt;</strong> into http element.
</p>

<p>
Modify web.xml as follows.
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
      
  &lt;display-name&gt;Spring BBS&lt;/display-name&gt;
  
  <strong>&lt;listener&gt;</strong>
    <strong>&lt;listener-class&gt;org.springframework.security.web.session.HttpSessionEventPublisher&lt;/listener-class&gt;</strong>
  <strong>&lt;/listener&gt;</strong>

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

  <strong>&lt;filter&gt;</strong>
    <strong>&lt;filter-name&gt;springSecurityFilterChain&lt;/filter-name&gt;</strong>
    <strong>&lt;filter-class&gt;org.springframework.web.filter.DelegatingFilterProxy&lt;/filter-class&gt;</strong>
  <strong>&lt;/filter&gt;</strong>

  &lt;filter-mapping&gt;
    &lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
    &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
  &lt;/filter-mapping&gt;

  <strong>&lt;filter-mapping&gt;</strong>
    <strong>&lt;filter-name&gt;springSecurityFilterChain&lt;/filter-name&gt;</strong>
    <strong>&lt;url-pattern&gt;/*&lt;/url-pattern&gt;</strong>  
  <strong>&lt;/filter-mapping&gt;</strong> 
  
  &lt;servlet&gt;
    &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
    &lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
    &lt;init-param&gt;
      &lt;param-name&gt;contextConfigLocation&lt;/param-value&gt;
      &lt;param-value&gt;/WEB-INF/spring/*.xml&lt;/param-value&gt;
    &lt;/init-param&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;

  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;

  <strong>&lt;error-page&gt;</strong>
    <strong>&lt;error-code&gt;403&lt;/error-code&gt;</strong>
    <strong>&lt;location&gt;/WEB-INF/views/noAuthority.jsp&lt;/location&gt;</strong>
  <strong>&lt;/error-page&gt;</strong>
&lt;/web-app&gt;
</pre>

<p>
Remove the login and logout methods from UsersController.java.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
/*
@RequestMapping(value="/login", method=RequestMethod.POST)
public String login(String email, String passwd, HttpSession session) {
  User user = userService.login(email, passwd);
  if (user != null) {
    session.setAttribute(WebContants.USER_KEY, user);
    return "redirect:/users/changePasswd";
  } else {
    return "redirect:/users/login";
  }
}

@RequestMapping(value="/logout", method=RequestMethod.GET)
public String logout(HttpSession session) {
  session.removeAttribute(WebContants.USER_KEY);
  return "redirect:/users/login";
}
*/
</pre>

<p>
Modify login.jsp as follows.
</p>

<h6 class="src">/WEB-INF/views/users/login.jsp</h6>
<pre class="prettyprint">
<strong>&lt;c:if test="${not empty param.error }"&gt;</strong>
  <strong>&lt;h2&gt;${SPRING_SECURITY_LAST_EXCEPTION.message }&lt;/h2&gt;</strong>
<strong>&lt;/c:if&gt;</strong>
<strong>&lt;c:url var="loginUrl" value="/login" /&gt;</strong>
&lt;form id="loginForm" <strong>action="${loginUrl }" method="post"</strong>&gt;
<strong>&lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
  &lt;td style="width: 200px;"&gt;Email&lt;/td&gt;
  &lt;td style="width: 390px"&gt;&lt;input type="text" name="<strong>username</strong>" style="width: 99%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Password&lt;/td&gt;
  &lt;td&gt;&lt;input type="password" name="<strong>password</strong>" style="width: 99%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
</pre>

<p>
If you try to log in without <strong>&lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt;</strong>, you will see a blank screen. Because Spring Security 's CSRF prevention works.
</p>

<p>
Spring Security enables CSRF prevention by default. Therefore, you must include the CSRF token in the PATCH, POST, PUT, and DELETE requests. If you use springform tags, you do not need to add the CSRF token parameter because springform tags add the token parameter.
</p>

<p>
Modify header.jsp as follows.
</p>

<h6 class="src">/WEB-INF/views/inc/header.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;
&lt;h1 style="float: left;width: 150px;"&gt;&lt;a href="../"&gt;&lt;img src="../images/ci.gif" alt="java-school logo" /&gt;&lt;/a&gt;&lt;/h1&gt;
&lt;div id="memberMenu" style="float: right;position: relative;top: 7px;"&gt;
<strong>&lt;security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"&gt;</strong>
  &lt;security:authentication property="principal.username" var="<strong>check</strong>" /&gt;
<strong>&lt;/security:authorize&gt;</strong>
&lt;c:choose&gt;
  &lt;c:when test="${empty <strong>check</strong>}"&gt;
    &lt;input type="button" value="Login" onclick="location.href='/users/login'" /&gt;
    &lt;input type="button" value="SignUp" onclick="location.href='/users/signUp'" /&gt;
  &lt;/c:when&gt;
  &lt;c:otherwise&gt;
    &lt;input type="button" value="Logout" id="logout" /&gt;
    &lt;input type="button" value="Modify Account" onclick="location.href='/users/editAccount'" /&gt;
  &lt;/c:otherwise&gt;
&lt;/c:choose&gt;
&lt;/div&gt;
<strong>&lt;form id="logoutForm" action="/logout" method="post" style="display:none"&gt;</strong>
  <strong>&lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt;</strong>
<strong>&lt;/form&gt;</strong>
<strong>&lt;script type="text/javascript" src="/resources/js/jquery.js"&gt;&lt;/script&gt;</strong>

<strong>&lt;script&gt;</strong>
<strong>$(document).ready(function() {</strong>
  <strong>$('#logout').click(function() {</strong>
    <strong>$('#logoutForm').submit();</strong>
    <strong>return false;</strong>
    <strong>});</strong>
<strong>});</strong>
<strong>&lt;/script&gt;</strong>
</pre>

<p>
Create a noAuthority.jsp as shown belows.
</p>

<h6 class="src">/WEB-INF/views/noAuthority.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;403&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
Insufficient privileges.
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>Modify sources</h3>

<h6 class="src">UserMapper.xml</h6>
<pre class="prettyprint">
&lt;insert id="insertAuthority"&gt;
  INSERT INTO authorities VALUES (#{email}, #{authority})
&lt;/insert&gt;

&lt;delete id="deleteAuthority"&gt;
  DELETE FROM authorities WHERE email = #{email}  
&lt;/delete&gt;
</pre>

<h6 class="src">UserMapper.java</h6>
<pre class="prettyprint">
public void insertAuthority(@Param("email") String email, @Param("authority") String authority);
  
public void deleteAuthority(@Param("email") String email);
</pre>

<h6 class="src">UserService.java</h6>
<pre class="prettyprint">
public void addAuthority(String email, String authority);
</pre>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">
@Override
public void addAuthority(String email, String authority) {
  userMapper.insertAuthority(email, authority);
}

@Override
public void bye(User user) {
  <strong>userMapper.deleteAuthority(user.getEmail());</strong>
  userMapper.delete(user);
}
</pre>

<h6 class="src">UsersController</h6>
<pre class="prettyprint">
//omit..

<strong>
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;

import java.security.Principal;
import org.springframework.ui.Model;
</strong>

//omit..

@RequestMapping(value="/signUp", method=RequestMethod.POST)
public String signUp(User user) {

  <strong>String authority = "ROLE_USER";</strong>

  userService.addUser(user);
  <strong>userService.addAuthority(user.getEmail(), authority);</strong>

  return "redirect:/users/welcome";
}

@RequestMapping(value="/editAccount", method=RequestMethod.GET)
public String editAccount(<strong>Principal principal, Model model</strong>) {
  User user = userService.getUser(<strong>principal.getName()</strong>);
  model.addAttribute(WebContants.USER_KEY, user);

  return "users/editAccount";
}

@RequestMapping(value="/editAccount", method=RequestMethod.POST)
public String editAccount(User user, <strong>Principal principal</strong>) {
  
  user.setEmail(<strong>principal.getName()</strong>);

  int check = userService.editAccount(user);
  if (check &lt; 1) {
    throw new RuntimeException(WebContants.EDIT_ACCOUNT_FAIL);
  } 

  return "redirect:/users/changePasswd";
  
}

@RequestMapping(value="/changePasswd", method=RequestMethod.GET)
public String changePasswd(<strong>Principal principal, Model model</strong>) {
  User user = userService.getUser(<strong>principal.getName()</strong>);

  model.addAttribute(WebContants.USER_KEY, user);

  return "users/changePasswd";
}

@RequestMapping(value="/changePasswd", method=RequestMethod.POST)
public String changePasswd(String currentPasswd, String newPasswd, <strong>Principal principal</strong>) {
  
  int check = userService.changePasswd(currentPasswd,newPasswd, <strong>principal.getName()</strong>);

  if (check &lt; 1) {
    throw new RuntimeException(WebContants.CHANGE_PASSWORD_FAIL);
  }  

  return "redirect:/users/changePasswd_confirm";

}

@RequestMapping(value="/bye", method=RequestMethod.POST)
public String bye(String email, String passwd, HttpServletRequest req) 
    throws ServletException {

  User user = userService.login(email, passwd);
  userService.bye(user);
  req.logout();

  return "redirect:/users/bye_confirm";
}
</pre>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
//omit..

<strong>import java.security.Principal;</strong>

//omit..

@RequestMapping(value="/write", method=RequestMethod.POST)
public String write(MultipartHttpServletRequest mpRequest, <strong>Principal principal</strong>) 
    throws Exception {

  //omit..
  Article article = new Article();
  article.setBoardCd(boardCd);
  article.setTitle(title);
  article.setContent(content);
  article.setEmail(<strong>principal.getName()</strong>);
    
  boardService.addArticle(article);  
    
  //omit..
    
  int size = fileList.size();
  for (int i = 0; i &lt; size; i++) {
    MultipartFile mpFile = fileList.get(i);
    AttachFile attachFile = new AttachFile();
    String filename = mpFile.getOriginalFilename();
    attachFile.setFilename(filename);
    attachFile.setFiletype(mpFile.getContentType());
    attachFile.setFilesize(mpFile.getSize());
    attachFile.setArticleNo(article.getArticleNo());
    attachFile.setEmail(<strong>principal.getName()</strong>);
    boardService.addAttachFile(attachFile);
  }

  //omit..
}

@RequestMapping(value="/addComment", method=RequestMethod.POST)
public String addComment(Integer articleNo, 
    String boardCd, 
    Integer page, 
    String searchWord, 
    String memo,
    <strong>Principal principal</strong>) throws Exception {
    
  Comment comment = new Comment();
  comment.setArticleNo(articleNo);
  comment.setEmail(<strong>principal.getName()</strong>);
  comment.setMemo(memo);

  //omit..
}
</pre>

<p>
You must add a CSRF token to the request as a query string for requests to upload files. (&lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt; does not work. this is true even if you are using Spring form tags)
</p>

<p>
Open the write.jsp and modify.jsp and remove &gt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt; and modify the form's action like below.
</p>
 
<h6 class="src">write.jsp</h6>
<pre class="prettyprint">
&lt;sf:form action="write?<strong>${_csrf.parameterName}=${_csrf.token}</strong>" method="post" ...
</pre>

<h6 class="src">modify.jsp</h6>
<pre class="prettyprint">
&lt;sf:form action="modify?<strong>${_csrf.parameterName}=${_csrf.token}</strong>" method="post" ...
</pre>

<h3>Test</h3>

<p>
After Build, restart Tomcat and visit the following address:<br />
http://localhost:8080/list?boardCd=chat&amp;page=1.
</p>

<p>
You will see the login page.<br />
Try login as username: jane@gmail.org, password: 1111.<br />
If login is successful, you will see the bulletin board screen.<br />
Try to visit http://localhost:8080/admin.<br />
Spring Security denied your access because the account has only normal user privilege, so that you will see noAuthority.jsp.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://docs.spring.io/spring-security/site/migrate/current/3-to-4/html5/migrate-3-to-4-xml.html#m3to4-xmlnamespace-defaults">http://docs.spring.io/spring-security/site/migrate/current/3-to-4/html5/migrate-3-to-4-xml.html#m3to4-xmlnamespace-defaults</a></li>
  <li><a href="http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#nsa-logout-attributes">http://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#nsa-logout-attributes</a></li>
  <li><a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec15.html#sec15.1.3">http://www.w3.org/Protocols/rfc2616/rfc2616-sec15.html#sec15.1.3</a></li>  
  <li><a href="http://stackoverflow.com/questions/10421588/spring-security-not-working-what-am-i-doing-wrong">Spring Security not working. What am I doing wrong?</a></li>
  <li><a href="http://static.springsource.org/spring-security/site/faq/faq.html#faq-method-security-in-web-context">https://docs.spring.io/spring-security/site/faq/faq.html#faq-method-security-in-web-context</a></li>
  <li><a href="http://stackoverflow.com/questions/3087548/can-spring-security-use-preauthorize-on-spring-controllers-methods">Can Spring Security use @PreAuthorize on Spring controllers methods?</a></li>
</ul>
</article>

</body>
</html>
