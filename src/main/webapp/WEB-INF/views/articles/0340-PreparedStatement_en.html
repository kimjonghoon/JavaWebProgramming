<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>PreparedStatement</title>
<meta name="Keywords" content="java,JDBC,PreparedStatement,setString,setInt" />
<meta name="Description" content="This article describes how to use PreparedStatement" />
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

<h1>PreparedStatement</h1>

<p>
The Statement instance passes a simple string to the DBMS. The DBMS compiles that string to be understood by the DBMS and executes it. PreparedStatement improves performance by delivering precompiled SQL statements to the DBMS. Not only does it improve performance, but it is also convenient. You can put question marks (?) in an SQL statement and set a value for each question mark. Therefore, you can execute the same SQL statement by replacing the question marks with values.
</p>

<p>
Our goal is to execute the following SQL:
</p>

<pre class="prettyprint">
UPDATE NAMECARD SET COMPANY = ? WHERE NO = ?
</pre>
  
<p>
Refer to the JDBC programming order to complete the main() of UsingPrepareStatement.java.
</p>

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use the ResultSet to process data.]</li>
	<li>Returning Resources</li>
</ol>

<h6 class="src">UsingPrepareStatement.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
<strong>import java.sql.PreparedStatement;</strong>
import java.sql.SQLException;

public class UsingPreparedStatement {
  static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  static final String USER = "scott";
  static final String PASS = "tiger";
	
  public static void main(String[] args) {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
		
    Connection con = null;
    PreparedStatement pstmt = null;
		
    String sql = "UPDATE NAMECARD SET COMPANY = <strong>?</strong> WHERE NO = <strong>?</strong>";

    try {
      con = DriverManager.getConnection(URL, USER, PASS);
      <strong>
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, "Google Inc");
      pstmt.setInt(2, 1);
      pstmt.executeUpdate();
      </strong>
    } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(sql);
    } finally {
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
  }

}
</pre>

<p>
The followings are the difference from using Statement.
</p>

<pre class="prettyprint">
pstmt = con.prepareStatement(<strong>sql</strong>);
</pre>

<p>
Unlike obtaining a Statement, you must pass an SQL statement with a Java string as an argument to the prepareStatement() method to get a PreparedStatement.
</p>

<pre class="prettyprint">
pstmt.executeUpdate();
</pre>

<p>
Unlike the executeUpdate() of the Statement interface, when you execute SQL, do not pass the SQL statement string to the executeUpdate() method as an argument.
</p>

<pre class="prettyprint">
pstmt = con.prepareStatement(sql);
pstmt.setString(1, "Google Inc");
pstmt.setInt(2, 1);
</pre>

<p>
If the SQL statement contains question marks, you must set a value for the question mark using the PrepareStatement's setXXX() method before executing.
</p>

<p>
The XXX part of the setXXX() method means Java data type.
</p>

<p>
The first parameter to the setXXX() method is the order in which question marks appear. The second parameter of the setXXX() method is the value to replace the question mark.
</p>

</article>

</body>
</html>
