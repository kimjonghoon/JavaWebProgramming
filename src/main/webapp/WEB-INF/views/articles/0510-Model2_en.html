<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Model 2</title>
<meta name="Keywords" content="Java,Model 2,board program,Value Object(VO),Data Transfer Object(DTO)" />
<meta name="Description" content="This article describes Model 2" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>Model 2</h1>

<p>
Model 1 is a program structure that uses Java classes in JSP. Model 2 is a structure in which a controller is added to Model 1. The controller acts as a bridge between views (JSPs) and model (Java classes) responsible for business logic. The process of Model 2 is summarized as follows.
</p>

<ol>
	<li>The controller receives all requests.</li>
	<li>The controller delegates all tasks to models. The model is responsible for business logic. When the controller delegates tasks, it passes the request object to the model.</li>
	<li>The model completes the task and passes the results to the controller. The model does this by storing the results in the request object.</li>
	<li>The controller passes the result to JSP, which eventually serves the client's request. The controller uses the forward() method to perform this task.</li>
</ol>

<p>
The following servlet gives us hints about controllers.
</p>

<h6 class="src">ControllerServlet.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class ControllerServlet extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req,resp);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String uri = req.getRequestURI();
    String contextPath = req.getContextPath();
    String command = null;
    command = uri.substring(contextPath.length());
		
    PrintWriter out = resp.getWriter();
    out.println(command);
    out.close();
  }
}
</pre>

<p>
Add the following to web.xml:
</p>

<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;Controller&lt;/servlet-name&gt;
  &lt;servlet-class&gt;net.java_school.board.ControllerServlet&lt;/servlet-class&gt;
  &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;
&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;Controller&lt;/servlet-name&gt;
  &lt;url-pattern&gt;*.do&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
Restart Tomcat.
Visit the following addresses:
</p>

<ul>
	<li>http://localhost:8080/list.do</li>
	<li>http://localhost:8080/board/list.do</li>
	<li>http://localhost:8080/board/view.do</li>
	<li>http://localhost:8080/board/write_form.do</li>
	<li>http://localhost:8080/board/modify_form.do</li>
</ul>

<p>
You can see that the request string is printed on the web browser screen. Unlike before, the request string does not represent a specific component of the server. The controller will respond to the user's request by determining the model and view according to the request string.
</p>

<h3>Create Models</h3>

<p>
When you create a model class, let the class name end with Action. (This is the naming convention used by the Struts 2 framework) From now on, We will modify the model 1 bulletin board to the model 2 bulletin board. Let's change the list page first. For a list, the model should provide:
</p>

<ul>
	<li>The list item number on the list page</li>
	<li>The result set to be displayed on the list page</li>
	<li>The page number to [&lt;] link</li>
	<li>The page number to [&gt;] link</li>
	<li>The first page number</li>
	<li>The last page number</li>
</ul>

<p>
The execute() method of action classes returns the data that the action should provide. (This is also the naming convention used in Struts 2)
</p>

<h6 class="src">ListAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class ListAction {
  public void execute(HttpServletRequest request) {
    //TODO
  }
}
</pre>

<p>
Complete the execute() method as follows:
</p>

<h6 class="src">ListAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

public class ListAction {
  public void execute(HttpServletRequest request) throws UnsupportedEncodingException {
    request.setCharacterEncoding("UTF-8");
        
    int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
    String keyword = request.getParameter("keyword");
    if (keyword == null) keyword = "";

    BoardService service = new BoardService();
    int totalRecord = service.getTotalRecord(keyword);
    Map&lt;String, Integer&gt; numbers = service.getNumbersForPaging(totalRecord, curPage, 10, 5);
    int startRecord = numbers.get("startRecord");
    int endRecord = numbers.get("endRecord");
        
    List&lt;Article&gt; list = service.getBoardList(startRecord, endRecord, keyword);
        
    int listItemNo = numbers.get("listItemNo");
    int prevPage = numbers.get("prevPage");
    int nextPage = numbers.get("nextPage");
    int firstPage = numbers.get("firstPage");
    int lastPage = numbers.get("lastPage");
        
    request.setAttribute("list", list);
    request.setAttribute("listItemNo", listItemNo);
    request.setAttribute("prevPage", prevPage);
    request.setAttribute("nextPage", nextPage);
    request.setAttribute("firstPage", firstPage);
    request.setAttribute("lastPage", lastPage);
  }
}
</pre>

