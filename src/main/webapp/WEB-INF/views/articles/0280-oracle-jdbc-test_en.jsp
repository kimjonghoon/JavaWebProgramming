<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>JDBC Test on Oracle</h1>

<h3>Adding Oracle JDBC driver to your classpath</h3>

<p>
Java JDBC programming requires a JDBC driver for a database.
You can find the Oracle JDBC driver in C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib.
Among the files in the directory, ojdbc6.jar is the JDBC driver we will use.
The following JDBC test file is a program that retrieves all the records in the Scott account's EMP table.
Save the test file as GetEmp.java in the C:\Users\java\jdbc directory.
</p>

<h6 class="src">GetEmp.java</h6>
<pre class="prettyprint">
import java.sql.*; 

public class GetEmp {
  public static void main(String[] args) {
    String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    String DB_USER = "scott";
    String DB_PASSWORD = "tiger";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String query = "SELECT * FROM emp";
		
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e ) {
      e.printStackTrace();
    }

    try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = conn.createStatement();
      rs = stmt.executeQuery(query);

      while (rs.next()) { 
        String empno = rs.getString(1);
        String ename = rs.getString(2);
        String job = rs.getString(3);
        String mgr = rs.getString(4);
        String hiredate = rs.getString(5);
        String sal = rs.getString(6);
        String comm = rs.getString(7);
        String depno = rs.getString(8);

        System.out.println(empno + " : " + ename + " : " + 
	    job + " : " + mgr + " : " + 
	    hiredate + " : " + sal + " : " + 
	    comm + " : " + depno); 
      }
			
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        rs.close();
        stmt.close();
        conn.close();
      } catch (SQLException e) {}
    }
  }

}
</pre>

<p>
Compile and run.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\java\jdbc&gt;set classpath=.;C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar

C:\Users\java\jdbc&gt;javac GetEmp.java

C:\Users\java\jdbc&gt;java GetEmp
7369 : SMITH : CLERK : 7902 : 1980-12-17 00:00:00.0 : 800 : null : 20
7499 : ALLEN : SALESMAN : 7698 : 1981-02-20 00:00:00.0 : 1600 : 300 : 30
7521 : WARD : SALESMAN : 7698 : 1981-02-22 00:00:00.0 : 1250 : 500 : 30
7566 : JONES : MANAGER : 7839 : 1981-04-02 00:00:00.0 : 2975 : null : 20
7654 : MARTIN : SALESMAN : 7698 : 1981-09-28 00:00:00.0 : 1250 : 1400 : 30
7698 : BLAKE : MANAGER : 7839 : 1981-05-01 00:00:00.0 : 2850 : null : 30
7782 : CLARK : MANAGER : 7839 : 1981-06-09 00:00:00.0 : 2450 : null : 10
7839 : KING : PRESIDENT : null : 1981-11-17 00:00:00.0 : 5000 : null : 10
7844 : TURNER : SALESMAN : 7698 : 1981-09-08 00:00:00.0 : 1500 : 0 : 30
7900 : JAMES : CLERK : 7698 : 1981-12-03 00:00:00.0 : 950 : null : 30
7902 : FORD : ANALYST : 7566 : 1981-12-03 00:00:00.0 : 3000 : null : 20
7934 : MILLER : CLERK : 7782 : 1982-01-23 00:00:00.0 : 1300 : null : 10
</pre>

<dl class="note">
<dt>String DB_URL = <strong>"jdbc:oracle:thin:@127.0.0.1:1521:XE"</strong></dt>
<dd>
<strong>jdbc:oracle:thin</strong>: Thin type JDBC driver<br />
<strong>1521</strong>: The port number of the Oracle listener<br />
The listener bridges Oracle with external applications.<br />
<strong>127.0.0.1</strong>: It is the IP of the server where the database exists.<br />
<strong>XE</strong>: It is the SID name. SID identifies Oracle database objects.<br />  
</dd>
</dl>

<h3>Test Failure Checklist</h3>

