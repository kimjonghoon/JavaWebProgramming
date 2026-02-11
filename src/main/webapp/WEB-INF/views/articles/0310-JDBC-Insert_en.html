<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC - Insert</title>
<meta name="Keywords" content="java,JDBC" />
<meta name="Description" content="This article describes how to execute insert statement using JDBC" />
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

<h1>JDBC - Insert</h1>

<p>
This chapter demonstrates how to insert records into the NAMECARD table using JDBC.
Our goal is to execute the following insert statement.
</p>

<pre class="prettyprint">
INSERT INTO NAMECARD VALUES
(
  SEQ_NAMECARD_NO.NEXTVAL,
  'Alison',
  '011-0000-0000',
  'alison@ggmail.org',
  'Google Inc'
);
</pre>

<p>
Complete the main() of NamecardInsert.java by referring to the following JDBC programming order.
</p>

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use a ResultSet to process the data.]</li>
	<li>Returning Resources</li>
</ol>

<h6 class="src">NamecardInsert.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class NamecardInsert {
  <strong>static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  static final String USER = "scott";
  static final String PASS = "tiger";</strong>
	
  public static void main(String[] args) {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
		
    Connection con = null;
    Statement stmt = null;
    <strong>String sql = "INSERT INTO NAMECARD VALUES " +
      "(SEQ_NAMECARD_NO.NEXTVAL," +
      "'Alison'," +
      "'011-0000-0000'," +
      "'alison@ggmail.org'," +
      "'Google Inc')";</strong>

    try {
      con = DriverManager.getConnection(<strong>URL, USER, PASS</strong>);
      stmt = con.createStatement();
      stmt.executeUpdate(sql);
    } catch (SQLException e) {
      e.printStackTrace();
      <strong>System.out.println(sql);</strong>
    } finally {
      try {
        stmt.close();
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
Run NamecardInsert class and confirm via SQL*PLUS that the data exists.
</p>

</article>

</body>
</html>