<p>
Let's modify the controller to perform the following code: 
</p>

<pre class="prettyprint">
request.setCharacterEncoding ("UTF-8");
</pre>

<h6 class="src">ControllerServlet.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class ControllerServlet extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req,resp);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    <strong>req.setCharacterEncoding("UTF-8");</strong>
    String uri = req.getRequestURI();
    String contextPath = req.getContextPath();
    String command = null;
    command = uri.substring(contextPath.length());
		
    PrintWriter out = resp.getWriter();
    out.println(command);
    out.close();
  }
}
</pre>

<h6 class="src">ListAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

public class ListAction {
  public void execute(HttpServletRequest request) {
    int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
    String keyword = request.getParameter("keyword");
    if (keyword == null) keyword = "";

    BoardService service = new BoardService();
    int totalRecord = service.getTotalRecord(keyword);
    Map&lt;String, Integer&gt; numbers = service.getNumbersForPaging(totalRecord, curPage, 10, 5);
    int startRecord = numbers.get("startRecord");
    int endRecord = numbers.get("endRecord");
        
    List&lt;Article&gt; list = service.getBoardList(startRecord, endRecord, keyword);
        
    int listItemNo = numbers.get("listItemNo");
    int prevPage = numbers.get("prevPage");
    int nextPage = numbers.get("nextPage");
    int firstPage = numbers.get("firstPage");
    int lastPage = numbers.get("lastPage");
        
    request.setAttribute("list", list);
    request.setAttribute("listItemNo", listItemNo);
    request.setAttribute("prevPage", prevPage);
    request.setAttribute("nextPage", nextPage);
    request.setAttribute("firstPage", firstPage);
    request.setAttribute("lastPage", lastPage);
  }
}
</pre>

<p>
Let's add code to the controller for the list request.
</p>

<h6 class="src">ControllerServlet.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class ControllerServlet extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req,resp);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    String uri = req.getRequestURI();
    String contextPath = req.getContextPath();
    String command = null;
    command = uri.substring(contextPath.length());
    <strong>
    String view = null; //JSP
    boolean isRedirect = false; //If false, forwarding

    if (command.equals("/board/list.do")) {
      ListAction listAction = new ListAction();
      listAction.execute(req);
      view = "/board/list.jsp";
    }

    if (isRedirect == false) {
      ServletContext sc = this.getServletContext();
      RequestDispatcher rd = sc.getRequestDispatcher(view);
      rd.forward(req, resp);
    } else {
      resp.sendRedirect(view);
    }
    </strong>
  }
}
</pre>

<p>
Modify the list page as shown below.
</p>

<h6 class="src">list.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%@ page import="java.util.*" %&gt;
&lt;%
String curPage = request.getParameter("curPage");
if (curPage == null) curPage = "1";
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
int listItemNo = (Integer) request.getAttribute("listItemNo");
List&lt;Article&gt; list = (List&lt;Article&gt;) request.getAttribute("list");
int prevPage = (Integer) request.getAttribute("prevPage");
int nextPage = (Integer) request.getAttribute("nextPage");
int firstPage = (Integer) request.getAttribute("firstPage");
int lastPage = (Integer) request.getAttribute("lastPage");
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
&lt;a href="view.do?no=&lt;%=article.getNo() %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;&lt;%=article.getTitle() %&gt;&lt;/a&gt;
&lt;%=article.getWdate() %&gt;&lt;br /&gt;
&lt;hr /&gt;
&lt;%
listItemNo--;
}
if (prevPage != 0) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=prevPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;]&lt;/a&gt;
&lt;%
}
for (int i = firstPage; i &lt;= lastPage; i++) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=i %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;%=i %&gt;]&lt;/a&gt;
&lt;%
}
if (nextPage != 0) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=nextPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&gt;]&lt;/a&gt;
&lt;%
}
%&gt;				
&lt;p&gt;
&lt;a href="write_form.do?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;New&lt;/a&gt;
&lt;/p&gt;
&lt;form method="get"&gt;
  &lt;input type="text" size="10" maxlength="30" name="keyword" /&gt;
  &lt;input type="submit" value="Search" /&gt;
