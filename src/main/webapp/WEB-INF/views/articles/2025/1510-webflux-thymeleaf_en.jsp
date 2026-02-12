<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Using Thymeleaf in WebFluxC</title>
<meta name="Keywords" content="Java,Thymeleaf,spring webflux,Thymeleaf layout,java config,@Configuration,@EnableWebFlux,AbstractReactiveWebInitializer," />
<meta name="Description" content="Using Thymeleaf in WebFlux" />
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
<div class="last-modified">Last Modified 6.20.2025</div>

<h1>Using Thymeleaf in WebFlux</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/webflux-thymeleaf</span>
</p>

<h3>Run</h3>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
Visit http://localhost:8080<br />
</p>

<p>
<img alt="thymeleaf layout test screen" src="https://lh3.googleusercontent.com/eqrNfc9FBz2EEkUKUeKQk8TUeEcVVn99on-nxzjXhdwbZLf6t_psFYqnDNvGSp6GvTv1R3gAIFsvQrjTa3PmdyYgPy3ACJY3x_MEkAjbu9MrSRwTXb_FIT_vEb9pidKSAKDu9gE-nbEYJdABYUWQBLX4mdwLPFj3CEJP-iYAyt87VmMMR6PT21-cABhyG16bBP_YSVtubGabDu_jl9Afn1-dVF0yG0-PpaAGxVntyDDHXbcN5Skr9RvMqzoUASuHFxZnU4uFRBTzV6umcVe1xQIr0RlEPbzcNSTECv4w3ELXUAqVeIfOvTASqd0F_rGhYAxC_lpFrjbFb7jQ99l3TWBVL8P3XJDFxIoUijBCXbyyaleMqobLk__6JG2e6e5QdoqEeSC7WXmg0rQ5QLTd081c2yjvbF51YZVB0KYG_f6uF4tVMjmxB1pHNkgJTkkEqGqrDSDkFtLwonAEO2Cz1uYNaXFgzxgu7ROrTucMa_FXxSHQlgWe_80DrMu1I7p1BCB6hjN-6iH6pi-tu18XQPT_w6C8QYeEXAhpKwnDYkWbXfE4A19ZzucA_E-bGB1lfclD76U8OMUKhJshJ6N5Tq1Gz00cvUzTclARKjDz-g4kn4vxb_r7GmUsCE6KRC6-MJihWJG6lxv7z-EYi0aDuX2QqeTybJg=w1007-h790-no" style="width: 100%" />
</p>

<h3>POM</h3>

<pre class="prettyprint">
&lt;project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;

&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
&lt;groupId&gt;net.java_school.tutorial&lt;/groupId&gt;
&lt;artifactId&gt;webflux-thymeleaf&lt;/artifactId&gt;
&lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
&lt;packaging&gt;war&lt;/packaging&gt;
&lt;name&gt;WebFlux Thymeleaf&lt;/name&gt;
&lt;url&gt;http://localhost:8080&lt;/url&gt;

&lt;properties&gt;
  &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
  &lt;maven.compiler.source&gt;<strong>21</strong>&lt;/maven.compiler.source&gt;
  &lt;maven.compiler.target&gt;<strong>21</strong>&lt;/maven.compiler.target&gt;
  &lt;spring.version&gt;<strong>6.2.8</strong>&lt;/spring.version&gt;
  <strong>&lt;failOnMissingWebXml&gt;false&lt;/failOnMissingWebXml&gt;</strong>
&lt;/properties&gt;

&lt;dependencyManagement&gt;
  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;org.springframework&lt;/groupId&gt;
      &lt;artifactId&gt;spring-framework-bom&lt;/artifactId&gt;
      &lt;version&gt;${spring.version}&lt;/version&gt;
      &lt;type&gt;pom&lt;/type&gt;
      &lt;scope&gt;import&lt;/scope&gt;
    &lt;/dependency&gt;
  &lt;/dependencies&gt;
&lt;/dependencyManagement&gt;

&lt;dependencies&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.springframework&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>spring-context</strong>&lt;/artifactId&gt;
  &lt;/dependency&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.springframework&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>spring-webflux</strong>&lt;/artifactId&gt;
  &lt;/dependency&gt;
  <strong>&lt;!-- https://mvnrepository.com/artifact/org.thymeleaf/thymeleaf-spring6 --&gt;</strong>
  &lt;dependency&gt;
    &lt;groupId&gt;org.thymeleaf&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>thymeleaf-spring6</strong>&lt;/artifactId&gt;
    &lt;version&gt;<strong>3.1.3.RELEASE</strong>&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;jakarta.servlet&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>jakarta.servlet-api</strong>&lt;/artifactId&gt;
    &lt;version&gt;<strong>6.0.0</strong>&lt;/version&gt;
    &lt;scope&gt;provided&lt;/scope&gt;
  &lt;/dependency&gt;
  <strong>&lt;!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api --&gt;</strong>
  &lt;dependency&gt;
    &lt;groupId&gt;org.slf4j&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>slf4j-api</strong>&lt;/artifactId&gt;
    &lt;version&gt;2.1.0-alpha1&lt;/version&gt;
  &lt;/dependency&gt;
  <strong>&lt;!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic --&gt;</strong>
  &lt;dependency&gt;
    &lt;groupId&gt;ch.qos.logback&lt;/groupId&gt;
    &lt;artifactId&gt;<strong>logback-classic</strong>&lt;/artifactId&gt;
    &lt;version&gt;1.5.18&lt;/version&gt;
    &lt;scope&gt;compile&lt;/scope&gt;
  &lt;/dependency&gt;
