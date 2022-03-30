<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.3.30</div>

<h1>윈도 10에서 책 예제 테스트</h1>

<h2>Java 설치</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads">https://www.oracle.com/java/technologies/downloads</a><br />
최신 버전, 17을 선택해 설치 후, JDK의 bin 디렉터리를 시스템 변수의 Path에 추가한다.
</p>

<h2>Maven 설치</h2>

<p>
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a><br />
최신 버전의 바이너리 파일을 내려받아 압축을 풀고 생성된 디렉터리를 원하는 곳에 복사한 후, 메이븐의 bin 디렉터리를 시스템 변수의 Path에 추가한다.
</p>

<h2>Git 설치</h2>

<p>
<a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a><br />
Next 버튼을 계속 눌러 설치할 수 있으나 원하지 않는 데이터베이스가 설치될 수 있으니 주의해서 설치를 완료한다.<br />
자신의 이름과 이메일을 git 설정에 추가한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">git config --global user.name "Gildong Hong"
git config --global user.email hong@gmail.org
</pre>

<p>
설정한 내용을 확인한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">git config --global --list 
</pre>

<h2>Tomcat 설치</h2>

<p>
<a href="https://tomcat.apache.org/download-90.cgi">https://tomcat.apache.org/download-90.cgi</a><br />
버전 9를 설치한다.
버전 10부터는 톰캣을 사용하는 서블릿 API의 네임스페이스가 변경되었다.
</p>

<h2>Oracle Database 11gR2 Express Edition 설치</h2>

<p>
개인 컴퓨터에 설치해 데이터베이스를 공부하는 용도로는 11g XE가 최신 버전보다 낫다.
</p>

<p>
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html<br />
64비트 윈도 시스템이면, --대부분 시스템이 64비트 시스템이다-- Oracle Database 11gR2 Express Edition for Windows x64를 내려받는다. 이 버전을 내려받으려면 오라클 사이트의 계정이 필요하다. 회원가입을 하고 로그인하면 내려받기가 시작된다.
</p>

<p>
11g XE 구성 요소 중 하나인 Oracle Application Express가 8080 포트를 사용하므로, 설치에 앞서 톰캣이 서비스 중이면 중지시킨다.
</p>

<p>
내려받은 압축 파일을 풀면 생성되는 Disk1 서브 디렉터리에서 setup.exe를 실행한 후, 다음 버튼을 계속 눌러 설치한다. 윈도 10은 11g 버전이 공식 지원하는 OS이기에 간단히 오라클이 설치된다. 설치 과정에서 자신이 입력한 관리자 비밀번호는 잊지 않도록 한다. 
</p>

<p>
윈도의 경우 Oracle Application Express의 디폴트 포트인 8080을 설치 과정에서 변경할 수 없다. 설치 후 Apex의 8080 포트를 9090으로 바꾸는 방법은 다음과 같다. 
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

<h2>테스트</h2>

<h3>책 예제 복사</h3>

<p>
git를 사용해 예제를 로컬 시스템에 내려받는다.
</p>

<pre class="prettyprint no-border">
git clone https://github.com/kimjonghoon/JavaWebProgramming
</pre>

<h3>업로드 디렉터리 수정</h3>

<p>
net.java_school.commons 패키지의 WebContants.java 파일을 열고 업로드 디렉터리를 자신의 시스템에 맞게 수정한다.
</p>

<h3>로그 파일 경로 수정</h3>

<p>
src/main/resources 폴더의 log4j2.xml 파일을 열고 로그 파일 경로를 수정한다.
</p>

<h3>오라클 데이터베이스 스키마</h3>

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

<h3>로컬 레포지터리에 Oracle JDBC 드라이버 설치</h3>

<p>
다음과 같이 Oracle JDBC 드라이버를 로컬 저장소에 수동으로 설치한다.
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

<h3>ROOT.xml 파일 생성</h3>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users&gt;cd C:\Program Files\Apache Software Foundation\Tomcat 9.0\conf\Catalina\localhost
C:\Program Files\Apache Software Foundation\Tomcat 9.0\conf\Catalina\localhost&gt;notepad ROOT.xml
</pre>

