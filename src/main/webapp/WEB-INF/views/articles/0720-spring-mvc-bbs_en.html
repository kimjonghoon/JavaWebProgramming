<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Board program on Spring MVC</title>
<meta name="Keywords" content="java,maven,spring,spring mvc,board program,@Controller,@RequestMapping,@Autowired,mvc:resources,context:component-scan,mvn:annotation-driven,mybatis:scan," />
<meta name="Description" content="Board program on Spring MVC" />
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

<h1>Board program on Spring MVC</h1>

<p>
This section covers changing the Model 2 project to the Spring MVC project.
</p>

<h2>Source</h2>

<p>
You need the final source of the <a th:href="@{/spring/spring-mvc-with-maven}">Building Spring MVC with Maven</a> section and <a th:href="@{/jsp-pjt}">JSP Porject</a> chapter.
</p>

<p>
The source of the JSP Project is also available at the following address:
</p>

<pre>
git clone https://github.com/kimjonghoon/model2
</pre>

<h2>Database design</h2>

<p>
The database design remains the same as the Model 2 database design. See Database design. See <a th:href="@{/jsp-pjt/database-design}">Database design</a>.
</p>

<h2>Copy files</h2>

<p>
To keep the model 2 source, we will put the spring bulletin board project in the spring-bbs project in the previous section.
</p>

<h3>Stylesheets and Images</h3>

<p>
Copy the /css and /images folders from C:/www/JSPProject/WebContent on the Model 2 bulletin board and paste them into the Document Base, C:/www/spring-bbs/src/main/webapp directory.
</p>

<h3>JSPs</h3>

<p>
Create the /views folder under C:/www/spring-bbs/src/main/webapp/WEB-INF.<br />
Copy the index.jsp, error.jsp, /bbs, /inc, /java, /users folders from the Document Base of Model 2 board and paste them into the /views folder.
</p>

<p>
The reason for putting JSPs in the /WEB-INF subdirectory is to prevent the web browser from directly accessing them.<br />
Spring MVC recommends a system where the dispatcher servlet receives all requests and passes them back to the controller.
</p>

<h3>Java sources</h3>

<p>
Copy all the Java source folders from C:/www/JSPProject/src on the Model 2 bulletin board and paste them into C:/www/spring-bbs/src/main/java.
</p>

<h3>logging configuration file</h3>

<p>
Copy the following commons-logging.properties and log4j2.xml from JSPProject and paste them into C:/www/spring-bbs/src/main/resources. If the /resources folder does not exist, create it and run <strong>Maven - Update Project...</strong> to synchronize.
</p>

<h6 class="src">commons-logging.properties</h6>
<pre class="prettyprint">
org.apache.commons.logging.Log = org.apache.commons.logging.impl.Log4JLogger
</pre>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Configuration&gt;
  &lt;Appenders&gt;
    &lt;File name="A1" fileName="A1.log" append="true"&gt;
      &lt;PatternLayout pattern="%t %-5p %c{2} - %m%n" /&gt;
    &lt;/File&gt;
    &lt;Console name="STDOUT" target="SYSTEM_OUT"&gt;
      &lt;PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n" /&gt;
    &lt;/Console&gt;
  &lt;/Appenders&gt;
  &lt;Loggers&gt;
    &lt;Logger name="net.java_school" level="debug"&gt;
      &lt;AppenderRef ref="A1" /&gt;
    &lt;/Logger&gt;
    &lt;Root level="debug"&gt;
      &lt;AppenderRef ref="STDOUT" /&gt;
    &lt;/Root&gt;
  &lt;/Loggers&gt;
&lt;/Configuration&gt;
</pre>

<h3>Mapping dispatcher servlet</h3>

<p>
As recommended by Spring MVC, set the following in web.xml so that the dispatcher servlet will handle all requests:
</p>

<pre class="prettyprint">
&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;spring-bbs&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<h2>Modify JSPs</h2>

<h3>Remove '.do' from request strings within JSP source</h3>

<p>
The Model 2 board controller was only responsible for requests ending in .do.
However, in Spring MVC, it is better to set the dispatcher servlet to handle all requests. So, you need to remove the '.do' from the request string ending in '.do' in the JSP. For example, modify ../users/login.do in header.jsp to ../users/login.
</p>

<h3>Using date format in list.jsp and view.jsp</h3>

<p>
JSTL makes it easy to format dates in JSPs.
</p>

<p>
Add the following tag libraries to both files:
</p>

<pre class="prettyprint">
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %&gt;
</pre>

<p>
In list.jsp, find the part that displays the date and modify it as follows.
</p>

<pre class="prettyprint">
&lt;fmt:formatDate pattern="yyyy.MM.dd" value="${article.regdate }" /&gt;
</pre>

<p>
In view.jsp, find the part that displays the date and modify it as follows.
</p>

<pre class="prettyprint">
&lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${regdate }" /&gt;
&lt;fmt:formatDate pattern="yyyy.MM.dd" value="${article.regdate }" /&gt;
</pre>

<h3>Create JSP used to download attachments</h3>

<p>
So far, we have downloaded the linked attachments. In the Spring MVC project, let's create and use a JSP that downloads attachments.
</p>

<h6 class="src">/WEB-INF/views/inc/download.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;    
&lt;%@ page import="java.io.File" %&gt;
&lt;%@ page import="java.net.URLEncoder" %&gt;
&lt;%@ page import="java.io.OutputStream" %&gt;
&lt;%@ page import="java.io.FileInputStream" %&gt;
&lt;%@ page import="java.io.IOException" %&gt;
&lt;%@ page import="org.springframework.util.FileCopyUtils" %&gt;
&lt;%@ page import="net.java_school.commons.WebContants" %&gt;
&lt;%
//request.setCharacterEncoding("UTF-8");//This is done by a filter.
String filename = request.getParameter("filename");

File file = new File(<strong>WebContants.UPLOAD_PATH</strong> + filename);

String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());

if (filetype.trim().equalsIgnoreCase("txt")) {
  response.setContentType("text/plain");
} else {
  response.setContentType("application/octet-stream");
}

response.setContentLength((int) file.length());

boolean ie = request.getHeader("User-Agent").indexOf("MSIE") != -1;
if (ie) {
  filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
} else {
  filename = new String(filename.getBytes("UTF-8"), "8859_1");
}

response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

OutputStream outputStream = response.getOutputStream();
FileInputStream fis = null;

try {
  fis = new FileInputStream(file);
  FileCopyUtils.copy(fis, outputStream);
} finally {
  if (fis != null) {
    try {
      fis.close();
    } catch (IOException e) {}
  }
}

out.flush();
%&gt;
</pre>

<p>
With download.jsp, you can download attachments even if they are in a location that your web browser can not access.
</p>

<p>
In the above, WebContants.UPLOAD_PATH is the directory where the bulletin board system saves attachment files.
</p>

<h6 class="src">WebContants.java</h6>
<pre class="prettyprint">package net.java_school.commons;

public class WebContants {
  //Session key
  public final static String USER_KEY = "user";
  //Error Message
  public final static String NOT_LOGIN = "Not Login";
  public final static String AUTHENTICATION_FAILED = "Authentication Failed";
  //Line Separator
  public final static String LINE_SEPARATOR = System.getProperty("line.separator");
  //Upload Path
  <strong>public final static String UPLOAD_PATH = "C:/www/spring-bbs/upload/";</strong>
}
</pre>

<p>
C:/www/spring-bbs/upload/ is a directory that the web browser cannot access. Therefore, you cannot make links in attachments in this directory. You need to change the attachment download code in the view.jsp.
</p>

<h2>User</h2>

<p>
We will modify database-related code to use the MyBatis-Spring. Change UserService.java to be an interface.
</p>

<h6 class="src">UserService.java</h6>

<pre class="prettyprint">package net.java_school.user;

public interface UserService {
    
  public void addUser(User user);

  public User login(String email, String passwd);

  public int editAccount(User user);

