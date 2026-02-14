<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Namecard Web App</h1>

<p>
This chapter describes the difference between pure Java applications and web applications by converting the JDBC Namecard example into a web application.
</p>

<h2>Preparations for converting the JDBC Namecard example to a web application</h2>

<h3>1. Copy the Oracle JDBC driver to CATALINA_HOME/lib.</h3>

<p>
The JDBC driver must be in CATALINA_HOME/lib instead of WEB-INF/lib for your web application.
Copying the JDBC driver files to to CATALINA_HOME/lib for each web application can cause memory leaks.
So, there should be no JDBC driver in WEB-INF/lib for your web application.
</p>

<h3>2. Create directories for the Namecard web application.</h3>

<p>
If you set C:/www/namecard to be the top-level directory of your namecard web application, you must create the following subdirectories under C:/www/namecard.
</p>

<ul>
	<li>WEB-INF</li>
	<li>WEB-INF/classes</li>
	<li>WEB-INF/lib</li>
</ul>

<h3>3. Create a web.xml file in the WEB-INF directory.</h3>

<p>
Copy CATALINA_HOME/webapps/ROOT/WEB-INF/web.xml and paste it into C:/www/namecard/WEB-INF/.
After copying, open the file C:/www/namecard/WEB-INF/web.xml and delete everything inside the web-app element as below.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_1.xsd"
  version="6.1"
  metadata-complete="true"&gt;

&lt;/web-app&gt;
</pre>

<h3>4. Create a Tomcat context file named namecard.xml.</h3>

<p>
Create a namecard.xml file in the CATALINA_HOME/conf/Catalina/localhost directory.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/namecard"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<h3>Test 1</h3>

<p>
Copy the namecard and NamecardDao bytecode that you have practiced in <a href="<c:url value="/jdbc/Namecard"/>">Namecard</a> into WEB-INF/classes.
</p>

<pre style="line-height: 1em;border: 2px dotted grey;padding: 1em;">
C:/www/namecard/WEB-INF/classes
                           └── net
                               └── java_school
                                       └── namecard
                                              ├── Namecard.class
                                              └── NamecardDao.class	
</pre>

<p>
Create all the JSP files in the DocumentBase, C:/www/namecard.
This practice is best done with a regular editor, not with Eclipse.
</p>

<h6 class="src">/list.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.namecard.*" %&gt;
&lt;%@ page import="java.util.*" %&gt;    
&lt;!DOCTYPE html&gt;
&lt;%
NamecardDao dao = new NamecardDao();
ArrayList&lt;Namecard&gt; list = dao.selectAll();
%&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;List All Namecard&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;table border="1"&gt;
&lt;tr&gt;
  &lt;td&gt;NO&lt;/td&gt;
  &lt;td&gt;NAME&lt;/td&gt;
  &lt;td&gt;MOBILE&lt;/td&gt;
  &lt;td&gt;EMAIL&lt;/td&gt;
  &lt;td&gt;COMPANY&lt;/td&gt;
&lt;/tr&gt;
&lt;%
int size = list.size();
for(int i = 0;i &lt; size;i++) {
  Namecard card = list.get(i);
%&gt;	
&lt;tr&gt;
  &lt;td&gt;&lt;%=card.getNo() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getName() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getMobile() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getEmail() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getCompany() %&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;%
}
%&gt;	
&lt;/table&gt;
&lt;p&gt;
&lt;input type="button" value="추가" onclick="location.href='write.jsp'" /&gt;
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
After restarting Tomcat, Visit http://localhost:8080/namecard/list.jsp for testing.
</p>

<h3>Test 2</h3>

<p>
You can let users not access java source files directly form their web browser by placing them under /WEB-INF.
Let's determine /WEB-INF/src as the java source directory.
Copy the src directory of the namecard JDBC example and paste and paste them into /WEB-INF.
At the command prompt, go to C:/www/namecad/WEB-INF/src/net/java_school/namecard and compile by doing the following:
</p>