&lt;/dependencies&gt;

&lt;build&gt;
  &lt;finalName&gt;webflux-thymeleaf&lt;/finalName&gt;
  &lt;pluginManagement&gt;
    &lt;plugins&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.4.1&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-resources-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.3.1&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.14.0&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.5.3&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.4.0&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.1.4&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.1.4&lt;/version&gt;
      &lt;/plugin&gt;
      <strong>&lt;!-- https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin --&gt;</strong>
      &lt;plugin&gt;
        &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
        &lt;artifactId&gt;<strong>jetty-maven-plugin</strong>&lt;/artifactId&gt;
        &lt;version&gt;<strong>11.0.25</strong>&lt;/version&gt;
      &lt;/plugin&gt;
    &lt;/plugins&gt;
  &lt;/pluginManagement&gt;
&lt;/build&gt;
&lt;/project&gt;
</pre>

<h3>Java-based Configuration</h3>

<pre class="prettyprint">
package net.java_school.config;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.reactive.config.EnableWebFlux;
import org.springframework.web.reactive.config.ResourceHandlerRegistry;
import org.springframework.web.reactive.config.ViewResolverRegistry;
import org.springframework.web.reactive.config.WebFluxConfigurer;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.thymeleaf.spring6.ISpringWebFluxTemplateEngine;
import org.thymeleaf.spring6.SpringWebFluxTemplateEngine;
import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring6.view.reactive.ThymeleafReactiveViewResolver;
import org.thymeleaf.templatemode.TemplateMode;

@Configuration
@EnableWebFlux
@ComponentScan("net.java_school.blog")
public class AppConfig implements ApplicationContextAware, WebFluxConfigurer {

  @Autowired
  private ApplicationContext applicationContext;

  @Override
  public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
    this.applicationContext = applicationContext;
  }

  @Override
  public void addResourceHandlers(final ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/static/**").addResourceLocations("classpath:static/");
  }

  @Bean
  public ResourceBundleMessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename("classpath:messages");
    messageSource.setDefaultEncoding("UTF-8");
    return messageSource;
  }

  @Bean
  public SpringResourceTemplateResolver templateResolver() {
    final SpringResourceTemplateResolver resolver = new SpringResourceTemplateResolver();
    resolver.setApplicationContext(this.applicationContext);
    resolver.setPrefix("classpath:templates/");
    resolver.setSuffix(".html");
    resolver.setTemplateMode(TemplateMode.HTML);
    resolver.setCacheable(false);
    return resolver;
  }

  @Bean
  public ISpringWebFluxTemplateEngine templateEngine() {
    SpringWebFluxTemplateEngine templateEngine = new SpringWebFluxTemplateEngine();
    templateEngine.setTemplateResolver(templateResolver());
    templateEngine.setEnableSpringELCompiler(true);
    return templateEngine;
  }

  @Bean
  public ThymeleafReactiveViewResolver viewResolver() {
    ThymeleafReactiveViewResolver viewResolver = new ThymeleafReactiveViewResolver();
    viewResolver.setTemplateEngine(templateEngine());
    viewResolver.setResponseMaxChunkSizeBytes(16348);
    return viewResolver;
  }

  @Override public void configureViewResolvers(ViewResolverRegistry registry) {
    registry.viewResolver(this.viewResolver());
  }
}
</pre>

<pre class="prettyprint">
package net.java_school.config;

import org.springframework.web.server.adapter.AbstractReactiveWebInitializer;

public class MyWebApplicationInitializer extends AbstractReactiveWebInitializer {

  @Override
  protected Class&lt;?&gt;[] getConfigClasses() {
    return new Class&lt;?&gt;[] {AppConfig.class};
  }
}
</pre>

<h3>Controller</h3>

<pre class="prettyprint">
package net.java_school.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import reactor.core.publisher.Mono;
import static reactor.core.publisher.Mono.just;

@Controller
public class MyController {

  @GetMapping("/")
  public Mono&lt;String&gt; index() {
    Mono&lt;String&gt; view = just("index");
    return view;
  }
  
  @GetMapping(value={"{chapter:java|jdbc|jsp|css-layout|jsp-pjt|spring|javascript|google-cloud}", 
      "{chapter:java|jdbc|jsp|css-layout|jsp-pjt|spring|javascript|google-cloud}/{lecture}"})
  public Mono&lt;String&gt; lecture(@PathVariable("chapter") String chapter, 
      @PathVariable(value="lecture", required=false) String lecture) {

    if (lecture != null) {
	  Mono&lt;String&gt; view = just(chapter + "/" + lecture);
      return view;
    } else {
	  Mono&lt;String&gt; view = just(chapter + "/index");
      return view;
    }
  }
	
  @GetMapping("blog")
  public Mono&lt;String&gt; getBlogHome() {
    Mono&lt;Strig&gt; view = just("blog/index");
    return view;
  }

  @GetMapping("blog/{year:\\d+}/{post}")
  public Mono&lt;String&gt; getPost(@PathVariable("year") Integer year, @PathVariable("post") String post) {
    Mono&lt;String&gt; view = just("blog/" + year + "/" + post);
    return view;
  }
}
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://hantsy.github.io/spring-reactive-sample/start/first.html">https://hantsy.github.io/spring-reactive-sample/start/first.html</a></li>
</ul>

</article>
</body>
</html>
