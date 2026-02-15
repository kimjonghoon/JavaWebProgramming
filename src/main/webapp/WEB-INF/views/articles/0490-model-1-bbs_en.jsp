<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Model 1 Board</h1>

<p>
Model 1 is a web application that extracts Java code from JSPs, turns them into Java classes, and uses them.
</p>

<p>
The bulletin board code in the previous section contains the JDBC code in the JSP. Unfortunately, such code is a nightmare in terms of maintenance.
</p>

<p>
Java programmers should always think about reuse. For reusability, we have to go through a process called Java design. Java design for pure Java applications and Java design for web applications are no different.
</p>

<p>
Let's start Java design for the bulletin board.
</p>


<h6 class="src">Article.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.Date;

public class Article {
  public static final String LINE_SEPARATOR = System.getProperty("line.separator");

  private int no;
  private String title;
  private String content;
  private Date wdate;
  private int parent;
  private int indent;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    if (content == null) content = "";
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getHtmlContent() {
    if (content == null) {
      return "";
    } else {
      return content.replaceAll(LINE_SEPARATOR, "&lt;br /&gt;");
    }
  }

  public Date getWdate() {
    return wdate;
  }

  public void setWdate(Date wdate) {
    this.wdate = wdate;
  }

  public int getParent() {
    return parent;
  }

  public void setParent(int parent) {
    this.parent = parent;
  }

  public int getIndent() {
    return indent;
  }

  public void setIndent(int indent) {
    this.indent = indent;
  }

}
</pre>

<p>
Fields of the Article class are mapped to columns of the board table. Thus, there is no indent column in the board table but the indent field in the article class. This field is used to indent the titles in the list.
</p>

<p>
Fields of the Article class are mapped to columns of the board table except for the indent field used to indent the titles in the list.
</p>

<p>
The getHtmlContent() is a method that converts the newline character stored in the content column to &lt;br /&gt;, which is used in the detailed view page.
</p>

<p>
<em>public static final String LINE_SEPARATOR = System.getProperty("line.separator");</em>
</p>

<p>
The LINE_SEPARATOR constant is used in the getHtmlContent() method. The following is the class to manage constants used by the bulletin board program.
</p>

<h6 class="src">WebContants.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class WebContants {
  //Line Separator
  public final static String LINE_SEPARATOR = System.getProperty("line.separator");
}
</pre>

<p>
Remove the LINE_SEPARATOR declaration from the Article class and modify the Article's getHtmlContent() method as follows:
</p>

<pre class="prettyprint">
//.. Omit ..

import net.java_school.commons.WebContants;

public class Article {
  //public static final String LINE_SEPARATOR = System.getProperty("line.separator"); //Remove it
	
  //.. Omit ..

  public String getHtmlContent() {
    if (content == null) {
      return "";
    } else {
      return content.replaceAll(<strong>WebContants.LINE_SEPARATOR</strong>, "&lt;br /&gt;");
    }
  }

  //.. Omit ..
}
</pre>

<p>
You may change the WebContants class to an enum like this:
</p>

<h6 class="src">WebContants.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public enum WebContants {
  lineSeparator (System.getProperty("line.separator"));
	
  public String value;
	
  WebContants (String value) {
    this.value = value;
  }
}
</pre>

<p>
If you change it to enum, the Article's getHtmlContent() method changes as follows:
</p>

<pre class="prettyprint">
public String getHtmlContent() {
  if (content == null) {
    return "";
  } else {
    return content.replaceAll(<strong>WebContants.lineSeparator.value</strong>, "&lt;br /&gt;");
  }
}
</pre>

<p>
Next, create a BoardDao class responsible for JDBC.
At the end of the name, Dao stands for Data Access Object, which only performs tasks related to data storage. This pattern is called the DAO pattern.
</p>

<p>
The following section describes the open-source connection pool and how to modify BoardDao to use an open-source connection pool. For this, BoardDao in this section will not use the connection pool itself.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import net.java_school.util.Log;

public class BoardDao {
  private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  private static final String USER = "scott";
  private static final String PASSWORD = "tiger";
	
  public BoardDao() {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
  }
	
