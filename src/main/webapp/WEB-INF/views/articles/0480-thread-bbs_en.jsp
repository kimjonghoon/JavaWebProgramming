<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Bulletin Boards with replies</h1>

<p>
This section describes:
</p>

<ol>
	<li>How to make bulletin boards with replies using databases that have not Hierarchical Queries</li>
	<li>Hierarchical Queries in Oracle SQL</li>
	<li>Using Oracle Hierarchical Query to create bulletin boards with replies</li>
</ol>

<p>
Below is a typical bulletin board with replies.
</p>

<table>
<tr>
	<th>no</th>
	<th>title</th>
	<th>wdate</th>
</tr>
<tr>
	<td>29</td>
	<td><em>29 posts</em></td>
	<td>2007/12/09</td>
</tr>
<tr>
	<td>27</td>
	<td><em>27 posts</em></td>
	<td>2007/11/27</td>
</tr>
<tr>
	<td>32</td>
	<td><span style="padding-left: 14px;">&#8627; First reply in 27 posts</span></td>
	<td>2007/12/22</td>
</tr>
<tr>
	<td>26</td>
	<td><em>26 posts</em></td>
	<td>2007/11/25</td>
</tr>
<tr>
	<td>30</td>
	<td><span style="padding-left: 14px;">&#8627; Second reply in 26 posts</span></td>
	<td>2007/12/20</td>
</tr>
<tr>
	<td>31</td>
	<td><span style="padding-left: 28px;">&#8627; First reply in 30 posts</span></td>
	<td>2007/12/21</td>
</tr>
<tr>
	<td>33</td>
	<td><span style="padding-left: 42px;">&#8627; First reply in 31 posts</span></td>
	<td>2007/12/23</td>
</tr>
<tr>
	<td>28</td>
	<td><span style="padding-left: 14px;">&#8627; First reply in 26 posts</span></td>
	<td>2007/12/01</td>
</tr>
<tr>
	<td>25</td>
	<td><em>posts 1</em></td>
	<td>2007/11/20</td>
</tr>
</table>

<h2>How to make bulletin boards with replies using databases that have not Hierarchical Queries</h2>

<p>
The 25th post, the 26th post, the 27th post, the29th post are original posts, not replies. So these become the top post of their group.
</p>

<h3>Fields to add for bulletin boards with replies</h3>

<p>
Each post should have the following information:
</p>

<ol>
	<li>which group it belongs to</li>
	<li>how far below it is from the top of the group</li>
	<li>how much its title should be indented on the list</li>
</ol>

<p>
Add a column named family for 1.
Add a column named depth for 2.
Add a column named indent for 3.
</p>

<table class="table-in-article">
<tr>
	<th>Column</th>
	<th>Type</th>
	<th>Description</th>
</tr>
<tr>
	<td>family</td>
	<td>number</td>
	<td>Group number</td>
</tr>
<tr>
	<td>depth</td>
	<td>number</td>
	<td>Order from the top of the group</td>
</tr>
<tr>
	<td>indent</td>
	<td>number</td>
	<td>Indentation level</td>
</tr>
</table>

<p>
When you delete the 30th posts, you must also delete the 31st and 33rd posts. But you can't do this with just the family, depth, and indent fields. You need information about replies' parents.
</p>

<p>
Add a column named parent.
</p>

<table class="table-in-article">
<tr>
	<th>no</th>
	<th>parent</th>
	<th>title</th>
	<th>wdate</th>
</tr>
<tr>
	<td>29</td>
	<td>0</td>
	<td>29 posts</td>
	<td>2007/12/09</td>
</tr>
<tr>
	<td>27</td>
	<td>0</td>
	<td>27 posts</td>
	<td>2007/11/27</td>
</tr>
<tr>
	<td>32</td>
	<td>27</td>	
	<td>&nbsp;&nbsp;&#8627; First reply in 27 posts</td>
	<td>2007/12/22</td>
</tr>
<tr>
	<td>26</td>
	<td>0</td>
	<td>26 posts</td>
	<td>2007/11/25</td>
</tr>
<tr style="background: #999;font-weight: bold;">
	<td>30</td>
	<td>26</td>
	<td style="text-decoration: line-through;">&nbsp;&nbsp;&#8627; Second reply in 26 posts</td>
	<td>2007/12/20</td>
</tr>
<tr style="background: #999;font-weight: bold;">
	<td>31</td>
	<td>30</td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&#8627; First reply in 30 posts</td>
	<td>2007/12/21</td>
</tr>
<tr style="background: #999;font-weight: bold;">
	<td>33</td>
	<td>31</td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8627; First reply in 31 posts</td>
	<td>2007/12/23</td>
</tr>
<tr>
	<td>28</td>
	<td>26</td>
	<td>&nbsp;&nbsp;&#8627; First reply in 26 posts</td>
	<td>2007/12/01</td>
</tr>
<tr>
	<td>25</td>
	<td>0</td>
	<td>25 posts</td>
	<td>2007/11/20</td>
</tr>
</table>

<p>
In conclusion, the columns needed for bulletin boards with replies are:
</p>

