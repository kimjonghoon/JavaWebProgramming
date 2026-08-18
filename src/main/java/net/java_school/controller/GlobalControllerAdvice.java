package net.java_school.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {
	@ModelAttribute("javaVer")
	public String getJavaVersion() {
		return "25";
	}
	@ModelAttribute("springVer")
	public String getSpringVersion() {
		return "7.0.8";
	}
	@ModelAttribute("securityVer")
	public String getSecurityVersion() {
		return "7.1.0";
	}
	//https://mvnrepository.com/artifact/joda-time/joda-time
	@ModelAttribute("jodaTimeVer")
	public String getJodaTimeVersion() {
		return "2.14.3";
	}
	//https://mvnrepository.com/artifact/org.slf4j/slf4j-api
	@ModelAttribute("slf4jVer")
	public String getSlf4jVersion() {
		return "2.0.17";
	}
	//https://mvnrepository.com/artifact/ch.qos.logback/logback-classic
	@ModelAttribute("logbackVer")
	public String getLogbackVersion() {
		return "1.6.3";
	}
	@ModelAttribute("ojdbc11Ver")
	public String getOjdbc11Version() {
		return "23.26.3.0.0";
	}
	//https://mvnrepository.com/artifact/org.aspectj/aspectjweaver
	@ModelAttribute("aspectjweaverVer")
	public String getAspectjweaverVersion() {
		return "1.9.25.1";
	}	
	@ModelAttribute("servletVer")
	public String getServletVersion() {
		return "6.1.0";
	}	
	@ModelAttribute("jstlApiVer")
	public String getJstlApiVersion() {
		return "3.0.2";
	}	
	@ModelAttribute("jstlVer")
	public String getJstlVersion() {
		return "3.0.1";
	}	
	//https://mvnrepository.com/artifact/org.apache.commons/commons-dbcp2
	@ModelAttribute("commonsDbcp2Ver")
	public String getCommonsDbcp2Version() {
		return "2.14.0";
	}
	//https://mvnrepository.com/artifact/org.mybatis/mybatis
	@ModelAttribute("mybatisVer")
	public String getMybatisVersion() {
		return "3.5.19";
	}
	//https://mvnrepository.com/artifact/org.mybatis/mybatis-spring
	@ModelAttribute("mybatisSpringVer")
	public String getMybatisSpringVersion() {
		return "4.1.0";
	}
	//https://mvnrepository.com/artifact/commons-logging/commons-logging
	@ModelAttribute("commonsLoggingVer")
	public String getCommonsLoggingVersion() {
		return "1.4.0";
	}
	@ModelAttribute("log4jVer")
	public String getLog4jVersion() {
		return "2.26.1";
	}
	@ModelAttribute("hibernateValidatorVer")
	public String getHivernateValidatorVersion() {
		return "9.1.3.Final";
	}
	@ModelAttribute("thymeleafSpring6Ver")
	public String getThymeleafSpring6Version() {
		return "3.1.5.RELEASE";
	}
	@ModelAttribute("jettyMavenPluginVer")
	public String getJettyMavenPluginVersion() {
		return "11.0.26";
	}
	@ModelAttribute("mysqlJdbcDriverVer")
	public String getMysqlJdbcDriverVersion() {
		return "26.7.0";
	}
	@ModelAttribute("jacksonDatabindVer")
	public String getJacksonDatabindVersion() {
		return "3.2.2";
	}
}
