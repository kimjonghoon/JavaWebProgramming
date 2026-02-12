<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC - Update</title>
<meta name="Keywords" content="java,JDBC" />
<meta name="Description" content="This article describes how to execute updae statement using JDBC" />
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

<h1>JDBC - Update</h1>

<p>
This tutorial describles how to use JDBC to execute an UPDATE statement.
Our goal is to execute the following SQL statement.
</p>

<pre class="prettyprint">
UPDATE NAMECARD SET EMAIL ='alison@ggmail.org' WHERE NO = 1
</pre>

<p>
Refer to the JDBC programming order to complete the main() of UpdateNamecard.java.

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use a ResultSet to process the data.]</li>
	<li>Returning Resources</li>
</ol>

<h6 class="src">NamecardUpdate.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class NamecardUpdate {
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
    Statement stmt = null;
		
    String sql = "UPDATE NAMECARD " +
      "SET EMAIL ='alison@ggmail.org' " +
      "WHERE NO = 1";
		
    try {
      con = DriverManager.getConnection(URL, USER, PASS);
      stmt = con.createStatement();
      stmt.executeUpdate(sql);
    } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(sql);
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

</article>

</body>
</html>
