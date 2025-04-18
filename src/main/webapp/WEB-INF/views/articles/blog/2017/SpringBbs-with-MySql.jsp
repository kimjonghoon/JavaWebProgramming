<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.funtions" prefix="fn" %>
<article>
<div class="last-modified">Last Modified 2017.7.6</div>

<h1>MySQL을 사용하는 스프링 게시판 프로그램</h1>

<p>
오라클을 사용하는 스프링 MVC 게시판을 MySql을 사용하도록 수정해 보자.
</p>

<h3>데이터베이스 디지인</h3>

<p>
root 계정으로 mysql 데이터베이스에 접속한다.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql
</pre>

<p>
접속된 상태에서 다음을 실행한다.
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


<h3>소스</h3>

<p>
아래는 오라클용 스프링 MVC 게시판과 다른 부분이다.
</p>

<p>
오라클용 스프링 MVC 게시판과 같은 artifactId를 사용하는 건 바람직하지 않으니 바꾼다.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;artifactId&gt;<strong>spring-bbs-mysql</strong>&lt;/artifactId&gt;

&lt;build&gt;
&lt;finalName&gt;<strong>spring-bbs-mysql</strong>&lt;/finalName&gt;
</pre>

<p>
MySql은 대소문자를 구별한다.
MySql에서 테이블 이름을 member로 생성했다면 select * from MEMBER;은 오라클과 달리 에러를 발생시킨다.
securty.xml을 열고 인증 쿼리를 아래를 참조해 수정한다.
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
데이터소스 설정을 MySql용으로 아래와 같이 수정한다.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"&gt;
	&lt;property name="driverClassName" value="<strong>com.mysql.jdbc.Driver</strong>"/&gt;
	&lt;property name="url" value="<strong>jdbc:mysql://localhost:3306/javaskool?useUnicode=yes&amp;amp;characterEncoding=UTF-8"</strong> /&gt;
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
기존 BoardMapper.xml을 MySql용으로 아래와 같이 수정한다.
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
			&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%${search}%' OR content LIKE '%${search}%')
			&lt;/if&gt;
		GROUP BY a.articleno, title, a.regdate, hit, m.name
		ORDER BY articleno DESC
		LIMIT ${fn:escapeXml("#{offset}")}, ${fn:escapeXml("#{rowCount}")}
	&lt;/select&gt;

	&lt;select id="selectCountOfArticles" parameterType="hashmap" resultType="int"&gt;
		SELECT count(*) FROM article 
		WHERE 
			boardcd = ${fn:escapeXml("#{boardCd}")}
			&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%${search}%' OR content LIKE '%${search}%')
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
		&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%${search}%' OR content LIKE '%${search}%')
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
		&lt;if test="search != null and search != ''"&gt;
			AND (title LIKE '%${search}%' OR content LIKE '%${search}%')
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
UserMapper.xml은 오라클용과 내용이 같다.
</p>

<p>
페이징 처리에 사용되는 다음 VO 클래스는 오라클용과 함께 사용해도 된다.
</p>

<h6 class="src">NumbersForPaging.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class NumbersForPaging {
	private int totalPage;
	private int firstPage;
	private int lastPage;
	private int prevBlock;
	private int nextBlock;
	private int listItemNo;
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getListItemNo() {
		return listItemNo;
	}
	public void setListItemNo(int listItemNo) {
		this.listItemNo = listItemNo;
	}
	
}
</pre>

<p>
페이징 처리를 위한 숫자를 생산하는 다음 클래스는 오라클용과 함께 사용해도 된다.
</p>

