<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Database Design</h1>

<p>
Connect SQL*PLUS as SYSDBA.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users&gt; <strong>sqlplus scott/tiger</strong>

Connected to:
Oracle Database 11g

SQL&gt; <strong>connect sys as sysdba</strong>
Enter password: 
Connected.
SQL&gt; show user
USER is "SYS"
</pre>

<p>
Execute the following while connected.
</p>

<%@ include file="commons/database-design.jsp" %>

<h2>DataSource</h2>

<p>
Modify CATALINA_HOME/conf/Catalina/localhost/ROOT.xml as follows.<br />
</p>

<h6 class="src">ROOT.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="C:/www/JSPProject/WebContent"
  reloadable="true"&gt;
  <strong>
  &lt;Resource
    name="jdbc/jsppjt"
    auth="Container"
    type="javax.sql.DataSource"
    username="java"
    password="school"
    driverClassName="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@127.0.0.1:1521:XE" 
    maxActive="8"
    maxIdle="4" /&gt;
    </strong>
			
&lt;/Context&gt;
</pre>

<p>
Copy Oracle JDBC Driver (ojdbc6.jar) and Paste it to CATALINA_HOME/lib.
</p>

<h3>Test</h3>

<p>
Create a test.jsp file in the Document Base (C:\www\JSPProject\WebContent).
</p>

<h6 class="src">test.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %&gt;
&lt;%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
	
DataSource ds = null;
	
int totalRecord = 0;
		
try {
  Context ic = new InitialContext();
  Context envCtx = (Context) ic.lookup("java:comp/env");
  ds = (DataSource) envCtx.lookup("<strong>jdbc/jsppjt</strong>");
} catch (NamingException e) {
  System.out.println(e.getMessage());
}
	
try {
  con = ds.getConnection();
		
  String sql = "SELECT count(*) FROM board";
		
  pstmt = con.prepareStatement(sql);
  rs = pstmt.executeQuery();
  rs.next();
  totalRecord = rs.getInt(1);
} catch (SQLException e) {
  System.out.println(e.getMessage());
} finally {
  try {
    rs.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
  try {
    pstmt.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
  try {
    con.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
}
%&gt;	
&lt;!DOCTYPE html&gt; 
&lt;html lang="ko"&gt; 
&lt;head&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;title&gt;DataSource Test&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;p&gt;
<strong>&lt;%=totalRecord %&gt;</strong>
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Restart Tomcat to visit http://localhost:8080/test.jsp to check if "1" is displayed.
</p>

</article>