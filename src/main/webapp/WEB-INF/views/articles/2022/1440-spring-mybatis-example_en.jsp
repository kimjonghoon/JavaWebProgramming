<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Simple MyBatis Example</title>
<meta name="Keywords" content="java,spring,mybatis,simple mybatis example" />
<meta name="Description" content="Simple Spring MyBatis Example" />
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
<div class="last-modified">Last Modified 6.21.2025</div>

<h1>Simple Spring MyBatis Example</h1>

<pre class="shell-prompt">
sqlplus scott/tiger
</pre>

<pre class="db-schema">
create table music (
no number,
content varchar2(4000),
constraint PK_MTV PRIMARY KEY(no)
);

create sequence SEQ_MUSIC
increment by 1
start with 1;
</pre>

<pre lang="en" class="tree">
mybatismusic
├── pom.xml
└── src
    └── main
        ├── java
        │   └── net
        │       └── java_school
        │           ├── mybatis
        │           │   └── MusicVideoMapper.java
        │           └── mybatismusic
        │               ├── HomeController.java
        │               ├── MusicVideo.java
        │               ├── MusicVideoService.java
        │               └── MusicVideoServiceImpl.java
        ├── resources
        │   ├── commons-logging.properties
        │   ├── log4j2.xml
        │   └── net
        │       └── java_school
        │           └── mybatis
        │               ├── Configuration.xml
        │               └── MusicVideoMapper.xml
        └── webapp
            ├── WEB-INF
            │   ├── applicationContext.xml
            │   ├── mybatismusic-servlet.xml
            │   ├── views
            │   │   └── index.jsp
            │   └── web.xml
            └── resources
                └── js
                    └── jquery.js
</pre>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
	http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
	
&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
&lt;groupId&gt;net.java_school&lt;/groupId&gt;
&lt;artifactId&gt;mybatismusic&lt;/artifactId&gt;
&lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
&lt;packaging&gt;war&lt;/packaging&gt;
&lt;name&gt;mybatismusic Maven Webapp&lt;/name&gt;
&lt;url&gt;http://localhost:8080&lt;/url&gt;

&lt;properties&gt;
  &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
  &lt;maven.compiler.source&gt;21&lt;/maven.compiler.source&gt;
  &lt;maven.compiler.target&gt;21&lt;/maven.compiler.target&gt;
  &lt;spring.version&gt;6.2.8&lt;/spring.version&gt;
&lt;/properties&gt;

&lt;dependencies&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;junit&lt;/groupId&gt;
    &lt;artifactId&gt;junit&lt;/artifactId&gt;
    &lt;version&gt;4.11&lt;/version&gt;
    &lt;scope&gt;test&lt;/scope&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;jakarta.servlet&lt;/groupId&gt;
    &lt;artifactId&gt;jakarta.servlet-api&lt;/artifactId&gt;
    &lt;version&gt;6.1.0&lt;/version&gt;
    &lt;scope&gt;provided&lt;/scope&gt;
  &lt;/dependency&gt;       
  &lt;!-- https://mvnrepository.com/artifact/jakarta.servlet.jsp.jstl/jakarta.servlet.jsp.jstl-api --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;jakarta.servlet.jsp.jstl&lt;/groupId&gt;
    &lt;artifactId&gt;jakarta.servlet.jsp.jstl-api&lt;/artifactId&gt;
    &lt;version&gt;3.0.2&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.glassfish.web/jakarta.servlet.jsp.jstl --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.glassfish.web&lt;/groupId&gt;
    &lt;artifactId&gt;jakarta.servlet.jsp.jstl&lt;/artifactId&gt;
    &lt;version&gt;3.0.1&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.springframework&lt;/groupId&gt;
    &lt;artifactId&gt;spring-context&lt;/artifactId&gt;
    &lt;version&gt;${spring.version}&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.springframework&lt;/groupId&gt;
    &lt;artifactId&gt;spring-webmvc&lt;/artifactId&gt;
    &lt;version&gt;${spring.version}&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.springframework&lt;/groupId&gt;
    &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;
    &lt;version&gt;${spring.version}&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc11 --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;
    &lt;artifactId&gt;ojdbc11&lt;/artifactId&gt;
    &lt;version&gt;23.7.0.25.01&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.mybatis&lt;/groupId&gt;
    &lt;artifactId&gt;mybatis&lt;/artifactId&gt;
    &lt;version&gt;3.5.19&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.mybatis&lt;/groupId&gt;
    &lt;artifactId&gt;mybatis-spring&lt;/artifactId&gt;
    &lt;version&gt;3.0.4&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.apache.commons/commons-dbcp2 --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.apache.commons&lt;/groupId&gt;
    &lt;artifactId&gt;commons-dbcp2&lt;/artifactId&gt;
    &lt;version&gt;2.13.0&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-api --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
    &lt;artifactId&gt;log4j-api&lt;/artifactId&gt;
    &lt;version&gt;2.24.3&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
    &lt;artifactId&gt;log4j-core&lt;/artifactId&gt;
    &lt;version&gt;2.24.3&lt;/version&gt;
  &lt;/dependency&gt;
  &lt;!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-jcl --&gt;
  &lt;dependency&gt;
    &lt;groupId&gt;org.apache.logging.log4j&lt;/groupId&gt;
    &lt;artifactId&gt;log4j-jcl&lt;/artifactId&gt;
    &lt;version&gt;2.24.3&lt;/version&gt;
  &lt;/dependency&gt;
