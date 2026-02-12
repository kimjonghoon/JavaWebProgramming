<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>윈도 10에서 책 예제 테스트</title>
<meta name="Keywords" content="java,JavaWebProgramming final source, how to test the book source on windows 10" />
<meta name="Description" content="이 글은 윈도 10에서 책 소스 테스트 방법을 설명합니다." />
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
<div class="last-modified">Last Modified 2025.5.30</div>

<h1>윈도 10에서 책 예제 테스트</h1>

<h2>Java 설치</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads">https://www.oracle.com/java/technologies/downloads</a><br />
최신 버전을 선택해 설치 후, JDK의 bin 디렉터리를 시스템 변수의 Path에 추가
</p>

<h2>Maven 설치</h2>

<p>
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a><br />
최신 버전의 바이너리 파일을 내려받아 압축을 풀고 생성된 디렉터리를 원하는 곳에 복사한 후, 메이븐의 bin 디렉터리를 시스템 변수의 Path에 추가
</p>

<h2>Git 설치</h2>

<p>
<a href="https://git-scm.com/downloads">https://git-scm.com/downloads</a><br />
64-bit Git for Windows Setup 파일을 내려받아 설치
</p>

<p>
설치 후, 이름과 이메일을 설정
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global user.name "Gildong Hong"
git config --global user.email hong@gmail.org
</pre>

<p>
설정 확인
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">git config --global --list 
</pre>

<h2>Oracle Database 11gR2 Express Edition 설치</h2>

<p>
개인 컴퓨터에 설치해 데이터베이스를 공부하는 용도로는 11g XE가 최신 버전보다 낫다.
</p>

<p>
<a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a><br />
64비트 윈도 시스템이면, --대부분 시스템이 64비트 시스템이다-- Oracle Database 11gR2 Express Edition for Windows x64를 내려받는다. 이 버전을 내려받으려면 오라클 사이트의 계정이 필요하다. 회원가입을 하고 로그인하면 내려받기가 시작된다.
</p>

<p>
11g XE 구성 요소 중 하나인 Oracle Application Express가 8080 포트를 사용하므로, 톰캣이 서비스 중이면 중지한다.
</p>

<p>
내려받은 압축 파일을 풀면 생성되는 Disk1 서브 디렉터리에서 setup.exe를 실행한 후, 다음 버튼을 계속 눌러 설치한다. 윈도 10은 11g 버전이 공식 지원하는 OS이기에 간단히 오라클이 설치된다. 설치 과정에서 자신이 입력한 관리자 비밀번호는 잊지 않도록 한다. 
</p>

<p>
윈도의 경우 Oracle Application Express의 디폴트 포트인 8080을 설치 과정에서 변경할 수 없다. 설치 후 Apex의 8080 포트를 9090으로 바꾸는 방법은 다음과 같다. 
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

<h2>Tomcat 11 설치</h2>

<p>
<a href="https://tomcat.apache.org/download-11.cgi">https://tomcat.apache.org/download-11.cgi</a><br />
Windows Service Installer를 내려받아 설치
</p>

<h2>테스트</h2>

<h3>책 예제 복사</h3>

<p>
git를 사용해 예제를 내려받는다.
</p>

<pre>git clone https://github.com/kimjonghoon/JavaWebProgramming</pre>

<h3>업로드 디렉터리 수정</h3>

<p>
net.java_school.commons 패키지의 WebContants.java 파일을 열고 업로드 디렉터리를 자신의 시스템에 맞게 수정
</p>

<h3>로그 파일 경로 수정</h3>

<p>
src/main/resources 폴더의 log4j2.xml 파일을 열고 로그 파일 경로를 자신의 시스템에 맞게 수정
</p>

<h3>오라클 데이터베이스 스키마</h3>

<div th:replace="~{articles/commons/database-design :: content}"></div>

<h3>ROOT.xml 파일 생성</h3>

