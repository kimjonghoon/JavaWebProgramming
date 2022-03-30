<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.3.30</div>

<h1>Testing the book source on Windows 10</h1>

<h2>Install Java</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads">https://www.oracle.com/java/technologies/downloads</a><br />
After installing the latest version, 17, add the JDK bin directory to the Path of the system variable.
</p>

<h2>Install Maven</h2>

<p>
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a><br />
Download and unzip the latest binary version, copy the created directory to the location you want, and add Maven's bin directory to the Path of the system variable.
</p>

<h2>Install Git</h2>

<p>
<a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a><br />
After running the downloaded file, you can complete the installation simply by clicking the Next button.
</p>

<p>
Add your name and email to your git config.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">git config --global user.name "Jo Maso"
git config --global user.email jo@gmail.org
</pre>

<p>
Verify.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">git config --global --list 
</pre>

<h2>Install Tomcat</h2>

<p>
<a href="https://tomcat.apache.org/download-90.cgi">https://tomcat.apache.org/download-90.cgi</a><br />
Install version 9, not 10.
</p>

<h2>Install Oracle Database 11gR2 Express Edition</h2>

<p>
11g XE is better than the latest version for studying databases by installing it on a personal computer.
</p>

<p>
If you have a 64-bit Windows system -- most systems are 64-bit systems -- download Oracle Database 11gR2 Express Edition for Windows x64. You need an account on the Oracle website to download this version. After registering as a member and logging in, the download will start.
</p>

<p>
Since Oracle Application Express, one of the 11g XE components, uses port 8080, stop Tomcat if it is in service before installation.
</p>

<p>
After unpacking the downloaded compressed file, run setup.exe in the Disk1 subdirectory created and click the Next button to install it. You can install Oracle easily since Oracle 11g version officially supports Windows 10. Do not forget the administrator password you entered during the installation.
</p>

<p>
For Windows, the default port of Oracle Application Express, 8080, cannot be changed during installation. After installation, the method to change the 8080 port of Apex to 9090 is as follows.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users&gt; sqlplus
Enter user-name: system
Enter password:
Connected.

SQL&gt; Exec DBMS_XDB.SETHTTPPORT(9090);

PL/SQL procedure successfully completed.

SQL&gt;
</pre>

<h2>Test</h2>

<h3>Clone the book source</h3>

<pre class="prettyprint no-border">
git clone https://github.com/kimjonghoon/JavaWebProgramming
</pre>

<h3>Edit the upload directory</h3>

<p>
Open the WebContants.java file in the net.java_school.commons package and modify the upload directory to match your system.
</p>

<h3>Modify the log file path</h3>

<p>
Open the log4j2.xml file in the src/main/resources folder and modify the log file path to match your system.
</p>

<h3>Oracle database schema</h3>

<pre class="prettyprint">
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO java IDENTIFIED BY school;
ALTER USER java DEFAULT TABLESPACE USERS;
ALTER USER java TEMPORARY TABLESPACE TEMP;

CONNECT java/school

create table member (
    email varchar2(60) PRIMARY KEY,
    passwd varchar2(200) NOT NULL,
    name varchar2(20) NOT NULL,
    mobile varchar2(20)
);

create table board (
    boardcd varchar2(20),
    boardnm varchar2(40) NOT NULL,
    boardnm_ko varchar2(40),
    constraint PK_BOARD PRIMARY KEY(boardcd)
);

