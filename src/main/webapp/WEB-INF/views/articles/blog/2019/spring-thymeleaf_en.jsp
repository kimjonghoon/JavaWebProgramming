<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Using Layout of Thymeleaf in Spring MVC</h1>

<p>
<a href="https://github.com/kimjonghoon/spring-thymeleaf">https://github.com/kimjonghoon/spring-thymeleaf</a><br>
</p>

<h3>How to run</h3>

<p>
Go to the root directory, and run the following at a command prompt:<br>
<strong>mvn jetty:run</strong><br>
<img alt="thymeleaf layout test screen" src="<c:url value="/resources/images/thymeleaf-layout_en.png"/>"/>
You can test only the highlighted links.
</p>

<p>
Origin: <a href="https://www.boraji.com/spring-mvc-5-hello-world-example-with-thymeleaf-template">Spring MVC 5 - Hello world example with Thymeleaf template</a>
</p>

<h3>Add dependency</h3>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.thymeleaf/thymeleaf-spring5 --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.thymeleaf&lt;/groupId&gt;
  &lt;artifactId&gt;thymeleaf-spring5&lt;/artifactId&gt;
  &lt;version&gt;3.0.15.RELEASE&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>Spring MVC Configuration</h3>

<pre class="prettyprint">
package net.java_school.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("net.java_school.blog")
public class MvcWebConfig implements WebMvcConfigurer {

  @Autowired
  private ApplicationContext applicationContext;
  <strong>
  /*
  i18n
  */
  @Bean
  public ResourceBundleMessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename("messages");
    messageSource.setDefaultEncoding("UTF-8");//If the encoding of the Java property file is UTF-8
    return messageSource;
  }

  /*
  Controller for static resources
  */
  @Override
  public void addResourceHandlers(final ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/static/**").addResourceLocations("/static/");
  }
  </strong>	
  /*
   * STEP 1 - Create SpringResourceTemplateResolver
  */
	
  @Bean
  public SpringResourceTemplateResolver templateResolver() {
    SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
    templateResolver.setApplicationContext(applicationContext);
    templateResolver.setPrefix("/WEB-INF/views/");
    templateResolver.setSuffix(".html");
    <strong>templateResolver.setCacheable(false);</strong>//Development Mode
    return templateResolver;
  }
  /*
   * STEP 2 - Create SpringTemplateEngine
  */
  @Bean
  public SpringTemplateEngine templateEngine() {
    SpringTemplateEngine templateEngine = new SpringTemplateEngine();
    templateEngine.setTemplateResolver(templateResolver());
    templateEngine.setEnableSpringELCompiler(true);
    return templateEngine;
  }

  /*
   * STEP 3 - Register ThymeleafViewResolver
  */
  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {
    ThymeleafViewResolver resolver = new ThymeleafViewResolver();
    <strong>resolver.setCharacterEncoding("UTF-8");</strong>
    resolver.setTemplateEngine(templateEngine());
    registry.viewResolver(resolver);
  }
}
</pre>

<pre class="prettyprint">package net.java_school.spring.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MvcWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class&lt;?&gt;[] getRootConfigClasses() {
    return null;
  }

  @Override
  protected Class&lt;?&gt;[] getServletConfigClasses() {
    return new Class[] { MvcWebConfig.class };
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] { "/" };
  }
}
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html">https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html</a></li>
	<li><a href="https://www.thymeleaf.org/doc/tutorials/3.0/thymeleafspring.html#integrating-thymeleaf-with-spring">https://www.thymeleaf.org/doc/tutorials/3.0/thymeleafspring.html#integrating-thymeleaf-with-spring</a></li>
	<li><a href="https://www.boraji.com/spring-mvc-5-hello-world-example-with-thymeleaf-template">Spring MVC 5 - Hello world example with Thymeleaf template</a></li>
</ul>

</article>
