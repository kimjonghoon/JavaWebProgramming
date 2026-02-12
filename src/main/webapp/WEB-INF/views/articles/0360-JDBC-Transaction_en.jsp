<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC - Transaction</title>
<meta name="Keywords" content="java,JDBC,transaction,setAutoCommit,commit,rollback,PreparedStatement" />
<meta name="Description" content="This article describes how to perform transaction using JDBC" />
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

<h1>JDBC - Transaction</h1>

<p>
A transfer is the best example of a transaction.
If you transfer $ 1500 from account A to account B, you have the following process:
</p>

<pre>
<strong>Process One:</strong> Withdraw $ 1,500 from the A account. 
<strong>Process Two:</strong> Deposit $ 1,500 into the B account.
</pre>

<p>
If Process One succeeds and Process Two fails, the purpose of transaction management is to cancel Process One and restore the state before Process One executes. You need to consider Process One and Process Two as one unit to manage the transaction. In this case, the bundle of Process One and Process Two is called a transaction unit.
</p>

<p>
The Auto-commit mode of the Connection instance is the default. Auto-commit mode regards each SQL statement as a transaction unit.
</p>

<p>
Change the auto-commit mode to false, and defining the commit time in the program is the coding that manages transactions.
</p>

<pre class="prettyprint">
<strong>con.setAutoCommit(false);</strong>
Withdraw $ 1500 from Account A.
Deposit $ 1500 into Account B.
<strong>con.commit();</strong>
</pre>

<p>
For the transaction example, create the ACCOUNT table in the Scott account and insert the test data as below. 
</p>

<pre class="prettyprint">
create table account (
 accountno varchar2(3) primary key,
 balance number,
 constraint account_balance_ck check(balance between 0 and 3000)
)
/
insert into account values ('111', 3000)
/
insert into account values ('222', 2000)
/
</pre>

<p>
Refer to the JDBC program procedure below and complete the main() of TransactionPairs.java.
</p>

<ol>
	<li>Loading a JDBC Driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use the returned ResultSet to process the data.]</li>
	<li>Returning Resources</li>
</ol>

<p>
Our goal is to execute the following SQL:
</p>

<pre>
UPDATE account SET balance = balance - 1500 WHERE accountno = '111'
UPDATE account SET balance = balance + 1500 WHERE accountno = '222'
</pre>

<h6 class="src">TransactionPairs.java</h6>
<pre class="prettyprint">
package net.java_school.jdbc.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionPairs {
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
    String sql = "UPDATE account SET balance = balance + ? WHERE accountno = ?";
		
    try {
      con = DriverManager.getConnection(URL, USER, PASS);
      <strong>
      con.setAutoCommit(false);
      </strong>
      pstmt = con.prepareStatement(sql);
			
      pstmt.setInt(1, -1500);
      pstmt.setString(2, "111");
      pstmt.executeUpdate();
			
      pstmt.setInt(1, 1500);
      pstmt.setString(2, "222");
      pstmt.executeUpdate();
      <strong>
      con.commit();
      </strong>
    } catch (SQLException e) {
      e.printStackTrace();
      try {
        <strong>con.rollback();</strong>
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
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
Run it and check the results with SQL * PLUS.
You will see an the following exception message.<br />
</p>

<pre>
java.sql.SQLException: ORA-02290: check constraint (SCOTT.ACCOUNT_BALANCE_CK) is violated.
</pre>

<p>
The cause of the error is that the BALANCE column of the ACCOUNT table can only store a value between 0 and 3000. The example rollbacks the bank transfer in the catch block when an exception occurs. Check the rollback via SQL*PLUS.
</p>

</article>

</body>
</html>