<p>
C:\JavaWebProgramming가 루트 디렉터리라면, 다음과 같이 ROOT.xml 파일을 작성한다.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="<strong>C:/JavaWebProgramming</strong>/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
톰캣을 재시작한다.
</p>

<p>
http://localhost:8080을 방문해 회원가입하고 게시판을 테스트한다.
</p>

<h3>관리자 모드 테스트</h3>

<p>
특정 회원에 관리자 롤을 부여한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">sqlplus java/school

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
로그아웃 후 다시 로그인하면 관리자 메뉴를 볼 수 있다.
</p>

<h3>Jetty 플러그인을 사용한 테스트</h3>

<p>
pom.xml에는 제티 플러그인 사용을 위한 설정이 있다.
pom.xml 파일을 편집하기 전에 mvn clean을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
제티 플러그인 설정에 있는 주석을 해제하고 톰캣 설정은 주석처리한다.
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
톰캣을 정지한 후, 다음을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn jetty:run
</pre>

<h2>MariaDB 설치</h2>

<p>
<a href="https://mariadb.org/download">https://mariadb.org/download</a><br />
책 내용은 오라클 데이터베이스를 다루고 있으나 소스는 MySQL 데이터베이스로도 테스트할 수 있게 구현되어 있다. MariaDB는 MySQL과 호환되는 데이터베이스로 MySQL의 SQL문을 거의 동일하게 사용할 수 있으며 MySQL의 JDBC 드라이버를 사용할 수 있다. 윈도 환경에서 MySQL보다 MariaDB를 쉽게 설치할 수 있다. Next 버튼을 눌러 설치할 수 있는데, 설치 과정에서 자신이 설정한 root 패스워드를 기억해야 한다.
</p>

<h3>MariaDB 데이터베이스 스키마</h3>

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

<h3>MariaDB를 사용하기 위한 소스 편집</h3>

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


&lt;-- 중간 생략 --&gt;


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

중간 생략


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
    
    
&lt;-- 중간 생략 --&gt;
    
    
    ORDER BY name ASC
    LIMIT ${offset}, ${rowCount}
&lt;/select&gt;
&lt;!-- MySQL and MariaDB end --&gt;

&lt;!-- Oracle start--&gt;
&lt;!--    
&lt;select id="selectTotalCount" resultType="int"&gt;
    SELECT count(*)
    FROM member


중간 생략


&lt;/select&gt;
--&gt;
&lt;!-- Oracle end --&gt;
</pre>

<h3>관리자 모드 테스트</h3>

<p>
관리자 모드를 테스트하려면 등록된 회원에 관리자 Role를 부여한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mysql --user=java --password javaskool