  public int changePasswd(String currentPasswd, String newPasswd, String email);

  public void bye(User user);

  public User getUser(String email);
    
}
</pre>

<p>
Create UserMapper.java in the net.java_school.mybatis package.
</p>

<h6 class="src">UserMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import org.apache.ibatis.annotations.Param;

import net.java_school.user.User;

public interface UserMapper {
    
  public void insert(User user);

  public User login(
    @Param("email") String email, 
    @Param("passwd") String passwd);

  public int update(User user);

  public int <strong>updatePasswd</strong>(
    @Param("currentPasswd") String currentPasswd, 
    @Param("newPasswd") String newPasswd, 
    @Param("email") String email);

  public int delete(User user);

  public User selectOne(String email);
    
}
</pre>

<p>
Create UserServiceImpl.java in the net.java_school.user package.
</p>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">
package net.java_school.user;

import net.java_school.mybatis.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    
  @Autowired
  private UserMapper userMapper;
    
  public void addUser(User user) {
    userMapper.insert(user);
  }

  public User login(String email, String passwd) {
    return userMapper.login(email, passwd);
  }

  public int editAccount(User user) {
    return userMapper.update(user);
  }

  public int changePasswd(String currentPasswd, String newPasswd, String email) {
    return userMapper.updatePasswd(currentPasswd, newPasswd, email);
  }

  public void bye(User user) {
    userMapper.delete(user);
  }

  public User getUser(String email) {
    return userMapper.selectOne(email);
  }
    
}
</pre>

<p>
In the project explorer view, create the net.java_school.mybatis package in src/main/resources, and make the MyBatis related configuration file Congifuration.xml in this package. This file sets the alias of the type and the location of the mapper files. You need to create configuration files in src/main/resources. When you make configuration files in this directory, Maven copies them to the classpath during the build process.
</p>

<h6 class="src">Configuration.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration 
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-config.dtd"&gt;

&lt;configuration&gt; 

  &lt;settings&gt;
    &lt;setting name="logImpl" value="LOG4J2"/&gt;
  &lt;/settings&gt;
        
  &lt;typeAliases&gt;
    &lt;typeAlias type="net.java_school.board.AttachFile" alias="AttachFile" /&gt;
    &lt;typeAlias type="net.java_school.board.Comment" alias="Comment" /&gt;
    &lt;typeAlias type="net.java_school.board.Board" alias="Board" /&gt;
    &lt;typeAlias type="net.java_school.board.Article" alias="Article" /&gt;
    &lt;typeAlias type="net.java_school.user.User" alias="User" /&gt;
  &lt;/typeAliases&gt;

  &lt;mappers&gt;
    &lt;mapper resource="net/java_school/mybatis/BoardMapper.xml" /&gt;
    <strong>&lt;mapper resource="net/java_school/mybatis/UserMapper.xml" /&gt;</strong>
  &lt;/mappers&gt;

&lt;/configuration&gt;
</pre>

<p>
Create a UserMapper.xml file in the exact location as Configuration.xml. In the mapper file, id values must match method names in UserMapper.java.
</p>

<h6 class="src">UserMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.UserMapper"&gt;
    
  &lt;insert id="insert" parameterType="User"&gt;
    INSERT INTO member VALUES (#{email}, #{passwd}, #{name}, #{mobile})
  &lt;/insert&gt;

  &lt;select id="login" resultType="User"&gt;
    SELECT email, passwd, name, mobile FROM member 
    WHERE email = #{email} AND passwd = #{passwd}
  &lt;/select&gt;

  &lt;update id="update" parameterType="User"&gt;
    UPDATE member SET name = #{name}, mobile = #{mobile} 
    WHERE email = #{email} AND passwd = #{passwd}
  &lt;/update&gt;

  &lt;update id="updatePasswd"&gt;
    UPDATE member SET passwd = #{newPasswd} 
    WHERE passwd = #{currentPasswd} AND email = #{email}
  &lt;/update&gt;

  &lt;delete id="delete"&gt;
    DELETE FROM member 
    WHERE email = #{email}
  &lt;/delete&gt;

  &lt;select id="selectOne" parameterType="string" resultType="User"&gt;
    SELECT email, passwd, name, mobile 
    FROM member
    WHERE email = #{email}
  &lt;/select&gt;
    
&lt;/mapper&gt;
</pre>

<p>
Create UsersController.java in the net.java_school. controller package. If you want this controller to handle all requests involving /users, add the @Controller annotation to the class declaration and add the @RequestMapping ("users") annotation right below the @Controller annotation.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import java.net.URLEncoder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import net.java_school.commons.WebContants;
import net.java_school.exception.AuthenticationException;
import net.java_school.user.User;
import net.java_school.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<strong>
@Controller
@RequestMapping("users")</strong>
public class UsersController {
    
  <strong>@Autowired</strong>
  private UserService userService;

  <strong>@RequestMapping(value="signUp", method=RequestMethod.GET)</strong>
  public String signUp() {
    return "users/signUp";
  }

  @RequestMapping(value="signUp", method=RequestMethod.POST)
  public String signUp(User user) {
    userService.addUser(user);
    return "<strong>redirect:/users/welcome</strong>";
  }

  @RequestMapping(value="<strong>welcome</strong>", method=RequestMethod.GET)
  public String welcome() {
    return "users/welcome";
  }

  @RequestMapping(value="login", method=RequestMethod.GET)
  public String login() {
    return "users/login";
  }
    
  @RequestMapping(value="login", method=RequestMethod.POST)
  public String login(String email, String passwd, String url, HttpSession session) {
    User user = userService.login(email, passwd);
        
    if (user == null) {
      return "redirect:/users/login?url=" + url + "&amp;msg=Login-Failed";
    } else {
      session.setAttribute(WebContants.USER_KEY, user);
      if (!url.equals("")) {
        return "redirect:" + url;
      }
      
      return "redirect:/";
    }
        
  }
        
  @RequestMapping(value="editAccount", method=RequestMethod.GET)
  public String editAccount(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User) session.getAttribute(WebContants.USER_KEY);

    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      
      return "redirect:/users/login?url=" + url;
    }

    return "users/editAccount";
  }
    
  @RequestMapping(value="editAccount", method=RequestMethod.POST)
  public String editAccount(User user, HttpSession session) {
    User loginUser = (User) session.getAttribute(WebContants.USER_KEY);
    if (loginUser == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    user.setEmail(loginUser.getEmail());
        
    int check = userService.editAccount(user);
    if (check &lt; 1) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }
    
    session.setAttribute(WebContants.USER_KEY, user);

    return "users/changePasswd";
        
  }
    
  @RequestMapping(value="changePasswd", method=RequestMethod.GET)
  public String changePasswd(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User) session.getAttribute(WebContants.USER_KEY);
        
    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;     
    }
        
    return "users/changePasswd";
  }
    
  @RequestMapping(value="changePasswd", method=RequestMethod.POST)
  public String changePasswd(String currentPasswd, String newPasswd, HttpSession session) {
    String email = ((User)session.getAttribute(WebContants.USER_KEY)).getEmail();
        
    int check = userService.changePasswd(currentPasswd, newPasswd, email);
    if (check &lt; 1) {
        throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    } 
    
    return "redirect:/users/changePasswd_confirm";
        
  }
    
  @RequestMapping(value="changePasswd_confirm", method=RequestMethod.GET)
  public String changePasswd_confirm() {
    return "users/changePasswd_confirm";
  }
    
  @RequestMapping(value="bye", method=RequestMethod.GET)
  public String bye(HttpServletRequest req, HttpSession session) throws Exception {
    User user = (User)session.getAttribute(WebContants.USER_KEY);
        
    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      
      return "redirect:/users/login?url=" + url;     
    }
        
    return "users/bye";
  }

  @RequestMapping(value="bye", method=RequestMethod.POST)
  public String bye(String email, String passwd, HttpSession session) {
    User user = (User)session.getAttribute(WebContants.USER_KEY);

    if (user == null || !user.getEmail().equals(email)) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }
    
    user = userService.login(email, passwd);
    userService.bye(user);
    session.removeAttribute(WebContants.USER_KEY);
    
    return "redirect:/users/bye_confirm";
        
  }
  
  @RequestMapping(value="bye_confirm", method=RequestMethod.GET)
  public String bye_confirm() {
  
    return "users/bye_confirm";    
  } 
    
  @RequestMapping(value="logout", method=RequestMethod.GET)
  public String logout(HttpSession session) {
    session.removeAttribute(WebContants.USER_KEY);

    return "redirect:/";

  }

}
</pre>