&lt;/dependencies&gt;

&lt;build&gt;
  &lt;finalName&gt;mybatismusic&lt;/finalName&gt;
  &lt;pluginManagement&gt;
    &lt;plugins&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.1.0&lt;/version&gt;
        &lt;configuration&gt;
          &lt;filesets&gt;
             &lt;fileset&gt;
                &lt;directory&gt;src/main/webapp/WEB-INF/classes&lt;/directory&gt;
             &lt;/fileset&gt;
             &lt;fileset&gt;
                &lt;directory&gt;src/main/webapp/WEB-INF/lib&lt;/directory&gt;
             &lt;/fileset&gt;
          &lt;/filesets&gt;
        &lt;/configuration&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-resources-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.0.2&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.8.0&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
        &lt;version&gt;2.22.1&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.2.2&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
        &lt;version&gt;2.5.2&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
        &lt;version&gt;2.8.2&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;!-- https://mvnrepository.com/artifact/org.eclipse.jetty/jetty-maven-plugin --&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
        &lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
        &lt;version&gt;11.0.25&lt;/version&gt;
      &lt;/plugin&gt;
    &lt;/plugins&gt;
  &lt;/pluginManagement&gt;
&lt;/build&gt;

&lt;/project&gt;
</pre>

<p>
src/main/resources
</p>

<h6 class="src">commons-logging.properties</h6>
<pre class="prettyprint">
org.apache.commons.logging.Log = org.apache.commons.logging.impl.Log4JLogger
</pre>

<h6 class="src">log4j2.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE configuration&gt;
&lt;Configuration&gt;
    &lt;Appenders&gt;
        &lt;File name="MyBatisMusic" fileName="/var/log/tomcat9/MyBatisMusic.log" append="false"&gt;
            &lt;PatternLayout pattern="%t %-5p %c{2} - %m%n" /&gt;
        &lt;/File&gt;
        &lt;Console name="STDOUT" target="SYSTEM_OUT"&gt;
            &lt;PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n" /&gt;
        &lt;/Console&gt;
    &lt;/Appenders&gt;
    &lt;Loggers&gt;
        &lt;Logger name="net.java_school" level="DEBUG"&gt;
            &lt;AppenderRef ref="MyBatisMusic" /&gt;
        &lt;/Logger&gt;
        &lt;Root level="INFO"&gt;
            &lt;AppenderRef ref="STDOUT" /&gt;
        &lt;/Root&gt;
    &lt;/Loggers&gt;
&lt;/Configuration&gt;
</pre>

<p>
src/main/resources/net/java_school/mybatis
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
		&lt;typeAlias type="net.java_school.mybatismusic.MusicVideo" alias="MusicVideo" /&gt;
	&lt;/typeAliases&gt;

&lt;/configuration&gt;
</pre>