<table class="table-in-article">
<tr>
	<th>Column</th>
	<th>Type</th>
	<th>Description</th>
</tr>
<tr>
	<td>family</td>
	<td>number</td>
	<td>Group number</td>
</tr>
<tr style="font-weight: bold;">
	<td>parent</td>
	<td>number</td>
	<td>The no column value of the parent posts</td>
</tr>
<tr>
	<td>depth</td>
	<td>number</td>
	<td>Order from the top of the group</td>
</tr>
<tr>
	<td>indent</td>
	<td>number</td>
	<td>Indentation level</td>
</tr>
</table>

<h3>bulletin boards with replies algorithm</h3>

<h4>New posts</h4>

<p>
A new post creates a group.<br />
The column values are determined as follows.
</p>

<table class="table-in-article">
<tr>
	<th>Field</th>
	<th>Value</th>
</tr>
<tr>
	<td>family</td>
	<td>Same as no column value</td>
</tr>
<tr>
	<td>parent</td>
	<td>0</td>
</tr> 
<tr>
	<td>depth</td>
	<td>0</td>
</tr>
<tr>
	<td>indent</td>
	<td>0</td>
</tr>
</table>

<h4>Reply</h4>

<p>
The column values are determined as follows. 
</p>

<table class="table-in-article">
<tr>
	<th>Field</th>
	<th>Value</th>
</tr>
<tr>
	<td>family</td>
	<td>Group number</td>
</tr>
<tr>
	<td>parent</td>
	<td>parent posts's no</td>