  private Connection getConnection() throws SQLException {
    return DriverManager.getConnection(URL, USER, PASSWORD);
  }
	
  private void close(ResultSet rs, PreparedStatement stmt, Connection con) {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (stmt != null) {
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
	
  public List&lt;Article&gt; getBoardList(int start, int end, String keyword) {
    Log log = new Log();
    List&lt;Article&gt; list = new ArrayList&lt;Article&gt;();
    String sql = null;
		
    if (keyword == null || keyword.equals("")) {
      sql = "SELECT no, indent, parent, title, wdate FROM " +
        "(SELECT ROWNUM R, A.* " +
        "FROM " +
        "(SELECT no, level as indent, parent, title, wdate FROM board " +
        "START WITH parent = 0 " +
        "CONNECT BY PRIOR no = parent " +
        "ORDER SIBLINGS BY no DESC) A) " +
        "WHERE R BETWEEN ? AND ?";
    } else {
      keyword = "%" + keyword + "%";
      sql = "SELECT no, indent, parent, title, wdate FROM " +
        "(SELECT ROWNUM R, A.* " +
        "FROM " +
        "(SELECT no, level as indent, parent, title, wdate FROM board " +
        "WHERE title LIKE ? OR content LIKE ? " +
        "START WITH parent = 0 " +
        "CONNECT BY PRIOR no = parent " +
        "ORDER SIBLINGS BY no DESC) A) " +
        "WHERE R BETWEEN ? AND ?";
    }

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
		
    try {
      con = getConnection();
      stmt = con.prepareStatement(sql);
      if (keyword == null || keyword.equals("")) {
        stmt.setInt(1, start);
        stmt.setInt(2, end);
      } else {
        stmt.setString(1, keyword);
        stmt.setString(2, keyword);
        stmt.setInt(3, start);
        stmt.setInt(4, end);
      }
      rs = stmt.executeQuery();
			
      while (rs.next()) {
        Article article = new Article();
        article.setNo(rs.getInt("no"));
        article.setTitle(rs.getString("title"));
        article.setWdate(rs.getDate("wdate"));
        article.setIndent(rs.getInt("indent"));
        list.add(article);
      }
    } catch (SQLException e) {
      log.debug("Error Source : BoardDao.getBoardList() : SQLException");
      log.debug("SQLState : " + e.getSQLState());
      log.debug("Message : " + e.getMessage());
      log.debug("Oracle Error Code : " + e.getErrorCode());
      log.debug("sql : " + sql);
    } finally {
      close(rs, stmt, con);
      log.close();
    }
		
    return list;
  }
	
  public int getTotalRecord(String keyword) {
    Log log = new Log();
    int totalRecord = 0;
    String sql = null;
		
    if (keyword == null || keyword.equals("")) {
      sql = "SELECT count(*) FROM board";
    } else {
      sql = "SELECT count(*) FROM board " +
      "WHERE title LIKE ? OR content LIKE ?";
    }
				
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
		
    try {
      con = getConnection();
      stmt = con.prepareStatement(sql);
      if (keyword != null &amp;&amp; !keyword.equals("")) {
        keyword = "%" + keyword + "%";
        stmt.setString(1, keyword);
        stmt.setString(2, keyword);
      }
      rs = stmt.executeQuery();
      rs.next();
      totalRecord = rs.getInt(1);
    } catch (SQLException e) {
      log.debug("Error Source : BoardDao.getTotalRecord() : SQLException");
      log.debug("SQLState : " + e.getSQLState());
      log.debug("Message : " + e.getMessage());
      log.debug("Oracle Error Code : " + e.getErrorCode());
      log.debug("sql : " + sql);
    } finally {
      close(rs, stmt, con);
      log.close();
    }
		
    return totalRecord;
  }

}
</pre>

<p>
The following method produces the numbers needed to paginate the list.
</p>

<pre class="prettyprint">
public Map&lt;String, Integer&gt; getNumbersForPaging(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
  Map&lt;String, Integer&gt; map = new HashMap&lt;String, Integer&gt;();
	
  int totalPage = totalRecord / numPerPage;
  if (totalRecord % numPerPage != 0) totalPage++;
  int totalBlock = totalPage / pagePerBlock;
  if (totalPage % pagePerBlock != 0) totalBlock++;
	
  int block = curPage / pagePerBlock;
  if (curPage % pagePerBlock != 0) block++;
	
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

  int listItemNo = totalRecord - (curPage - 1) * numPerPage;
  int startRecord = (curPage - 1) * numPerPage + 1;
  int endRecord = curPage * numPerPage;

  map.put("totalPage", totalPage);
  map.put("firstPage", firstPage);
  map.put("lastPage", lastPage);
  map.put("prevPage", prevPage);
  map.put("nextPage", nextPage);
  map.put("listItemNo", listItemNo);
  map.put("startRecord", startRecord);
  map.put("endRecord", endRecord);

  return map;
}    
</pre>

<p>
Modify the list page to use the above method.
</p>

<h6 class="src">/board/list.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%@ page import="java.util.*" %&gt;
&lt;%!
public Map&lt;String, Integer&gt; getNumbersForPaging(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {

  Map&lt;String, Integer&gt; map = new HashMap&lt;String, Integer&gt;();
	
  int totalPage = totalRecord / numPerPage;
  if (totalRecord % numPerPage != 0) totalPage++;
  int totalBlock = totalPage / pagePerBlock;
  if (totalPage % pagePerBlock != 0) totalBlock++;
	
  int block = curPage / pagePerBlock;
  if (curPage % pagePerBlock != 0) block++;
	
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

  int listItemNo = totalRecord - (curPage - 1) * numPerPage;
  int startRecord = (curPage - 1) * numPerPage + 1;
  int endRecord = curPage * numPerPage;

  map.put("totalPage", totalPage);
  map.put("firstPage", firstPage);
  map.put("lastPage", lastPage);
  map.put("prevPage", prevPage);
  map.put("nextPage", nextPage);
  map.put("listItemNo", listItemNo);
  map.put("startRecord", startRecord);
  map.put("endRecord", endRecord);

  return map;
}
%&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
BoardDao dao = new BoardDao();
int totalRecord = dao.getTotalRecord(keyword);
Map&lt;String, Integer&gt; numbers = this.getNumbersForPaging(totalRecord, curPage, 10, 5);
int startRecord = numbers.get("startRecord");
int endRecord = numbers.get("endRecord");
List&lt;Article&gt; list = dao.getBoardList(startRecord, endRecord, keyword);
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;List&lt;/title&gt;
&lt;/head&gt;
&lt;body style="font-size: 11px;"&gt;
&lt;h1&gt;List&lt;/h1&gt;
&lt;%
int listItemNo = numbers.get("listItemNo");//This value is the number assigned to the list item on the list page.It is not a value stored in the no column.
for (int i = 0; i &lt; list.size(); i++) {
  Article article = list.get(i);
  int indent = article.getIndent();
  for (int j = 0; j &lt; indent; j++) {
    out.println("&amp;nbsp;&amp;nbsp;");
  }
  if(indent != 1) {
    out.println("&#8627;");
  }
%&gt;
&lt;%=listItemNo %&gt;
&lt;a href="view.jsp?no=&lt;%=article.getNo() %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;&lt;%=article.getTitle() %&gt;&lt;/a&gt;
&lt;%=article.getWdate() %&gt;&lt;br /&gt;
&lt;hr /&gt;
&lt;%
listItemNo--;
}
int prevPage = numbers.get("prevPage");
if (prevPage != 0) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=prevPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;]&lt;/a&gt;
&lt;%
}
int firstPage = numbers.get("firstPage");
int lastPage = numbers.get("lastPage");
for (int i = firstPage; i &lt;= lastPage; i++) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=i %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;%=i %&gt;]&lt;/a&gt;
&lt;%
}
int nextPage = numbers.get("nextPage");
if (nextPage != 0) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=nextPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&gt;]&lt;/a&gt;
&lt;%
}
%&gt;				
&lt;p&gt;
&lt;a href="write_form.jsp?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;New&lt;/a&gt;
&lt;/p&gt;
&lt;form method="get"&gt;
  &lt;input type="text" size="10" maxlength="30" name="keyword" /&gt;
  &lt;input type="submit" value="Search" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Article and BoardDao are all you need to create a simple bulletin board. But, most web programs have a class that acts as only one reception desk to web components like JSPs and servlets. These class's names end up with Service.  This pattern is called the Service pattern.