insert into authorities values ('<em>가입되어 있는 회원의 이메일</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<h3>톰캣 테스트</h3>

<p>
pom.xml 파일을 편집하기 전에 먼저 mvn clean을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
pom.xml 파일에서 제티 설정은 주석처리, 톰캣 설정은 주석 해제한 후, 다음 명령으로 컴파일한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn compile war:inplace
</pre>

<p>
톰캣 모니터를 사용해 톰캣을 실행한 후, http://localhost:8080을 방문해 테스트한다.
</p>

<h3>제티 테스트</h3>

<p>
먼저 mvn clean을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn clean
</pre>

<p>
pom.xml 파일에서 톰캣 설정은 주석 처리하고 제티 설정은 주석 해제한다.
</p>

<p>
제티를 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mvn jetty:run 
</pre>
<div class="explain">
<p>
<b>Note:</b>
시스템 리부팅 후 로그인 시도에서 아래와 같은 에러 메시지를 보게 되는 경우는 대부분 오라클이 시작되지 않았기 때문이다.
</p>

<p>
<img src="https://lh3.googleusercontent.com/O6BBBAXodo8nhhsyTFBbZmYOE0qIV-6Sx-mRIQqSR8BfGfF200OnaBI7vVcxaxKVBTa0NxXyxB6nu0Jbe7qvvlyAnbXyrj7btWCM2ceKv5Nw5HeFp8o_aGsoeIE3v2qH92Uqu7er-blabcriLoNMnIimyrOpieVir0Xut0KggrG9hms-veqy8olJvoF2D328wsgaq-sjZdQ-Ty1an5XAeXjmIfK19S_vmvyVrBjpX8-ObiWb3cHUPzLNhGN8M_jUFdu9T_8wD6_49g_0tBYI_kMlOR6GNjBEtFtEE2BDqwjE_edbw7bhgDWsAk8Y9dCOVCN9IQYlh3sIRbrKgIdqu4b146gOl2OjUA0xnfhKKhxQpZA3BqXIXvsd1uqLAQiP4kaR1gGZEoXgg2j1VTwiCe_iMBDaYLPjAfF6re38clabHG_SNj8zTRfTD-uQGiBg2koyHgyU9EPt504yoM1rfUmcdxN8sgtvWkfzVT1IdcfMTGsRGiKnwiAJCG-J7Eq8AaV-bwFqRlCzFHuNdYZ8vOWcm6-itk3ImpoMlUdj8Ef3Pt03fs6h8RrchEM5_PrnYRiyrow31DwG7WkxCYAgmMA8aI28uEAPI6fegxi_LEjTKRgtjns8HHnMkwNf26gXGtO_BjAfC8gaw3UeyABMutYk9Htvc57ueLit4dEnVluEvMxRj_gmn_amCOJZnE8J2YWcrjkm2I6Le3td1aNdJNAPMqtqx5xdxV1iRkOC8nkzfzZx93yPRUx6dKw=w794-h351-no?authuser=0" alt="로그인 실패" />
</p>

<p>
오라클 데이터베이스를 시작한다.
</p>

<p>
<img src="https://lh3.googleusercontent.com/hgZnOQJZafrYzVNYmylu21CfhhrHe7k7eM9lceZJSii4yVQhkASh-sTV9y8YokBZ0_MyS9iMm-9xwPjgEZnN-PkvbjCXTd5CA1YSAlJU6Cuza-E2TeKeXYI5hFeEnOy8UfY2jmkqocufk8Sy18up0vbv8bbSDZs8jkru-7KVhfpS13rTTivyT9dhWdQN_L6oafBizxDO5D2UjBgMzHI7qkUCkYI9rnfslJJBHx-WGi7XF49GmT_e5HtrEYaYqFdV5Hv6VHJjgeJKo-euKhKOpYsq1IZePW2rtRR4NJBDbI6n_-rJr6dco6flxZVVePqiN4xUklV9kORXJ3LzgEOuYw-X-Htonhl7x-ZfBtp6scOIjVHO_A9mfUhCVm3YJFkzomOgiv7AAxNEnJUeY8nZpLCRY5TkuPr_NGt37PRgNO1LzA9Sv4yaMvxY_c3R72ZnuBcrksvM9gFysBJyVT44tJr3GX-VFkA7dE8ORYtnkkf-W3GFYv9jg9uLq2et3FrV2A0wrEeCqO1vmzmm7SQZBj3VI1JPiupLh7qlqdh0bUhaDpm10jAoPMU5M10Pa5DYeW1X-LzKcr8oOetquwAXfrXJV-dE-tAtiZ-34lAPt8YYVAhiwy2uaNzu4V3pKoufQCIMpqYsjKX-4vIlOnTGxCz1_MnD5L7tusrDNpHgu_IE-E5c5TwbxU2LLasHeCadOgQBdLtnCAYMermdyXycF5qCCyMl17WpRA3GW7tvScNRN0ClvCbb5d2ttRE=w322-h473-no?authuser=0" alt="Start Database" />
</p>

<p>
<img src="https://lh3.googleusercontent.com/nhjJQHukNRHZcSnF4vzhGnUd3cWavPjLPoR4MGFYqWIzAawrQ_tR8_zHUiGCFvZxHEmHgNah9ON7LtSb9gwwbiHC7raqsiwMtSNXrbC-adY6FCvzgXfVU317lvfWdLhcibuJfPDBEvmqjxzhav3kr9sNbHUHEd3cN_l53L6Cr3wc5YXTavhclD6om0L6U0xOx6mhpSi1wadOowR-jU_548zEM2Y5Byb2M2Svy4fwbXRrVp8N34yZ_RDeigEmzZwO-b6PSc6PDBfjYyB5gTZP125yHoffA86nEsOp85CEsfLyMeZeq5X-eGIWRHenRysR_S0xaaLGOwMP2Ujtn-gH5DS7Aa1Ma-ECr5eXXT0fXkIfMUnyXpGv0VwVxVKAA9S3LWVY3Ivc_-_VfHD3QnzM5AJwhroIAhqBCEJ-7ukATn25BDi_slWfjVhAHi72R8HYH5nPmqCzjUjXxYikWObbOBzZ4F2x9aFQ3AaXL_LqkK8BVJSdgHFOMoTTRwBJ59WkceZ8xltor9_cEivtZnXZfhcaRF6wpKgJkV-BplYOrDuaJrlZjNKq6VHsWv1V2LAu6a9g432T3TYEqFfrP1lOQ4BT6NG8AhrqSf-3IAX-47HmlcbOtYSZvn_wTgj1QqazU7PTxacFpCacZw4jbZ__4xpqMEKCrcqER3V_ww5cBvs2HygequJ08P4NrwfYGQIWmMc6QfRYwPk1708A2A19Dj_62hRNFuVMzllrIQexH6ayLTruWgZ5-xcu9QQ=w597-h175-no?authuser=0" alt="Confirm OracleServiceXE" />
</p>

<p>
톰캣 Startup Type이 Manual이면, 부팅 후 톰캣이 자동으로 시작되지 않는다.
테스트를 위해 아래와 같이 톰캣을 실행한다.
</p>

<p>
<img src="https://lh3.googleusercontent.com/YbVPxLgbxWGrl_nUINvNmQtLnrEa42kYBXtgkePBrsw7OBKStr_3Fhkf-qFFuIoQB_YDxYtyR9cZxodRqHusFVrd754hOCZ5f7qbba1KnCPpLCT_zH92EyUQunp1R0h82ok_AbT3rTchw67J2cRjI8avRH4HzEgICVGZ-jWyFNPwv3YjtnytHNS1oPB7f2bygiT-YNURC7ls4H-f5W1rKkRiPRm-mRM_9aSBfseblFPWNQadrqBiV2tdXYRIsE5Epa77QdTiqTYIj0KOas9wPa4iJXXoPj4N3XvOY9UCJTVcGKP2vq4a8Dcm7URnY3tRJofuXxmAvnTYJjZ845CoxjrRO2ybGhFfjIWZgPTOJZY0qNB8IMSB229e4jlWU0klHcfDYghB25Bl42yUzeadVWgr4WA3f5OnocgC4G0evyepCD55Kr8KqwYJr9Pm_zsJt8Hmn5nXncJo7fnntCkDXUOfndSMt53CmAc0ED32AeiubsTEgZ4p4KNEA7tH6OVZ9K4V0ZAttybqczVtjNE9CuhEqLXK9m40IzrkrsNLc1iB_1b1VlO2_cZrw9_4z6K8_4LpjzcoT2LlFXPC4e9PIMUyrTIrxo769aA-haxU3_EkHO6lFS9YVeiM3JzUZqIOhTNp7dGYwUq-po3TomlBBdWb3xtaTzz0Lu_pW2rBq2FdmMaHR6I31p-ohvopuK_fYszHakDGUSLG0WEkPJ8zDjYCQrsGRNfZcNbRUirI_Mz8bOPk2x5_YbqJsyI=w325-h362-no?authuser=0" alt="Monitor Tomcat" />
</p>

<p>
<img src="https://lh3.googleusercontent.com/zDln74pTefrijGGtejutdrxuUnJUov5p211HVQZ6gd0SUQXQ8xHArJsW7J-lmuE3Vi625L1Vg8tmAQjiYeFGhKedrDBD9n-vtoqLNF_CmHYtmXlniafl3qxfNI-20nleQ66X33DEHdWyGznZSrn0MFm1SIf3ONRBdM7UskWn7kmT1IHT8YpmzLpv5H44zKYT5yoLURi-CGVoh3IIIa-1s3GEh3g5eiTd-SSVl3a6JR3YW9sIVmOLtcIIuJ-mFdk_R09Nqt44gTZ_ERPdiS7k5qWfl6Ev8HKOErQwBQQyucxUx5riiCPDbLyR1wKi6NdQkmrBjerDSw-wEqrTx7RL51Tri9CAVa6ZkhG4sSvISlbhKW0x7UcTvkcbkAVIbwlgZynrykVVjxEBGqnHMNFS2UG26itXpYacSzcqmfQ_jB4pZf4jXERQqIUzju47k5hDpkaEfz0XB4YkyBsMS_2Lkvf1dWVllu8En8xB9M15i2LRKkP4rVEdQKh2MtO9HqAJ0crRgQgusjQ3gPzOtfvq3zN4HIcYoRhorpIgsmatqijOcrRAS2SFkN_tTpMAOG4Urn5HZVrOlYiWtLZxvkBbNTw0ccNt2DjxtsrofgQXKHMYxBkmd3sAnKEHWR7bjCQDCnMPl-9bdDx5Uotv8nbit9pF1ohsKAXF0aVhljOAeQOD2XwnoSkkIAePZo-1pw8j-9_fIkt5YaO8NCoagOOd9uy3PwxV_Twx_Ktgyjpp9Bmd_YEz7O4hTC-sEK4=w485-h177-no?authuser=0" alt="Apache Commons Daemon Service Manager" />
</p>

<p>
<img src="https://lh3.googleusercontent.com/kzkZ9HXctO0ZiBMewbpUKcPNHaBTm0BhKQzsCR9DO2kFOi2vDCYsXl6wqUsw5ehiokD3W750LARx52pkOIi3dBDzgt2tIbPSddz1bTwawOVNqZpj21HPHPo7dgsfQhyWufE9oc3CWHruXciv35N55KfJGVBSOfuRz2TxHX_Ya-xYsWcFgnY_FsY4SLoYh3rGiYous02kZrNEhDg8dNNOZcy6py1JrD3fJCQeSGpqi6w8Qtv41osVwVsuGXvngQvekXwkDOZ6qKnBktm1CIKu0sKUQHRJrlejuGsfdpS-nD3J1yLGQ7Kx9AFc7DBzlTPtHbvs4xxuZoBs1dbjvpxAnKcJ75zXmPLKePHL_lPb4ZOfh4Ba0_MgwmSSDAn5tbC_tT1R_CFboADd0abeGeBBT9oWMvXDexTOZ0qq99-kTm0R4TiV3LPd3UQ2zIwjf5rAVGAWbMvAFGtMKuMin-BbTuy4rE35tW24rfR_ftyt5dsB3EluvFObmcyFC6rMc62C54Y4MJZOMZh5uXC5MK5UbAIogqA9iiZnsqS7ER7MSDYvH3hC1MxnlrMP3TK0CEJKBpKpPOiwD__ywFbttNz77WgTto5xQFehbAzNV3vsrf_BwakDFVDMRWcGT0_lkHGFJbl1u5_Dya8XTKMm2xeCrLWyOe8wpSJXw7JBF_eVDbWKOOfRoDrP_woniNi6539TAABtKFXb0CRaEf9fQPsIzmPykXadkQLL67f0tinNs0OyqD4ox0S3bsdvt9k=w414-h499-no?authuser=0" alt="Apache Tomcat 9.0 Tomcat9 Properties" />
</p>
</div>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="/">자바 설치</a></li>
	<li><a href="/spring/building-java-projects-with-maven">메이븐으로 자바 개발</a></li>
	<li><a href="/jsp/How-to-install-Tomcat">톰캣 설치</a></li>
	<li><a href="/jsp/Creating-a-new-web-application">웹 애플리케이션 작성 실습</a></li>
	<li><a href="/blog/2017/jetty-maven-plugin">제티 메이븐 플러그인</a></li>
	<li><a href="/jdbc/How-to-install-Oracle">오라클 설치</a></li>
	<li><a href="/blog/2019/java-development-environment-on-ubuntu-18">우분투 18.04에 자바 개발 환경 만들기</a></li>
	<li><a href="/blog/2017/Setting-development-environment-in-Ubuntu">우분투 개발환경</a></li>
</ul>

</article>
