<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.11.29</div>

<h1>Spring board program using MySql</h1>

<p>
Let's modify the Spring MVC bulletin board for Oracle to use MySql.
</p>

<h3>Database Design</h3>

<p>
Connect to the mysql database as root account.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql
</pre>

<p>
Then run:
</p>

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

insert into board values ('chat','Chat','자유게시판');
commit;

exit;
</pre>


<h3>Modify sources</h3>

<p>
Add the following to the pom.xml.<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
</p>

<pre class="prettyprint">
&lt;!-- Source: https://mvnrepository.com/artifact/com.mysql/mysql-connector-j --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;com.mysql&lt;/groupId&gt;
  &lt;artifactId&gt;mysql-connector-j&lt;/artifactId&gt;
  &lt;version&gt;${mysqlJdbcDriverVer }&lt;/version&gt;
  &lt;scope&gt;compile&lt;/scope&gt;
&lt;/dependency&gt;
</pre>

<p>
Below is a different part from the Spring MVC bulletin board for Oracle. Avoid using the same artifactId as the Spring MVC bulletin for Oracle.
</p>

<p>
Modify pom.xml as follows.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;artifactId&gt;<strong>spring-bbs-mysql</strong>&lt;/artifactId&gt;

&lt;build&gt;
&lt;finalName&gt;<strong>spring-bbs-mysql</strong>&lt;/finalName&gt;
</pre>

<p>
MySql is case-sensitive. If you create a table named member in MySql, the query: select * from MEMBER will generate an error, unlike Oracle.
</p>

<p>
Open securty.xml and modify the authentication query as shown below.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;jdbc-user-service
  data-source-ref="dataSource"
  users-by-username-query="select email as username,passwd as password,1 as enabled
  from member where email = ?"
  authorities-by-username-query="select email as username,authority
  from authorities where email = ?" /&gt;
</pre>

<p>
Modify the datasource configuration as shown below.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
  &lt;property name="driverClassName" value="<strong>com.mysql.jdbc.Driver</strong>"/&gt;
  &lt;property name="url" value="<strong>jdbc:mysql://localhost:3306/javaskool?useUnicode=true&amp;amp;characterEncoding=utf-8&amp;amp;useSSL=false"</strong> /&gt;
  &lt;property name="username" value="java"/&gt;
  &lt;property name="password" value="school"/&gt;
  &lt;property name="maxActive" value="100"/&gt;
  &lt;property name="maxWait" value="1000"/&gt;
  &lt;property name="poolPreparedStatements" value="true"/&gt;
  &lt;property name="defaultAutoCommit" value="true"/&gt;
  &lt;property name="validationQuery" value="<strong>SELECT 1</strong>" /&gt;
&lt;/bean&gt;
</pre>

<p>
Modify BoardMapper.xml as follows.
</p>

<h6 class="src">BoardMapper.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8" ?&gt;

&lt;!DOCTYPE mapper
    PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd"&gt;