</tr>
<tr>
	<td>depth</td>
	<td>(parent's depth) + 1</td>
</tr>
<tr>
	<td>indent</td>
	<td>(parent's indent) + 1</td>
</tr>
</table>

<h3>Changing the board table for bulletin boards with replies</h3>

<pre class="prettyprint">
alter table board 
add (family number, parent number, depth number, indent number)
/
update board set family = no, parent = 0, depth = 0, indent = 0
/
</pre>

<h4>Modify list.jsp</h4>

<p>
Modify the following query to retrieve the records.
</p>

<pre class="prettyprint">
if (keyword.equals("")) {
  sql = "SELECT no,family,parent,depth,indent,title,wdate " +
    "FROM (SELECT ROWNUM R, A.* FROM (" +
    "SELECT no,family,parent,depth,indent,title,wdate FROM board " + 
    "ORDER BY family DESC, depth ASC) A) " +
    "WHERE R BETWEEN ? AND ?";
} else {
  sql = "SELECT no,family,parent,depth,indent,title,wdate " +
    "FROM (SELECT ROWNUM R, A.* FROM (" +
    "SELECT no,family,parent,depth,indent,title,wdate FROM board " +
    "WHERE title LIKE '%" + keyword + "%' OR content LIKE '%" + keyword + "%' " + 
    "ORDER BY family DESC, depth ASC) A) " + 
    "WHERE R BETWEEN ? AND ?";
}
</pre>

<p>
Indent as shown below.
</p>

<pre class="prettyprint">
while (rs.next()) {
  int no = rs.getInt("no");
  String title = rs.getString("title");
  Date wdate = rs.getDate("wdate");
  int indent = rs.getInt("indent");
  for (int i = 0; i &lt; indent; i++) {
    out.println("&amp;nbsp;&amp;nbsp;");
  }
  if(indent != 0) {
    out.println("&#8627;");
  }
	
  //.. Omit ..
}
</pre>

<p>
If it is an answer (indent! = 0), add &amp;nbsp;&amp;nbsp; as long as the indent column value and add "&#8627;" before the title.
</p>

<h4>Modify BoardWriter.java</h4>

<p>
Open the BoardWriter servlet file and modify the query as shown below.
</p>

<pre class="prettyprint">
String sql = "INSERT INTO board (no,title,content,wdate,family,parent,depth,indent) "
  + "VALUES (board_no_seq.nextval, ?, ?, sysdate, board_no_seq.nextval, 0, 0, 0)";
</pre>

<h4>Modify detailed view page</h4>

<p>
Open the view.jsp file and insert the following code in the appropriate location:
</p>

<pre class="prettyprint">
&lt;a href="reply_form.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;Reply&lt;/a&gt;
</pre>

<h4>Modify Reply form page</h4>

<p>
Create reply_form.jsp as shown below.
</p>

<h6 class="src">reply_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.sql.*" %&gt;
&lt;%@ page import="net.java_school.util.*" %&gt;
&lt;%@ page import="net.java_school.db.dbpool.*" %&gt;
&lt;jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" /&gt;
&lt;!DOCTYPE html&gt;
&lt;%! static final String LINE_SEPARATOR = System.getProperty("line.separator"); %&gt; 
&lt;%
request.setCharacterEncoding("UTF-8");
Log log = new Log();

int family = 0;
int indent = 0;
int depth = 0;

String title = null;
String content = null;
Date wdate = null;

int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String sql = "SELECT no, family, depth, indent, title, content, wdate " +
    "FROM board " +
    "WHERE no = ?";

try {
  con = dbmgr.getConnection();
  stmt = con.prepareStatement(sql);
  stmt.setInt(1, no);
  rs = stmt.executeQuery();

  rs.next();
  no = rs.getInt("no");
  family = rs.getInt("family");
  depth = rs.getInt("depth");
  indent = rs.getInt("indent");
  title = rs.getString("title");
  content = rs.getString("content");

  //Add &amp;gt; for each line of the parent text.
  content = content.replaceAll(LINE_SEPARATOR, LINE_SEPARATOR + "&gt;");
  content = LINE_SEPARATOR + LINE_SEPARATOR +"&gt;" + content;
  wdate = rs.getDate("wdate");
} catch (SQLException e) {
  log.debug("Error Source : board/modify_form.jsp : SQLException");
  log.debug("SQLState : " + e.getSQLState());
  log.debug("Message : " + e.getMessage());
  log.debug("Oracle Error Code : " + e.getErrorCode());
  log.debug("sql : " + sql );
} finally {
  if (rs != null) {
    try {
      rs.close();
    } catch (SQLException e) {}
  }
  if (stmt != null) {
    try {
      stmt.close();
    } catch (SQLException e) {}
  }
  if (con != null) {
    try {
      con.close();
    } catch (SQLException e) {}
  }
}
%&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Reply&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Reply&lt;/h1&gt;
&lt;form action="../servlet/BoardReplier" method="post"&gt;
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;
&lt;input type="hidden" name="family" value="&lt;%=family %&gt;" /&gt;
&lt;input type="hidden" name="indent" value="&lt;%=indent %&gt;" /&gt;
&lt;input type="hidden" name="depth" value="&lt;%=depth %&gt;" /&gt;
&lt;input type="hidden" name="curPage" value="&lt;%=curPage %&gt;" /&gt;
&lt;input type="hidden" name="keyword" value="&lt;%=keyword %&gt;" /&gt;
Title: &lt;input type="text" name="title" size="45" value="&lt;%=title %&gt;" /&gt;&lt;br /&gt;
&lt;textarea name="content" rows="10" cols="60"&gt;&lt;%=content %&gt;&lt;/textarea&gt;&lt;br /&gt;
&lt;input type="submit" value="Submit" /&gt;
&lt;input type="reset" value="Reset" /&gt;&lt;br /&gt;
&lt;/form&gt;
&lt;a href="view.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create BoardReplier.java.
</p>

<h6 class="src">BoardReplier.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.sql.*;

import net.java_school.db.dbpool.*;
import net.java_school.util.*;

public class BoardReplier extends HttpServlet {
  
  OracleConnectionManager dbmgr = null;
	
  //Query for depth update
  String sql1 = "UPDATE board SET depth = depth + 1 " + 
      "WHERE family = ? AND depth &gt; ? ";
	
  //Queries for reply
  String sql2 = "INSERT INTO board " + 
      "(no, family, parent, depth, indent, title, content, wdate) " + 
      "VALUES (board_no_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
	
  @Override
  public void init() throws ServletException {
    ServletContext sc = getServletContext();
    dbmgr = (OracleConnectionManager)sc.getAttribute("dbmgr");
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) 
      throws ServletException, IOException {
		
    req.setCharacterEncoding("UTF-8");
    Log log = new Log();
		
    int parent = Integer.parseInt(req.getParameter("no"));
    int family = Integer.parseInt(req.getParameter("family"));
    int depth = Integer.parseInt(req.getParameter("depth"));
    int indent = Integer.parseInt(req.getParameter("indent"));
    String title = req.getParameter("title");
    String content = req.getParameter("content");
		
    String curPage = req.getParameter("curPage");
    String keyword = req.getParameter("keyword");
		
    Connection con = null;
    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
		
    try {
      con = dbmgr.getConnection();
      con.setAutoCommit(false);
			
      stmt1 = con.prepareStatement(sql1);
      stmt1.setInt(1,family);
      stmt1.setInt(2,depth);
      stmt1.executeUpdate();
			
      stmt2 = con.prepareStatement(sql2);
      stmt2.setInt(1, family);
      stmt2.setInt(2, parent);
      stmt2.setInt(3, depth+1);
      stmt2.setInt(4, indent+1);
      stmt2.setString(5, title);
      stmt2.setString(6, content);
      stmt2.executeUpdate();
      con.commit();
    } catch (SQLException e) {
      try {
        con.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      log.debug("Error Source:BoardReplier.java : SQLException");
      log.debug("SQLState : " + e.getSQLState());
      log.debug("Message : " + e.getMessage());
      log.debug("Oracle Error Code : " + e.getErrorCode());
      log.debug("sql : " + sql2);
    } finally {
      if (stmt1 != null) {
        try {
          stmt1.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt2 != null) {
        try {
          stmt2.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (con != null) {
        dbmgr.freeConnection(con);
      }
      log.close();
      String path = req.getContextPath();
      keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
      resp.sendRedirect(path + "/board/list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
    }
  }

}
</pre>

<p>
Add the following servlet definition and mapping to the web.xml.
</p>

<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;BoardReplier&lt;/servlet-name&gt;
  &lt;servlet-class&gt;net.java_school.board.BoardReplier&lt;/servlet-class&gt;
&lt;/servlet&gt;
&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;BoardReplier&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/servlet/BoardReplier&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
Restart Tomcat and test a reply.
</p>

<h4>Delete a post</h4>

<h5>Solution when you want not to delete a post with replies</h5>

<pre class="prettyprint">
String sql1 = "SELECT count(*) FROM board WHERE parent = ?";
String sql2 = "DELETE FROM board WHERE no = ?";

boolean check = false;

Connection con = null;
PreparedStatement stmt1 = null;
PreparedStatement stmt2 = null;
ResultSet rs = null;

con = dbmgr.getConnection();
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
</pre>

<h6 class="src">BoardDeleter.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.sql.*;

import net.java_school.db.dbpool.*;
import net.java_school.util.*;

public class BoardDeleter extends HttpServlet {

  private OracleConnectionManager dbmgr;
	
  private static final String SQL1 = "SELECT count(*) FROM board WHERE parent = ?";
  private static final String SQL2 = "DELETE FROM board WHERE no = ?";
	
  @Override
  public void init() throws ServletException {
    ServletContext sc = getServletContext();
    dbmgr = (OracleConnectionManager) sc.getAttribute("dbmgr");
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    doPost(req, resp);
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
		
    req.setCharacterEncoding("UTF-8");
    Log log = new Log();
		
    int no = Integer.parseInt(req.getParameter("no"));
    String curPage = req.getParameter("curPage");
    String keyword = req.getParameter("keyword");
		
    Connection con = dbmgr.getConnection();
    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;
		
    boolean check = false;
		
    try {
      stmt1 = con.prepareStatement(SQL1);
      stmt1.setInt(1, no);
      rs = stmt1.executeQuery();
      rs.next();
      int num = rs.getInt(1);
      if (num == 0) {
        check = true;
      }
      if (check == true) {
        stmt2 = con.prepareStatement(SQL2);
        stmt2.setInt(1, no);
        stmt2.executeUpdate();
      }
    } catch (SQLException e) {
      log.debug("Error Source : BoardDeleter.java : SQLException");
      log.debug("SQLState : " + e.getSQLState());
      log.debug("Message : " + e.getMessage());
      log.debug("Oracle Error Code : " + e.getErrorCode());
      log.debug("sql1 : " + SQL1);
      log.debug("sql2 : " + SQL2);
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt1 != null) {
        try {
          stmt1.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt2 != null) {
        try {
          stmt2.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (con != null) {
        dbmgr.freeConnection(con);
      }
      log.close();
      String path = req.getContextPath();
      keyword = java.net.URLEncoder.encode(keyword, "UTF-8");
      resp.sendRedirect(path + "/board/list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
    }
  }

}
</pre>

<h5>Solution when you want to delete a post its all descendants</h5>

<table class="table-in-article">
<tr>
	<th style="width: 100px;">no</th>
	<th style="width: 100px;">parent</th>
	<th style="width: 100px;">family</th>
	<th>title</th>
</tr>
<tr>
	<td>85</td>
	<td>0</td>
	<td>85</td>
	<td>85 posts</td>
</tr>
<tr>
	<td>86</td>
	<td>85</td>
	<td>85</td>
	<td>&nbsp;&nbsp;&#8627; First reply in 85 posts</td>
</tr>
<tr>
	<td>87</td>
	<td>86</td>
	<td>85</td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&#8627; First reply in 86 posts</td>
</tr>
<tr>
	<td>88</td>
	<td>87</td>
	<td>85</td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8627; First reply in 87 posts</td>
</tr>
</table>

<ol>
	<li>Add the no of the posts to delete to the deletion list</li>
 	<li>Fetch one by one from the deletion list and find posts whose parent equals to the fetched value and add them to the deletion list</li>
	<li>Delete all posts stored in the deletion list</li>
</ol>

<h6 class="src"> RecursiveDeleter.java (perform the delete algorithm)</h6>
<pre class="prettyprint">
public class RecursiveDeleter {
  String sql1 = "SELECT no FROM board WHERE parent = ?";
  String sql2 = "DELETE FROM board WHERE no = ?";
	
  Connection con;
	
  Vector&lt;Integer&gt; v = new Vector&lt;Integer&gt;();//delete list
  int idx = 1; //To recursively call the next to the first one added to the list
	
  public RecursiveDeleter(Connection con) {
    this.con = con;
  }
	
  public void addDeleteList(int no) {
    v.addElement(new Integer(no));
  }
	
  public void getDeleteList(int no) {
    PreparedStatement stmt = null;
    ResultSet rs = null;
		
    try {
      stmt = con.prepareStatement(sql1);
      stmt.setInt(1, no);
      rs = stmt.executeQuery();
      while (rs.next()) {
        int target = rs.getInt(1);
        v.addElement(new Integer(target));
      }
      if(idx &lt; v.size()) {
        Integer value = (Integer) v.elementAt(idx++);
        getDeleteList(value.intValue());
      }
    } catch (SQLException e) {
    } finally {
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
    }
  }
	 
  public void delete() {
    PreparedStatement stmt = null;
		
    try {
      stmt = con.prepareStatement(sql2);
      for(int i = 0; i &lt; v.size(); i++) {
        Integer value = (Integer) v.elementAt(i);
        stmt.setInt(1, value.intValue());
        stmt.executeUpdate();
      }
    } catch (SQLException e) {
    } finally {
      v.removeAllElements();
      if (stmt != null) {
        try {
          stmt.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (con != null) {
        dbmgr.freeConnection(con);
      }
    }
  }

}
</pre>

<p>
You must call the method in the following order.
</p>

<ol>
	<li>addDeleteList(no);</li>
	<li>getDeleteList(no);</li>
	<li>delete();</li>
</ol>

<p>
If you want to delete the 86, add the 86 to the deletion list using the addDeleteList() method and then call the getDeleteList() method.
</p>

<p>
The getDeleteList() method retrieves the 86 from the deletion list and adds the 87 whose parent is the 86 to the deletion list. Next, this method calls itself to fetch the 87 from the deletion list and add the 88 whose parent is the 87 to the deletion list. Again, it calls itself to retrieve the 88 from the deletion list and finds the posts whose parent is the 88. Since no post whose parent is the 88, it completes the deletion list.
</p>

<p>
Finally, delete all the posts in the deletion list by calling the delete() method.
</p>

<p>
Methods that call themselves, such as getDeleteList(), are called recursive methods.
</p>

<p>
When the deletion list is complete, the getDeleteList() method should no longer be called. To do this, it used the idx as an index. Therefore, you need to trace how the idx value changes to understand the getDeleteList() method entirely.
</p>

<h6 class="src">BoardDeleter.java - (Remove all descendant posts)</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.*;
import java.net.URLEncoder;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.sql.*;
import java.util.Vector;

import net.java_school.db.dbpool.*;
import net.java_school.util.*;

public class BoardDeleter extends HttpServlet {
	
  private OracleConnectionManager dbmgr = null;
	
  class RecursiveDeleter {
    String sql1 = "SELECT no FROM board WHERE parent = ?";
    String sql2 = "DELETE FROM board WHERE no = ?";
		
    Connection con;
		
    Vector&lt;Integer&gt; v = new Vector&lt;Integer&gt;();
    int idx = 1; //To recursively call the next to the first one added to the list
		
    public RecursiveDeleter(Connection con) {
      this.con = con;
    }

    public void addDeleteList(int no) {
      v.addElement(new Integer(no));
    }
	
    public void getDeleteList(int no) {
      Log log = new Log();
      PreparedStatement stmt = null;
      ResultSet rs = null;
			
      try {
        stmt = con.prepareStatement(sql1);
        stmt.setInt(1, no);
        rs = stmt.executeQuery();
        while (rs.next()) {
          int target = rs.getInt(1);
          v.addElement(new Integer(target));
        }
        if(idx &lt; v.size()) {
          Integer value = (Integer) v.elementAt(idx++);
          getDeleteList(value.intValue());
        }
      } catch (SQLException e) {
        log.debug("Error Source : BoardDeleter.getDeleteList() : SQLException");
        log.debug("SQLState : " + e.getSQLState());
        log.debug("Message : " + e.getMessage());
        log.debug("Oracle Error Code : " + e.getErrorCode());
        log.debug("sql : " + sql1);
      } finally {
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
        log.close();
      }
    }
		 
    public void delete() {
      Log log = new Log();
			
      PreparedStatement stmt = null;
			
      try {
        stmt = con.prepareStatement(sql2);
        for(int i = 0; i &lt; v.size(); i++) {
          Integer value = (Integer) v.elementAt(i);
          stmt.setInt(1, value.intValue());
          stmt.executeUpdate();
        }
      } catch (SQLException e) {
        log.debug("Error Source : BoardDeleter.delete() : SQLException");
        log.debug("SQLState : " + e.getSQLState());
        log.debug("Message : " + e.getMessage());
        log.debug("Oracle Error Code : " + e.getErrorCode());
        log.debug("sql : " + sql2);
      } finally {
        v.removeAllElements();
        if (stmt != null) {
          try {
            stmt.close();
          } catch (SQLException e) {
            e.printStackTrace();
          }
        }
        if (con != null) {
          dbmgr.freeConnection(con);
        }
        log.close();
      }
    }
  }
	
  @Override
  public void init() throws ServletException {
    ServletContext sc = getServletContext();
    dbmgr = (OracleConnectionManager)sc.getAttribute("dbmgr");
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    doPost(req, resp);
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
		
    req.setCharacterEncoding("UTF-8");
		
    int no = Integer.parseInt(req.getParameter("no"));
    String curPage = req.getParameter("curPage");
    String keyword = req.getParameter("keyword");
		
    Connection con = dbmgr.getConnection();
    RecursiveDeleter deleter = new RecursiveDeleter(con);
    deleter.addDeleteList(no);
    deleter.getDeleteList(no);
    deleter.delete();
		
    String path = req.getContextPath();
    keyword = URLEncoder.encode(keyword, "UTF-8");
    resp.sendRedirect(path + "/board/list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
  }

}
</pre>

<h2>Oracle Hierarchical Query</h2>

<p>
Let's practice Oracle Hierarchical queries with the Scott account's emp table. The mgr column of the emp table stores the supervisor's employee number.
</p>

<pre class="prettyprint">
SELECT job, empno, ename, mgr
FROM emp
START WITH mgr is null
CONNECT BY PRIOR empno = mgr;
</pre>

<pre class="prettyprint">
JOB	       EMPNO ENAME	       MGR
--------- ---------- ---------- ----------
PRESIDENT	7839 KING
MANAGER 	7566 JONES	      7839
ANALYST 	7902 FORD	      7566
CLERK		7369 SMITH	      7902
MANAGER 	7698 BLAKE	      7839
SALESMAN	7499 ALLEN	      7698
SALESMAN	7521 WARD	      7698
SALESMAN	7654 MARTIN	      7698
SALESMAN	7844 TURNER	      7698
CLERK		7900 JAMES	      7698
MANAGER 	7782 CLARK	      7839
CLERK		7934 MILLER	      7782
</pre>

<p>
The start with clause is followed by a condition to find the highest position. The connect by clause connects parent and child nodes.
</p>

<p>
To easily understand hierarchical relationships, let's use the level pseudo column used in hierarchical queries.
</p>

<pre class="prettyprint">
SELECT level, job, empno, ename, mgr
FROM emp
START WITH mgr is null
CONNECT BY PRIOR  empno = mgr;
</pre>

<pre class="prettyprint">
     LEVEL JOB		  EMPNO ENAME		  MGR
---------- --------- ---------- ---------- ----------
	 1 PRESIDENT	   7839 KING
	 2 MANAGER	   7566 JONES		 7839
	 3 ANALYST	   7902 FORD		 7566
	 4 CLERK	   7369 SMITH		 7902
	 2 MANAGER	   7698 BLAKE		 7839
	 3 SALESMAN	   7499 ALLEN		 7698
	 3 SALESMAN	   7521 WARD		 7698
	 3 SALESMAN	   7654 MARTIN		 7698
	 3 SALESMAN	   7844 TURNER		 7698
	 3 CLERK	   7900 JAMES		 7698
	 2 MANAGER	   7782 CLARK		 7839
	 3 CLERK	   7934 MILLER		 7782
</pre>

<p>
Let's indent using the level column.
</p>

<pre class="prettyprint">
col job format a20;

SELECT LPAD(' ', 2*(LEVEL-1)) || job job, empno, ename, mgr
FROM emp
START WITH mgr is null
CONNECT BY PRIOR  empno = mgr;
</pre>

<pre class="prettyprint">
JOB			  EMPNO ENAME		  MGR
-------------------- ---------- ---------- ----------
PRESIDENT		   7839 KING
  MANAGER		   7566 JONES		 7839
    ANALYST		   7902 FORD		 7566
      CLERK		   7369 SMITH		 7902
  MANAGER		   7698 BLAKE		 7839
    SALESMAN		   7499 ALLEN		 7698
    SALESMAN		   7521 WARD		 7698
    SALESMAN		   7654 MARTIN		 7698
    SALESMAN		   7844 TURNER		 7698
    CLERK		   7900 JAMES		 7698
  MANAGER		   7782 CLARK		 7839
    CLERK		   7934 MILLER		 7782
</pre>

<p>
If you add <strong>ORDER BY empno DESC</strong> to sort the above query, the hierarchical relationship is broken. To keep the hierarchical relationship, use <strong>ORDER SIBLINGS BY empno DESC</strong>.
</p>

<pre class="prettyprint">
SELECT LPAD(' ', 2*(LEVEL-1)) || job job, empno, ename, mgr
FROM emp
START WITH mgr is null
CONNECT BY PRIOR  empno = mgr 
<strong>ORDER SIBLINGS BY empno DESC</strong>;
</pre>

<p>
Notice that the highlighted part of the result is sorted in empno descending order.
</p>

<pre class="prettyprint">
JOB			  EMPNO ENAME		  MGR
-------------------- ---------- ---------- ----------
PRESIDENT		   7839 KING
  MANAGER		   7782 CLARK		 7839
    CLERK		   7934 MILLER		 7782
  MANAGER		   7698 BLAKE		 7839
    CLERK		   <strong>7900</strong> JAMES		 7698
    SALESMAN		   <strong>7844</strong> TURNER		 7698
    SALESMAN		   <strong>7654</strong> MARTIN		 7698
    SALESMAN		   <strong>7521</strong> WARD		 7698
    SALESMAN		   <strong>7499</strong> ALLEN		 7698
  MANAGER		   7566 JONES		 7839
    ANALYST		   7902 FORD		 7566
      CLERK		   7369 SMITH		 7902
</pre>

<p>
The following query extracts only the top 10 records.
</p>

<pre class="prettyprint">
SELECT job, empno, ename,mgr FROM
(SELECT ROWNUM R, A.* 
FROM 
(SELECT LPAD(' ', 2*(LEVEL-1)) || job job, empno, ename, mgr
FROM emp
START WITH mgr is null
CONNECT BY PRIOR  empno = mgr 
ORDER SIBLINGS BY empno DESC) A) 
WHERE R BETWEEN 1 AND 10;
</pre>

<pre class="prettyprint">
JOB			  EMPNO ENAME		  MGR
-------------------- ---------- ---------- ----------
PRESIDENT		   7839 KING
  MANAGER		   7782 CLARK		 7839
    CLERK		   7934 MILLER		 7782
  MANAGER		   7698 BLAKE		 7839
    CLERK		   7900 JAMES		 7698
    SALESMAN		   7844 TURNER		 7698
    SALESMAN		   7654 MARTIN		 7698
    SALESMAN		   7521 WARD		 7698
    SALESMAN		   7499 ALLEN		 7698
  MANAGER		   7566 JONES		 7839
</pre>

<p>
If you want to create bulletin boards with replies using Oracle hierarchical queries, you only need to add the parent column to store the unique number of the parent post.
</p>

<h6 class="src">Oracle hierarchical Query for bulletin boards with replies</h6>
<pre class="prettyprint">
SELECT no, indent, parent, title, wdate FROM 
(SELECT ROWNUM R, A.* 
FROM 
(SELECT no, level as indent, parent, title, wdate FROM board 
START WITH parent = 0 
CONNECT BY PRIOR no = parent 
ORDER SIBLINGS BY no DESC) A) 
WHERE R BETWEEN 1 AND 10
</pre>

<h3>Modify list.jsp</h3>

<p>
Change the query that retrieves list data from as follows:
</p>

<pre class="prettyprint">
if (keyword.equals("")) {
  sql = "SELECT no, indent, parent, title, wdate FROM " +
  "(SELECT ROWNUM R, A.* " +
  "FROM " +
  "(SELECT no, level as indent, parent, title, wdate FROM board " +
  "START WITH parent = 0 " +
  "CONNECT BY PRIOR no = parent " +
  "ORDER SIBLINGS BY no DESC) A) " +
  "WHERE R BETWEEN ? AND ?";
} else {
  sql = "SELECT no, indent, parent, title, wdate FROM " +
  "(SELECT ROWNUM R, A.* " +
  "FROM " +
  "(SELECT no, level as indent, parent, title, wdate FROM board " +
  "WHERE title LIKE '%" + keyword + "%' OR content LIKE '%" + keyword + "%' " +
  "START WITH parent = 0 " +
  "CONNECT BY PRIOR no = parent " +
  "ORDER SIBLINGS BY no DESC) A) " +
  "WHERE R BETWEEN ? AND ?";
}
</pre>

<p>
Then modify the following in list.jsp:
</p>

<pre class="prettyprint">
if(indent != <strong>1</strong>) {
	out.println("&#8627;");
}
</pre>

<p>
The bulletin board usually works just fine.<br />
The following columns are no longer needed, so let's remove them.
</p>

<h4>ALTER TABLE board</h4>

<pre class="prettyprint">
ALTER TABLE board DROP COLUMN family
/
ALTER TABLE board DROP COLUMN depth
/
ALTER TABLE board DROP COLUMN indent
/
</pre>

<h3>New Post</h3>

<p>
If there is no parent, the parent column value is set to 0. Otherwise, the parent column value is set to the no column value of the parent post.
</p>

<p>
Edit the BoardWriter's new post-registration query as shown below.
</p>

<pre class="prettyprint">
String sql = "INSERT INTO board (no, title, content, wdate, parent) "
  + "VALUES (board_no_seq.nextval, ?, ?, sysdate, 0)";
</pre>

<h3>Reply</h3>

<h6 class="src">reply_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.sql.*" %&gt;
&lt;%@ page import="net.java_school.util.*" %&gt;
&lt;%@ page import="net.java_school.db.dbpool.*" %&gt;
&lt;jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" /&gt;
&lt;!DOCTYPE html&gt;
&lt;%! static final String LINE_SEPARATOR = System.getProperty("line.separator"); %&gt; 
&lt;%
request.setCharacterEncoding("UTF-8");
Log log = new Log();

int parent = 0;

String title = null;
String content = null;
Date wdate = null;

int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String sql = "SELECT no, title, content, wdate " +
        "FROM board " +
        "WHERE no = ?";

try {
  con = dbmgr.getConnection();
  stmt = con.prepareStatement(sql);
  stmt.setInt(1, no);
  rs = stmt.executeQuery();

  rs.next();
  no = rs.getInt("no");
  title = rs.getString("title");
  content = rs.getString("content");

  //add &gt; for each line of the parent post.
  content = content.replaceAll(LINE_SEPARATOR, LINE_SEPARATOR + "&gt;");
  content = LINE_SEPARATOR + LINE_SEPARATOR +"&gt;" + content;
  wdate = rs.getDate("wdate");
} catch (SQLException e) {
  log.debug("Error Source : board/modify_form.jsp : SQLException");
  log.debug("SQLState : " + e.getSQLState());
  log.debug("Message : " + e.getMessage());
  log.debug("Oracle Error Code : " + e.getErrorCode());
  log.debug("sql : " + sql );
} finally {
  if (rs != null) {
    try {
      rs.close();
    } catch (SQLException e) {}
  }
  if (stmt != null) {
    try {
      stmt.close();
    } catch (SQLException e) {}
  }
  if (con != null) {
    try {
      con.close();
    } catch (SQLException e) {}
  }

}
%&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Reply&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Reply&lt;/h1&gt;
&lt;form action="../servlet/BoardReplier" method="post"&gt;
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;
&lt;input type="hidden" name="curPage" value="&lt;%=curPage %&gt;" /&gt;
&lt;input type="hidden" name="keyword" value="&lt;%=keyword %&gt;" /&gt;
Title: &lt;input type="text" name="title" size="45" value="&lt;%=title %&gt;" /&gt;&lt;br /&gt;
&lt;textarea name="content" rows="10" cols="60"&gt;&lt;%=content %&gt;&lt;/textarea&gt;&lt;br /&gt;
&lt;input type="submit" value="Submit" /&gt;
&lt;input type="reset" value="Reset" /&gt;&lt;br /&gt;
&lt;/form&gt;
&lt;a href="view.jsp?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">BoardReplier.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.sql.*;

import net.java_school.db.dbpool.*;
import net.java_school.util.*;

public class BoardReplier extends HttpServlet {
  
  OracleConnectionManager dbmgr = null;
	
  //Queries for reply
  String sql = "INSERT INTO board " + 
      "(no, parent, title, content, wdate) " + 
      "VALUES (board_no_seq.nextval, ?, ?, ?, sysdate)";
	
  @Override
  public void init() throws ServletException {
    ServletContext sc = getServletContext();
    dbmgr = (OracleConnectionManager)sc.getAttribute("dbmgr");
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) 
      throws ServletException, IOException {
		
    req.setCharacterEncoding("UTF-8");
    Log log = new Log();
		
    int parent = Integer.parseInt(req.getParameter("no"));
    String title = req.getParameter("title");
    String content = req.getParameter("content");
		
    String curPage = req.getParameter("curPage");
    String keyword = req.getParameter("keyword");
		
    Connection con = null;
    PreparedStatement stmt = null;
		
    try {
      con = dbmgr.getConnection();
      stmt = con.prepareStatement(sql);
      stmt.setInt(1, parent);
      stmt.setString(2, title);
      stmt.setString(3, content);
      stmt.executeUpdate();
    } catch (SQLException e) {
      log.debug("Error Source:BoardReplier.java : SQLException");
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
        dbmgr.freeConnection(con);
      }
      log.close();
      String path = req.getContextPath();
      keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
      resp.sendRedirect(path + "/board/list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
    }
  }

}
</pre>

<h3>Delete a post</h3>

<p>
Solution when you don't want to delete a post with replies.
</p>

<h6 class="src">BoardDeleter.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.sql.*;

import net.java_school.db.dbpool.*;
import net.java_school.util.*;

public class BoardDeleter extends HttpServlet {

  private OracleConnectionManager dbmgr;
	
  private static final String SQL1 = "SELECT count(*) FROM board WHERE parent = ?";
  private static final String SQL2 = "DELETE FROM board WHERE no = ?";
	
  @Override
  public void init() throws ServletException {
    ServletContext sc = getServletContext();
    dbmgr = (OracleConnectionManager) sc.getAttribute("dbmgr");
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    doPost(req, resp);
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
		
    req.setCharacterEncoding("UTF-8");
    Log log = new Log();
		
    int no = Integer.parseInt(req.getParameter("no"));
    String curPage = req.getParameter("curPage");
    String keyword = req.getParameter("keyword");
		
    Connection con = dbmgr.getConnection();
    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;
		
    boolean check = false;
		
    try {
      stmt1 = con.prepareStatement(SQL1);
      stmt1.setInt(1, no);
      rs = stmt1.executeQuery();
      rs.next();
      int num = rs.getInt(1);
      if (num == 0) {
        check = true;
      }
      if (check == true) {
        stmt2 = con.prepareStatement(SQL2);
        stmt2.setInt(1, no);
        stmt2.executeUpdate();
      }
    } catch (SQLException e) {
      log.debug("Error Source : BoardDeleter.java : SQLException");
      log.debug("SQLState : " + e.getSQLState());
      log.debug("Message : " + e.getMessage());
      log.debug("Oracle Error Code : " + e.getErrorCode());
      log.debug("sql1 : " + SQL1);
      log.debug("sql2 : " + SQL2);
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt1 != null) {
        try {
          stmt1.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt2 != null) {
        try {
          stmt2.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (con != null) {
        dbmgr.freeConnection(con);
      }
      log.close();
      String path = req.getContextPath();
      keyword = java.net.URLEncoder.encode(keyword, "UTF-8");
      resp.sendRedirect(path + "/board/list.jsp?curPage=" + curPage + "&amp;keyword=" + keyword);
    }
  }
}
</pre>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/model-1-bbs"/>">Model 1 Board</a></li>
		<li>Prev : <a href="<c:url value="/jsp/bbs-basics"/>">Board Basics</a></li>
	</ul>
</div>

</article>