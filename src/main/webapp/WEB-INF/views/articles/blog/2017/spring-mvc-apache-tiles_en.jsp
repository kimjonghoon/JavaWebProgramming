<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.12.6</div>

<h1>Apache Tiles</h1>

<p>
Source : <a href="https://github.com/kimjonghoon/tilesOnSpringMVC">https://github.com/kimjonghoon/tilesOnSpringMVC</a>
</p>

<h3>Add Apache Tiles dependency to pom.xml</h3>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.apache.tiles/tiles-extras --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.apache.tiles&lt;/groupId&gt;
  &lt;artifactId&gt;tiles-extras&lt;/artifactId&gt;
  &lt;version&gt;3.0.8&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>Create Layout JSPs</h3>

<h6 class="src">/WEB-INF/views/layouts/main-layout.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%&gt;
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;
&lt;%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%&gt;

&lt;tiles:importAttribute name="links" /&gt;
&lt;tiles:importAttribute name="scripts" /&gt;
&lt;tiles:importAttribute name="alias" /&gt;

&lt;!DOCTYPE html&gt;
&lt;html lang="&lt;spring:message code="lang" /&gt;"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;&lt;spring:message code="${alias }.title" /&gt;&lt;/title&gt;
&lt;meta name="viewport" content="width=device-width, initial-scale=1" /&gt;
&lt;meta name="Keywords" content="&lt;spring:message code="${alias }.keys" /&gt;" /&gt;
&lt;meta name="Description" content="&lt;spring:message code="${alias }.desc" /&gt;" /&gt;
&lt;link rel="stylesheet" href="/resources/css/&lt;spring:message code="lang" /&gt;.css" /&gt;
&lt;c:forEach var="link" items="${links }"&gt;
  &lt;link rel="stylesheet" href="&lt;c:url value="${link }" /&gt;" type="text/css" /&gt;
&lt;/c:forEach&gt;
&lt;c:forEach var="script" items="${scripts }"&gt;
  &lt;script src="&lt;c:url value="${script }" /&gt;"&gt;&lt;/script&gt;
&lt;/c:forEach&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;tiles:insertAttribute name="header" /&gt;
  &lt;/div&gt;
	
  &lt;div id="main-menu" lang="en"&gt;
    &lt;tiles:insertAttribute name="main-menu" /&gt;
  &lt;/div&gt;
	
  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;tiles:insertAttribute name="content" /&gt;
    &lt;/div&gt;
  &lt;/div&gt;
	
  &lt;div id="sidebar" lang="en"&gt;
    &lt;tiles:insertAttribute name="sidebar" /&gt;
  &lt;/div&gt;
	
  &lt;div id="extra"&gt;
    &lt;tiles:insertAttribute name="extra" /&gt;
  &lt;/div&gt;
	
  &lt;div id="footer"&gt;
    &lt;tiles:insertAttribute name="footer" /&gt;
  &lt;/div&gt;

&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>Create tiles definition file</h3>

<h6 class="src">/WEB-INF/tiles.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE tiles-definitions PUBLIC  
    "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"  
    "http://tiles.apache.org/dtds/tiles-config_3_0.dtd"&gt;