<pre>
javac -d C:/www/namecard/WEB-INF/classes *.java
</pre>

<p>
(If the NamecardDao class uses the connection pool, you have to compile first them)
</p>

<p>
Visit http://localhost:8080/namecard/list.jsp for testing.
</p>

<h3 id="3rd-Test">Test 3</h3>

<p>
Test 3 shows you how to manage your sources in Eclipse.
Run Eclipse and select your workspace as C:/www.<br />
<img src="<c:url value="/resources/images/workspace-c-www-en.png"/>" alt="select workspace as C:\www" /><br />

In the Java perspective, select File - New - Java Project.<br />
Create a Java project named namecard.<br />
(Most books and sites illustrate how to create a Dynamic Web Project of the Java EE perspective. But, to focus on Servlets and JSPs rather than Eclipse, this way is better)<br />


<img src="<c:url value="/resources/images/java-perspective-file-new-java-project.png"/>" alt="Create a Java Project with the Java perspective selected." /><br />

We are writing a web application, not a pure Java application, so do not use the directories src and bin that Eclipse sets by default.
With the mouse selected for the project, right-click.
Select Build Path, Configure Build Path.
In the Source tab, specify WEB-INF/src as the Source folder and WEB-INF/classes as the Output folder.<br />

<img src="<c:url value="/resources/images/namecard-webapp-src-bin.png"/>" alt="the Source Folder and Output Folder for Namecard Web Application" /><br />

Visit http://localhost:8080/namecard/list.jsp for testing.
If the test succeeds, create a JSP file in C:/www/namecard to register the namecard.
First, change the Eclipse JSP template charset to UTF-8.
In Eclipse, select Windows - Preferences - Web - JSP Files. 
And then, select UTF-8 in the Encoding box, and click Apply.<br />

<img src="<c:url value="/resources/images/eclipse-jsp-files-encoding.png"/>" alt="JSP charset to  UTF-8 " /><br />

The highlighted part of the write.jsp source below is what you need to type directly.
</p>
 
<h6 class="src">/write.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html PUBLIC&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;<strong>Add Namecard</strong>&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
<strong>&lt;h1&gt;Add Namecard&lt;/h1&gt;
&lt;form action="write_proc.jsp" method="post"&gt;
NAME : &lt;input type="text" name="name" /&gt;&lt;br /&gt;
MOBILE : &lt;input type="text" name="mobile" /&gt;&lt;br /&gt;
EMAIL : &lt;input type="text" name="email" /&gt;&lt;br /&gt;
COMPANY : &lt;input type="text" name="company" /&gt;&lt;br /&gt;
&lt;input type="submit" value="Confirm" /&gt;
&lt;input type="button" value="Cancel" onclick="location.href='list.jsp'" /&gt;
&lt;/form&gt;</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Next, create a write_proc.jsp.
This page adds the information received from write.jsp to the table.
You will have to type in the highlighted part of the source below.
</p>

<h6 class="src">/write_proc.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ page import="net.java_school.namecard.*" %&gt;</strong>
&lt;!DOCTYPE html&gt;
<strong>&lt;%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String company = request.getParameter("company");
Namecard namecard = new Namecard(name,mobile,email,company);
NamecardDao dao = new NamecardDao();
dao.insert(namecard);
%&gt;</strong>
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;<strong>Add Namecard</strong>&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
<strong>New namecard added.&lt;a href="list.jsp"&gt;All Namecards&lt;/a&gt;</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit http://localhost:8080/namecard/list.jsp and test the registration.
</p>

<p>
Let's implement the deletion function.
First, edit the list.jsp by referring to the code snippet below. 
</p>

<h6 class="src">/list.jsp</h6>
<pre class="prettyprint">
.. omit ..

  &lt;td&gt;NO&lt;/td&gt;
  &lt;td&gt;NAMe&lt;/td&gt;
  &lt;td&gt;MOBILE&lt;/td&gt;
  &lt;td&gt;EMAIL&lt;/td&gt;
  &lt;td&gt;COMPANY&lt;/td&gt;
  <span class="emphasis">&lt;td&gt;Manage&lt;/td&gt;</span>