<h6 class="src">MusicVideoMapper.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.MusicVideoMapper"&gt;

    &lt;select id="selectCountOfVideos" resultType="int"&gt;
        SELECT count(*) FROM music 
    &lt;/select&gt;

    &lt;select id="selectVideos" parameterType="hashmap" resultType="MusicVideo"&gt;
        SELECT content 
        FROM (
            SELECT rownum R,A.* 
            FROM (
                SELECT 
                    content
                FROM 
                    music
                ORDER BY no DESC
                 ) A
             )
        WHERE R BETWEEN #{start} AND #{end}
    &lt;/select&gt;	

    &lt;insert id="insert"&gt;
	    insert into music values (seq_music.nextval, #{content})
    &lt;/insert&gt;
	
&lt;/mapper&gt;
</pre>

<p>
src/main/java/net/java_school/mybatis
</p>

<h6 class="src">MusicVideoMapper.java</h6>
<pre class="prettyprint">
package net.java_school.mybatis;

import java.util.HashMap;
import java.util.List;
import net.java_school.mybatismusic.MusicVideo;
import org.apache.ibatis.annotations.Param;

public interface MusicVideoMapper {
	public int selectCountOfVideos();

	public List&lt;MusicVideo&gt; selectVideos(HashMap&lt;String, String&gt; hashmap);

	public void insert(@Param("content") String content);
}
</pre>

<p>
src/main/java/net/java_school/mybatismusic
</p>

<h6 class="src">MusicVideo.java</h6>
<pre class="prettyprint">
package net.java_school.mybatismusic;

public class MusicVideo {
	private int no;
	private String content;

	public MusicVideo() {}

	public MusicVideo(int no, String content) {
		this.no = no;
		this.content = content;
	}

	public int getNo() {
	       return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}	
</pre>

<h6 class="src">MusicVideoService.java</h6>
<pre class="prettyprint">
package net.java_school.mybatismusic;

import java.util.List;

public interface MusicVideoService {
	
	public int getTotalRecords();

	public List&lt;MusicVideo&gt; getVideos(Integer startRecord, Integer endRecord);

	public void add(String content);
}
</pre>

<h6 class="src">MusicVideoServiceImpl.java</h6>
<pre class="prettyprint">
package net.java_school.mybatismusic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.HashMap;
import net.java_school.mybatis.MusicVideoMapper;

@Service
public class MusicVideoServiceImpl implements MusicVideoService {

	@Autowired
	private MusicVideoMapper musicVideoMapper;

	@Override
	public int getTotalRecords() {
		return musicVideoMapper.selectCountOfVideos();
	}

	@Override
	public List&lt;MusicVideo&gt; getVideos(Integer startRecord, Integer endRecord) {
		HashMap&lt;String, String&gt; hashmap = new HashMap&lt;String, String&gt;();
		hashmap.put("start", startRecord.toString());
		hashmap.put("end", endRecord.toString());

		return musicVideoMapper.selectVideos(hashmap);
	}

	@Override
	public void add(String content) {
		musicVideoMapper.insert(content);
	}
}
</pre>

<h6 class="src">HomeController.java</h6>
<pre class="prettyprint">
package net.java_school.mybatismusic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Controller
public class HomeController {
	@Autowired
	private MusicVideoService musicVideoService;

	private Map&lt;String, Integer&gt; getNumbersForPaging(int totalRecord, 
			int page, int numPerPage, int pagePerBlock) {

		Map&lt;String, Integer&gt; map = new HashMap&lt;String, Integer&gt;();

		int totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) totalPage++;

		int totalBlock = totalPage / pagePerBlock;
		if (totalPage % pagePerBlock != 0) totalBlock++;

		int block = page / pagePerBlock;
		if (page % pagePerBlock != 0) block++;

		int firstPage = (block - 1) * pagePerBlock + 1;
		int lastPage = block * pagePerBlock;

		int prevPage = 0;
		if (block &gt; 1) prevPage = firstPage - 1;

		int nextPage = 0;
		if (block &lt; totalBlock) nextPage = lastPage + 1;
		if (block &gt;= totalBlock) lastPage = totalPage;
		
		int listItemNo = totalRecord - (page - 1) * numPerPage;
		int startRecord = (page - 1) * numPerPage + 1;
		int endRecord = page * numPerPage;

		map.put("totalPage", totalPage);
		map.put("firstPage", firstPage);
		map.put("lastPage", lastPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		map.put("startRecord", startRecord);
		map.put("endRecord", endRecord);

		return map;
	}

	@GetMapping("/")
	public String index(@RequestParam(name="page", required=false) Integer page, Model model) {
		if (page == null) return "redirect:/?page=1";

		int numPerPage = 4;
		int pagePerBlock = 50;

		int totalRecord = musicVideoService.getTotalRecords();

		Map&lt;String, Integer&gt; map = getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);
		Integer startRecord = map.get("startRecord");
		Integer endRecord = map.get("endRecord");

		List&lt;MusicVideo&gt; list = musicVideoService.getVideos(startRecord, endRecord);

		Integer prevPage = map.get("prevPage");
		Integer nextPage = map.get("nextPage");
		Integer firstPage = map.get("firstPage");
		Integer lastPage = map.get("lastPage");
		Integer totalPage = map.get("totalPage");

		model.addAttribute("list", list);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("totalPage", totalPage);

		return "index";
	}

	@PostMapping("/")
	@ResponseBody
	public void add(@RequestParam(name="content") String content) {
		musicVideoService.add(content);	
	}
}
</pre>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;

&lt;display-name&gt;MyBatis Music&lt;/display-name&gt;

&lt;context-param&gt;
	&lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;
	&lt;param-value&gt;/WEB-INF/applicationContext.xml&lt;/param-value&gt;
&lt;/context-param&gt;

&lt;listener&gt;
	&lt;listener-class&gt;org.springframework.web.context.ContextLoaderListener&lt;/listener-class&gt;
&lt;/listener&gt;

&lt;filter&gt;
	&lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
	&lt;filter-class&gt;org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class&gt;
	&lt;init-param&gt;
		&lt;param-name&gt;encoding&lt;/param-name&gt;
		&lt;param-value&gt;UTF-8&lt;/param-value&gt;
	&lt;/init-param&gt;
	&lt;init-param&gt;
		&lt;param-name&gt;forceEncoding&lt;/param-name&gt;
		&lt;param-value&gt;true&lt;/param-value&gt;
	&lt;/init-param&gt;
&lt;/filter&gt;

&lt;filter-mapping&gt;
	&lt;filter-name&gt;encodingFilter&lt;/filter-name&gt;
	&lt;url-pattern&gt;/*&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;

&lt;servlet&gt;
	&lt;servlet-name&gt;mybatismusic&lt;/servlet-name&gt;
	&lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
	&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
	&lt;servlet-name&gt;mybatismusic&lt;/servlet-name&gt;
	&lt;url-pattern&gt;/&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;

&lt;/web-app&gt;
</pre>

<h6 class="src">mybatismusic-servlet.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:mybatis="http://mybatis.org/schema/mybatis-spring"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context.xsd
	http://www.springframework.org/schema/mvc 
	http://www.springframework.org/schema/mvc/spring-mvc.xsd
	http://mybatis.org/schema/mybatis-spring 
	http://mybatis.org/schema/mybatis-spring.xsd"&gt;

&lt;mvc:resources location="/resources/" mapping="/resources/**" /&gt;

&lt;mvc:annotation-driven /&gt;

&lt;context:component-scan base-package="net.java_school.mybatismusic" /&gt;

&lt;mybatis:scan base-package="net.java_school.mybatis" /&gt;

&lt;bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt;
	&lt;property name="viewClass" value="org.springframework.web.servlet.view.JstlView" /&gt;
	&lt;property name="prefix" value="/WEB-INF/views/" /&gt;
	&lt;property name="suffix" value=".jsp" /&gt;
&lt;/bean&gt;

&lt;/beans&gt;
</pre>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans.xsd"&gt;

&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close"&gt;
	&lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
	&lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
	&lt;property name="username" value="scott" /&gt;
	&lt;property name="password" value="tiger" /&gt;
	&lt;property name="maxTotal" value="100" /&gt;
	&lt;property name="maxWaitMillis" value="1000" /&gt;
	&lt;property name="poolPreparedStatements" value="true" /&gt;
	&lt;property name="defaultAutoCommit" value="true" /&gt;
	&lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
&lt;/bean&gt;

&lt;bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean"&gt;
	&lt;property name="dataSource" ref="dataSource" /&gt;
	&lt;property name="configLocation" value="classpath:net/java_school/mybatis/Configuration.xml" /&gt;
&lt;/bean&gt;

&lt;/beans&gt;
</pre>

<p>
src/main/webapp/WEB-INF/views
</p>

<h6 class="src">index.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;MyBatis Music&lt;/title&gt;
&lt;meta name="viewport" content="width=device-width, initial-scale=1" /&gt;
&lt;meta name="Keywords" content="MyBatis Music App Test" /&gt;
&lt;meta name="Description" content="This is test web app for MyBatis Music Video" /&gt;
&lt;style&gt;
html, body {
	margin: 0;
	padding: 0;
	background-color: #FFF;
	font-family: "Liberation Sans", Helvetica, sans-serif;
}
#videos .iframe {
	float: left;
}
#paging {
	width: 640px;
	float: left;
	font-size: 1em;
}
form {
	display: flex;
}
textarea {
	display: inline-block;
	width: 85%;
	resize: none;
}
#submit {
	display: inline-block;
	width: 10%;
	margin-bottom: -10px;
}
&lt;/style&gt;
&lt;script src="resources/js/jquery.js"&gt;&lt;/script&gt;
&lt;script&gt;
$(document).ready(function() {
	$("#addForm").submit(function (event) {
		event.preventDefault();
		var $form = $(this);
		var content = $('#addForm-ta').val();
		content = $.trim(content);
		if (content.length === 0) {
			$('#addForm-ta').val('');
			return false;
		}
		var dataToBeSent = $form.serialize();
		var url = $form.attr("action");
		var posting = $.post(url, dataToBeSent);
		posting.done(function () {
			$('#addForm-ta').val('');
		});
	});    

	var originWidth = $('#videos &gt; iframe').width();
	var originHeight = $('#videos &gt; iframe').height();

	var width = $('#paging').width();
	var height = originHeight * width / originWidth;

	$('#videos &gt; iframe').attr('width', width);
	$('#videos &gt; iframe').attr('height', height);

	$('#videos &gt; iframe').attr('allowFullScreen', '');

});
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
	&lt;div id="videos"&gt;
		&lt;c:forEach var="video" items="${list }" varStatus="status"&gt;
		${video.content }
		&lt;/c:forEach&gt;
	&lt;/div&gt;

	&lt;div id="paging"&gt;
		&lt;c:if test="${prevPage &gt; 0}"&gt;
		&lt;a href="?page=1" title="1"&gt;[First]&lt;/a&gt;
		&lt;a href="?page=${prevPage }" title="${prevPage }"&gt;[Prev]&lt;/a&gt;
		&lt;/c:if&gt;

		&lt;c:forEach var="i" begin="${firstPage }" end="${lastPage }" varStatus="status"&gt;
		&lt;c:choose&gt;
			&lt;c:when test="${param.page == i}"&gt;
			&lt;strong&gt;${i }&lt;/strong&gt;
			&lt;/c:when&gt;
			&lt;c:otherwise&gt;
			&lt;a href="?page=${i }" title="${i }"&gt;${i }&lt;/a&gt;
			&lt;/c:otherwise&gt;
		&lt;/c:choose&gt;
		&lt;/c:forEach&gt;

		&lt;c:if test="${nextPage &gt; 0 }"&gt;
		&lt;a href="?page=${nextPage }" title="${nextPage }"&gt;[Next]&lt;/a&gt;
		&lt;a href="?page=${totalPage }" title="${totalPage }"&gt;[Last]&lt;/a&gt;
		&lt;/c:if&gt;
		&lt;form id="addForm" action="./"&gt;
			&lt;textarea id="addForm-ta" name="content" cols="30" rows="1"&gt;&lt;/textarea&gt;
			&lt;input id="submit" type="submit" value="Send" /&gt; 
		&lt;/form&gt;
	&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
https://jquery.com/download/<br />
src/main/webapp/resources/js/jquery.js
</p>

<h3>Run</h3>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
<span class="repository">https://github.com/kimjonghoon/mybatismusic</span>
</p>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/java/JDK-Install}">Java Install</a></li>
	<li><a href="#" th:href="@{/spring/building-java-projects-with-maven}">Building Java Projects with Maven</a></li>
	<li><a href="#" th:href="@{/jsp/How-to-install-Tomcat}">Tomcat Install</a></li>
	<li><a href="#" th:href="@{/jsp/Creating-a-new-web-application}">Creating a new web application</a></li>
	<li><a href="#" th:href="@{/jdbc/How-to-install-Oracle}">Oracle Install</a></li>
	<li><a href="#" href="/blog/2019/java-development-environment-on-ubuntu-18}">Java Development Environment on Ubuntu 18.04</a></li>
	<li><a href="https://jquery.com/download/">https://jquery.com/download/</a></li>
</ul>

</article>
</body>
</html>