<p>
@RequestMapping(value="signUp", method=RequestMethod.GET) annotation above the method declaration allows the method to handle the "/users/signUp" request of the GET method. (The "/users" part of "/users/signUp" is due to the @RequestMapping("users") annotation added above the UsersController class declaration)
</p>

<p>
@RequestMapping(value="/signUp", method=RequestMethod.POST) above the method declaration allows the method to handle the "/users/signUp" request of the POST method.
</p>

<p>
Even if the request string is the same, it is possible to handle each request separately by HTTP method.
</p>

<p>
The method invoked on the /users/signUp request of the POST method gets your web browser to redirect the request to welcome.jsp after completing membership. If this method changes the screen using forwarding after membership, the user can subscribe with the same information using the F5 button. Redirect does not have this problem. If you have chosen a redirect, You need to write a method with the following annotation on the controller.
</p>

<pre class="prettyprint">@RequestMapping(value="welcome", method="RequestMethod.GET")</pre>

<p>
HomeController is the controller responsible for homepage (/) request.
</p>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
  @RequestMapping(method=RequestMethod.GET)
  public String index() {
    return "index";
  }
}
</pre>

<p>
JavaController is the controller that handles requests starting with /java.
</p>

<h6 class="src">JavaController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("java")
public class JavaController {

  @RequestMapping(method=RequestMethod.GET)
  public String index() {
    return "java/index";
  }
    
  @RequestMapping(value="jdk-install", method=RequestMethod.GET)
  public String basic() {
    return "java/jdk-install";
  }

}
</pre>

<p>
JavascriptController is the controller that handles requests starting with /javascript.
</p>

<h6 class="src">JavascriptController.java</h6>
<pre class="prettyprint">package net.java_school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("javascript")
public class JavascriptController {

  @RequestMapping(method=RequestMethod.GET)
  public String index() {
    return "javascript/index";
  }
    
}
</pre>

<h6 class="src">mvc.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xmlns:mvc="http://www.springframework.org/schema/mvc"
  xmlns:p="http://www.springframework.org/schema/p"
  xmlns:mybatis="http://mybatis.org/schema/mybatis-spring"
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd
    http://www.springframework.org/schema/mvc
    http://www.springframework.org/schema/mvc/spring-mvc.xsd
    http://mybatis.org/schema/mybatis-spring 
    http://mybatis.org/schema/mybatis-spring.xsd"&gt;
            
  &lt;!-- The following tells Dispatcher servlet the location of the static resource.  --&gt;
  &lt;mvc:resources location="/images/" mapping="/images/**" /&gt;
  &lt;mvc:resources location="/css/" mapping="/css/**" /&gt;
        
  &lt;mvc:annotation-driven /&gt;
    
  &lt;context:component-scan
    base-package="net.java_school.controller,
      net.java_school.board, 
      net.java_school.user, " /&gt;

  &lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;

  &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE"/&gt;
    &lt;property name="username" value="java"/&gt;
    &lt;property name="password" value="school"/&gt;
    &lt;property name="maxActive" value="100"/&gt;
    &lt;property name="maxWait" value="1000"/&gt;
    &lt;property name="poolPreparedStatements" value="true"/&gt;
    &lt;property name="defaultAutoCommit" value="true"/&gt;
    &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
  &lt;/bean&gt;
    
  &lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
    &lt;property name="configLocation" value="classpath:net/java_school/mybatis/Configuration.xml" /&gt;
  &lt;/bean&gt;

  &lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;
    &lt;property name="maxUploadSize" value="2097152" /&gt;
  &lt;/bean&gt;
    
  &lt;!-- ViewResolver --&gt;
  &lt;bean id="internalResourceViewResolver" 
      class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
    &lt;property name="viewClass"&gt;
      &lt;value&gt;org.springframework.web.servlet.view.JstlView&lt;/value&gt;
    &lt;/property&gt;
    &lt;property name="prefix"&gt;
      &lt;value&gt;/WEB-INF/views/&lt;/value&gt;
    &lt;/property&gt;
    &lt;property name="suffix"&gt;
      &lt;value&gt;.jsp&lt;/value&gt;
    &lt;/property&gt;
  &lt;/bean&gt;
  
  &lt;bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver"&gt;
    &lt;property name="defaultErrorView" value="error" /&gt;
    &lt;property name="exceptionMappings"&gt;
      &lt;props&gt;
        &lt;prop key="net.java_school.exception.AuthenticationException"&gt;
          <strong>403-error</strong>
        &lt;/prop&gt;
      &lt;/props&gt;
    &lt;/property&gt;
  &lt;/bean&gt;
&lt;/beans&gt;
</pre>

<pre class="prettyprint">
<strong>&lt;mvc:resources location=".." /&gt;</strong>
</pre>

<p>
It tells the dispatcher servlet the location of static resources.
</p>

<pre class="prettyprint">
<strong>&lt;context:component-scan base-package=".." /&gt;</strong>
</pre>

<p>
It let Spring scan Java beans and register them in the container. You don't need to set beans that Spring auto-scans in your Spring configuration file. Beans to be auto-scanned must-have component annotations above the class declaration and belong to the base package. Spring refers to the annotations above the class declaration when it scans beans. For example, if @Repository, Spring treats this class as Dao. But if @Componenct or @Service, Spring scans these classes but does not treat them as special. Spring applications that run on an annotation base require the following settings:
</p>

<pre class="prettyprint">
<strong>&lt;mvc:annotation-driven /&gt;</strong>
</pre>

<pre class="prettyprint">
<strong>&lt;mybatis:scan base-package=".." /&gt;</strong>
</pre>

<p>
It let Spring scan mybatis-spring beans and register them in the container. Using the above configuration, you can omit the following from the Spring configuration file.
</p>

<pre class="prettyprint">
&lt;bean id="boardMapper" class="org.mybatis.spring.mapper.MapperFactoryBean"&gt;
  &lt;property name="mapperInterface" value="net.java_school.mybatis.BoardMapper" /&gt;
  &lt;property name="sqlSessionFactory" ref="sqlSessionFactory" /&gt;
&lt;/bean&gt;
</pre>

<pre class="prettyprint">
<strong>&lt;bean id="dataSource" ..&gt;</strong>
</pre>

<p>
You need to the dataSource definition whether you use Spring JDBC or MyBatis.
</p>

<pre class="prettyprint">
<strong>&lt;bean id="sqlSessionFactory" ..&gt;</strong>
</pre>

<p>
MyBatis applications use instances of the SqlSessionFactory interface type.
</p>

<pre class="prettyprint">
<strong>&lt;bean id="multipartResolver" ..&gt;</strong>
</pre>

<p>
When uploading a file, Spring passes a wrapper for the HttpServletRequest to the controller. The method that handles the uploaded file cast the wrapper to the MultiPartHttpServletRequest interface to control the multipart file passed to the server.
</p>

<p>
The following is a setting for how to interpret the view from the string returned by the controller.
</p>

<pre class="prettyprint">
&lt;bean class="org.springframework.web.servlet.handler.SimpleMappingExceptionResolver"&gt;
</pre>

<p>
It is a Spring MVC exception handling setting. Spring MVC has several exception handling methods. Among them, it is easiest to use SimpleMappingExceptionResolver.
</p>

<pre class="prettyprint">
&lt;prop key="net.java_school.exception.AuthenticationException"&gt;
  403-error
