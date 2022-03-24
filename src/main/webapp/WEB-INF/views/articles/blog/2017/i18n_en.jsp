<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.12.6</div>

<h1>i18n</h1>

<p>
Source: <a href="https://github.com/kimjonghoon/i18nOnSpringMVC">https://github.com/kimjonghoon/i18nOnSpringMVC</a><br />
How to run: Go to the root directory and run <strong>mvn jetty:run</strong> and visit http://localhost:8080.
</p>

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
&lt;/bean&gt;
</pre>

<p>
Without <strong>&lt;property name="defaultEncoding" value="UTF-8" /&gt;</strong>, Non english characters may be broken.
</p>

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
