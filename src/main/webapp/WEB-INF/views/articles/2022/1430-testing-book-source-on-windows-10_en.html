<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Testing the boook source on Windows 10</title>
<meta name="Keywords" content="java,JavaWebProgramming final source,how to test the book source on windows 10" />
<meta name="Description" content="This article describes how to test the book source on windows 10." />
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
<div class="last-modified">Last Modified 5.30.2025</div>

<h1>Testing the book source on Windows 10</h1>

<h2>Install Java</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads">https://www.oracle.com/java/technologies/downloads</a><br />
After installing the latest version, add the JDK bin directory to the Path of the system variable.
</p>

<h2>Install Maven</h2>

<p>
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a><br />
Download and unzip the latest binary version, copy the created directory to the location you want, and add Maven's bin directory to the Path of the system variable.
</p>

<h2>Install Git</h2>

<p>
<a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a><br />
Download 64-bit Git for Windows Setup.<br />
You can complete the installation simply by clicking the Next button.
</p>

<p>
Add your name and email to your git config.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global user.name "Jo Maso"
git config --global user.email jo@gmail.org
</pre>

<p>
Verify.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global --list 
</pre>

<h2>Install Oracle Database 11gR2 Express Edition</h2>

<p>
11g XE is better than the latest version for studying databases by installing it on a personal computer.
</p>

<p>
<a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a><br />
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

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users&gt; sqlplus
Enter user-name: system
Enter password:
Connected.

SQL&gt; Exec DBMS_XDB.SETHTTPPORT(9090);

PL/SQL procedure successfully completed.

SQL&gt;
</pre>

<h2>Install Tomcat 11</h2>

<p>
<a href="https://tomcat.apache.org/download-11.cgi">https://tomcat.apache.org/download-11.cgi</a><br />
download Windows Service Installer.<br />
</p>

<h2>Test</h2>

<h3>Clone the book source</h3>

<pre>git clone https://github.com/kimjonghoon/JavaWebProgramming</pre>

<h3>Edit the upload directory</h3>

<p>
Open the WebContants.java file in the net.java_school.commons package and modify the upload directory to match your system.
</p>

<h3>Modify the log file path</h3>

<p>
Open the log4j2.xml file in the src/main/resources folder and modify the log file path to match your system.
</p>

<h3>Oracle database schema</h3>

<div th:replace="~{articles/commons/database-design :: content}"></div>

<h3>Create ROOT.xml</h3>