&lt;/form&gt;	
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Go to http://localhost:8080/board/list.do and test.
The list page no longer produces the numbers needed for paging and doesn't even do anything with the database. Instead, it only receives and displays the results produced by the model. But you won't like the next part of the code.
</p>

<pre class="prettyprint">
int listItemNo = (Integer) request.getAttribute("listItemNo");
List&lt;Article&gt; list = (List&lt;Article&gt;) request.getAttribute("list");
int prevPage = (Integer) request.getAttribute("prevPage");
int nextPage = (Integer) request.getAttribute("nextPage");
int firstPage = (Integer) request.getAttribute("firstPage");
int lastPage = (Integer) request.getAttribute("lastPage");
</pre>

<p>
The problem with the above code is the tricky conversion. You can avoid this by using the Value Object pattern.
</p>

<h6 class="src">ListVo.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.List;

public class ListVo {	
  private List&lt;Article&gt; list;
  private int totalPage;
  private int listItemNo;
  private int firstPage;
  private int lastPage;
  private int prevPage;
  private int nextPage;
  private int startRecord;
  private int endRecord;
	
  public List&lt;Article&gt; getList() {
    return list;
  }
  public void setList(List&lt;Article&gt; list) {
    this.list = list;
  }
  public int getTotalPage() {
    return totalPage;
  }
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public int getListItemNo() {
    return listItemNo;
  }
  public void setListItemNo(int listItemNo) {
    this.listItemNo = listItemNo;
  }
  public int getPrevPage() {
    return prevPage;
  }
  public void setPrevPage(int prevPage) {
    this.prevPage = prevPage;
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
  public int getNextPage() {
    return nextPage;
  }
  public void setNextPage(int nextPage) {
    this.nextPage = nextPage;
  }
  public int getStartRecord() {
    return startRecord;
  }
  public void setStartRecord(int startRecord) {
    this.startRecord = startRecord;
  }
  public int getEndRecord() {
    return endRecord;
  }
  public void setEndRecord(int endRecord) {
    this.endRecord = endRecord;
  }
}
</pre>

<p>
Modify the BoardService and ListAction to use the Value Object.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.List;

public class BoardService {

  private BoardDao dao = new BoardDao();

  public BoardService() {}

  public ListVo getNumbersForPaging(int totalRecord, int curPage, int numPerPage, int pagePerBlock) {
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
<strong>
    ListVo listVo = new ListVo();
		
    listVo.setTotalPage(totalPage);
    listVo.setFirstPage(firstPage);
    listVo.setLastPage(lastPage);
    listVo.setPrevPage(prevPage);
    listVo.setNextPage(nextPage);
    listVo.setListItemNo(listItemNo);
    listVo.setStartRecord(startRecord);
    listVo.setEndRecord(endRecord);
</strong>
    return listVo;
  }

  public List&lt;Article&gt; getBoardList(int startRecord, int endRecord, String keyword) {
    return dao.getBoardList(startRecord, endRecord, keyword);
  }

  public int getTotalRecord(String keyword) {
    return dao.getTotalRecord(keyword);
  }

  public void write(Article article) {
    dao.insert(article);
  }

  public Article getArticle(int no) {
    return dao.selectOne(no);
  }

  public void modify(Article article) {
    dao.update(article);
  }

  public void delete(int no) {
    dao.delete(no);
  }