<p>
C:\JavaWebProgramming가 루트 디렉터리라면, 다음과 같이 ROOT.xml 파일을 작성하고, 톰캣의 conf/Catalina/localhost 폴더에 복사한다. (폴더가 없으면 생성)
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="<strong>C:/JavaWebProgramming</strong>/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
톰캣을 시작하고, http://localhost:8080 방문, 회원가입과 게시판을 테스트한다.
</p>

<h3>관리자 모드 테스트</h3>

<p>
특정 회원에 관리자 롤을 부여한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">sqlplus java/school

insert into authorities values ('<em>가입되어 있는 회원 이메일</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<p>
로그아웃 후 다시 로그인하여 관리자 메뉴가 보이는지 확인
</p>

<h3>Jetty 플러그인을 사용한 테스트</h3>

<p>
톰캣을 정지하고, 다음 명령을 실행
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean jetty:run
</pre>

<h2>MariaDB 설치</h2>

<p>
<a href="https://mariadb.org/download/">https://mariadb.org/download/</a><br />
책 내용은 오라클 데이터베이스를 다루고 있으나 소스는 MySQL 데이터베이스로도 테스트할 수 있게 구현했다.<br />
MariaDB는 MySQL과 호환되는 데이터베이스로 MySQL의 SQL문을 거의 동일하게 사용할 수 있으며 MySQL의 JDBC 드라이버를 사용할 수 있다.<br />
윈도에서 MySQL보다 MariaDB를 쉽게 설치할 수 있다.<br />
Next 버튼을 눌러 설치할 수 있는데, 설치 과정에서 자신이 설정한 root 패스워드를 기억해야 한다.
</p>

<h3>MariaDB 데이터베이스 스키마</h3>

<div th:replace="~{articles/commons/database-design-mysql :: content}"></div>

<h3>MariaDB를 사용하기 위한 소스 편집</h3>

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
Manually    )
    WHERE R BETWEEN #{startRecord} AND #{endRecord}
&lt;/select&gt;
--&gt;
&lt;!-- Oracle end --&gt;
</pre>

<h3>관리자 모드 테스트</h3>

<p>
등록된 회원에 관리자 Role을 부여한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mysql --user=java --password javaskool

insert into authorities values ('<em>가입되어 있는 회원 이메일</em>','ROLE_ADMIN');

commit;

exit;
</pre>

<h3>톰캣 테스트</h3>

<p>
다음 명령으로 컴파일
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean compile war:inplace
</pre>

<p>
톰캣 실행 후, http://localhost:8080 방문
</p>

<h3>제티 테스트</h3>

<p>
톰캣 중지 후, mvn clean jetty:run 실행
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn clean jetty:run 
</pre>

<div class="explain">
<p>
<b>Note:</b>
로그인 시도에서 아래와 같은 에러 메시지를 보게 되는 경우는, 대부분 오라클이 시작되지 않았기 때문에 일어난다.
</p>

<p>
<img src="../../../static/images/ora-12505.png" th:src="@{/static/images/ora-12505.png}" alt="Log in failed" />
</p>

<p>
오라클 데이터베이스를 시작한다.
</p>

<p>
<img src="../../../static/images/start-database-oracle.png" th:src="@{/static/images/start-database-oracle.png}" alt="Start Database" />
</p>

<p>
<img src="../../../static/images/start-database-prompt.png" th:src="@{/static/images/start-database-prompt.png}" alt="Confirm OracleServiceXE" />
</p>

</div>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/java/JDK-Install}">자바 설치</a></li>
	<li><a href="#" th:href="@{/spring/building-java-projects-with-maven}">메이븐으로 자바 개발</a></li>
	<li><a href="#" th:href="@{/jsp/How-to-install-Tomcat}">톰캣 설치</a></li>
	<li><a href="#" th:href="@{/jsp/Creating-a-new-web-application}">웹 애플리케이션 작성 실습</a></li>
	<li><a href="#" th:href="@{/blog/2017/jetty-maven-plugin}">제티 메이븐 플러그인</a></li>
	<li><a href="#" th:href="@{/jdbc/How-to-install-Oracle}">오라클 설치</a></li>
</ul>

</article>
</body>
</html>