</p>

<p>
Create a BoardService class as shown below.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

public class BoardService {

  private BoardDao dao = new BoardDao();
	
  public BoardService() {}
	
  public Map&lt;String, Integer&gt; getNumbersForPaging(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
    Map&lt;String, Integer&gt; map = new HashMap&lt;String, Integer&gt;();
		
    int totalPage = totalRecord / numPerPage;
    if (totalRecord % numPerPage != 0) totalPage++;
    int totalBlock = totalPage / pagePerBlock;
    if (totalPage % pagePerBlock != 0) totalBlock++;
		
    int block = curPage / pagePerBlock;
    if (curPage % pagePerBlock != 0) block++;
		
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
	
    int listItemNo = totalRecord - (curPage - 1) * numPerPage;
    int startRecord = (curPage - 1) * numPerPage + 1;
    int endRecord = curPage * numPerPage;
	
    map.put("totalPage", totalPage);
    map.put("firstPage", firstPage);
    map.put("lastPage", lastPage);
    map.put("prevPage", prevPage);
    map.put("nextPage", nextPage);
    map.put("listItemNo", listItemNo);
    map.put("startRecord", startRecord);
    map.put("endRecord", endRecord);
	
    return map;
  }
	
  public List&lt;Article&gt; getBoardList(int startRecord, int endRecord, String keyword) {
    return dao.getBoardList(startRecord, endRecord, keyword);
  }
    
