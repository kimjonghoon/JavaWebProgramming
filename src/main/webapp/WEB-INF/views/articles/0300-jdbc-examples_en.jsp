<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>JDBC Examples</h1>

<h2>Create Table</h2>

<p>
If you have successfully tested the GetEmp.java file, let's practice another JDBC programming example. The prepared example is the business card management program. This chapter will create a table and a sequence using JDBC.
</p>

<pre class="prettyprint">
CREATE TABLE NAMECARD (
  NO  NUMBER CONSTRAINT PK_NAMECARD PRIMARY KEY,
  NAME    VARCHAR2(20) NOT NULL,
  MOBILE  VARCHAR2(20) NOT NULL,
  EMAIL   VARCHAR2(40),
  COMPANY VARCHAR2(60)
);
 
CREATE SEQUENCE SEQ_NAMECARD_NO
INCREMENT BY 1
START WITH 1;

</pre>

<p>
Let's recall the JDBC programming order again.
</p>

<ol>
	<li>Loading the JDBC Driver</li>
	<li>Obtaining a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use the returned ResultSet to process the data.]</li>
	<li>Returning Resources</li>
</ol>

<p>
In the Package Explorer view in Eclipse, create NamecardDDL.java in the jdbc project to be in the package net.java_school.jdbc.test.
Write all code within the main().
</p>

<h3>1. Loading a JDBC Driver</h3>

<p>
Class.forName() method loads the startup class of the Oracle JDBC driver into memory.
Copy and paste this snippet from GetEmp.java.<br />

<img src="<c:url value="/resources/images/load-oracle-jdbc-driver-01.png"/>" alt="Loading a JDBC Driver" style="width: 100%;" /><br />

Since the forName() method of Class class is a method that must handle ClassNotFoundException, the above compilation error occurs.
With the help of Eclipse's code assist, Select the second solution to insert a try ~ catch statement. (for Eclipse's code assist, place your mouse in the code where the compilation error occurs)
<br />

<img src="<c:url value="/resources/images/load-oracle-jdbc-driver-02.png"/>" alt="Handing a ClassNotFoundException" style="width: 100%;" /><br />
</p>

<h3>2. Obtaining a Connection</h3>

<p>
You can get a connection using the getConnection() method of the DriverManager class.<br />
<img src="<c:url value="/resources/images/get-connection-03.png"/>" alt="Obtaining a Connection" style="width: 100%;" /><br />

Connection and DriverManager are in the java.sql package.
Add the import statement by selecting the first solution in the code assist of the compile error.<br />

<img src="<c:url value="/resources/images/get-connection-04.png"/>" alt="Add import java.sql.*;" style="width: 100%;" /><br />

The first argument to the DriverManager's getConnection() method is URL.
The second argument is the user, and the third argument is the user's password.
Since we decided to create a table and a sequence in the Scott account, the second and third argument values are scott and tiger.<br />

<img src="<c:url value="/resources/images/get-connection-05.png"/>" alt="DriverManager.getConnection(String,String,String)" style="width: 100%;" /><br />

The DriverManager's getConnection() method can raise an SQLException.
Select the second solution of the code assist and handle the exception with a try ~ catch statement.<br />
 
<img src="<c:url value="/resources/images/get-connection-06.png"/>" alt="Handing a SQLException" style="width: 100%;" /><br />

DriverManager's getConnection() and the Connection interface's methods are all methods that must handle SQLException. So put the getConnection() in a try block.
The Connection instances used in the try block must be returned in the finally block.
So declare the con variable of the Connection type outside the try block.<br />
<img src="<c:url value="/resources/images/get-connection-07.png"/>" alt="con variable declaration must be outside the try block" style="width: 100%;" /><br />
</p>

<h3>3. Getting a Statement</h3>

<p>
Decalre the stmt variable of the Statement type outside the try block.
The reason for declaring the variable con outside the try block is the same.
If the "Statement is of an unresolved type" compile error occurs, let the code assist function of Eclipse to add "import java.sql.Statement;".<br />

<img src="<c:url value="/resources/images/createStatement-08.png"/>" alt="stmt variable declaration must be outside the try block. Add import java.sql.Statement;" style="width: 100%;"/><br />
</p>

<h3>4. Execute SQL</h3>

<p>
The next step is to execute the SQL statement.
First, make the SQL statement.
</p>

