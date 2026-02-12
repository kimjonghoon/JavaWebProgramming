<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC - Select</title>
<meta name="Keywords" content="java,JDBC" />
<meta name="Description" content="This article describes how to execute select statement using JDBC" />
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

<h1>JDBC - Select</h1>

<p>
This chapter demonstrates the JDBC example of retrieving records from the NAMECARD table.
Our goal is to run the following SQL using JDBC.
</p>

<pre>
SELECT NO,NAME,MOBILE,EMAIL,COMPANY 
FROM NAMECARD
ORDER BY NO DESC
</pre>

<p>
Complete the main() of NamecardSelect.java by referring the JDBC programming procedure below.
</p>

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use ResultSet to process the data.]</li>
	<li>Returning Resources</li>
</ol>

<h6 class="src">NamecardSelect.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class NamecardSelect {
  static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  static final String USER = "scott";
  static final String PASS = "tiger";
	
  public static void main(String[] args) {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
		
    String sql = "SELECT NO,NAME,MOBILE,EMAIL,COMPANY " +
      "FROM NAMECARD " +
      "ORDER BY NO DESC";

    try {
      con = DriverManager.getConnection(URL, USER, PASS);
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        int no = rs.getInt("no");
        String name = rs.getString("name");
        String mobile = rs.getString("mobile");
        String email = rs.getString("email");
        String company = rs.getString("company");
        System.out.println(no + "|" + name + "|" + mobile + "|" + email + "|" + company);
      }
			
    } catch (SQLException e) {
      e.printStackTrace();
      System.out.println(sql);
    } finally {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
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

<dl class="note">
<dt>ResultSet getXXX() method</dt>
<dd>
The getXXX() is not a name. XXX means a data type of Java. If the column's data type is NUMBER, you can use getXXX() methods whose XXX part is Int, Long, Double,.. one of the Java data types.
If you pass an index of the column as an argument value like getInt(1), you will get the first column value as a Java int type. You can pass the column name as an argument value like our example. Of course, performance is faster to pass indexes, but giving column names is better for maintenance.
</dd>
</dl>

</article>

</body>
</html>