&lt;mapper namespace="net.java_school.mybatis.BoardMapper"&gt;

	&lt;select id="selectListOfArticles" parameterType="hashmap" resultType="Article"&gt;
		SELECT 
			a.articleno, a.title, a.regdate, a.hit, m.name, 
			count(distinct(f.attachfileno)) attachfileNum, 
			count(distinct(c.commentno)) commentNum
		FROM 
			article as a left join attachfile as f on a.articleno = f.articleno
				left join comments as c on a.articleno = c.articleno
				left join member as m on a.email = m.email
		WHERE
			a.boardcd = &#35;{boardCd}
			&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%&#36;{search}%' OR content LIKE '%&#36;{search}%')
			&lt;/if&gt;
		GROUP BY a.articleno, title, a.regdate, hit, m.name
		ORDER BY articleno DESC
		LIMIT &#35;{offset}, &#35;{rowCount}
	&lt;/select&gt;

	&lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
		SELECT count(*) FROM article 
		WHERE 
			boardcd = &#35;{boardCd}
			&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%&#36;{search}%' OR content LIKE '%&#36;{search}%')
			&lt;/if&gt;
	&lt;/select&gt;

	&lt;insert id="insert" parameterType="Article" useGeneratedKeys="true" keyProperty="articleNo"&gt;
		INSERT INTO article (boardcd, title, content, email, hit, regdate)
		VALUES
		(&#35;{boardCd}, &#35;{title}, &#35;{content}, &#35;{email}, 0, now())
	&lt;/insert&gt;
	
	&lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
		INSERT INTO attachfile (filename, filetype, filesize, articleno, email)
		VALUES
		(&#35;{filename}, &#35;{filetype}, &#35;{filesize}, &#35;{articleNo}, &#35;{email})
	&lt;/insert&gt;

	&lt;update id="update" parameterType="Article"&gt;
		UPDATE article 
		SET title = &#35;{title}, content = &#35;{content} 
		WHERE articleno = &#35;{articleNo}
	&lt;/update&gt;

	&lt;delete id="delete" parameterType="int"&gt;
		DELETE FROM article WHERE articleno = &#35;{articleNo}
	&lt;/delete&gt;

	&lt;update id="updateHitPlusOne" parameterType="int"&gt;
		UPDATE article SET hit = hit + 1 WHERE articleno = &#35;{articleNo}
	&lt;/update&gt;

	&lt;select id="selectOne" parameterType="int" resultType="Article"&gt;
		SELECT 
			articleno,
			title,
			content,
			a.email,
			ifNull(name, 'Anonymous') name,
			hit,
			regdate
		FROM article as a left join member as m on a.email = m.email
		WHERE 
			articleno = &#35;{articleNo}
	&lt;/select&gt;

	&lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
		SELECT articleno, title 
		FROM article 
		WHERE 
			boardCd = &#35;{boardCd} 
			AND articleno &amp;gt; &#35;{articleNo}
		&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%&#36;{search}%' OR content LIKE '%&#36;{search}%')
		&lt;/if&gt; 
		ORDER BY articleno
		LIMIT 1
	&lt;/select&gt;
	
	&lt;select id="selectPrevOne" parameterType="hashmap" resultType="Article"&gt;
		SELECT articleno, title 
		FROM article 
		WHERE 
			boardCd = &#35;{boardCd} 
			AND articleno &amp;lt; &#35;{articleNo}
		&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%&#36;{search}%' OR content LIKE '%&#36;{search}%')
		&lt;/if&gt; 
		ORDER BY articleno DESC
		LIMIT 1
	&lt;/select&gt;

	&lt;select id="selectListOfAttachFiles" parameterType="int" resultType="AttachFile"&gt;
		SELECT 
			attachfileno,
			filename,
			filetype,
			filesize,
			articleno,
			email 
		FROM attachfile 
		WHERE articleno = &#35;{articleNo} 
		ORDER BY attachfileno
	&lt;/select&gt;

	&lt;delete id="deleteFile" parameterType="int"&gt;
		DELETE FROM attachfile WHERE attachfileno = &#35;{attachFileNo}
	&lt;/delete&gt;

	&lt;select id="selectOneBoard" parameterType="string" resultType="string"&gt;
		SELECT * FROM board WHERE boardcd = &#35;{boardCd}
	&lt;/select&gt;

	&lt;insert id="insertComment" parameterType="Comment"&gt;
		INSERT INTO comments (articleno, email, memo, regdate)
		VALUES (&#35;{articleNo}, &#35;{email}, &#35;{memo}, now())
	&lt;/insert&gt;

	&lt;update id="updateComment" parameterType="Comment"&gt;
		UPDATE comments SET memo = &#35;{memo} WHERE commentno = &#35;{commentNo}
	&lt;/update&gt;
	
	&lt;delete id="deleteComment" parameterType="int"&gt;
		DELETE FROM comments WHERE commentno = &#35;{commentNo}
	&lt;/delete&gt;

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
			articleno = &#35;{articleNo}
		ORDER BY commentno DESC
	&lt;/select&gt;

	&lt;select id="selectOneAttachFile" parameterType="int" resultType="AttachFile"&gt;
		SELECT
			attachfileno,
			filename,
			filetype,
			filesize,
			articleno,
			email
		FROM
			attachfile
		WHERE
			attachfileno = &#35;{attachfileno}
	&lt;/select&gt;

	&lt;select id="selectOneComment" parameterType="int" resultType="Comment"&gt;
		SELECT 
			commentno,
			articleno,
			email,
			memo,
			regdate 
		FROM comments 
		WHERE
			commentno = &#35;{commentNo}
	&lt;/select&gt;

 &lt;/mapper&gt;
</pre>

<p>
Modify BbsController.java as follows. 
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
//List
@RequestMapping(value="/{boardCd}", method=RequestMethod.GET)
public String list(@PathVariable String boardCd, Integer page, String search, Locale locale, Model model) {
  if (page == null) page = 1;
	
  int numPerPage = 10;
  int pagePerBlock = 10;

  int totalRecord = boardService.getTotalRecord(boardCd, search);

  NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

  //mysql
  Integer offset = (page - 1) * numPerPage;
  HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
  map.put("boardCd", boardCd);
  map.put("search", search);
  map.put("offset", offset.toString());
  Integer rowCount = numPerPage;
  map.put("rowCount", rowCount.toString());
  List&lt;Article&gt; list = boardService.getArticleList(map);

  Integer listItemNo = numbers.getListItemNo();
  Integer prevPage = numbers.getPrevBlock();
  Integer nextPage = numbers.getNextBlock();
  Integer firstPage = numbers.getFirstPage();
  Integer lastPage = numbers.getLastPage();

  model.addAttribute("list", list);
  model.addAttribute("listItemNo", listItemNo);
  model.addAttribute("prevPage", prevPage);
  model.addAttribute("nextPage", nextPage);
  model.addAttribute("firstPage", firstPage);
  model.addAttribute("lastPage", lastPage);
	
  String lang = locale.getLanguage();
  List&lt;Board&gt; boards = boardService.getBoards();
  String boardName = this.getBoardName(boardCd, lang);
  model.addAttribute("boards", boards);
  model.addAttribute("boardName", boardName);
	
  model.addAttribute("boardCd", boardCd);
	
  return "bbs/list";
}

//Detailed view
@RequestMapping(value="/{boardCd}/{articleNo}", method=RequestMethod.GET)
public String view(@PathVariable String boardCd, @PathVariable Integer articleNo,   
    Integer page, String search, Locale locale, Model model) {
  if(page == null) page = 1;
  String lang = locale.getLanguage();
  boardService.increaseHit(articleNo);

  Article article = boardService.getArticle(articleNo);
  List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
  Article nextArticle = boardService.getNextArticle(articleNo, boardCd, search);
  Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, search);
  List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);
  String boardName = this.getBoardName(boardCd, lang);

  String title = article.getTitle();
  String content = article.getContent();
  content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
  int hit = article.getHit();
  String name = article.getName();
  String email = article.getEmail();
  Date regdate = article.getRegdate();

  model.addAttribute("title", title);
  model.addAttribute("content", content);
  model.addAttribute("hit", hit);
  model.addAttribute("name", name);
  model.addAttribute("email", email);
  model.addAttribute("regdate", regdate);
  model.addAttribute("attachFileList", attachFileList);
  model.addAttribute("nextArticle", nextArticle);
  model.addAttribute("prevArticle", prevArticle);
  model.addAttribute("commentList", commentList);

  int numPerPage = 10;
  int pagePerBlock = 10;

  int totalRecord = boardService.getTotalRecord(boardCd, search);
	
  NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);
	
  //mysql
  Integer offset = (page - 1) * numPerPage;
  HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
  map.put("boardCd", boardCd);
  map.put("search", search);
  map.put("offset", offset.toString());
  Integer rowCount = numPerPage;
  map.put("rowCount", rowCount.toString());
  List&lt;Article&gt; list = boardService.getArticleList(map);

  int listItemNo = numbers.getListItemNo();
  int prevPage = numbers.getPrevBlock();
  int nextPage = numbers.getNextBlock();
  int firstPage = numbers.getFirstPage();
  int lastPage = numbers.getLastPage();

  model.addAttribute("list", list);
  model.addAttribute("listItemNo", listItemNo);
  model.addAttribute("prevPage", prevPage);
  model.addAttribute("firstPage", firstPage);
  model.addAttribute("lastPage", lastPage);
  model.addAttribute("nextPage", nextPage);
  model.addAttribute("boardName", boardName);

  List&lt;Board&gt; boards = boardService.getBoards();
  model.addAttribute("boards", boards);
	
  model.addAttribute("articleNo", articleNo);
  model.addAttribute("boardCd", boardCd);
	
  return "bbs/view";
}
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://fosskb.wordpress.com/2015/04/18/installing-openstack-kilo-on-ubuntu-15-04-single-machine-setup/">https://fosskb.wordpress.com/2015/04/18/installing-openstack-kilo-on-ubuntu-15-04-single-machine-setup/</a></li>
</ul>

</article>