<h6 class="src">Paginator.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class Paginator {

	public NumbersForPaging getNumbersForPaging(int totalRecord, int page, int numPerPage, int pagePerBlock) {
		int totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage != 0) totalPage++;
		int totalBlock = totalPage / pagePerBlock;
		if (totalPage % pagePerBlock != 0) totalBlock++;
		int block = page / pagePerBlock;
		if (page % pagePerBlock != 0) block++;
		int firstPage = (block - 1) * pagePerBlock + 1;
		int lastPage = block * pagePerBlock;
		int prevPage = 0;
		if (block &gt; 1) {
			prevPage = firstPage - 1;
		}
		int nextPage = 0;
		if (block &lt; totalBlock) {
			nextPage = lastPage + 1;
		}
		if (block &gt;= totalBlock) {
			lastPage = totalPage;
		}
		int listItemNo = totalRecord - (page - 1) * numPerPage;
		
		NumbersForPaging numbers = new NumbersForPaging();
		
		numbers.setTotalPage(totalPage);
		numbers.setFirstPage(firstPage);
		numbers.setLastPage(lastPage);
		numbers.setPrevBlock(prevPage);
		numbers.setNextBlock(nextPage);
		numbers.setListItemNo(listItemNo);
		
		return numbers;
	}

}
</pre>

<p>
페이지를 위한 숫자를 생산해야 하는 컨트롤러는 Paginator 클래스를 상속하게 한다.
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
@Controller
@RequestMapping("/bbs")
public class BbsController <strong>extends Paginator</strong>
</pre>

<p>
목록과 상세보기에서 레코드를 그룹화할 때 필요한 숫자가 오라클과 MySql이 다르다.
아래 코드를 참조해 레코드을 그룹화하는 부분의 코드를 MySql에 맞게 수정한다. 
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
//목록
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
	
	//boardCd는 파라미터로 전달되지 않으므로
	model.addAttribute("boardCd", boardCd);
	
	return "bbs/list";

}

//상세보기
@RequestMapping(value="/{boardCd}/{articleNo}", method=RequestMethod.GET)
public String view(@PathVariable String boardCd, @PathVariable Integer articleNo,   
		Integer page, String search, Locale locale, Model model) {
	if(page == null) page = 1;
	String lang = locale.getLanguage();
	boardService.increaseHit(articleNo);

	Article article = boardService.getArticle(articleNo);//상세보기에서 볼 게시글
	List&lt;AttachFile&gt; attachFileList = boardService.getAttachFileList(articleNo);
	Article nextArticle = boardService.getNextArticle(articleNo, boardCd, search);
	Article prevArticle = boardService.getPrevArticle(articleNo, boardCd, search);
	List&lt;Comment&gt; commentList = boardService.getCommentList(articleNo);
	String boardName = this.getBoardName(boardCd, lang);

	//상세보기에서 볼 게시글 관련 정보
	String title = article.getTitle();//제목
	String content = article.getContent();//내용
	content = content.replaceAll(WebContants.LINE_SEPARATOR, "&lt;br /&gt;");
	int hit = article.getHit();//조회수
	String name = article.getName();//작성자 이름
	String email = article.getEmail();//작성자 ID
	Date regdate = article.getRegdate();//작성일

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

	//목록관련
	int numPerPage = 10;//페이지당 레코드 수
	int pagePerBlock = 10;//블록당 페이지 링크수

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
	
	//articleNo와 boardCd는 파라미터로 전달되지 않기에
	model.addAttribute("articleNo", articleNo);
	model.addAttribute("boardCd", boardCd);
	
	return "bbs/view";
}
</pre>

<p>
수정을 마쳤다면 컴파일한다.
</p>

<pre class="shell-prompt">
mvn clean compile war:inplace
</pre>


<h3>톰캣 컨텍스트 파일</h3>

<p>
ROOT 애플리케이션으로 테스트해야 한다.
다음과 같이 ROOT.xml을 수정한다.
</p>

<pre class="shell-prompt">
cd /etc/tomcat7/Catalina/localhost
sudo nano ROOT.xml
</pre>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="/home/kim/Lab/SpringBbs/src/main/webapp"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>


<h3>테스트</h3>

<p>
톰캣을 재실행한다.
</p>

<pre class="shell-prompt">
sudo service tomcat8 restart
</pre>


<p>
http://localhost:8080 방문한다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://fosskb.wordpress.com/2015/04/18/installing-openstack-kilo-on-ubuntu-15-04-single-machine-setup/">https://fosskb.wordpress.com/2015/04/18/installing-openstack-kilo-on-ubuntu-15-04-single-machine-setup/</a></li>
</ul>

</article>
