<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
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

<div th:replace="~{articles/commons/database-design-mysql :: content}"></div>

<h3>Modify sources</h3>

<p>
Add the following to the pom.xml.<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;mysql&lt;/groupId&gt;
  &lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;
  &lt;version&gt;8.0.27&lt;/version&gt;
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
			a.boardcd = ${fn:escapeXml("#{boardCd}")}
			&lt;if test="searchWord != null and searchWord != ''"&gt;
			AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
			&lt;/if&gt;
		GROUP BY a.articleno, title, a.regdate, hit, m.name
		ORDER BY articleno DESC
		LIMIT ${fn:escapeXml("#{offset}")}, ${fn:escapeXml("#{rowCount}")}
	&lt;/select&gt;

	&lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
		SELECT count(*) FROM article 
		WHERE 
			boardcd = ${fn:escapeXml("#{boardCd}")}
			&lt;if test="searchWord != null and searchWord != ''"&gt;
			AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
			&lt;/if&gt;
	&lt;/select&gt;

	&lt;insert id="insert" parameterType="Article" useGeneratedKeys="true" keyProperty="articleNo"&gt;
		INSERT INTO article (boardcd, title, content, email, hit, regdate)
		VALUES
		(${fn:escapeXml("#{boardCd}")}, ${fn:escapeXml("#{title}")}, ${fn:escapeXml("#{content}")}, ${fn:escapeXml("#{email}")}, 0, now())
	&lt;/insert&gt;
	
	&lt;insert id="insertAttachFile" parameterType="AttachFile"&gt;
		INSERT INTO attachfile (filename, filetype, filesize, articleno, email)
		VALUES
		(${fn:escapeXml("#{filename}")}, ${fn:escapeXml("#{filetype}")}, ${fn:escapeXml("#{filesize}")}, ${fn:escapeXml("#{articleNo}")}, ${fn:escapeXml("#{email}")})
	&lt;/insert&gt;

	&lt;update id="update" parameterType="Article"&gt;
		UPDATE article 
		SET title = ${fn:escapeXml("#{title}")}, content = ${fn:escapeXml("#{content}")} 
		WHERE articleno = ${fn:escapeXml("#{articleNo}")}
	&lt;/update&gt;

	&lt;delete id="delete" parameterType="int"&gt;
		DELETE FROM article WHERE articleno = ${fn:escapeXml("#{articleNo}")}
	&lt;/delete&gt;

	&lt;update id="updateHitPlusOne" parameterType="int"&gt;
		UPDATE article SET hit = hit + 1 WHERE articleno = ${fn:escapeXml("#{articleNo}")}
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
			articleno = ${fn:escapeXml("#{articleNo}")}
	&lt;/select&gt;

	&lt;select id="selectNextOne" parameterType="hashmap" resultType="Article"&gt;
		SELECT articleno, title 
		FROM article 
		WHERE 
			boardCd = ${fn:escapeXml("#{boardCd}")} 
			AND articleno &amp;gt; ${fn:escapeXml("#{articleNo}")}
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
			boardCd = ${fn:escapeXml("#{boardCd}")} 
			AND articleno &amp;lt; ${fn:escapeXml("#{articleNo}")}
		&lt;if test="searchWord != null and searchWord != ''"&gt;
			AND (title LIKE '%${searchWord}%' OR content LIKE '%${searchWord}%')
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
		WHERE articleno = ${fn:escapeXml("#{articleNo}")} 
		ORDER BY attachfileno
	&lt;/select&gt;

	&lt;delete id="deleteFile" parameterType="int"&gt;
		DELETE FROM attachfile WHERE attachfileno = ${fn:escapeXml("#{attachFileNo}")}
	&lt;/delete&gt;

	&lt;select id="selectOneBoard" parameterType="string" resultType="string"&gt;
		SELECT * FROM board WHERE boardcd = ${fn:escapeXml("#{boardCd}")}
	&lt;/select&gt;

	&lt;insert id="insertComment" parameterType="Comment"&gt;
		INSERT INTO comments (articleno, email, memo, regdate)
		VALUES (${fn:escapeXml("#{articleNo}")}, ${fn:escapeXml("#{email}")}, ${fn:escapeXml("#{memo}")}, now())
	&lt;/insert&gt;

	&lt;update id="updateComment" parameterType="Comment"&gt;
		UPDATE comments SET memo = ${fn:escapeXml("#{memo}")} WHERE commentno = ${fn:escapeXml("#{commentNo}")}
	&lt;/update&gt;
	
	&lt;delete id="deleteComment" parameterType="int"&gt;
		DELETE FROM comments WHERE commentno = ${fn:escapeXml("#{commentNo}")}
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
			articleno = ${fn:escapeXml("#{articleNo}")}
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
			attachfileno = ${fn:escapeXml("#{attachfileno}")}
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
			commentno = ${fn:escapeXml("#{commentNo}")}
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
public String list(@PathVariable String boardCd, Integer page, String searchWord, Locale locale, Model model) {
  if (page == null) page = 1;
	
  int numPerPage = 10;
  int pagePerBlock = 10;

  int totalRecord = boardService.getTotalRecord(boardCd, searchWord);

  NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);

  //mysql
  Integer offset = (page - 1) * numPerPage;
  HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
  map.put("boardCd", boardCd);
  map.put("searchWord", searchWord);
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
    Integer page, String searchWord, Locale locale, Model model) {
  if(page == null) page = 1;
  String lang = locale.getLanguage();
  boardService.increaseHit(articleNo);

  Article article = boardService.getArticle(articleNo);
  List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
  Article nextArticle = boardService.getNextArticle(articleNo, boardCd, searchWord);
  Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, searchWord);
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

  int totalRecord = boardService.getTotalRecord(boardCd, searchWord);
	
  NumbersForPaging numbers = this.getNumbersForPaging(totalRecord, page, numPerPage, pagePerBlock);
	
  //mysql
  Integer offset = (page - 1) * numPerPage;
  HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();
  map.put("boardCd", boardCd);
  map.put("searchWord", searchWord);
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