  public int getTotalRecord(String keyword) {
    return dao.getTotalRecord(keyword);
  }
}
</pre>

<p>
Now that JSPs only use the BoardService. Notice that the getNumbersForPaging() method declared in the list page has been moved to BoardService.
</p>

<p>
Modify the list page to use only BoardService.
</p>

<h6 class="src">list.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%@ page import="net.java_school.commons.*" %&gt;
&lt;%@ page import="java.util.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
int curPage = (request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage")));
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
BoardService service = new BoardService();
int totalRecord = service.getTotalRecord(keyword);
Map&lt;String, Integer&gt; numbers = service.getNumbersForPaging(totalRecord, curPage, 10, 5);
int startRecord = numbers.get("startRecord");
int endRecord = numbers.get("endRecord");
List&lt;Article&gt; list = service.getBoardList(startRecord, endRecord, keyword);
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;List&lt;/title&gt;
&lt;/head&gt;
&lt;body style="font-size: 11px;"&gt;
&lt;h1&gt;List&lt;/h1&gt;
&lt;%
int listItemNo = numbers.get("listItemNo");
for (int i = 0; i &lt; list.size(); i++) {
  Article article = list.get(i);
  int indent = article.getIndent();
  for (int j = 0; j &lt; indent; j++) {
    out.println("&amp;nbsp;&amp;nbsp;");
  }
  if(indent != 1) {
    out.println("&#8627;");
  }
%&gt;
&lt;%=listItemNo %&gt;
&lt;a href="view.jsp?no=&lt;%=article.getNo() %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;&lt;%=article.getTitle() %&gt;&lt;/a&gt;
&lt;%=article.getWdate() %&gt;&lt;br /&gt;
&lt;hr /&gt;
&lt;%
listItemNo--;
}
int prevPage = numbers.get("prevPage");
if (prevPage != 0) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=prevPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;]&lt;/a&gt;
&lt;%
}
int firstPage = numbers.get("firstPage");
int lastPage = numbers.get("lastPage");
for (int i = firstPage; i &lt;= lastPage; i++) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=i %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;%=i %&gt;]&lt;/a&gt;
&lt;%
}
int nextPage = numbers.get("nextPage");
if (nextPage != 0) {
%&gt;
  &lt;a href="list.jsp?curPage=&lt;%=nextPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&gt;]&lt;/a&gt;
&lt;%
}
%&gt;				
&lt;p&gt;
&lt;a href="write_form.jsp?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;New&lt;/a&gt;
&lt;/p&gt;
&lt;form method="get"&gt;
  &lt;input type="text" size="10" maxlength="30" name="keyword" /&gt;
  &lt;input type="submit" value="Search" /&gt;