&lt;tiles-definitions&gt;
  &lt;definition name="app.default" template="/WEB-INF/views/layouts/main-layout.jsp"&gt;
    &lt;put-attribute name="header" value="/WEB-INF/views/inc/header.jsp" /&gt;
    &lt;put-attribute name="main-menu" value="/WEB-INF/views/inc/main-menu.jsp" /&gt;
    &lt;put-attribute name="extra" value="/WEB-INF/views/inc/extra.jsp" /&gt;
    &lt;put-attribute name="footer" value="/WEB-INF/views/inc/footer.jsp" /&gt;
    &lt;put-list-attribute name="links"&gt;
      &lt;add-attribute value="/resources/css/screen.css" /&gt;
      &lt;add-attribute value="/resources/css/print.css" /&gt;
    &lt;/put-list-attribute&gt;
    &lt;put-list-attribute name="scripts"&gt;
      &lt;add-attribute value="/resources/js/jquery-3.2.1.min.js" /&gt;
      &lt;add-attribute value="/resources/js/commons.js" /&gt;
    &lt;/put-list-attribute&gt;
  &lt;/definition&gt;
  &lt;definition name="403" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/403.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/error-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="403" /&gt;
  &lt;/definition&gt;
  &lt;definition name="users/*" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/users/{1}.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/users/user-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="user.{1}" /&gt;
  &lt;/definition&gt;
  &lt;!-- BBS --&gt;
  &lt;definition name="bbs/*" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/bbs/{1}.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/bbs/bbs-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="bbs.{1}" /&gt;
  &lt;/definition&gt;
  &lt;!-- admin --&gt;
  &lt;definition name="admin/*" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/admin/{1}.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/admin/admin-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="admin.{1}" /&gt;
  &lt;/definition&gt;    
  &lt;definition name="index" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/articles/java/JDK-Install_en.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/index-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="java.JDK-Install" /&gt;
    &lt;put-list-attribute name="links" inherit="true"&gt;
      &lt;add-attribute value="/resources/css/windows.css" /&gt;
      &lt;add-attribute value="/resources/css/prettify.css" /&gt;
    &lt;/put-list-attribute&gt;
    &lt;put-list-attribute name="scripts" inherit="true"&gt;
      &lt;add-attribute value="/resources/js/prettify.js" /&gt;
      &lt;add-attribute value="/resources/js/javaschool-prettify.js" /&gt;
    &lt;/put-list-attribute&gt;
  &lt;/definition&gt;
  &lt;definition name="*/*" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/articles/{1}/{2}_en.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/{1}/{1}-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="{1}.{2}" /&gt;
  &lt;/definition&gt;
&lt;/tiles-definitions&gt;
</pre>

<h3>Create a tiles definition file for Korean</h3>

<h6 class="src">/WEB-INF/tiles_ko.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE tiles-definitions PUBLIC  
    "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"  
    "http://tiles.apache.org/dtds/tiles-config_3_0.dtd"&gt;
&lt;tiles-definitions&gt;
  &lt;definition name="index" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/articles/java/JDK-Install.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/index-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="java.JDK-Install" /&gt;
    &lt;put-list-attribute name="links" inherit="true"&gt;
      &lt;add-attribute value="/resources/css/windows.css" /&gt;
      &lt;add-attribute value="/resources/css/prettify.css" /&gt;
    &lt;/put-list-attribute&gt;
    &lt;put-list-attribute name="scripts" inherit="true"&gt;
      &lt;add-attribute value="/resources/js/prettify.js" /&gt;
      &lt;add-attribute value="/resources/js/javaschool-prettify.js" /&gt;
    &lt;/put-list-attribute&gt;
  &lt;/definition&gt;
  &lt;definition name="*/*" extends="app.default"&gt;
    &lt;put-attribute name="content" value="/WEB-INF/views/articles/{1}/{2}.jsp" /&gt;
    &lt;put-attribute name="sidebar" value="/WEB-INF/views/{1}/{1}-sub.jsp" /&gt;
    &lt;put-attribute name="alias" value="{1}.{2}" /&gt;
  &lt;/definition&gt;
&lt;/tiles-definitions&gt;
</pre>

<h3>Tiles View Resolver</h3>

<p>
Remove the existing view resolver, and tiles view resolver to the Spring Configuration file.
</p>

<pre class="prettyprint">
&lt;!-- ViewResolver --&gt;
&lt;bean id="tilesViewResolver" class="org.springframework.web.servlet.view.UrlBasedViewResolver"&gt;
  &lt;property name="viewClass" value="org.springframework.web.servlet.view.tiles3.TilesView" /&gt;
&lt;/bean&gt;

&lt;bean id="tilesConfigurer" class="org.springframework.web.servlet.view.tiles3.TilesConfigurer"&gt;
  &lt;property name="definitions"&gt;
    &lt;list&gt;
      &lt;value&gt;/WEB-INF/tiles.xml&lt;/value&gt;
    &lt;/list&gt;
  &lt;/property&gt;
&lt;/bean&gt;
</pre>

<h3>Test</h3>

<h6 class="src">/index.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;

&lt;h1&gt;Home&lt;/h1&gt;
</pre>

<h6 class="src">/index_ko.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;

&lt;h1&gt;홈&lt;/h1&gt;
</pre>

<h6 class="src">/index-sub.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;

&lt;h1&gt;Home&lt;/h1&gt;
</pre>

<h6 class="src">/index-sub_ko.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;

&lt;h1&gt;홈&lt;/h1&gt;
</pre>

</article>