.. omit ..

  &lt;td&gt;&lt;%=card.getNo() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getName() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getMobile() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getEmail() %&gt;&lt;/td&gt;
  &lt;td&gt;&lt;%=card.getCompany() %&gt;&lt;/td&gt;
  <span class="emphasis">&lt;td&gt;&lt;a href="delete.jsp?no=&lt;%=card.getNo() %&gt;"&gt;Del&lt;/a&gt;&lt;/td&gt;</span>

.. omit ..	
</pre>

<p>
Create delete.jsp.
This JSP receives the primary key of the namecard from the list.jsp and performs deletion.
You will have to type in the highlighted part of the source below.
</p>

<h6 class="src">/delete.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ page import="net.java_school.namecard.*" %&gt;</strong>
&lt;!DOCTYPE html&gt;
<strong>&lt;%
int no = Integer.parseInt(request.getParameter("no"));
NamecardDao dao = new NamecardDao();
dao.delete(no);
%&gt;</strong>
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;<strong>Delete Namecard</strong>&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
<strong>The namecard has been deleted.&lt;a href="list.jsp"&gt;All Namecards&lt;/a&gt;</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit http://localhost:8080/namecard/list.jsp to test the deletion of namecards.
</p>

<p>
Next, let's implement namecard modification.
Below is the method for modifying a namecard.
</p>

<h6 class="src">NamecardDao.java</h6>
<pre class="prettyprint">
public void update(Namecard card) {
  String sql = "UPDATE namecard " +
      "SET name = ? " +
      ",mobile = ? " +
      ",email = ? " +
      ",company = ? " +
      "WHERE no = ?";
			
  Connection con = null;
  PreparedStatement pstmt = null;
	
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, card.getName());
    pstmt.setString(2, card.getMobile());
    pstmt.setString(3, card.getEmail());
    pstmt.setString(4, card.getCompany());
    pstmt.setInt(5, card.getNo());
    pstmt.executeUpdate();
		
//.. omit ..
</pre>

<p>
Modify the list.jsp as shown below.
</p>

<h6 class="src">/list.jsp</h6>
<pre class="prettyprint">
&lt;td&gt;
  &lt;a href="delete.jsp?no=&lt;%=card.getNo() %&gt;"&gt;Del&lt;/a&gt;
  <strong>&lt;a href="modify.jsp?no=&lt;%=card.getNo() %&gt;"&gt;Modify&lt;/a&gt;</strong>
&lt;/td&gt;
</pre>

<p>
Create modify.jsp.
</p>

<h6 class="src">/modify.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ page import="net.java_school.namecard.*" %&gt;</strong>
&lt;!DOCTYPE html&gt;
<strong>&lt;%
int no = Integer.parseInt(request.getParameter("no"));
NamecardDao dao = new NamecardDao();
Namecard card = dao.selectOne(no);
%&gt;</strong>
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;<strong>Modify a Namecard</strong>&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
<strong>&lt;h1&gt;Modify a Namecard&lt;/h1&gt;
&lt;form action="modify_proc.jsp" method="post"&gt;
<span class="emphasis">&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;</span>
NAME : &lt;input type="text" name="name" value="&lt;%=card.getName() %&gt;" /&gt;&lt;br /&gt;
MOBILE : &lt;input type="text" name="mobile" value="&lt;%=card.getMobile() %&gt;" /&gt;&lt;br /&gt;
EMAIL : &lt;input type="text" name="email" value="&lt;%=card.getEmail() %&gt;" /&gt;&lt;br /&gt;
COMPANY : &lt;input type="text" name="company" value="&lt;%=card.getCompany() %&gt;" /&gt;&lt;br /&gt;
&lt;input type="submit" value="Confirm" /&gt;
&lt;input type="button" value="Cancel" onclick="location.href='list.jsp'" /&gt;
&lt;/form&gt;</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
&lt;input type="hidden" name="no" value="&lt;%=no %&gt;" /&gt;<br />
The above code must be in the form tag.
</p>

