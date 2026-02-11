<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>스프링 MVC에서 Thymeleaf 레이아웃 사용</title>
<meta name="Keywords" content="Java,자바,Thymeleaf,타임리프,spring mvc,Thymeleaf layout,java config,@Configuration,@EnableWebMvc,@ComponentScan,@Bean,AbstractAnnotationConfigDispatcherServletInitializer," />
<meta name="Description" content="스프링 MVC에서 Thymeleaf 레이아웃 사용하기" />
<link rel="stylesheet" href="../../../static/css/korean.css" type="text/css" />
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
<div class="last-modified">Last Modified 2025.5.3</div>

<h1>스프링 MVC에서 Thymeleaf 레이아웃 사용</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/spring-thymeleaf</span>
</p>

<h3>실행 방법</h3>

<p>
루트 디렉터리에서 mvn jetty:run 실행하고, http://localhost:8080 방문<br />
<img alt="thymeleaf layout test screen" src="https://lh3.googleusercontent.com/ONstTt64usqYdNfmETpkKnq83OxNxaFlKRvgXYVfvpgBgbSqTJaSIdz3pXoHbUIAM6KnE9jcoP7kMgqhc2xR4_6uYSFhBlLU63Lso1T4fGMewlCSIwFJ1_cIsfIpv0HITNJobhl_4YPjcC_9y2nHTZK84P5iZcW7XBQ3f4G6aMwDtOEAsd_2tPUUgSYuGyU1bw1YLn-wrnGTeU62OFFrfIphFW5Iu18K3iWSLjXwP0x2Uq3frBxYt4SqEmE1pNwRo88tGueZcGPz8xWoCr3CBdWhosPfF6lRHxSPcTjheesuD_d0AbYg3lOiuKxq20Bt7SaIm9HCvkwIUZWRXSrrdmT2mZjxvmZndXfzAxoNklXyCnZ86B5_nDK6dYqk2ELBly7m8mFt502Vu_dQkJi5KOkDrvI_xq708V1V2MooXkVtOZRvwAjiggy-bS-CzaswZ-3S2IoiOJ7AwpovxFrs8s3dc15gzWj0BA7fX-kVL313xSPGiJBSZYwI_LM0KyTleF-hMTeH_m54rPwbeo6TXLmS_rRqn3rBDIihg8D4ko2uMzmHstux5ezGaqNwJZ5IFtVtlozmrZXCMTBUjgIRDTk3YyV-gndOl5x15Z7RX7Q8BpWdlj1EHJ7iCUeK6P0yCfat5RfxJh_CidmGmlbvF-7KFyc7nd4=w1017-h792-no" style="width: 100%" />
강조된 링크만 테스트할 수 있다.
</p>

<p>
Spring MVC와 Thymeleaf 통합 설정은 <a href="https://www.boraji.com/spring-mvc-5-hello-world-example-with-thymeleaf-template">Spring MVC 5 - Hello world example with Thymeleaf template</a> 을 참조했다.
</p>

<h3>의존성 추가</h3>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.thymeleaf/thymeleaf-spring6 --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.thymeleaf&lt;/groupId&gt;
  &lt;artifactId&gt;thymeleaf-spring6&lt;/artifactId&gt;
  &lt;version&gt;3.1.3.RELEASE&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>스프링 설정</h3>

<pre class="prettyprint">package net.java_school.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.spring6.SpringTemplateEngine;
import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring6.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;

@Configuration
@EnableWebMvc
@ComponentScan("net.java_school.blog")
public class AppConfig implements WebMvcConfigurer {

  @Autowired
  private ApplicationContext applicationContext;

  /*
  Controller for static resources
  */
  @Override
  public void addResourceHandlers(final ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/static/**").addResourceLocations("/static/");
  }

  /*
  i18n
  */
  @Bean
  public ResourceBundleMessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename("messages");
    messageSource.setDefaultEncoding("UTF-8");//자바 프로퍼티 파일의 인코딩이 UTF-8이라면
    return messageSource;
  }
	
  /*
  * STEP 1 - Create SpringResourceTemplateResolver
  */
  @Bean
  public SpringResourceTemplateResolver templateResolver() {
    SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
    templateResolver.setApplicationContext(this.applicationContext);
    templateResolver.setPrefix("/WEB-INF/views/");
    templateResolver.setSuffix(".html");
    templateResolver.setTemplateMode(TemplateMode.HTML);
    <strong>templateResolver.setCacheable(false);</strong>//개발 모드
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
   * STEP 3 - Create ThymeleafViewResolver
  */
  @Bean
  public ThymeleafViewResolver viewResolver() {
    ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
    viewResolver.setTemplateEngine(templateEngine());
    viewResolver.setCharacterEncoding("UTF-8");
    return viewResolver;
  }
}
</pre>

<pre class="prettyprint">package net.java_school.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class&lt;?&gt;[] getRootConfigClasses() {
    return null;
  }

  @Override
  protected Class&lt;?&gt;[] getServletConfigClasses() {
    return new Class[] { AppConfig.class };
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] { "/" };
  }
}
</pre>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.thymeleaf.org/doc/tutorials/3.1/thymeleafspring.html">https://www.thymeleaf.org/doc/tutorials/3.1/thymeleafspring.html</a></li>
	<li><a href="https://www.boraji.com/spring-mvc-5-hello-world-example-with-thymeleaf-template">Spring MVC 5 - Hello world example with Thymeleaf template</a></li>
</ul>

</article>
</body>
</html>