  public void reply(Article article) {
    dao.reply(article);
  }	
}
</pre>

<h6 class="src">ListAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;

public class ListAction {
  public void execute(HttpServletRequest request) {
    int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
    String keyword = request.getParameter("keyword");
    if (keyword == null) keyword = "";

    BoardService service = new BoardService();
    int totalRecord = service.getTotalRecord(keyword);
<strong>		
    ListVo vo = service.getNumbersForPaging(totalRecord, curPage, 10, 5);
    int startRecord = vo.getStartRecord();
    int endRecord = vo.getEndRecord();
</strong>
    List&lt;Article&gt; list = service.getBoardList(startRecord, endRecord, keyword);
<strong>
    vo.setList(list);

    request.setAttribute("listVo", vo);
</strong>		
  }
}
</pre>

<p>
Modify the list page file as follows:
</p>

<h6 class="src">list.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%@ page import="java.util.*" %&gt;
&lt;%
String curPage = request.getParameter("curPage");
if (curPage == null) curPage = "1";
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
ListVo vo = (ListVo) request.getAttribute("listVo");
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
int listItemNo = vo.getListItemNo();
List&lt;Article&gt; list = vo.getList();
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
&lt;a href="view.do?no=&lt;%=article.getNo() %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;&lt;%=article.getTitle() %&gt;&lt;/a&gt;
&lt;%=article.getWdate() %&gt;&lt;br /&gt;
&lt;hr /&gt;
&lt;%
listItemNo--;
}
int prevPage = vo.getPrevPage();
if (prevPage != 0) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=prevPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;]&lt;/a&gt;
&lt;%
}
int firstPage = vo.getFirstPage();
int lastPage = vo.getLastPage();
for (int i = firstPage; i &lt;= lastPage; i++) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=i %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&lt;%=i %&gt;]&lt;/a&gt;
&lt;%
}
int nextPage = vo.getNextPage();
if (nextPage != 0) {
%&gt;
  &lt;a href="list.do?curPage=&lt;%=nextPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;[&gt;]&lt;/a&gt;
&lt;%
}
%&gt;				
&lt;p&gt;
&lt;a href="write_form.do?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;New&lt;/a&gt;
&lt;/p&gt;
&lt;form action="list.do" method="post"&gt;
  &lt;input type="text" size="10" maxlength="30" name="keyword" /&gt;
  &lt;input type="submit" value="Search" /&gt;
&lt;/form&gt;	
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
More action classes are needed.
So when you create an action interface and apply it to an action, the controller's code becomes elegant.
</p>

<h6 class="src">Action.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public interface Action {
  public void execute(HttpServletRequest request);
}
</pre>

<p>
Modify the ListAction to implement the action interface.
</p>

<h6 class="src">ListAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;

public class ListAction <strong>implements Action</strong> {
  <strong>@Override</strong>
  public void execute(HttpServletRequest request) {
	
    //.. The code below is omitted because it is the same as before..
	
  }
}
</pre>

<p>
Modify the controller as follows.
</p>

<h6 class="src">ControllerServlet.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.*;

public class ControllerServlet extends HttpServlet {

  private ServletContext sc;
	
  @Override
  public void init() throws ServletException {
    sc = this.getServletContext();
  }

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req,resp);
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
    req.setCharacterEncoding("UTF-8");
    String uri = req.getRequestURI();	
    String contextPath = req.getContextPath();
    String command = null;
    command = uri.substring(contextPath.length());
		
    String view = null; //JSP
    Action action = null;
    boolean isRedirect = false; //if fasle, forwarding.
    if (command.equals("/board/list.do")) {
      action = new ListAction();
      action.execute(req);
      view = "/board/list.jsp";
    } else if (command.equals("/board/write_form.do")) {
      //TODO 1
    } else if (command.equals("/board/write.do")) {
      //TODO 2
    } else if (command.equals("/board/view.do")) {
      //TODO 3
    } else if (command.equals("/board/modify_form.do")) {
      //TODO 4
    } else if (command.equals("/board/modify.do")) {
      //TODO 5 
    } else if (command.equals("/board/del.do")) {
      //TODO 6
    } else if (command.equals("/board/reply_form.do")) {
      //TODO 7
    } else if (command.equals("/board/reply.do")) {
      //TODO 8
    }
    if (isRedirect == false) {
      RequestDispatcher rd = sc.getRequestDispatcher(view);
      rd.forward(req, resp);
    } else {
      resp.sendRedirect(view);
    }
  }
}
</pre>

<h3>//TODO 1</h3>