&lt;/prop&gt;
</pre>

<p>
According to the above, when an AuthenticationException exception occurs, the 403-error view is selected. -- Our view resolver will interpret the 403-error as /WEB-INF/views/403-error.jsp --
</p>

<p>
Create a 403-error.jsp file that says "Access Denied."  -- You do not need to define a handler for the /403-error to the controller --
</p>

<pre class="prettyprint">
&lt;property name="defaultErrorView" value="error" /&gt;
</pre>

<p>
According to the above, when an exception other than AuthenticationException occurs, the error view is selected. -- Our view resolver will interpret the error as /WEB-INF/views/error.jsp --
</p>

<h3>Board</h3>

<p>
Create BoardMapper.xml in the exact location as the UserMapper.xml, as configured in Configuration.xml.
</p>

<h6 class="src">BoardMapper.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.BoardMapper"&gt;

  &lt;select id="selectListOfArticles" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title, regdate, hit, name, attachfileNum, commentNum 
    FROM (
      SELECT rownum r,a.* 
        FROM (
          SELECT 
            a.articleno, a.title, a.regdate, a.hit, m.name,
            COUNT(DISTINCT(f.attachfileno)) attachfileNum, 
            COUNT(DISTINCT(c.commentno)) commentNum
          FROM 
            article a, attachfile f, comments c, member m
          WHERE
            a.articleno = f.articleno(+)
            AND a.articleno = c.articleno(+)
            AND a.email = m.email(+)
            AND a.boardcd = #{boardCd}
            &lt;if test="searchWord != null and searchWord != ''"&gt;
            AND (title LIKE '%${searchWord}%' OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
            &lt;/if&gt;
          GROUP BY a.articleno, title, a.regdate, hit, m.name
          ORDER BY articleno DESC
        ) a
    )
    WHERE r BETWEEN #{start} AND #{end}
    &lt;/select&gt;

  &lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
    SELECT count(*) FROM article WHERE boardcd = #{boardCd}
    &lt;if test="searchWord != null and searchWord != ''"&gt;
    AND (title LIKE '%${searchWord}%' OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
    &lt;/if&gt;
  &lt;/select&gt;

  &lt;insert id="insert" parameterType="Article" useGeneratedKeys="true"&gt;
    &lt;selectKey keyProperty="articleNo" resultType="int" order="BEFORE"&gt;
      SELECT seq_article.nextval FROM dual
    &lt;/selectKey&gt;
    INSERT INTO article (articleNo, boardCd, title, content, email, hit, regdate)
    VALUES
    (#{articleNo}, #{boardCd}, #{title}, #{content}, #{email}, 0, sysdate)
  &lt;/insert&gt;

  &lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
    INSERT INTO attachfile (attachfileno, filename, filetype, filesize, articleno, email)
    VALUES
    (seq_attachfile.nextval, #{filename}, #{filetype}, #{filesize}, #{articleNo}, #{email})
  &lt;/insert&gt;
    
  &lt;update id="update" parameterType="Article"&gt;
    UPDATE article 
    SET title = #{title}, content = #{content} 
    WHERE articleno = #{articleNo}
  &lt;/update&gt;
    
  &lt;delete id="delete" parameterType="int"&gt;
    DELETE FROM article WHERE articleno = #{articleNo}
  &lt;/delete&gt;
    
  &lt;update id="updateHitPlusOne" parameterType="int"&gt;
    UPDATE article SET hit = hit + 1 WHERE articleno = #{articleNo}
  &lt;/update&gt;
    
  &lt;select id="selectOne" parameterType="int" resultType="Article"&gt;
    SELECT 
      articleno, 
      title, 
      content, 
      a.email, 
      NVL(name, 'Anonymous') name, 
      hit, 
      regdate
    FROM article a, member m
      WHERE a.email = m.email(+) AND articleno = #{articleNo}
  &lt;/select&gt;
    
  &lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title
    FROM
    (SELECT rownum r,a.*
      FROM
        (SELECT articleno, title 
        FROM article 
        WHERE 
          boardCd = #{boardCd} 
          AND articleno &gt; #{articleNo}
          &lt;if test="searchWord != null and searchWord != ''"&gt;
          AND (title LIKE '%${searchWord}%' OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
          &lt;/if&gt;
        ORDER BY articleno) 
    a)
    WHERE r = 1
  &lt;/select&gt;
    
  &lt;select id="selectPrevOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title
    FROM
      (SELECT rownum r,a.*
      FROM
        (SELECT articleno, title 
        FROM article 
        WHERE 
          boardCd = #{boardCd} 
          AND articleno &lt; #{articleNo}
          &lt;if test="searchWord != null and searchWord != ''"&gt;
          AND (title LIKE '%${searchWord}%' OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
          &lt;/if&gt; 
        ORDER BY articleno DESC)
      a)
    WHERE r = 1
  &lt;/select&gt;
    
  &lt;select id="selectListOfAttachFiles" parameterType="int" resultType="AttachFile"&gt;
    SELECT 
      attachfileno, 
      filename, 
      filetype, 
      filesize, 
      articleno, 
      email
    FROM attachfile 
    WHERE articleno = #{articleNo} 
    ORDER BY attachfileno
  &lt;/select&gt;
    
  &lt;delete id="deleteFile" parameterType="int"&gt;
    DELETE FROM attachfile WHERE attachfileno = #{attachFileNo}
  &lt;/delete&gt;
    
  &lt;select id="selectOneBoard" parameterType="string" resultType="string"&gt;
    SELECT * FROM board WHERE boardcd = #{boardCd}
  &lt;/select&gt;
    
  &lt;insert id="insertComment" parameterType="Comment"&gt;
    INSERT INTO comments (commentno, articleno, email, memo, regdate)
    VALUES (seq_comments.nextval, #{articleNo}, #{email}, #{memo}, sysdate)
  &lt;/insert&gt;
    
  &lt;update id="updateComment" parameterType="Comment"&gt;
    UPDATE comments SET memo = #{memo} WHERE commentno = #{commentNo}
  &lt;/update&gt;
    
  &lt;delete id="deleteComment" parameterType="int"&gt;
    DELETE FROM comments WHERE commentno = #{commentNo}
  &lt;/delete&gt;

  &lt;select id="selectListOfComments" parameterType="int" resultType="Comment"&gt;
    SELECT 
      commentno, 
      articleno, 
      c.email, 
      NVL(name,'Anonymous') name, 
      memo, 
      regdate
    FROM comments c, member m
    WHERE 
      c.email = m.email(+)
      AND articleno = #{articleNo}
    ORDER BY commentno DESC
  &lt;/select&gt;

  &lt;select id="selectOneAttachFile" parameterType="int" resultType="AttachFile"&gt;
    SELECT 
      attachfileno, 
      filename, 
      filetype, 
      filesize, 
      articleno, 
      email
    FROM attachfile
    WHERE attachfileno = #{attachFileNo}
  &lt;/select&gt;
    
  &lt;select id="selectOneComment" parameterType="int" resultType="Comment"&gt;
    SELECT 
      commentno,
      articleno,
      email,
      memo,
      regdate 
    FROM comments 
    WHERE commentno = #{commentNo}
  &lt;/select&gt;

&lt;/mapper&gt;
</pre>

<p>
To make MyBatis return a unique number after an insert, add the useGeneratedKeys="true" attribute. For databases that do not have auto-increment columns like Oracle, add the selectKey subelement.
</p>

<pre class="prettyprint">
&lt;insert id="insert" parameterType="Article" <strong>useGeneratedKeys="true"</strong>&gt;
  <strong>&lt;selectKey keyProperty="articleNo" resultType="int" order="BEFORE"&gt;
    SELECT seq_article.nextval FROM dual
  &lt;/selectKey&gt;</strong>
  INSERT INTO article (articleNo, boardCd, title, content, email, hit, regdate)
  VALUES
  (#{articleNo}, #{boardCd}, #{title}, #{content}, #{email}, 0, sysdate)
&lt;/insert&gt;
</pre>

<p>
Create BoardMapper.java like below.
</p>

<h6 class="src">BoardMapper.java</h6>
<pre class="prettyprint">package net.java_school.mybatis;

import java.util.HashMap;
import java.util.List;

import net.java_school.board.Article;
import net.java_school.board.AttachFile;
import net.java_school.board.Comment;

public interface BoardMapper {

  public List&lt;Article&gt; selectListOfArticles(HashMap&lt;String, String&gt; hashmap);  

  public int selectCountOfArticles(HashMap&lt;String, String&gt; hashmap);

  public int insert(<strong>Article article</strong>);   

  <strong>public void insertAttachFile(AttachFile attachFile);</strong>

  public void update(<strong>Article article</strong>);  

  public void delete(int articleNo);

  public void updateHitPlusOne(int articleNo);  

  public Article selectOne(int articleNo);

  public Article selectNextOne(<strong>HashMap&lt;String, String&gt; hashmap</strong>); 

  public Article selectPrevOne(<strong>HashMap&lt;String, String&gt; hashmap</strong>);

  public List&lt;AttachFile&gt; selectListOfAttachFiles(int articleNo);    

  public void deleteFile(int attachFileNo); 

  public String selectOneBoard(String boardCd);

  public void insertComment(Comment comment);   

  public void updateComment(Comment comment);

  public void deleteComment(int commentNo);

  public List&lt;Comment&gt; selectListOfComments(int articleNo);

  public AttachFile selectOneAttachFile(int attachFileNo);

  public Comment selectOneComment(int commentNo);

} 
</pre>

<p>
Modify BoardService.java to be an interface.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">package net.java_school.board;

import java.util.List;

public interface BoardService {

  public <strong>List&lt;Article&gt;</strong> getArticleList(String boardCd, String searchWord, <strong>Integer startRecord, Integer endRecord</strong>);

  public int getTotalRecord(String boardCd, String searchWord);

  public int addArticle(<strong>Article article</strong>);

  <strong>public void addAttachFile(AttachFile attachFile);</strong>

  public void modifyArticle(<strong>Article article</strong>);

  public void removeArticle(int articleNo);

  public void increaseHit(int articleNo);

  public Article getArticle(int articleNo);

  public Article getNextArticle(int articleNo, String boardCd, String searchWord);

  public Article getPrevArticle(int articleNo, String boardCd, String searchWord);

  public <strong>List&lt;AttachFile&gt;</strong> getAttachFileList(int articleNo);

  public void removeAttachFile(int attachFileNo);

  public Board getBoard(String boardCd);

  public void addComment(Comment comment);

  public void modifyComment(Comment comment);

  public void removeComment(int commentNo);

  public <strong>List&lt;Comment&gt;</strong> getCommentList(int articleNo);

  public AttachFile getAttachFile(int attachFileNo);

  public Comment getComment(int commentNo);

}
</pre>

<p>
In the net.java_school.board package, create BoardServiceImpl.java, which is an implementation of the BoardService interface.
</p>

<h6 class="src">BoardServiceImpl.java</h6>
<pre class="prettyprint">package net.java_school.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.java_school.mybatis.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardMapper boardMapper;

  @Override
  public <strong>List&lt;Article&gt;</strong> getArticleList(String boardCd, String searchWord, <strong>Integer startRecord, Integer endRecord</strong>) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    hashmap.put("start", startRecord.toString());
    hashmap.put("end", endRecord.toString());

    return boardMapper.selectListOfArticles(hashmap);
  }
    
  @Override 
  public int getTotalRecord(String boardCd, String searchWord) {
    HashMap&lt;String,String&gt; hashmap = new HashMap&lt;String,String&gt;();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    
    return boardMapper.selectCountOfArticles(hashmap);
  }
    
  @Override
  public int addArticle(Article article) {
    return boardMapper.insert(article);
  }

  @Override
  public void addAttachFile(AttachFile attachFile) {
    boardMapper.insertAttachFile(attachFile);
  }

  @Override
  public void modifyArticle(Article article) {
    boardMapper.update(article);
  }

  @Override
  public void removeArticle(int articleNo) {
    boardMapper.delete(articleNo);
  }

  @Override
  public void increaseHit(int articleNo) {
    boardMapper.updateHitPlusOne(articleNo);
  }

  @Override
  public Article getArticle(int articleNo) {
    return boardMapper.selectOne(articleNo);
  }

  @Override
  public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectNextOne(hashmap);
  }

  @Override
  public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
    HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectPrevOne(hashmap);
  }

  @Override
  public <strong>List&lt;AttachFile&gt;</strong> getAttachFileList(int articleNo) {
    return boardMapper.selectListOfAttachFiles(articleNo);
  }

  @Override
  public void removeAttachFile(int attachFileNo) {
    boardMapper.deleteFile(attachFileNo);
  }

  @Override
  public Board getBoard(String boardCd) {
    return boardMapper.selectOneBoard(boardCd);
  }

  @Override
  public void addComment(Comment comment) {
    boardMapper.insertComment(comment);
  }

  @Override
  public void modifyComment(Comment comment) {
    boardMapper.updateComment(comment);
  }

  @Override
  public void removeComment(int commentNo) {
    boardMapper.deleteComment(commentNo);
  }

  @Override
  public <strong>List&lt;Comment&gt;</strong> getCommentList(int articleNo) {
    return boardMapper.selectListOfComments(articleNo);
  }

  @Override
  public AttachFile getAttachFile(int attachFileNo) {
    return boardMapper.selectOneAttachFile(attachFileNo);
  }

  @Override
  public Comment getComment(int commentNo) {
    return boardMapper.selectOneComment(commentNo);
  }

}
</pre>

<p>
Create NumbersForPaging.java that saves numbers needed for paging.
</p>

<h6 class="src">NumbersForPaging.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class NumbersForPaging {
  private int totalPage;
  private int firstPage;
  private int lastPage;
  private int prevBlock;
  private int nextBlock;
  private int listItemNo;
  
  public int getTotalPage() {
    return totalPage;
  }
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public int getFirstPage() {
    return firstPage;
  }
  public void setFirstPage(int firstPage) {
    this.firstPage = firstPage;
  }
  public int getLastPage() {
    return lastPage;
  }
  public void setLastPage(int lastPage) {
    this.lastPage = lastPage;
  }
  public int getPrevBlock() {
    return prevBlock;
  }
  public void setPrevBlock(int prevBlock) {
    this.prevBlock = prevBlock;
  }
  public int getNextBlock() {
    return nextBlock;
  }
  public void setNextBlock(int nextBlock) {
    this.nextBlock = nextBlock;
  }
  public int getListItemNo() {
    return listItemNo;
  }
  public void setListItemNo(int listItemNo) {
    this.listItemNo = listItemNo;
  }
  
}
</pre>

<p>
Create Paginator.java that returns a NumberForPaging object.
</p>

<h6 class="src">Paginator.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class Paginator {

  public NumbersForPaging getNumbersForPaging(int totalRecord, int page, int numPerPage, int pagePerBlock) {
    int totalPage = totalRecord / numPerPage;
    if (totalRecord % numPerPage != 0) totalPage++;
    int totalBlock = totalPage / pagePerBlock;
    if (totalPage % pagePerBlock != 0) totalBlock++;
    int block = page / pagePerBlock;
    if (page % pagePerBlock != 0) block++;
    int firstPage = (block - 1) * pagePerBlock + 1;
    int lastPage = block * pagePerBlock;
    int prevPage = 0;
    if (block &gt; 1) {
      prevPage = firstPage - 1;
    }
    int nextPage = 0;
    if (block &lt; totalBlock) {
      nextPage = lastPage + 1;
    }
    if (block &gt;= totalBlock) {
      lastPage = totalPage;
    }
    int listItemNo = totalRecord - (page - 1) * numPerPage;
    
    NumbersForPaging numbers = new NumbersForPaging();
    
    numbers.setTotalPage(totalPage);
    numbers.setFirstPage(firstPage);
    numbers.setLastPage(lastPage);
    numbers.setPrevBlock(prevPage);
    numbers.setNextBlock(nextPage);
    numbers.setListItemNo(listItemNo);
    
    return numbers;
  }

}
</pre>

<p>
Create BbsController.java in the net.java_school.controller package.
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
package net.java_school.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import net.java_school.board.Article;
import net.java_school.board.AttachFile;
import net.java_school.board.BoardService;
import net.java_school.board.Comment;
import net.java_school.commons.WebContants;
import net.java_school.exception.AuthenticationException;
import net.java_school.user.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/bbs")
public class BbsController <strong>extends Paginator</strong> {

  @Autowired
  private BoardService boardService;

  @RequestMapping(value="/list", method=RequestMethod.GET)
  public String list(String boardCd, 
      Integer page, 
      String searchWord,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    int numPerPage = 10;
    int pagePerBlock = 10;

    int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

    NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);
    //oracle
    Integer startRecord = (page - 1) * numPerPage + 1;
    Integer endRecord = page * numPerPage;

    HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
    map.put("boardCd", boardCd);
    map.put("searchWord", searchWord);
    map.put("start", startRecord.toString());
    map.put("end", endRecord.toString());
    List&lt;Article&gt; list = boardService.getArticleList(map);
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    
    Integer listItemNo = numbers.getListItemNo();
    Integer prevPage = numbers.getPrevBlock();
    Integer nextPage = numbers.getNextBlock();
    Integer firstPage = numbers.getFirstPage();
    Integer lastPage = numbers.getLastPage();

    model.addAttribute("list", list);
    model.addAttribute("boardName", boardName);
    model.addAttribute("listItemNo", listItemNo);
    model.addAttribute("prevPage", prevPage);
    model.addAttribute("nextPage", nextPage);
    model.addAttribute("firstPage", firstPage);
    model.addAttribute("lastPage", lastPage);

    return "bbs/list";

  }

  @RequestMapping(value="/write", method=RequestMethod.GET)
  public String writeForm(String boardCd,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    model.addAttribute("boardName", boardName);

    return "bbs/write";
  }

  @RequestMapping(value="/write", method=RequestMethod.POST)
  public String write(MultipartHttpServletRequest mpRequest,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    String boardCd = mpRequest.getParameter("boardCd");
    String title = mpRequest.getParameter("title");
    String content = mpRequest.getParameter("content");

    Article article = new Article();
    article.setBoardCd(boardCd);
    article.setTitle(title);
    article.setContent(content);
    article.setEmail(user.getEmail());

    boardService.addArticle(article);

    Iterator&lt;String&gt; it = mpRequest.getFileNames();
    List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
    while (it.hasNext()) {
      MultipartFile multiFile = mpRequest.getFile((String) it.next());
      if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
      }
    }

    int size = fileList.size();
    for (int i = 0; i &lt; size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(article.getArticleNo());
      attachFile.setEmail(user.getEmail());
      boardService.addAttachFile(attachFile);
    }

    return "redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
  }

  @RequestMapping(value="/view", method=RequestMethod.GET)
  public String view(Integer articleNo, 
      String boardCd, 
      Integer page,
      String searchWord,
      HttpServletRequest req,
      HttpSession session,
      Model model) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      url = URLEncoder.encode(url, "UTF-8");
      return "redirect:/users/login?url=" + url;
    }

    boardService.increaseHit(articleNo);

    Article article = boardService.getArticle(articleNo);
    List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
    Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
    Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
    List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);

    String title = article.getTitle();
    String content = article.getContent();
    content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
    int hit = article.getHit();
    String name = article.getName();
    String email = article.getEmail();
    String regdate = article.<strong>getRegdateForView()</strong>;

    model.addAttribute("title", title);
    model.addAttribute("content", content);
    model.addAttribute("hit", hit);
    model.addAttribute("name", name);
    model.addAttribute("email", email);
    model.addAttribute("regdate", regdate);
    model.addAttribute("attachFileList", attachFileList);
    model.addAttribute("nextArticle", nextArticle);
    model.addAttribute("prevArticle", prevArticle);
    model.addAttribute("commentList", commentList);

    int numPerPage = 10;
    int pagePerBlock = 10;

    int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

    NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

    Integer startRecord = (page - 1) * numPerPage + 1;
    Integer endRecord = page * numPerPage;

    HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
    map.put("boardCd", boardCd);
    map.put("searchWord", searchWord);
    map.put("start", startRecord.toString());
    map.put("end", endRecord.toString());
    List&lt;Article&gt; list = boardService.getArticleList(map);
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();
    
    int listItemNo = numbers.getListItemNo();
    int prevPage = numbers.getPrevBlock();
    int nextPage = numbers.getNextBlock();
    int firstPage = numbers.getFirstPage();
    int lastPage = numbers.getLastPage();

    model.addAttribute("list", list);
    model.addAttribute("listItemNo", listItemNo);
    model.addAttribute("prevPage", prevPage);
    model.addAttribute("firstPage", firstPage);
    model.addAttribute("lastPage", lastPage);
    model.addAttribute("nextPage", nextPage);
    model.addAttribute("boardName", boardName);

    return "bbs/view";
  }

  @RequestMapping(value="/addComment", method=RequestMethod.POST)
  public String addComment(Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      String memo,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    Comment comment = new Comment();
    comment.setArticleNo(articleNo);
    comment.setEmail(user.getEmail());
    comment.setMemo(memo);

    boardService.addComment(comment);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/updateComment", method=RequestMethod.POST)
  public String updateComment(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord, 
      String memo,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Comment comment = boardService.getComment(commentNo);

    if (user == null || !user.getEmail().equals(comment.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    comment.setMemo(memo);
    boardService.modifyComment(comment);

    searchWord = URLEncoder.encode(searchWord, "UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/deleteComment", method=RequestMethod.POST)
  public String deleteComment(Integer commentNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Comment comment = boardService.getComment(commentNo);

    if (user == null || !user.getEmail().equals(comment.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeComment(commentNo);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/modify", method=RequestMethod.GET)
  public String modifyForm(Integer articleNo, 
      String boardCd,
      HttpSession session,
      Model model) {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    Article article = boardService.getArticle(articleNo);

    if (user == null || !user.getEmail().equals(article.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    String title = article.getTitle();
    String content = article.getContent();
    String boardName = boardService.getBoard(boardCd).getBoardNm_ko();

    model.addAttribute("title", title);
    model.addAttribute("content", content);
    model.addAttribute("boardName", boardName);

    return "bbs/modify";
  }

  @RequestMapping(value="/modify", method=RequestMethod.POST)
  public String modify(MultipartHttpServletRequest mpRequest,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);

    int articleNo = Integer.parseInt(mpRequest.getParameter("articleNo"));
    Article article = boardService.getArticle(articleNo);

    if (!article.getEmail().equals(user.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    String boardCd = mpRequest.getParameter("boardCd");
    int page = Integer.parseInt(mpRequest.getParameter("page"));
    String searchWord = mpRequest.getParameter("searchWord");

    String title = mpRequest.getParameter("title");
    String content = mpRequest.getParameter("content");

    article.setTitle(title);
    article.setContent(content);
    article.setBoardCd(boardCd);
    boardService.modifyArticle(article);

    Iterator&lt;String&gt; it = mpRequest.getFileNames();
    List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
    while (it.hasNext()) {
      MultipartFile multiFile = mpRequest.getFile((String) it.next());
      if (multiFile.getSize() &gt; 0) {
        String filename = multiFile.getOriginalFilename();
        multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
        fileList.add(multiFile);
      }
    }

    int size = fileList.size();
    for (int i = 0; i &lt; size; i++) {
      MultipartFile mpFile = fileList.get(i);
      AttachFile attachFile = new AttachFile();
      String filename = mpFile.getOriginalFilename();
      attachFile.setFilename(filename);
      attachFile.setFiletype(mpFile.getContentType());
      attachFile.setFilesize(mpFile.getSize());
      attachFile.setArticleNo(articleNo);
      attachFile.setEmail(user.getEmail());
      boardService.addAttachFile(attachFile);
    }

    searchWord = URLEncoder.encode(searchWord,"UTF-8");
    return "redirect:/bbs/view?articleNo=" + articleNo 
        + "&amp;boardCd=" + boardCd 
        + "&amp;page=" + page 
        + "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/download", method=RequestMethod.POST)
  public String download(String filename, HttpSession session, Model model) {
    User user = (User) session.getAttribute(WebContants.USER_KEY);
    if (user == null) {
      throw new AuthenticationException(WebContants.NOT_LOGIN);
    }

    model.addAttribute("filename", filename);
    return "inc/download";

  }

  @RequestMapping(value="/deleteAttachFile", method=RequestMethod.POST)
  public String deleteAttachFile(Integer attachFileNo, 
      Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    AttachFile attachFile = boardService.getAttachFile(attachFileNo);

    if (user == null || !user.getEmail().equals(attachFile.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeAttachFile(attachFileNo);

    searchWord = URLEncoder.encode(searchWord,"UTF-8");

    return "redirect:/bbs/view?articleNo=" + articleNo + 
        "&amp;boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;

  }

  @RequestMapping(value="/del", method=RequestMethod.POST)
  public String del(Integer articleNo, 
      String boardCd, 
      Integer page, 
      String searchWord,
      HttpSession session) throws Exception {

    User user = (User) session.getAttribute(WebContants.USER_KEY);
    Article article = boardService.getArticle(articleNo);

    if (user == null || !user.getEmail().equals(article.getEmail())) {
      throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
    }

    boardService.removeArticle(articleNo);

    searchWord = URLEncoder.encode(searchWord, "UTF-8");

    return "redirect:/bbs/list?boardCd=" + boardCd + 
        "&amp;page=" + page + 
        "&amp;searchWord=" + searchWord;
  }

}
</pre>

<p>
A handler method parameters like boardCd, page, and searchWord are assigned values of the same name's request parameters. If the name of the method parameter and the request parameter is different, put @RequestParam annotation before the method parameter name below to solve it.
</p>

<p>
If the method parameter name is page and the request parameter name is curPage, you should declare the handler method parameter, page like below.
</p>

<pre class="prettyprint">@RequestParam("curPage") String page</pre>

<p>
The following writeForm() method is the handler for the GET method's /bbs/write request.
</p>

<pre class="prettyprint">
@RequestMapping(value="write", method=RequestMethod.GET)
public String writeForm(String boardCd,HttpServletRequest req,HttpSession session...)
</pre>

<p>
The following write() method handles the POST method's /bbs/write request.
</p>

<pre class="prettyprint">
@RequestMapping(value="write", method=RequestMethod.POST)
public String write(MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception
</pre>

<p>
You can access files passed to the system using the mpRequest parameter of the MultipartHttpServletRequest type.
</p>

<p>
The write() method first checks whether the user logs in. If the user did not log in, an AuthenticationException exception occurs, and the view resolver selects /WEB-INF/views/error.jsp as the view.
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<p>
The code checks whether the user who submits a new post is a logged-in user and inserts the post into the table if they are logged-in users. When boardService.addArticle(<strong>article</strong>) is executed, the <strong>article</strong>'s setArticleNo() is called to set the post's unique number.
</p>

<pre class="prettyprint">
String boardCd = mpRequest.getParameter("boardCd");
String title = mpRequest.getParameter("title");
String content = mpRequest.getParameter("content");

Article article = new Article();
article.setBoardCd(boardCd);
article.setTitle(title);
article.setContent(content);
article.setEmail(user.getEmail());

<strong>boardService.addArticle(article);</strong>
</pre>

<p>
After inserting the new post into the table, Our code starts to handle an uploaded file.
</p>

<p>
You can upload only one attachment with the writing form page, but the following handler method can handle multiple upload files.
</p>

<pre class="prettyprint">
Iterator&lt;String&gt; it = mpRequest.getFileNames();
List&lt;MultipartFile&gt; fileList = new ArrayList&lt;MultipartFile&gt;();
while (it.hasNext()) {
  MultipartFile multiFile = mpRequest.getFile((String) it.next());
  if (multiFile.getSize() &gt; 0) {
    String filename = multiFile.getOriginalFilename();
    multiFile.transferTo(new File(WebContants.UPLOAD_PATH + filename));
    fileList.add(multiFile);
  }
}
</pre>

<p>
Spring MVC supports Apache's commons-fileupload, which is a framework for file uploads. Developers just need to add the necessary dependencies and set the multipartResolver bean in the Spring configuration file.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/commons-io/commons-io --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;commons-io&lt;/groupId&gt;
  &lt;artifactId&gt;commons-io&lt;/artifactId&gt;
  &lt;version&gt;2.11.0&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;commons-fileupload&lt;/groupId&gt;
  &lt;artifactId&gt;commons-fileupload&lt;/artifactId&gt;
  &lt;version&gt;1.4&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<pre class="prettyprint">
&lt;bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"&gt;
  &lt;property name="maxUploadSize" value="2097152" /&gt;
&lt;/bean&gt;
</pre>

<p>
The method moves the attachment to the upload directory and inserts the file information into the table. The code, article.getArticleNo(), gets the unique number of the post from the table.
</p>

<pre class="prettyprint">
int size = fileList.size();
for (int i = 0; i &lt; size; i++) {
  MultipartFile mpFile = fileList.get(i);
  AttachFile attachFile = new AttachFile();
  String filename = mpFile.getOriginalFilename();
  attachFile.setFilename(filename);
  attachFile.setFiletype(mpFile.getContentType());
  attachFile.setFilesize(mpFile.getSize());
  attachFile.setArticleNo(<strong>article.getArticleNo()</strong>);
  attachFile.setEmail(user.getEmail());
  boardService.addAttachFile(attachFile);
}
</pre>

<p>
The code above uses two new methods, addArticle(article) and addAttachFile(attachFile), to insert attachment information into the table. Note that the board source of the JSP Project chapter used only one method, addArticle(article, attachFile), in the same process.
</p>

<p>
After completing all the work related to registering a new post, the method redirects the request to the bulletin board list. Note that there are page=1 and boardCd parameters in the query string of the redirect address.
</p>

<pre class="prettyprint">
return redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
</pre>


<h3>Detailed view</h3>

<p>
The following method is a handler for /bbs/view requests of the GET method.
</p>

<pre class="prettyprint">
@RequestMapping(value="/view", method=RequestMethod.GET)
public String view(Integer articleNo, 
        String boardCd, 
        Integer page,
        String searchWord,
        HttpServletRequest req,
        HttpSession session,
        Model model) throws Exception {
</pre>

<p>
The method first checks whether the user is a logged-in user and, if a logged-in user, increases the number of views and builds the data required for the detailed view screen.
</p>

<pre class="prettyprint">
boardService.increaseHit(articleNo);

Article article = boardService.getArticle(articleNo);
List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);
String boardName = boardService.getBoard(boardCd).getBoardNm_ko();

String title = article.getTitle();
String content = article.getContent();
content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
int hit = article.getHit();
String name = article.getName();
String email = article.getEmail();
String regdate = article.getRegdateForView();

model.addAttribute("title", title);
model.addAttribute("content", content);
model.addAttribute("hit", hit);
model.addAttribute("name", name);
model.addAttribute("email", email);
model.addAttribute("regdate", regdate);
model.addAttribute("attachFileList", attachFileList);
model.addAttribute("nextArticle", nextArticle);
model.addAttribute("prevArticle", prevArticle);
model.addAttribute("commentList", commentList);
</pre>

<h3>Add comment</h3>

<p>
The addComment() is a handler for /bbs/addComment requests of POST method.
</p>

<pre class="prettyprint">
@RequestMapping(value="/addComment", method=RequestMethod.POST)
public String addComment(Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        String memo,
        HttpSession session) throws Exception {
</pre>

<p>
That method first checks if the user logs in.
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<p>
The method inserts the comment information to the table using request parameters if the user has logged in.
</p>

<pre class="prettyprint">
Comment comment = new Comment();
comment.setArticleNo(articleNo);
comment.setEmail(user.getEmail());
comment.setMemo(memo);

boardService.addComment(comment);
</pre>

<p>
The search term needs to be encoded.
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord,"UTF-8");
</pre>

<p>
The method redirects the request to view.jsp.
</p>

<pre class="prettyprint">
return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<p>
The updateComment() method is a handler for "/bbs/updateComment" request of POST method.
</p>

<pre class="prettyprint">
@RequestMapping(value="/updateComment", method=RequestMethod.POST)
public String updateComment(
        Integer commentNo, 
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord, 
        String memo,
        HttpSession session) throws Exception {
</pre>

<p>
The method first checks whether the user has logged in and is the text owner and throws a custom authentication exception if the user is not a logged-in user or is not the owner of the post.
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

Comment comment = boardService.getComment(commentNo);

if (user == null || !user.getEmail().equals(comment.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
If the above code passes, the method modifies the comment with the request parameters. We can edit only the comment's content, and the original owner will not change, even if the administrator has edited the text.
</p>

<pre class="prettyprint">
comment.setMemo(memo);
boardService.modifyComment(comment);
</pre>

<p>
The method redirects the request to view.jsp.
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord, "UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<p>
The deleteComment() is a handler for /bbs/deleteComment requests of POST method.
</p>

<pre class="prettyprint">
@RequestMapping(value="/deleteComment", method=RequestMethod.POST)
public String deleteComment(
        Integer commentNo, 
        Integer articleNo, 
        String boardCd, 
        Integer page, 
        String searchWord,
        HttpSession session) throws Exception {
</pre>

<p>
This method first checks whether the user has logged in and is the text owner and throws a custom authentication exception if the user is not a logged-in user or is not the owner of the comment.
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);

Comment comment = boardService.getComment(commentNo);

if (user == null || !user.getEmail().equals(comment.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
If the above passes, the method deletes the comment with the request parameter.
</p>

<pre class="prettyprint">
boardService.removeComment(commentNo);
</pre>

<p>
The method redirects the request to view.jsp.
</p>

<pre class="prettyprint">
searchWord = URLEncoder.encode(searchWord,"UTF-8");

return "redirect:/bbs/view?articleNo=" + articleNo + 
    "&amp;boardCd=" + boardCd + 
    "&amp;page=" + page + 
    "&amp;searchWord=" + searchWord;
</pre>

<p>
The download() is a handle for /bbs/download requests of the POST method.
</p>

<pre class="prettyprint">
@RequestMapping(value="/download", method=RequestMethod.POST)
public String download(String filename, HttpSession session, Model model) {
</pre>

<p>
The method passes a filename to download.jsp.
</p>

<pre class="prettyprint">
model.addAttribute("filename", filename);
return "inc/download";
</pre>

<h3>Modify view.jsp</h3>

<p>
Add the following javascript code to the view.jsp.
</p>

<pre class="prettyprint">
function download(filename) {
  var form = document.getElementById("downForm");
  form.filename.value = filename;
  form.submit();
}
</pre>

<p>
Add the following form to the #form-group.
</p>

<pre class="prettyprint">
&lt;form id="downForm" action="download" method="post"&gt;
  &lt;input type="hidden" name="filename" /&gt;
&lt;/form&gt;
</pre>

<p>
Modify file download links as shown below.
</p>

<pre class="prettyprint">
&lt;a href="javascript:download('${file.filename }')"&gt;${file.filename }&lt;/a&gt;
</pre>

<h2>Test</h2>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean compile war:inplace
</pre>

<p>
Modify ROOT.xml as shown below.
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/spring-bbs/<strong>src/main/webapp</strong>"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Restart Tomcat and visit the following:<br />
http://localhost:8080/bbs/list?boarCd=smalltalk&amp;page=1.
</p>

<h2>Authentication Summary</h2>

<p>
The following is the authentication code used in the method of the bulletin board controller.
</p>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  String url = req.getServletPath();
  String query = req.getQueryString();
  if (query != null) url += "?" + query;
  url = URLEncoder.encode(url, "UTF-8");
  return "redirect:/users/login?url=" + url;
}
</pre>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}
</pre>

<pre class="prettyprint">
if (user == null || !user.getEmail().equals(comment.getEmail())) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<p>
The following is the authentication code used in the method of the UsersController.
</p>

<pre class="prettyprint">
User user = userService.login(email, passwd);
if (user == null) {
  return "redirect:/users/login?url=" + url + "&amp;msg=Login-Failed";
} else {
  session.setAttribute(WebContants.USER_KEY, user);
  if (url != null &amp;&amp; !url.equals("")) {
  return "redirect:" + url;
}

return "redirect:/";
</pre>

<pre class="prettyprint">
User user = (User) session.getAttribute(WebContants.USER_KEY);
if (user == null) {
  String url = req.getServletPath();
  String query = req.getQueryString();
  if (query != null) url += "?" + query;
  url = URLEncoder.encode(url, "UTF-8");
  return "redirect/users/login?url=" + url;
}
</pre>

<pre class="prettyprint">
User loginUser = (User) session.getAttribute(WebContants.USER_KEY);

if (loginUser == null) {
  throw new AuthenticationException(WebContants.NOT_LOGIN);
}

if (userService.login(loginUser.getEmail(), user.getPasswd()) == null) {
  throw new AuthenticationException(WebContants.AUTHENTICATION_FAILED);
}
</pre>

<pre class="prettyprint">
String email = ((User)session.getAttribute(WebContants.USER_KEY)).getEmail();
</pre>

<p>
The following is the authentication code used in JSPs.
</p>

<pre class="prettyprint">
&lt;!-- omit --&gt;

&lt;p id="file-list" style="text-align: right"&gt;
  &lt;c:forEach var="file" items="${attachFileList }" varStatus="status"&gt;    
  &lt;a href="javascript:download('${file.filename }')"&gt;${file.filename }&lt;/a&gt;
  <strong>&lt;c:if test="${user.email == file.email }"&gt;</strong>
  &lt;a href="javascript:deleteAttachFile('${file.attachFileNo }')"&gt;x&lt;/a&gt;
  <strong>&lt;/c:if&gt;</strong>
  &lt;br /&gt;
  &lt;/c:forEach&gt;
&lt;/p&gt;

&lt;!-- omit --&gt;

<strong>&lt;c:if test="${user.email == comment.email }"&gt;</strong>    
&lt;span class="modify-del"&gt;
  &lt;a href="javascript:modifyCommentToggle('${comment.commentNo }')"&gt;Modify&lt;/a&gt;
  | &lt;a href="javascript:deleteComment('${comment.commentNo }')"&gt;Del&lt;/a&gt;
&lt;/span&gt;
<strong>&lt;/c:if&gt;</strong>  

&lt;!-- omit --&gt;

<strong>&lt;c:if test="${user.email == email }"&gt;</strong>
&lt;div class="fl"&gt;
  &lt;input type="button" value="Modify" onclick="goModify()" /&gt;
  &lt;input type="button" value="Del" onclick="goDelete()"/&gt;
&lt;/div&gt;
<strong>&lt;/c:if&gt;</strong>
</pre>

<p>
If an error occurs during testing, you need to check the log file set in log4j2.xml or the log file in CATALINA_HOME/logs. It is not necessary to understand all the log messages. However, you should develop the ability to look at log messages and deduce the cause of the error.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.mybatis.org/mybatis-3/logging.html">http://www.mybatis.org/mybatis-3/logging.html</a></li>
</ul>
</article>

</body>
</html>