<ol>
	<li>Exception in thread "main" java.lang.NoClassDefFoundError: GetEmp
		<ul>
			<li>The message says that the class loader cannot find the GetEmp.</li>
			<li>Confirm that you ran it where the GetEmp.class file is located, and the classpath contains the current directory (.).</li>
		</ul>
	</li>
	<li>java.lang.ClassNotFoundException: oracle.jdbc.driver.OracleDriver
		<ul>
			<li>The message says that the class loader cannot the startup class of the Oracle JDBC driver.</li>
			<li>Make sure you have added the Oracle JDBC driver to your CLASSPATH.</li>
		</ul>
	</li>	
	<li>Java.sql.SQLException: IO Exception: The Network Adapter could not establish the connection
		<ul>
			<li>The message says that there is a possibility that Oracle's Listener is not in service.</li>
			<li>At the command prompt, run <em>lsnrctl status</em> command to check the status of the Listener service.</li>
		</ul>
	</li>
	<li>java.sql.SQLException: ORA-01017: invalid username/password; logon denied
		<ul>
			<li>The message says that password for the Scott account is wrong. If Scott's password is not tiger, modify the GetEmp.java source and test again.</li>
		</ul>
	</li>	
</ol>

<h3>How to test with the -classpath</h3>

<p>
Here's how to use the -classpath option when compiling and running.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\java\jdbc&gt;javac -classpath C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar GetEmp.java

C:\Users\java\jdbc&gt;java -classpath .;C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar GetEmp
7369 : SMITH : CLERK : 7902 : 1980-12-17 00:00:00.0 : 800 : null : 20
7499 : ALLEN : SALESMAN : 7698 : 1981-02-20 00:00:00.0 : 1600 : 300 : 30
7521 : WARD : SALESMAN : 7698 : 1981-02-22 00:00:00.0 : 1250 : 500 : 30
7566 : JONES : MANAGER : 7839 : 1981-04-02 00:00:00.0 : 2975 : null : 20
7654 : MARTIN : SALESMAN : 7698 : 1981-09-28 00:00:00.0 : 1250 : 1400 : 30
7698 : BLAKE : MANAGER : 7839 : 1981-05-01 00:00:00.0 : 2850 : null : 30
7782 : CLARK : MANAGER : 7839 : 1981-06-09 00:00:00.0 : 2450 : null : 10
7839 : KING : PRESIDENT : null : 1981-11-17 00:00:00.0 : 5000 : null : 10
7844 : TURNER : SALESMAN : 7698 : 1981-09-08 00:00:00.0 : 1500 : 0 : 30
7900 : JAMES : CLERK : 7698 : 1981-12-03 00:00:00.0 : 950 : null : 30
7902 : FORD : ANALYST : 7566 : 1981-12-03 00:00:00.0 : 3000 : null : 20
7934 : MILLER : CLERK : 7782 : 1982-01-23 00:00:00.0 : 1300 : null : 10
</pre>

<p>
You can test it by creating the following batch file.
</p>

<h6 class="src">JDBCTEST.bat</h6>
<pre class="prettyprint">
@echo off

java -classpath C:/Users/java/jdbc;C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar GetEmp

pause
</pre>

<h3>Test GetEmp.java in Eclipse</h3>

<p>
Eclipse does not refer to the classpath environment variable.
To run GetEmp in Eclipse, Eclipse manages your code on a project-by-project basis, so you need to create a project once.
Create the project as shown below, and create GetEmp.java belongs to a package called net.java_school.jdbc.
Select the project with the mouse.<br />
<img src="<c:url value="/resources/images/getemp-project-select.png"/>" alt="GetEmp.java on the jdbc project" style="width: 100%;" /><br />

Click the right button and select the menu like below.<br />
<img src="<c:url value="/resources/images/getemp-configure-build-path.png"/>" alt="jdbc project selection - mouse right click - Build Path - Configure Build Path selection" style="width: 100%;" /><br />

Select the Libraries tab and click the Add External JARs button.<br />
<img src="<c:url value="/resources/images/getemp-libraries-tab-select.png"/>" alt="Libraries tab - Add External Lib..." style="width: 100%;" /><br />

Add the Oracle JDBC driver file.<br />
<img src="<c:url value="/resources/images/getemp-ojdbc6-select.png"/>" alt="Add ojdbc6.jar" style="width: 100%;" /><br />

<img src="<c:url value="/resources/images/getemp-oracle-jdbc-driver-classpath.png"/>" alt="Confirm ojdbc6.jar" style="width: 100%;" /><br />

In the Package Explorer view, select GetEmp.java with the mouse.
Click the right button and execute as below.
<img src="<c:url value="/resources/images/getemp-run.png"/>" alt="How to run GetEmp.java in Eclipse" style="width: 100%;" /><br />
</p>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jdbc/jdbc-guide"/>">JDBC Guide</a></li>
		<li>Prev : <a href="<c:url value="/jdbc/sql-basics"/>">SQL Basics</a></li>
	</ul>
</div>

</article>