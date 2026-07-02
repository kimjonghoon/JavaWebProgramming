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
	@ModelAttribute("jodaTimeVer")
	public String getJodaTimeVersion() {
		return "2.14.1";
	}
	@ModelAttribute("slf4jVer")
	public String getSlf4jVersion() {
		return "2.0.17";
	}
	@ModelAttribute("logbackVer")
	public String getLogbackVersion() {
		return "1.5.32";
	}
	@ModelAttribute("ojdbc11Ver")
	public String getOjdbc11Version() {
		return "23.26.2.0.0";
	}
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
	@ModelAttribute("commonsDbcp2Ver")
	public String getCommonsDbcp2Version() {
		return "2.14.0";
	}
	@ModelAttribute("mybatisVer")
	public String getMybatisVersion() {
		return "3.5.19";
	}
	@ModelAttribute("mybatisSpringVer")
	public String getMybatisSpringVersion() {
		return "4.1.0";
	}
	@ModelAttribute("commonsLoggingVer")
	public String getCommonsLoggingVersion() {
		return "1.4.0";
	}
	@ModelAttribute("log4jVer")
	public String getLog4jVersion() {
		return "2.26.0";
	}
	@ModelAttribute("hibernateValidatorVer")
	public String getHivernateValidatorVersion() {
		return "9.1.1.Final";
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
		return "9.7.0";
	}
	@ModelAttribute("jacksonDatabindVer")
	public String getJacksonDatabindVersion() {
		return "3.2.0";
	}
}