<pre class="prettyprint">
Connection con = null;
Statement stmt = null;
<strong>String sql = null;</strong>
try {
  con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:XE", "scott", "tiger");
  stmt = con.createStatement();
  sql = <strong>"CREATE TABLE NAMECARD ( " +
    "NO  NUMBER CONSTRAINT PK_NAMECARD PRIMARY KEY, " +
    "NAME    VARCHAR2(20) NOT NULL, " +
    "MOBILE  VARCHAR2(20) NOT NULL, " +
    "EMAIL   VARCHAR2(40), " +
    "COMPANY VARCHAR2(60))"</strong>;
  <strong>stmt.executeUpdate(sql);</strong>
} catch (SQLException e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
}
</pre>

<p>
Execute the SQL statement by calling ExecuteUpdate() of the Statement by passing the string that creates the table as an argument.
Next, the SQL statement that generates the sequence.
Execute the SQL statement by calling executeUpdate() of the Statement by passing the string that generates the sequence as an argument.<br />
</p>

<pre class="prettyprint">
Connection con = null;
Statement stmt = null;
String sql = null;

try {
  con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:XE", "scott", "tiger");
  stmt = con.createStatement();
  sql = "CREATE TABLE NAMECARD ( " +
    "NO  NUMBER CONSTRAINT PK_NAMECARD PRIMARY KEY, " +
    "NAME    VARCHAR2(20) NOT NULL, " +
    "MOBILE  VARCHAR2(20) NOT NULL, " +
    "EMAIL   VARCHAR2(40), " +
    "COMPANY VARCHAR2(60))";
  stmt.executeUpdate(sql);
  sql = "<strong>CREATE SEQUENCE SEQ_NAMECARD_NO " +
    "INCREMENT BY 1 " +
    "START WITH 1</strong>";
  <strong>stmt.executeUpdate(sql);</strong>
} catch (SQLException e) {
  // TODO Auto-generated catch block
  e.printStackTrace();
}
</pre>

<h3>5. Returning Resources</h3>

<p>
Write the finally block and insert the code that returns resources in the block.
Since you must return resources in the reverse order of creation, let the Statement instance resource disappers first.<br />
<img src="<c:url value="/resources/images/stmt-close-11.png"/>" alt="SQLException compile error" style="width: 100%;" /><br />

Since the close() method of the Statement must handle an SQLException, the compile error occurs.
Use Eclipse's code assists to insert a try - catch block.
The close() method of the Connection interface also must handle an SQLException. 
Use Eclipse's code assists to insert a try ~ catch block.<br />

<img src="<c:url value="/resources/images/close-12.png"/>" alt="Returning Resources Completed." style="width: 100%;" /><br />
Returning resources is most important in the JDBC code. Do not forget to write the code to close resources.
Run NamecardDDL.java.
If the exception does not occur, access the Scott account with SQL * PLUS to see if the table and sequence exist.
If an exception occurs, add code displaying the SQL statement into the catch block.
One of the disadvantages of JDBC is that you need to replace the SQL statements with Java strings.
Many people make many mistakes when replacing SQL statements with Java strings.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\java&gt;<span class="emphasis">sqlplus scott/tiger</span>

SQL*Plus: Release 10.2.0.1.0 - Production on 08-JAN-2011 21:11:20

Copyright (c) 1982, 2005, Oracle.  All rights reserved.


Connected to:
Oracle Database 10g Release 10.2.0.1.0 - Production

SQL&gt; <span class="emphasis">select tname from tab;</span>

TNAME
------------------------------------------------------------
DEPT
EMP
BONUS
SALGRADE
<span class="emphasis">NAMECARD</span>

5 rows selected.

SQL&gt; <span class="emphasis">select sequence_name from user_sequences;</span>

SEQUENCE_NAME
------------------------------------------------------------
<span class="emphasis">SEQ_NAMECARD_NO</span>

SQL&gt;
</pre>

<p>
If you run NamecardDDL another, you will encounter an exception.
Because the table and sequence with the same name already exist in the Scott account.
</p>

<dl class="note">
<dt>executeUpdate()</dt>
<dd>
Statement's executeUpdate() method is used to execute DDL statements such as create table .. or DML statements (INSERT, UPDATE, DELETE).
</dd>
</dl>

<h2>Insert</h2>

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

<h2>Select</h2>

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

<h2>Update</h2>

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

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jdbc/preparedstatement"/>">PreparedStatement</a></li>
		<li>Prev : <a href="<c:url value="/jdbc/jdbc-guide"/>">JDBC Guide</a></li>
	</ul>
</div>

</article>