create table article (
    articleno number,
    boardcd varchar2(20),
    title varchar2(200) NOT NULL,
    content clob NOT NULL,
    email varchar2(60),
    hit number,
    regdate date,
    constraint PK_ARTICLE PRIMARY KEY(articleno),
    constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

create sequence SEQ_ARTICLE
increment by 1
start with 1;

create table comments (
    commentno number,
    articleno number,
    email varchar2(60),
    memo varchar2(4000) NOT NULL,
    regdate date, 
    constraint PK_COMMENTS PRIMARY KEY(commentno)
);

create sequence SEQ_COMMENTS
    increment by 1
    start with 1;

create table attachfile (
    attachfileno number,
    filename varchar2(50) NOT NULL,
    filetype varchar2(30),
    filesize number,
    articleno number,
    email varchar2(60),
    constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

create sequence SEQ_ATTACHFILE
increment by 1
start with 1;

CREATE TABLE authorities (
  email VARCHAR2(60) NOT NULL,
  authority VARCHAR2(20) NOT NULL,
  CONSTRAINT fk_authorities FOREIGN KEY(email) REFERENCES member(email)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(email, authority); 

-- for test records
insert into board values ('chat', 'Chat', '자유 게시판');

commit;

create table views (
  no number,
  articleNo number,
  ip varchar(60),
  yearMonthDayHour char(10),
  constraint PK_VIEWS PRIMARY KEY(no),
  constraint UNIQUE_VIEWS UNIQUE(articleNo, ip, yearMonthDayHour)
);

create sequence SEQ_VIEWS
increment by 1
start with 1;
</pre>

<h3>Install the Oracle JDBC driver to the local repository</h3>

<p>
Manually install the Oracle JDBC driver to the local repository as follows.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users&gt;cd C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib

C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib&gt;mvn install:install-file ^
-Dfile=ojdbc6.jar ^
-DgroupId=com.oracle ^
-DartifactId=ojdbc6 ^
-Dversion=11.2.0.2.0 ^
-Dpackaging=jar

</pre>

<h3>Create ROOT.xml</h3>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users&gt;cd C:\Program Files\Apache Software Foundation\Tomcat 9.0\conf\Catalina\localhost
C:\Program Files\Apache Software Foundation\Tomcat 9.0\conf\Catalina\localhost&gt;notepad ROOT.xml
</pre>

<p>
If C:\JavaWebProgramming is your root directory, edit ROOT.xml as shown below.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="<strong>C:/JavaWebProgramming</strong>/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Restart Tomcat.
</p>

<p>
Visit http://localhost:8080 to sign up and test the bulletin board.
</p>

<h3>Test Admin mode</h3>

<p>
Grant the admin role to a registered someone.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">sqlplus java/school

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
Log in as a member with an administrator role and check if the administrator menu is visible.
</p>

<h3>Test in Jetty</h3>

<p>
Execute mvn clean first before editing the pom.xml file.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
Uncomment the Jetty plugin configuration and comment out the Tomcat configuration in the pom.xml.
</p>

<pre class="prettyprint">
&lt;!-- $ mvn jetty:run --&gt;
&lt;build&gt;
  &lt;finalName&gt;JavaWebProgrammingFinalSource&lt;/finalName&gt;
  &lt;pluginManagement&gt;
    &lt;plugins&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
        &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.8.1&lt;/version&gt;
        &lt;configuration&gt;
          &lt;source&gt;${jdk.version}&lt;/source&gt;
          &lt;target&gt;${jdk.version}&lt;/target&gt;
          &lt;encoding&gt;UTF-8&lt;/encoding&gt;
        &lt;/configuration&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
        &lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
        &lt;version&gt;10.0.8&lt;/version&gt;
      &lt;/plugin&gt;
    &lt;/plugins&gt;
  &lt;/pluginManagement&gt;
&lt;/build&gt;

&lt;!-- $ mvn compile war:inplace and run tomcat --&gt;
&lt;!--
&lt;build&gt;
  &lt;pluginManagement&gt;
    &lt;plugins&gt;
      &lt;plugin&gt;
        &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
        &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.3.2&lt;/version&gt;
      &lt;/plugin&gt;
      &lt;plugin&gt;
        &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
        &lt;version&gt;3.8.0&lt;/version&gt;
        &lt;configuration&gt;
          &lt;source&gt;${jdk.version}&lt;/source&gt;
          &lt;target&gt;${jdk.version}&lt;/target&gt;
          &lt;compilerArgument&gt;&lt;/compilerArgument&gt;
          &lt;encoding&gt;UTF-8&lt;/encoding&gt;
        &lt;/configuration&gt;
      &lt;/plugin&gt;
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
    &lt;/plugins&gt;
  &lt;/pluginManagement&gt;
&lt;/build&gt;
--&gt;
</pre>

<p>
After stopping Tomcat, run the following:
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn jetty:run
</pre>

<h2>Install MariaDB</h2>

<p>
<a href="https://mariadb.org/download">https://mariadb.org/download</a><br />
After running the downloaded file, click the Next button to complete the installation. Don't forget the root password you entered during installation.
</p>

<p>
Although the contents of the book deal with the Oracle database, the source is implemented so that you can test it with the MySQL database as well. MariaDB is a database compatible with MySQL, and you can use MySQL's SQL statements almost identically, and you can use MySQL's JDBC driver. In Windows, you can install MariaDB more easily than MySQL.
</p>

<h3>MariaDB database schema</h3>

<pre class="prettyprint">
mysql --user=root --password mysql

create user 'java'@'%' identified by 'school';
grant all privileges on *.* to 'java'@'%';

create database javaskool;
exit;

mysql --user=java --password javaskool

create table member (
    email varchar(60) PRIMARY KEY,
    passwd varchar(200) NOT NULL,
    name varchar(20) NOT NULL,
    mobile varchar(20)
);

create table authorities (
    email VARCHAR(60) NOT NULL,
    authority VARCHAR(20) NOT NULL,
    CONSTRAINT fk_authorities FOREIGN KEY(email) REFERENCES member(email)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(email,authority); 

create table board (
    boardcd varchar(20),
    boardnm varchar(40) NOT NULL,
    boardnm_ko varchar(40) NOT NULL,
    constraint PK_BOARD PRIMARY KEY(boardcd)
);

create table article (
    articleno int NOT NULL AUTO_INCREMENT,
    boardcd varchar(20),
    title varchar(200) NOT NULL,
    content text NOT NULL,
    email varchar(60),
    hit bigint,
    regdate datetime,
    constraint PK_ARTICLE PRIMARY KEY(articleno),
    constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

create table comments (
    commentno int NOT NULL AUTO_INCREMENT,
    articleno int,
    email varchar(60),
    memo varchar(4000) NOT NULL,
    regdate datetime,
    constraint PK_COMMENTS PRIMARY KEY(commentno)
);

create table attachfile (
    attachfileno int NOT NULL AUTO_INCREMENT,
    filename varchar(255) NOT NULL,
    filetype varchar(255),
    filesize bigint,
    articleno int,
    email varchar(60),
    filekey varchar(255),
    creation datetime,
    constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

create table views (
  no int primary key AUTO_INCREMENT,
  articleNo int,
  ip varchar(60),
  yearMonthDayHour char(10),
  unique key (articleNo, ip, yearMonthDayHour)
);

insert into board values ('chat','Chat','자유 게시판');
commit;
</pre>

<h3>Edit sources to use the MariaDB</h3>

<h6 class="src">src/main/webapp/WEB-INF/applicationContext.xml</h6>
<pre class="prettyprint">
  &lt;!-- Oracle datasource--&gt;
&lt;!--
  &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
    &lt;property name="username" value="java" /&gt;
    &lt;property name="password" value="school" /&gt;
    &lt;property name="maxActive" value="100" /&gt;
    &lt;property name="maxWait" value="1000" /&gt;
    &lt;property name="poolPreparedStatements" value="true" /&gt;
    &lt;property name="defaultAutoCommit" value="true" /&gt;
    &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
  &lt;/bean&gt;
--&gt;
  &lt;!-- MySQL datasource --&gt;
  &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
    &lt;property name="driverClassName" value="com.mysql.cj.jdbc.Driver" /&gt;
    &lt;property name="url" value="jdbc:mysql://localhost:3306/javaskool?useUnicode=true&amp;amp;characterEncoding=utf8&amp;amp;useSSL=false" /&gt;
    &lt;property name="username" value="java" /&gt;
    &lt;property name="password" value="school" /&gt;
    &lt;property name="maxActive" value="100" /&gt;
    &lt;property name="maxWait" value="1000" /&gt;
    &lt;property name="poolPreparedStatements" value="true" /&gt;
    &lt;property name="defaultAutoCommit" value="true" /&gt;
    &lt;property name="validationQuery" value="SELECT 1" /&gt;
  &lt;/bean&gt;
</pre>

<h6 class="src">src/main/java/net/java_school/controller/AdminController's index()</h6>

<pre class="prettyprint">
/*
//Oracle start
Integer startRecord = (page - 1) * numPerPage + 1;
Integer endRecord = page * numPerPage;
map.put("search", search);
map.put("startRecord", startRecord.toString());
map.put("endRecord", endRecord.toString());
//Oracle end
*/

//MySQL and MariaDB start
Integer offset = (page - 1) * numPerPage;
Integer rowCount = numPerPage;
map.put("search", search);
map.put("offset", offset.toString());
map.put("rowCount", rowCount.toString());
//MySQL and MariaDB end
</pre>

<h6 class="src">src/main/java/net/java_school/controller/BbsController's list() and view() methods</h6>

<pre class="prettyprint">
/*
//Oracle start
Integer startRecord = (page - 1) * numPerPage + 1;
Integer endRecord = page * numPerPage;
map.put("start", startRecord.toString());
map.put("end", endRecord.toString());
//Oracle end
*/

//MySQL and MariaDB start
Integer offset = (page - 1) * numPerPage;
Integer rowCount = numPerPage;
map.put("offset", offset.toString());
map.put("rowCount", rowCount.toString());
//MySQL and MariaDB end
</pre>

<h6 class="src">src/main/resources/net/java_school/mybatis/BoardMapper.xml</h6>

<pre class="prettyprint">
&lt;!-- MySQL and MariaDB start --&gt;
&lt;select id="selectListOfComments" parameterType="int" resultType="Comment"&gt;
    SELECT 
        commentno, 
        articleno, 
        c.email, 
        ifNull(name, 'Anonymous') name,
        memo, 
        regdate
    FROM comments as c left join member as m on c.email = m.email
    WHERE 


&lt;-- Omit --&gt;


        &lt;if test="searchWord != null and searchWord != ''"&gt;
        AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
        &lt;/if&gt;
&lt;/select&gt;
&lt;!-- MySQL and MariaDB end --&gt;

&lt;!-- Oracle start --&gt;
&lt;!-- 	
&lt;select id="selectListOfComments" parameterType="int" resultType="Comment"&gt;
    SELECT 
        commentno, 
        articleno, 
        c.email, 
        NVL(name, 'Anonymous') name,
        memo, 
        regdate
    FROM 
        comments c left join member m on c.email = m.email
    WHERE 

.. Omit .. 


&lt;/select&gt;	
--&gt;   
&lt;!-- Oracle end --&gt;	
</pre>

<h6 class="src">src/main/resources/net/java_school/mybatis/UserMapper.xml</h6>

<pre class="prettyprint">
&lt;!-- MySQL and MariaDB start --&gt;
&lt;select id="selectTotalCount" resultType="int"&gt;
    SELECT count(*)
    FROM member
    &lt;if test="search != null and search != ''"&gt;
    WHERE
    
    
&lt;-- Omit --&gt;
    
    
    ORDER BY name ASC
    LIMIT ${offset}, ${rowCount}
&lt;/select&gt;
&lt;!-- MySQL and MariaDB end --&gt;

&lt;!-- Oracle start--&gt;
&lt;!--    
&lt;select id="selectTotalCount" resultType="int"&gt;
    SELECT count(*)
    FROM member


-- Omit --


&lt;/select&gt;
--&gt;
&lt;!-- Oracle end --&gt;
</pre>

<h3>Test in Tomcat</h3>

<p>
Execute mvn clean first before editing the pom.xml file.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
In the pom.xml file, Comment out the Jetty configuration, uncomment the Tomcat configuration, and then compile with the following command:
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn compile war:inplace
</pre>

<p>
After running Tomcat using Tomcat Monitor, visit http://localhost:8080 to test it.
</p>

<h3>Test Admin mode</h3>

<p>
Grant the admin role to a registered someone.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mysql --user=java --password javaskool

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
Log in as a member with an administrator role and check if the administrator menu is visible.
</p>

<h3>Test in Jetty</h3>

<p>
Execute mvn clean before editing the pom.xml file.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
In the pom.xml file, Comment out the Tomcat configuration, uncomment the Jetty configuration, and then execute the following command:
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn jetty:run 
</pre>
<div class="explain">
<p>
<b>Note:</b>
In most cases where you see the following error message when trying to log in, it is because your system did not start Oracle.
</p>

<p>
<img src="https://lh3.googleusercontent.com/p5rGTDVSWP5VlEQQI8H738n0oWYLfE2c68GgpI-QHWRJZxCGyJ1lu8n1ymATpXyjyRP510CKV0zDnvqAYVyivFzoI_qWvW53DNi9-S9Zf5QuIZOzEn8Fp4E7bqrtM6yS3kgWmTC7hfh2Twc9riztt3Zz7YO7T_BE8aRFfPa-_oonAWgx7p2_mWByOOSklCyetgMihNBgIxX7jev4eoMwlsaR441Bp9wexmRVjMe4TigbyTgqQONLu-KJ9T_EkquRqqPmH2f-bgz664fKtREI9-oKvQzfo3-7DajPdHnwQvr554dROaS9SSe40-0jOUvBVgf9qawQ8FdwaAqP3ipbRUHE3zdg8fZMuiNRUou8kbIHH-HY-desXOZKA4Y6dDmAPWjADVnGX1e3dheE24bBKeYnq49mBJ2z5vy6-GLCSZvuOAsiul4ZOgM3DnrzMEAARFrQuEsjJal3qw9qaeyal5SOd8BroOSQ_v5KsS07TEvXJtN8MfZsiAmnmTHVUlc2HRl7ENIuyGp5Kn_fVr5PZaZVxi19Bl47L6N4a4U6wdYeMyy5dl3ZCBDuNesZZooE2Qn04DxhlHpZiEfBT6zFXk9awk3Qc4agBz02r65_4XM4gXUki66b0DwuZTdIOjD5cItuhBoq1Mjq-3Hw0GCnS3cnZAPPFXUFrA4UzdmLW4KGUeLSq9YMM1kmab-ChlmF0i9s2gGF6fDHW_8qwOWco8ERdcKBiBNJIljI-n9mug4Eqcb1tqIKguN6Jdk=w794-h355-no?authuser=0" alt="Log in failed" />
</p>

<p>
Start Oracle database.
</p>

<p>
<img src="https://lh3.googleusercontent.com/hgZnOQJZafrYzVNYmylu21CfhhrHe7k7eM9lceZJSii4yVQhkASh-sTV9y8YokBZ0_MyS9iMm-9xwPjgEZnN-PkvbjCXTd5CA1YSAlJU6Cuza-E2TeKeXYI5hFeEnOy8UfY2jmkqocufk8Sy18up0vbv8bbSDZs8jkru-7KVhfpS13rTTivyT9dhWdQN_L6oafBizxDO5D2UjBgMzHI7qkUCkYI9rnfslJJBHx-WGi7XF49GmT_e5HtrEYaYqFdV5Hv6VHJjgeJKo-euKhKOpYsq1IZePW2rtRR4NJBDbI6n_-rJr6dco6flxZVVePqiN4xUklV9kORXJ3LzgEOuYw-X-Htonhl7x-ZfBtp6scOIjVHO_A9mfUhCVm3YJFkzomOgiv7AAxNEnJUeY8nZpLCRY5TkuPr_NGt37PRgNO1LzA9Sv4yaMvxY_c3R72ZnuBcrksvM9gFysBJyVT44tJr3GX-VFkA7dE8ORYtnkkf-W3GFYv9jg9uLq2et3FrV2A0wrEeCqO1vmzmm7SQZBj3VI1JPiupLh7qlqdh0bUhaDpm10jAoPMU5M10Pa5DYeW1X-LzKcr8oOetquwAXfrXJV-dE-tAtiZ-34lAPt8YYVAhiwy2uaNzu4V3pKoufQCIMpqYsjKX-4vIlOnTGxCz1_MnD5L7tusrDNpHgu_IE-E5c5TwbxU2LLasHeCadOgQBdLtnCAYMermdyXycF5qCCyMl17WpRA3GW7tvScNRN0ClvCbb5d2ttRE=w322-h473-no?authuser=0" alt="Start Database" />
</p>

<p>
If Tomcat Startup Type is Manual, Tomcat does not start automatically after booting.
</p>

<p>
Start Tomcat.
</p>

<p>
<img src="https://lh3.googleusercontent.com/YbVPxLgbxWGrl_nUINvNmQtLnrEa42kYBXtgkePBrsw7OBKStr_3Fhkf-qFFuIoQB_YDxYtyR9cZxodRqHusFVrd754hOCZ5f7qbba1KnCPpLCT_zH92EyUQunp1R0h82ok_AbT3rTchw67J2cRjI8avRH4HzEgICVGZ-jWyFNPwv3YjtnytHNS1oPB7f2bygiT-YNURC7ls4H-f5W1rKkRiPRm-mRM_9aSBfseblFPWNQadrqBiV2tdXYRIsE5Epa77QdTiqTYIj0KOas9wPa4iJXXoPj4N3XvOY9UCJTVcGKP2vq4a8Dcm7URnY3tRJofuXxmAvnTYJjZ845CoxjrRO2ybGhFfjIWZgPTOJZY0qNB8IMSB229e4jlWU0klHcfDYghB25Bl42yUzeadVWgr4WA3f5OnocgC4G0evyepCD55Kr8KqwYJr9Pm_zsJt8Hmn5nXncJo7fnntCkDXUOfndSMt53CmAc0ED32AeiubsTEgZ4p4KNEA7tH6OVZ9K4V0ZAttybqczVtjNE9CuhEqLXK9m40IzrkrsNLc1iB_1b1VlO2_cZrw9_4z6K8_4LpjzcoT2LlFXPC4e9PIMUyrTIrxo769aA-haxU3_EkHO6lFS9YVeiM3JzUZqIOhTNp7dGYwUq-po3TomlBBdWb3xtaTzz0Lu_pW2rBq2FdmMaHR6I31p-ohvopuK_fYszHakDGUSLG0WEkPJ8zDjYCQrsGRNfZcNbRUirI_Mz8bOPk2x5_YbqJsyI=w325-h362-no?authuser=0" alt="Monitor Tomcat" />
</p>

<p>
<img src="https://lh3.googleusercontent.com/zDln74pTefrijGGtejutdrxuUnJUov5p211HVQZ6gd0SUQXQ8xHArJsW7J-lmuE3Vi625L1Vg8tmAQjiYeFGhKedrDBD9n-vtoqLNF_CmHYtmXlniafl3qxfNI-20nleQ66X33DEHdWyGznZSrn0MFm1SIf3ONRBdM7UskWn7kmT1IHT8YpmzLpv5H44zKYT5yoLURi-CGVoh3IIIa-1s3GEh3g5eiTd-SSVl3a6JR3YW9sIVmOLtcIIuJ-mFdk_R09Nqt44gTZ_ERPdiS7k5qWfl6Ev8HKOErQwBQQyucxUx5riiCPDbLyR1wKi6NdQkmrBjerDSw-wEqrTx7RL51Tri9CAVa6ZkhG4sSvISlbhKW0x7UcTvkcbkAVIbwlgZynrykVVjxEBGqnHMNFS2UG26itXpYacSzcqmfQ_jB4pZf4jXERQqIUzju47k5hDpkaEfz0XB4YkyBsMS_2Lkvf1dWVllu8En8xB9M15i2LRKkP4rVEdQKh2MtO9HqAJ0crRgQgusjQ3gPzOtfvq3zN4HIcYoRhorpIgsmatqijOcrRAS2SFkN_tTpMAOG4Urn5HZVrOlYiWtLZxvkBbNTw0ccNt2DjxtsrofgQXKHMYxBkmd3sAnKEHWR7bjCQDCnMPl-9bdDx5Uotv8nbit9pF1ohsKAXF0aVhljOAeQOD2XwnoSkkIAePZo-1pw8j-9_fIkt5YaO8NCoagOOd9uy3PwxV_Twx_Ktgyjpp9Bmd_YEz7O4hTC-sEK4=w485-h177-no?authuser=0" alt="Apache Commons Daemon Service Manager" />
</p>

</div>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/">Java Install</a></li>
	<li><a href="/spring/building-java-projects-with-maven">Building Java Projects with Maven</a></li>
	<li><a href="/jsp/How-to-install-Tomcat">Tomcat Install</a></li>
	<li><a href="/jsp/Creating-a-new-web-application">Creating a new web application</a></li>
	<li><a href="/blog/2017/jetty-maven-plugin">Jetty Maven Plugin</a></li>
	<li><a href="/jdbc/How-to-install-Oracle">Oracle Install</a></li>
	<li><a href="/blog/2019/java-development-environment-on-ubuntu-18">Java Development Environment on Ubuntu 18.04</a></li>
	<li><a href="/blog/2017/Setting-development-environment-in-Ubuntu">Development in Ubuntu</a></li>
</ul>

</article>