<p>
Create modify_proc.jsp.
This JSP modifies a namecard using information sent from modify.jsp.
</p>

<h6 class="src">modify_proc.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ page import="net.java_school.namecard.*" %&gt;</strong>
&lt;!DOCTYPE html&gt;
<strong>&lt;%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String company = request.getParameter("company");
Namecard card = new Namecard();
card.setNo(no);
card.setName(name);
card.setMobile(mobile);
card.setEmail(email);
card.setCompany(company);
NamecardDao dao = new NamecardDao();
dao.update(card);
%&gt;</strong>
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;<strong>Modify a Namecard</strong>&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
<strong>The namecard has been modified. &lt;a href="list.jsp"&gt;All Namecards&lt;/a&gt;</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit http://localhost:8080/namecard/list.jsp, and modify a namecard.
</p>

<p>
Let's add a search function to list.jsp.
Open list.jsp and add the following before &lt;/body&gt;.
</p>

<h6 class="src">/list.jsp</h6>
<pre class="prettyprint">
&lt;form action="list.jsp" method="post"&gt;
  &lt;input type="text" name="keyword" /&gt;
  &lt;input type="submit" value="Search" /&gt;
&lt;/form&gt;
</pre>

<p>
Add the selectByKeyword (String keyword) method to NamecardDao.java.
</p>

<h6 class="src">NamecardDao.java</h6>
<pre class="prettyprint">
public ArrayList&lt;Namecard&gt; selectByKeyword(String keyword) {
  keyword = "%" + keyword + "%";
  ArrayList&lt;Namecard&gt; matched = new ArrayList&lt;Namecard&gt;();
		
  String sql ="SELECT no,name,mobile,email,company " + 
      "FROM namecard " +
      "WHERE name LIKE ? " +
        "OR mobile LIKE ? " +
        "OR email LIKE ? " + 
        "OR company LIKE ? " +
      "ORDER BY no DESC";
			
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
	
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, keyword);
    pstmt.setString(2, keyword);
    pstmt.setString(3, keyword);
    pstmt.setString(4, keyword);
    rs = pstmt.executeQuery();
		
    while(rs.next()) {
      int no = rs.getInt("no");
      String sname = rs.getString("name");
      String mobile = rs.getString("mobile");
      String email = rs.getString("email");
      String company = rs.getString("company");
      Namecard namecard = new Namecard(no, name, mobile, email, company);
      matched.add(namecard);
    }
  } catch (SQLException e) {
    e.printStackTrace();
    System.out.println(sql);
  } finally {
    close(rs,pstmt,con);
  }
  return matched;
}
</pre>

<p>
There is a bug that searches for null on the list page.
The first time you visit list.jsp using the web browser's address bar, the keyword is null.
And if you did not put any value in the search field in list.jsp and clicked the search button, the keyword is "" (whitespace).
</p>

<p>
Open list.jsp and modify it as shown below.
</p>

<h6 class="src">/list.jsp</h6>
<pre class="prettyprint">
&lt;%
//Commented out the following code.
//NamecardDao dao = new NamecardDao();
//ArrayList&lt;Namecard&gt; list = dao.selectAll();

request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");

NamecardDao dao = new NamecardDao();
ArrayList&lt;Namecard&gt; list = null;

if (keyword == null) {
  keyword = "";
}
if (keyword.equals("")) {
  list = dao.selectAll();
} else {
  list = dao.selectByKeyword(keyword);
}
%&gt;
</pre>

<p>
Visit http://localhost:8080/namecard/list.jsp for testing. 
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://stackoverflow.com/questions/6981564/why-jdbc-driver-must-been-put-in-tomcat-home-lib-folder">http://stackoverflow.com/questions/6981564/why-jdbc-driver-must-been-put-in-tomcat-home-lib-folder</a></li>
</ul>

</article>