&lt;/form&gt;	
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
I'm not going to use BoardWriter anymore because BoardService must provide all the board's logic. I'll use write.jsp instead of BoardWriter.
</p>

<p>
Modify the action attribute value of the form tag in write_form.jsp file to write.jsp.
</p>

<h6 class="src">write_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;New&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;New&lt;/h1&gt;
&lt;form action="<strong>write.jsp</strong>" method="post"&gt;
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;Title&lt;/td&gt;
  &lt;td&gt;&lt;input type="text" name="title" size="50"&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    &lt;textarea name="content" rows="20" cols="100"&gt;&lt;/textarea&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    &lt;input type="submit" value="Submit"&gt;
    &lt;input type="reset" value="Reset"&gt;
    &lt;a href="list.jsp?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;List&lt;/a&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Add the following method to BoardDao.
BoardDao's insert() method has the same logic as BoardWriter.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
public void insert(Article article) {
  Log log = new Log();
  String sql = "INSERT INTO board (no, title, content, wdate, parent) "
    + "VALUES (board_no_seq.nextval, ?, ?, sysdate, 0)";
		
  Connection con = null;
  PreparedStatement stmt = null;
	
  try {
    con = getConnection();
    stmt = con.prepareStatement(sql);
    stmt.setString(1, article.getTitle());
    stmt.setString(2, article.getContent());
    stmt.executeUpdate();
  } catch (SQLException e) {
    log.debug("Error Source : BoardDao.insert() : SQLException");
    log.debug("SQLState : " + e.getSQLState());
    log.debug("Message : " + e.getMessage());
    log.debug("Oracle Error Code : " + e.getErrorCode());
    log.debug("sql : " + sql);
  } finally {
    close(null, stmt, con);
    log.close();
  }
}
</pre>

<p>
Add the following method to BoardService.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
public void write(Article article) {
  dao.insert(article);
}
</pre>

<p>
Create write.jsp as shown below.
</p>

<h6 class="src">write.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String content = request.getParameter("content");

Article article = new Article();
article.setTitle(title);
article.setContent(content);

BoardService service= new BoardService();
service.write(article);

response.sendRedirect("list.jsp");
%&gt;
</pre>

<p>
Add the selectOne() method to BoardDao.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
public Article selectOne(int no) {
  Log log = new Log();
	
  Article article = null;
  String sql = "SELECT no, title, content, wdate FROM board WHERE no = ?";
	
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
	
  try {
    con = getConnection();
    stmt = con.prepareStatement(sql);
    stmt.setInt(1, no);
    rs = stmt.executeQuery();
    while (rs.next()) {
      article = new Article();
      article.setNo(rs.getInt("no"));
      article.setTitle(rs.getString("title"));
      article.setContent(rs.getString("content"));
      article.setWdate(rs.getDate("wdate"));
    }
  } catch (SQLException e) {
    log.debug("Error Source : BoardDao.selectOne() : SQLException");
    log.debug("SQLState : " + e.getSQLState());
    log.debug("Message : " + e.getMessage());
    log.debug("Oracle Error Code : " + e.getErrorCode());
    log.debug("sql : " + sql);
  } finally {
    close(rs, stmt, con);
    log.close();
  }

  return article;
}
</pre>

<p>
Add the following method to BoardService.
This method is used on the detailed view page.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
public Article getArticle(int no) {
  return dao.selectOne(no);
}
</pre>

<p>
Modify the detailed view page as shown below.
</p>

<h6 class="src">view.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
BoardService service = new BoardService();
Article article = service.getArticle(no);
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;View&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function goModify(no,curPage,keyword) {
  location.href="modify_form.jsp?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" + keyword;
}

