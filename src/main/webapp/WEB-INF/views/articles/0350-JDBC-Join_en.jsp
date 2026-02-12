<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC - Join</title>
<meta name="Keywords" content="java,JDBC,table join,PreparedStatement,prepareStatement(String sql)," />
<meta name="Description" content="This article describes how to execute sql that join tables using JDBC" />
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

<h1>JDBC - Join</h1>

<p>
Since there is only one table for name card example, Let's practice the example of joining EMP and DEPT.
</p>

<p>
Our goal is to execute the following SQL:
</p>

<pre class="prettyprint">
SELECT ENAME, JOB, D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'DALLAS'
</pre>

<p>
Refer to the JDBC programming procedure below and complete the main() of the JoinTable.java.
</p>

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use the returned ResultSet to process data.]</li>
	<li>Returning Resources</li>
</ol>

<h6 class="src">JoinTable.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JoinTable {
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
    ResultSet rs = null;
		
    String sql = "SELECT ENAME,JOB,D.DEPTNO,DNAME " +
        "FROM EMP E, DEPT D " +
        "WHERE E.DEPTNO = D.DEPTNO " +
        "AND D.LOC = 'DALLAS'";
		
    try {
      con = DriverManager.getConnection(URL, USER, PASS);
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
			
      while (rs.next()) {
        String ename = rs.getString("ename");
        String job = rs.getString("job");
        String deptno = rs.getString("deptno");
        String dname = rs.getString("dname");
        System.out.println(ename + " " + job + " " + deptno + " " + dname);
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

</article>

</body>
</html>
