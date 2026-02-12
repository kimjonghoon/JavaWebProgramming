<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>WebFluxC에서 Thymeleaf 사용</title>
<meta name="Keywords" content="Java,자바,Thymeleaf,타임리프,spring webflux,Thymeleaf layout,java config,@Configuration,@EnableWebFlux,AbstractReactiveWebInitializer," />
<meta name="Description" content="WebFlux에서 Thymeleaf 레이아웃 사용하기" />
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
<div class="last-modified">Last Modified 2025.6.20</div>

<h1>WebFlux에서 Thymeleaf 사용</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/webflux-thymeleaf</span>
</p>

<h3>실행</h3>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
http://localhost:8080 방문<br />
(강조된 링크만 테스트할 수 있다)<br />
<img alt="thymeleaf layout test screen" src="https://lh3.googleusercontent.com/ONstTt64usqYdNfmETpkKnq83OxNxaFlKRvgXYVfvpgBgbSqTJaSIdz3pXoHbUIAM6KnE9jcoP7kMgqhc2xR4_6uYSFhBlLU63Lso1T4fGMewlCSIwFJ1_cIsfIpv0HITNJobhl_4YPjcC_9y2nHTZK84P5iZcW7XBQ3f4G6aMwDtOEAsd_2tPUUgSYuGyU1bw1YLn-wrnGTeU62OFFrfIphFW5Iu18K3iWSLjXwP0x2Uq3frBxYt4SqEmE1pNwRo88tGueZcGPz8xWoCr3CBdWhosPfF6lRHxSPcTjheesuD_d0AbYg3lOiuKxq20Bt7SaIm9HCvkwIUZWRXSrrdmT2mZjxvmZndXfzAxoNklXyCnZ86B5_nDK6dYqk2ELBly7m8mFt502Vu_dQkJi5KOkDrvI_xq708V1V2MooXkVtOZRvwAjiggy-bS-CzaswZ-3S2IoiOJ7AwpovxFrs8s3dc15gzWj0BA7fX-kVL313xSPGiJBSZYwI_LM0KyTleF-hMTeH_m54rPwbeo6TXLmS_rRqn3rBDIihg8D4ko2uMzmHstux5ezGaqNwJZ5IFtVtlozmrZXCMTBUjgIRDTk3YyV-gndOl5x15Z7RX7Q8BpWdlj1EHJ7iCUeK6P0yCfat5RfxJh_CidmGmlbvF-7KFyc7nd4=w1017-h792-no" style="width: 100%" />
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

<h3>자바 기반 설정</h3>

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

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://hantsy.github.io/spring-reactive-sample/start/first.html">https://hantsy.github.io/spring-reactive-sample/start/first.html</a></li>
</ul>

</article>
</body>
</html>
