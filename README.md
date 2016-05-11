JSPProject
============

BBS with JSP model 1 architecture 

How to install

1. $ git clone https://github.com/kimjonghoon/JSPProject

2. Eclipse
   File - New - Dynamic Web Project - Project name: JSPProject
   refer to http://www.java-school.net/jsp-pjt/Dynamic-Web-Project-Set-Up
   
3. Eclipse
   Project Explorer - JSPProjct - Build Path - Configure Build Path...
   Libraries tab - Add External JARs - Add {TOMCAT_HOME}/lib/servlet-api.jar

4. {TOMCAT_HOME}/Catalina/localhost/JSPProject.xml  
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="{your path}/JSPProject/WebContent"
    reloadable="true"&gt;
	&lt;Resource
		name="jdbc/jsppjt"
		auth="Container"
		type="javax.sql.DataSource"
		username="java"
		password="school"
		driverClassName="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@127.0.0.1:1521:XE" 
		maxActive="8"
		maxIdle="4" /&gt;
&lt;/Context&gt;                                                                             

4. database design 
   refer to http://www.java-school.net/jsp-pjt/database-design

have to edit
 
JSPProject/src/log4j.xml 
&lt;param name="File"  value="{Full path of log file}"/&gt;
