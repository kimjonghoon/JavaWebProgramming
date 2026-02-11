<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>i18n</title>
<meta name="Keywords" content="java,spring mvc,i18n,messageSource,ReloadableResourceBundleMessageSource,LocalResolver,localeChangeInterceptor," />
<meta name="Description" content="i18n on Spring MVC" />
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
<div class="last-modified">Last Modified 5.5.2025</div>

<h1>i18n</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/i18nOnSpringMVC</span>
</p>

<h3>How to run</h3>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<h3>MessageSource</h3>

<p>
MessageSource is a component that looks at the locale and determines the message. ResourceBundleMessageSource and ReloadableResourceBundleMessageSource are implementations of MessageSource. ResourceBundleMessageSource can only access resources on the classpath, whereas ReloadableResourceBundleMessageSource allows resources to access any resources in the file system.
</p>

<p>
Add ReloadableResourceBundleMessageSource to the Spring configuration file.
</p>

<pre class="prettyprint">
&lt;bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource"&gt;
  &lt;property name="basename" value="WEB-INF/classes/messages" /&gt;
  &lt;property name="defaultEncoding" value="UTF-8" /&gt;
  &lt;property name="cacheSeconds" value="10" /&gt;
  &lt;property name="fallbackToSystemLocale" value="false" /&gt;  
&lt;/bean&gt;
</pre>

<h3>LocalResolver</h3>

<p>
LocaleResolver is a component that determines the locale. If you omit LocaleResolver in the Spring configuration file, Spring selects AcceptHeaderLocaleResolver by default. AcceptHeaderLocaleResolver uses the locale set in the "accept-language" of the request header in which the browser has already set the operating system's locale. In this case, users can not change the locale. If you want users to change the website's locale, you must select either SessionLocaleResolver or CookieLocaleResolver as LocaleResolver, additionally requires LocaleChangeInterceptor.
</p>

<p>
Add <strong>SessionLocaleResolver</strong> and <strong>LocalChangeInterceptor</strong> to the Spring configuration file.
</p>

<pre class="prettyprint">
&lt;bean id="localeResolver" class="org.springframework.web.servlet.i18n.SessionLocaleResolver"&gt;
    &lt;property name="defaultLocale" value="en" /&gt;
&lt;/bean&gt;
&lt;mvc:interceptors&gt;
  &lt;bean id="localeChangeInterceptor" class="org.springframework.web.servlet.i18n.LocaleChangeInterceptor"&gt;
    &lt;property name="paramName" value="lang" /&gt;
  &lt;/bean&gt;
&lt;/mvc:interceptors&gt;
</pre>

</article>

</body>
</html>