function goDelete(no,curPage,keyword) {
  var check = confirm("Are you sure you want to delete it?");
  if (check) {
    location.href="del.jsp?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" + keyword;
  }
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;View&lt;/h1&gt;
&lt;h2&gt;Title: &lt;%=article.getTitle() %&gt;, Date created: &lt;%=article.getWdate() %&gt;&lt;/h2&gt;
&lt;p&gt;
&lt;%=article.getHtmlContent() %&gt;
&lt;/p&gt;
&lt;a href="list.jsp?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;List&lt;/a&gt;
&lt;input type="button" value="Modify" onclick="javascript:goModify('&lt;%=no %&gt;','&lt;%=curPage %&gt;','&lt;%=keyword %&gt;')"&gt;
&lt;input type="button" value="Delete" onclick="javascript:goDelete('&lt;%=no %&gt;','&lt;%=curPage %&gt;','&lt;%=keyword %&gt;')"&gt;
&lt;a href="reply_form.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;Reply&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Add the following update() method to BoardDao.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
public void update(Article article) {
  Log log = new Log();
  String sql = "UPDATE board SET title = ?, content = ? WHERE no = ?";		
  Connection con = null;
  PreparedStatement stmt = null;
  try {
    con = getConnection();
    stmt = con.prepareStatement(sql);
    stmt.setString(1, article.getTitle());
    stmt.setString(2, article.getContent());
    stmt.setInt(3, article.getNo());
    stmt.executeUpdate();
  } catch (SQLException e) {
    log.debug("Error Source : BoardDao.update() : SQLException");
    log.debug("SQLState : " + e.getSQLState());
    log.debug("Message : " + e.getMessage());
    log.debug("Oracle Error Code : " + e.getErrorCode());
    log.debug("sql : " + sql);
  } finally {
    close(null, stmt, con);
    log.close();
  }
}
</pre>

<p>
Add the following method to BoardService.
This method is used on the modify.jsp page.
The modify.jsp does the same thing as BoardModifier.
BoardModifier is deprecated.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
public void modify(Article article) {
  dao.update(article);
}
</pre>

<p>
Modify the modify_form.jsp to use only BoardService.
</p>

<h6 class="src">modify_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.sql.*" %&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

BoardService service = new BoardService();
Article article = service.getArticle(no);
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Edit posts&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Edit posts&lt;/h1&gt;
&lt;form action="modify.jsp" method="post"&gt;
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;"&gt;
&lt;input type="hidden" name="curPage" value="&lt;%=curPage %&gt;"&gt;
&lt;input type="hidden" name="keyword" value="&lt;%=keyword %&gt;"&gt;
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;Title&lt;/td&gt;
  &lt;td&gt;&lt;input type="text" name="title" size="50" value="&lt;%=article.getTitle() %&gt;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    &lt;textarea name="content" rows="30" cols="100"&gt;&lt;%=article.getContent() %&gt;&lt;/textarea&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    &lt;input type="submit" value="Submit"&gt;
    &lt;input type="reset" value="Reset"&gt;
    &lt;a href="view.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create a modify.jsp as shown below.
</p>

<h6 class="src">modify.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
String title = request.getParameter("title");
String content = request.getParameter("content");

Article article = new Article();
article.setNo(no);
article.setTitle(title);
article.setContent(content);

BoardService service= new BoardService();
service.modify(article);
keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
response.sendRedirect("view.jsp?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" +  keyword);
%&gt;
</pre>

<p>
Add a delete() method to BoardDao.
This method is used on the del.jsp page.
The del.jsp does the same thing as BoardDeleter.
BoardDeleter is deprecated.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
public void delete(int no) {
  Log log = new Log();
	
  String sql1 = "SELECT count(*) FROM board WHERE parent = ?";
  String sql2 = "DELETE FROM board WHERE no = ?";
	
  Connection con = null;
  PreparedStatement stmt1 = null;
  PreparedStatement stmt2 = null;
  ResultSet rs = null;
	
  boolean check = false; //If true, delete post
	
  try {
    con = getConnection();
    stmt1 = con.prepareStatement(sql1);
    stmt1.setInt(1, no);
    rs = stmt1.executeQuery();
    rs.next();
    int num = rs.getInt(1);
    if (num == 0) {
      check = true;
    }
    if (check == true) {
      stmt2 = con.prepareStatement(sql2);
      stmt2.setInt(1, no);
      stmt2.executeUpdate();
    }
  } catch (SQLException e) {
    log.debug("Error Source : BoardDao.delete() : SQLException");
    log.debug("SQLState : " + e.getSQLState());
    log.debug("Message : " + e.getMessage());
    log.debug("Oracle Error Code : " + e.getErrorCode());
    log.debug("sql : " + sql1);
  } finally {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {}
    }
    if (stmt1 != null) {
      try {
        stmt1.close();
      } catch (SQLException e) {}
    }
    if (stmt2 != null) {
      try {
        stmt2.close();
      } catch (SQLException e) {}
    }
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {}
    }
    log.close();
  }
}
</pre>