<pre class="prettyprint">
view = "/board/write_form.jsp";
</pre>

<p>
No action is required as there is no data to pass to write_form.jsp.
Open the write_form.jsp file and change the .jsp in your code to .do.
Visit the list and click New to see if you can go to write_form.jsp.
</p>

<h3>//TODO 2</h3>

<pre class="prettyprint">
action = new WriteAction();
action.execute(req);
view = "/board/list.do";
isRedirect = true;
</pre>

<p>
WriteAction.java should be created. This model is responsible for the logic that processes the writing. You can create a WriteAction referring to the write.jsp file of Model 1 as follows.
</p>

<h6 class="src">WriteAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class WriteAction implements Action{

  @Override
  public void execute(HttpServletRequest request) {
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Article article = new Article();
    article.setTitle(title);
    article.setContent(content);
		
    BoardService service= new BoardService();
    service.write(article);
  }

}
</pre>

<p>
Test new posting.
If the test succeeds, the write.jsp file is not needed, so delete it.
</p>

<h3>//TODO 3</h3>

<pre class="prettyprint">
action = new ViewAction();
action.execute(req);
view = "/board/view.jsp";
</pre>

<p>
ViewAction should handle the detailed view logic.
</p>

<h6 class="src">ViewAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class ViewAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {
    int no = Integer.parseInt(request.getParameter("no"));
    BoardService service = new BoardService();
		
    Article article = service.getArticle(no);
		
    request.setAttribute("article", article);
  }
}
</pre>

<p>
Modify the detailed view page to show the data that the model has preprocessed and delivered.
</p>

<h6 class="src">view.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";
<strong>Article article = (Article) request.getAttribute("article");</strong>
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;View&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function goModify(no,curPage,keyword) {
  location.href="modify_form.do?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" + keyword;
}

function goDelete(no,curPage,keyword) {
  var check = confirm("Are you sure you want to delete it?");
  if (check) {
    location.href="del.do?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" + keyword;
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
&lt;a href="list.do?curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;List&lt;/a&gt;
&lt;input type="button" value="Edit Post" onclick="javascript:goModify('&lt;%=no %&gt;','&lt;%=curPage %&gt;','&lt;%=keyword %&gt;')"&gt;
&lt;input type="button" value="Delete" onclick="javascript:goDelete('&lt;%=no %&gt;','&lt;%=curPage %&gt;','&lt;%=keyword %&gt;')"&gt;
&lt;a href="reply_form.do?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;Reply&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>//TODO 4</h3>

<pre class="prettyprint">
action = new ModifyFormAction();
action.execute(req);
view = "/board/modify_form.jsp";
</pre>

<p>
Create a ModifyFormAction as shown below.
</p>

<h6 class="src">ModifyFormAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class ModifyFormAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {
    int no = Integer.parseInt(request.getParameter("no"));
    BoardService service = new BoardService();
    Article article = service.getArticle(no);
    request.setAttribute("article", article);
  }

}
</pre>

<p>
Modify the modify_form.jsp file as follows.
</p>

<h6 class="src">modify_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.sql.*" %&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
<strong>Article article = (Article) request.getAttribute("article");</strong>
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Edit Post&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Edit Post&lt;/h1&gt;
&lt;form action="modify.do" method="post"&gt;
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
    &lt;a href="view.do?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h5>//TODO 5</h5>

<pre class="prettyprint">
action = new ModifyAction();
action.execute(req);
String no = req.getParameter("no");
String curPage = req.getParameter("curPage");
String keyword = req.getParameter("keyword");
if (keyword == null) keyword = "";
keyword = java.net.URLEncoder.encode(keyword, "UTF-8");
view = "/board/view.do?no=" + no + "&amp;curPage=" + curPage + "&amp;keyword=" + keyword;
isRedirect = true;
</pre>

<p>
Create a ModifyAction as follows.
</p>

<h6 class="src">ModifyAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class ModifyAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {

    int no = Integer.parseInt(request.getParameter("no"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Article article = new Article();
    article.setNo(no);
    article.setTitle(title);
    article.setContent(content);

    BoardService service= new BoardService();
    service.modify(article);
		
  }

}
</pre>

<p>
The modify.jsp file is needed no longer, so delete it.
</p>

<h3>//TODO 6</h3>

<pre class="prettyprint">
action = new DeleteAction();
action.execute(req);
String curPage = req.getParameter("curPage");
String keyword = req.getParameter("keyword");
if (keyword == null) keyword = "";
keyword = java.net.URLEncoder.encode(keyword, "UTF-8");
view = "/board/list.do?curPage=" + curPage + "&amp;keyword=" + keyword;
isRedirect = true;
</pre>

<p>
Create a DeleteAction as follows.
</p>

<h6 class="src">DeleteAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class DeleteAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {
    int no = Integer.parseInt(request.getParameter("no"));
    BoardService service= new BoardService();	
    service.delete(no);
  }

}
</pre>

<p>
The del.jsp file is needed no longer, so delete it.
</p>

<h3>//TODO 7</h3>

<pre class="prettyprint">
action = new ReplyFormAction();
action.execute(req);
view = "/board/reply_form.jsp";
</pre>

<p>
Create a ReplyFormAction as follows.
</p>

<h6 class="src">ReplyFormAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

import net.java_school.commons.WebContants;

public class ReplyFormAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {

    int no = Integer.parseInt(request.getParameter("no"));

    BoardService service = new BoardService();
    Article article = service.getArticle(no);    
    String content = article.getContent();

    //Add &gt; for each line of the parent content.
    content = content.replaceAll(WebContants.lineSeparator.value , WebContants.lineSeparator.value + "&gt;");
    content = WebContants.lineSeparator.value + WebContants.lineSeparator.value + "&gt;" + content;

    article.setContent(content);
    request.setAttribute("article", article);
  }

}
</pre>