<p>
If C:\JavaWebProgramming is your root directory, create ROOT.xml as shown below and copy it to the conf/Catalina/localhost folder of Tomcat.(Create this folder if it doesn't exist)
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

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">sqlplus java/school

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
Log in as a member with an administrator role and check if the administrator menu is visible.
</p>

<h3>Test in Jetty</h3>

<p>
stop Tomcat and run the following:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean jetty:run
</pre>

<h2>Install MariaDB</h2>

<p>
<a href="https://mariadb.org/download/">https://mariadb.org/download/</a><br />
After running the downloaded file, click the Next button to complete the installation. Don't forget the root password you entered during installation.
</p>

<p>
Although the contents of the book deal with the Oracle database, the source is implemented so that you can test it with the MySQL database as well. MariaDB is a database compatible with MySQL, and you can use MySQL's SQL statements almost identically, and you can use MySQL's JDBC driver. In Windows, you can install MariaDB more easily than MySQL.
</p>

<h3>MariaDB database schema</h3>

<div th:replace="~{articles/commons/database-design-mysql :: content}"></div>

<h3>Edit sources to use the MariaDB</h3>

<h6 class="src">src/main/webapp/WEB-INF/applicationContext.xml</h6>
<pre class="prettyprint">
&lt;!-- Oracle datasource--&gt;
&lt;!--
&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close"&gt;
  &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
  &lt;property name="url" value="jdbc:oracle:thin:@localhost:1521:XE" /&gt;
  &lt;property name="username" value="java" /&gt;
  &lt;property name="password" value="school" /&gt;
  &lt;property name="maxTotal" value="100" /&gt;
  &lt;property name="maxWaitMillis" value="1000" /&gt;
  &lt;property name="poolPreparedStatements" value="true" /&gt;
  &lt;property name="defaultAutoCommit" value="true" /&gt;
  &lt;property name="validationQuery" value=" SELECT 1 FROM DUAL" /&gt;
&lt;/bean&gt;
--&gt;
&lt;!-- MySQL datasource --&gt;
&lt;bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close"&gt;
  &lt;property name="driverClassName" value="com.mysql.cj.jdbc.Driver" /&gt;
  &lt;property name="url" value="jdbc:mysql://localhost:3306/javaskool" /&gt;
  &lt;property name="username" value="java" /&gt;
  &lt;property name="password" value="school" /&gt;
  &lt;property name="maxTotal" value="100" /&gt;
  &lt;property name="maxWaitMillis" value="1000" /&gt;
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
        articleno = #{articleNo}
    ORDER BY commentno DESC
&lt;/select&gt;	
&lt;insert id="insertComment" parameterType="Comment"&gt;
    INSERT INTO comments (articleno, email, memo, regdate)
    VALUES (#{articleNo}, #{email}, #{memo}, now())
&lt;/insert&gt;	
&lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title 
    FROM article 
    WHERE 
        boardCd = #{boardCd} 
        AND articleno &gt; #{articleNo}
    &lt;if test="searchWord != null and searchWord != ''"&gt;
        AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
    &lt;/if&gt; 
    ORDER BY articleno
    LIMIT 1
&lt;/select&gt;
&lt;select id="selectPrevOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title 
    FROM article 
    WHERE 
        boardCd = #{boardCd} 
        AND articleno &lt; #{articleNo}
    &lt;if test="searchWord != null and searchWord != ''"&gt;
        AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
    &lt;/if&gt; 
    ORDER BY articleno DESC
    LIMIT 1
&lt;/select&gt;	
&lt;select id="selectOne" parameterType="int" resultType="Article"&gt;
    SELECT 
        a.articleno,
        title,
        content,
        a.email,
        ifNull(name, 'Anonymous') name,
        regdate
    FROM 
        article as a left join member as m on a.email = m.email
    WHERE 
        a.articleno = #{articleNo}
&lt;/select&gt;	
&lt;insert id="insertOneViews" parameterType="hashmap"&gt;
    INSERT INTO views (articleNo, ip, yearMonthDayHour) values (#{articleNo}, #{ip}, #{yearMonthDayHour})
&lt;/insert&gt;	
&lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
    INSERT INTO attachfile (filename, filetype, filesize, articleno, email)
    VALUES
    (#{filename}, #{filetype}, #{filesize}, #{articleNo}, #{email})
&lt;/insert&gt;
&lt;insert id="insert" parameterType="Article" useGeneratedKeys="true" keyProperty="articleNo"&gt;
    INSERT INTO article (boardcd, title, content, email, regdate)
    VALUES
    (#{boardCd}, #{title}, #{content}, #{email}, now())
&lt;/insert&gt;
&lt;select id="selectListOfArticles" parameterType="hashmap" resultType="Article"&gt;
    SELECT 
        a.articleno, a.title, a.regdate,
        count(distinct(v.no)) hit, 
        count(distinct(f.attachfileno)) attachfileNum, 
        count(distinct(c.commentno)) commentNum
    FROM 
        article as a left join attachfile as f on a.articleno = f.articleno
        left join comments as c on a.articleno = c.articleno
        left join views as v on a.articleno = v.articleNo
    WHERE
        a.boardcd = #{boardCd}
        &lt;if test="searchWord != null and searchWord != ''"&gt;
        AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
        &lt;/if&gt;
    GROUP BY a.articleno, title, a.regdate
    ORDER BY articleno DESC
    LIMIT ${offset}, ${rowCount}
&lt;/select&gt;
&lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
    SELECT count(*) FROM article 
    WHERE 
        boardcd = #{boardCd}
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
        articleno = #{articleNo}
    ORDER BY commentno DESC
&lt;/select&gt;	
&lt;insert id="insertComment" parameterType="Comment"&gt;
    INSERT INTO comments (commentno, articleno, email, memo, regdate)
    VALUES (seq_comments.nextval, #{articleNo}, #{email}, #{memo}, sysdate)
&lt;/insert&gt;	
&lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title
    FROM
        (SELECT rownum r,a.*
        FROM
            (SELECT articleno, title 
            FROM article 
            WHERE 
                boardCd = #{boardCd} 
                AND articleno &gt; #{articleNo}
            &lt;if test="searchWord != null and searchWord != ''"&gt;
                AND (title LIKE '%${searchWord}%' 	OR 	DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
            &lt;/if&gt; 
            ORDER BY articleno) 
        a)
    WHERE r = 1
&lt;/select&gt;
&lt;select id="selectPrevOne" parameterType="hashmap" resultType="Article"&gt;
    SELECT articleno, title
    FROM
        (SELECT rownum r,a.*
        FROM
            (SELECT articleno, title 
            FROM article 
            WHERE 
                boardCd = #{boardCd} 
                AND articleno &lt; #{articleNo}
            &lt;if test="searchWord != null and searchWord != ''"&gt;
                AND (title LIKE '%${searchWord}%' OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
            &lt;/if&gt; 
            ORDER BY articleno DESC)
            a)
    WHERE r = 1
&lt;/select&gt;	
&lt;select id="selectOne" parameterType="int" resultType="Article"&gt;
    SELECT 
        a.articleno,
        title,
        content,
        a.email,
        NVL(name, 'Anonymous') name,
        regdate
    FROM 
        article a left join member m on a.email = m.email
    WHERE 
        articleno = #{articleNo}
&lt;/select&gt;
&lt;insert id="insertOneViews" parameterType="hashmap"&gt;
    INSERT INTO views values (seq_views.nextval, #{articleNo}, #{ip}, #{yearMonthDayHour})
&lt;/insert&gt;	
&lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
    INSERT INTO attachFile (attachfileno, filename, filetype, filesize, articleno, email)
    VALUES
    (seq_attachfile.nextval, #{filename}, #{filetype}, #{filesize}, #{articleNo}, #{email})
&lt;/insert&gt;
&lt;insert id="insert" parameterType="Article" useGeneratedKeys="true"&gt;
    &lt;selectKey keyProperty="articleNo" resultType="int" order="BEFORE"&gt;
        SELECT seq_article.nextval FROM dual
    &lt;/selectKey&gt;
    INSERT INTO article (articleno, boardcd, title, content, email, regdate)
    VALUES
    (#{articleNo}, #{boardCd}, #{title}, #{content}, #{email}, sysdate)
&lt;/insert&gt;
&lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
        SELECT count(*) FROM article 
        WHERE 
                boardcd = #{boardCd}
                &lt;if test="searchWord != null and searchWord != ''"&gt;
                AND (title LIKE '%${searchWord}%' 	OR 	DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
                &lt;/if&gt;
&lt;/select&gt;
&lt;select id="selectListOfArticles" parameterType="hashmap" resultType="Article"&gt;
     SELECT articleno, title, regdate, hit, attachfileNum, commentNum 
     FROM (
        SELECT rownum R,A.* 
            FROM (
                SELECT 
                    a.articleno, a.title, a.regdate,
                    count(distinct(v.no)) hit, 
                    count(distinct(f.attachfileno)) attachfileNum, 
                    count(distinct(c.commentno)) commentNum
                FROM 
                    article a left join attachfile f on a.articleno = f.articleno
                    left join comments c on a.articleno = c.articleno
                    left join views v on a.articleno = v.articleNo
                WHERE
                    a.boardcd = #{boardCd}
                    &lt;if test="searchWord != null and searchWord != ''"&gt;
                    AND (title LIKE '%${searchWord}%' 	OR DBMS_LOB.INSTR(content, #{searchWord}) &gt; 0)
                    &lt;/if&gt;
                GROUP BY a.articleno, title, a.regdate
                ORDER BY articleno DESC
                ) A
        )
    WHERE R BETWEEN #{start} AND #{end}
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
        email LIKE concat('%', #{search}, '%')
        OR name LIKE concat('%', #{search}, '%')
        OR mobile LIKE concat('%', #{search}, '%')
    &lt;/if&gt;
&lt;/select&gt;

&lt;select id="selectAll" parameterType="hashmap" resultMap="UserResult"&gt;
    SELECT	email, name, mobile
    FROM
    member
    &lt;if test="search != null and search != ''"&gt;
    WHERE
        email LIKE concat('%', #{search}, '%')
        OR name LIKE concat('%', #{search}, '%')
        OR mobile LIKE concat('%', #{search}, '%')
    &lt;/if&gt;
    ORDER BY name ASC
    LIMIT ${offset}, ${rowCount}
&lt;/select&gt;
&lt;!-- MySQL and MariaDB end --&gt;
&lt;!-- Oracle start--&gt;
&lt;!--	
&lt;select id="selectTotalCount" resultType="int"&gt;
    SELECT count(*)
    FROM member
    &lt;if test="search != null and search != ''"&gt;
    WHERE 
        email LIKE '%' || #{search} || '%'
        OR name LIKE '%' || #{search} || '%'
        OR mobile LIKE '%' || #{search} || '%'
    &lt;/if&gt;
&lt;/select&gt;
&lt;select id="selectAll" parameterType="hashmap" resultMap="UserResult"&gt;
    SELECT email, name, mobile
    FROM (
    SELECT ROWNUM R, a.*
    FROM (
    SELECT email, name, mobile
    FROM member
    &lt;if test="search != null and search != ''"&gt;
    WHERE 
        email LIKE '%' || #{search} || '%'
        OR name LIKE '%' || #{search} || '%'
        OR mobile LIKE '%' || #{search} || '%'
    &lt;/if&gt;
    ORDER BY name ASC
    ) a
    )
    WHERE R BETWEEN #{startRecord} AND #{endRecord}
&lt;/select&gt;
--&gt;
&lt;!-- Oracle end --&gt;
</pre>

<h3>Test in Tomcat</h3>

<p>
Run the following command:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean compile war:inplace
</pre>

<p>
After running Tomcat, visit http://localhost:8080 to test it.
</p>

<h3>Test Admin mode</h3>

<p>
Grant the admin role to a registered someone.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mysql --user=java --password javaskool

insert into authorities values ('<em>User Email</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
Log in as a member with an administrator role and check if the administrator menu is visible.
</p>

<h3>Test in Jetty</h3>

<p>
Stop tomcat and run the following command:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean jetty:run 
</pre>

<div class="explain">
<p>
<b>Note:</b>
In most cases where you see the following error message when trying to log in, it is because your system did not start Oracle.
</p>

<p>
<img src="../../../static/images/ora-12505-en.png" th:src="@{/static/images/ora-12505-en.png}" alt="Log in failed" />
</p>

<p>
Start Oracle database.
</p>

<p>
<img src="../../../static/images/start-database-oracle.png" th:src="@{/static/images/start-database-oracle.png}" alt="Start Database" />
</p>

</div>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/java/JDK-Install}">Java Install</a></li>
	<li><a href="#" th:href="@{/spring/building-java-projects-with-maven}">Building Java Projects with Maven</a></li>
	<li><a href="#" th:href="@{/jsp/How-to-install-Tomcat}">Tomcat Install</a></li>
	<li><a href="#" th:href="@{/jsp/Creating-a-new-web-application}">Creating a new web application</a></li>
	<li><a href="#" th:href="@{/blog/2017/jetty-maven-plugin}">Jetty Maven Plugin</a></li>
	<li><a href="#" th:href="@{/jdbc/How-to-install-Oracle}">Oracle Install</a></li>
</ul>

</article>
</body>
</html>