<p>
Add the following method to BoardService.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
public void delete(int no) {
  dao.delete(no);
}
</pre>

<p>
Create a del.jsp as follows.
</p>

<h6 class="src">del.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

BoardService service= new BoardService();
service.delete(no);
keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
response.sendRedirect("list.jsp?curPage=" + curPage + "&amp;keyword=" +  keyword);
%&gt;
</pre>

<p>
Add the following reply() method to BoardDao.
</p>

<h6 class="src">BoardDao.java</h6>
<pre class="prettyprint">
public void reply(Article article) {
  Log log = new Log();
	
  String sql = "INSERT INTO board " + 
      "(no, parent, title, content, wdate) " + 
      "VALUES (board_no_seq.nextval, ?, ?, ?, sysdate)";
			
  Connection con = null;
  PreparedStatement stmt = null;
	
  try {
    con = getConnection();
    stmt = con.prepareStatement(sql);
    stmt.setInt(1, article.getParent());
    stmt.setString(2, article.getTitle());
    stmt.setString(3, article.getContent());
    stmt.executeUpdate();
  } catch (SQLException e) {
    log.debug("Error Source:BoardDao.reply() : SQLException");
    log.debug("SQLState : " + e.getSQLState());
    log.debug("Message : " + e.getMessage());
    log.debug("Oracle Error Code : " + e.getErrorCode());
    log.debug("sql : " + sql);
  } finally {
    if (stmt != null) {
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    log.close();
  }
}
</pre>

<p>
Add the following reply() method to BoardService.
This method is used in the reply.jsp page.
The reply.jsp does the same thing as BoardReplier.
BoardReplier is deprecated.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
public void reply(Article article) {
  dao.reply(article);
}
</pre>

<h6 class="src">reply_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%@ page import="net.java_school.commons.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

BoardService service = new BoardService();
Article article = service.getArticle(no);
String content = article.getContent();

//Add &gt; for each line of the parent content.
content = content.replaceAll(WebContants.lineSeparator.value, WebContants.lineSeparator.value + "&gt;");
content = WebContants.lineSeparator.value + WebContants.lineSeparator.value + "&gt;" + content;
%&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Reply&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;h1&gt;Reply&lt;/h1&gt;

&lt;form action="reply.jsp" method="post"&gt;
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;
&lt;input type="hidden" name="curPage" value="&lt;%=curPage %&gt;" /&gt;
&lt;input type="hidden" name="keyword" value="&lt;%=keyword %&gt;" /&gt;
Title : &lt;input type="text" name="title" size="45" value="&lt;%=article.getTitle() %&gt;" /&gt;&lt;br /&gt;
&lt;textarea name="content" rows="10" cols="60"&gt;&lt;%=content %&gt;&lt;/textarea&gt;&lt;br /&gt;
&lt;input type="submit" value="Submit" /&gt;
&lt;input type="reset" value="Reset" /&gt;&lt;br /&gt;
&lt;/form&gt;
&lt;a href="view.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create a reply.jsp as shown below.
</p>

<h6 class="src">reply.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");

int parent = Integer.parseInt(request.getParameter("no"));
String title = request.getParameter("title");
String content = request.getParameter("content");

String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

Article article = new Article();
article.setParent(parent);
article.setTitle(title);
article.setContent(content);

BoardService service= new BoardService();
service.reply(article);

keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
response.sendRedirect("list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
%&gt;
</pre>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/datasource"/>">DataSource</a></li>
		<li>Prev : <a href="<c:url value="/jsp/thread-bbs"/>">Thread Board</a></li>
	</ul>
</div>

</article>