<p>
Modify the reply_form.jsp file as follows.
</p>

<h6 class="src">reply_form.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.board.*" %&gt;
&lt;%
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

<strong>Article article = (Article) request.getAttribute("article");</strong>
%&gt;
&lt;html&gt;
&lt;head&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;h1&gt;Reply&lt;/h1&gt;

&lt;form action="reply.do" method="post"&gt;
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;
&lt;input type="hidden" name="curPage" value="&lt;%=curPage %&gt;" /&gt;
&lt;input type="hidden" name="keyword" value="&lt;%=keyword %&gt;" /&gt;
Title : &lt;input type="text" name="title" size="45" value="&lt;%=article.getTitle() %&gt;" /&gt;&lt;br /&gt;
&lt;textarea name="content" rows="10" cols="60"&gt;&lt;%=<strong>article.getContent()</strong> %&gt;&lt;/textarea&gt;&lt;br /&gt;
&lt;input type="submit" value="Submit" /&gt;
&lt;input type="reset" value="Reset" /&gt;&lt;br /&gt;
&lt;/form&gt;
&lt;a href="view.do?no=&lt;%=no %&gt;&amp;curPage=&lt;%=curPage %&gt;&amp;keyword=&lt;%=keyword %&gt;"&gt;View&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>//TODO 8</h3>

<pre class="prettyprint">
action = new ReplyAction();
action.execute(req);
String curPage = req.getParameter("curPage");
String keyword = req.getParameter("keyword");
if (keyword == null) keyword = "";
keyword = java.net.URLEncoder.encode(keyword, "UTF-8");
view = "/board/list.do?curPage=" + curPage + "&amp;keyword=" + keyword;
isRedirect = true;
</pre>

<p>
Create a ReplyAction as follows.
</p>

<h6 class="src">ReplyAction.java</h6>
<pre class="prettyprint">
package net.java_school.board;

import jakarta.servlet.http.HttpServletRequest;

public class ReplyAction implements Action {

  @Override
  public void execute(HttpServletRequest request) {

    int parent = Integer.parseInt(request.getParameter("no"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Article article = new Article();
    article.setParent(parent);
    article.setTitle(title);
    article.setContent(content);

    BoardService service= new BoardService();
    service.reply(article);
  }

}
</pre>

<p>
The reply.jsp file is needed no longer, so delete it.
</p>

</article>

</body>
</html>
