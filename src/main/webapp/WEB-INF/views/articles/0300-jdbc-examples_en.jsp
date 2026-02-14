<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>JDBC - Create Table</h1>

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

<img src="https://lh3.googleusercontent.com/daZUtjQNRrjZtQCGuqtECQI4J2YMnijDgudAGaovaK286r6KLtn5dy2dZYbegEHsQW5UW1A9PxXN71j8nO2ouytNMGCU_zNUjr8_i0B5VsfO9S_0-tMbD5UvgKzYrIqTws-ktXbHBHADPEDqiZCHBZXecAUi5nRV6M-_5X9hqiwy3BU4DzbOmmZdv9DHgXTqGAps1e9yNgOT4APuy27oQtNHhKuOpJ3CflFj3_j3EhvctJYPNCin4YlidBxzMy8jI1pyhi-B21gM88kHG4W8v5r8QjuMKIecp3s9tKmfg7RKgFJLwGlzV7qrSWR0DAfdrz_4bQeP1GsTZPxbY8BI2GnPAuo7P-r2ZGhUHZJL9C3ylPQYaY6SDtArsiar7QAu1qM22HR6V1HHjQguC6BM-rDgxqGWfJonxnpUosRbMIcAGhf-HP5Jbz1MvLJVkCjyryfzHbRri1GcLR8URhDDTy0ZBZw9kP5TrzW0yTC5fBfYOwzHT7najmZX06KJpx6vW6Pomn7hvZBZfXrHv_1pTrTlBciAtOqxV6mpme0M7ngRv1OZeh6JA_NjOSGlsGOQjo7QjM7zKKJxuuRwMg6KvOwetzyoW2RQL1rLvtFvhSWbT_4gcWG2mI2bb4dS9pZSlgguVC01W0ZMYJopdDc0QUAeSpW4Z2A=w590-h273-no" alt="Loading a JDBC Driver" /><br />

Since the forName() method of Class class is a method that must handle ClassNotFoundException, the above compilation error occurs.
With the help of Eclipse's code assist, Select the second solution to insert a try ~ catch statement. (for Eclipse's code assist, place your mouse in the code where the compilation error occurs)
<br />

<img src="https://lh3.googleusercontent.com/nbu4Y5P8Vb2uIrW8gNR59ftjxCXvqISZoxwX3C_6py7pJc5KNiODJKAEmDdOALUFI4RCWM-y2c83stF7_6_6a6Q-ID9dvUDC4F8fqURax-p1m3H9g4Kci51tKQilOkUVaGSvEoCOp_2IantAQfaFrz5qh2LQ5100vkAW8IfMxqgG3IERsCJStmBOsAx_itW3WtaQ9QKXr_DWZvIZhkT6CHaPOjwmSg-9HiATNR0zYFWeX_pjEvzZnK-wjjq_xX20k38OYF-fffOZolPKTYXJl9Ja96UApjrAAdKEN_iXvrneMK54wOQLPMkopv9UU0luPBXDMDxOI2FYjfWATDG7ev_AhxhXrIk3WBwMxj1hX5PvqeZp83-n-JH2HDd1nliMf_L9-cotGTy2ELykXlS3v9aM6ZlTOCSzOiRqNuImM82T0GTY5f2cGvZJyx-6PRUcTirhz9w5LAWogTIxoVoNHObBsTuNMMYppbwm0Er-xYPAZTSrqNeOdoOuRaPG5PVNbBEF1Vom0zmJrb7BswlcYcGSBbEUcsITnieQ8uwpexjTdy8xXxuJjNvRD9dDBVqPxWGGJYLrp9j8V-1QTflqnN6qjMgWA2uAkOaVTbisT9NY1fd_qHaiq9BmA3WKondxjiVODmdvfiunGGq6kjrfd5ZmcqbDph0=w590-h298-no" alt="Handing a ClassNotFoundException" /><br />
</p>

<h3>2. Obtaining a Connection</h3>

<p>
You can get a connection using the getConnection() method of the DriverManager class.<br />
<img src="https://lh3.googleusercontent.com/juj6v3F17uhCqsiJ3-FgvvJeFodd_8C86vxP18HFZv3SacUK_oqG9hVh2DGat3KPyOi5vdpvFqGfPoJa3unfRVS3v7guXU1x8l-MBJAwzBx9dru6nMnEGBOygB453dOByiCM12_ZBa3sIl7MuoiFZCOVrK_-zVNK80t-pi65pkyXmtOA50Nh9hqSViGrITW7o-4qQd2dfBJfMjIeww2Mfq4eDXuQAuIwgkCph_lpGn5d_hWap0V5SDIctIj72g7SDsGm2Lph_LPIF0RWbnN2AkglGBDMuA_pgbxfpaG0hLAHUn_J5M1c_XQaLwRgNUxG_cgJ7JgQILPVjttA5PkuxvxqtP8Vi-KkRh2VFVZQ4rkfn5QWiQhsK3y3eL4bAhpCdRbeLG4fgmQnG1aYJbboQxeaSbKxFLn-ytzuN9KneBteSp1gjeu3v8pCTrM-1Ku1hvlwIsgwRUmiWpjEgi1OmysTwPcdXY9uUtX5OHeFGubpFtwpEY_Zs7jXMgR-GwIOoATIVHYbUhui4Shcc3zZkqzHDK0caAPuTYZ72mStyRcc--Uh5ka3b5tpl3i_RQry1Qbx2S3gS2QFUqSzBYxcU0LJUa8_Hqo7WeEGkda8Rb_I2Osz3DQrqRQkcDPp2WbQJ8_hRqOlDM46IzFeQJWlcFPjUIUt12c=w590-h379-no" alt="Obtaining a Connection" /><br />

Connection and DriverManager are in the java.sql package.
Add the import statement by selecting the first solution in the code assist of the compile error.<br />

<img src="https://lh3.googleusercontent.com/F5sHsanTCPRkrjz5GwcnHwjJZWIF_IorTl6x-KQSypNFLxaQrWCCCl-JYSDTPByafocE5uin9Ro2KY4kg41ZCC8AJZmMmYS0S-MSQHleDWv0fmeTtht-qimxkl05yXqRtlujbPAxn55VL8J3rni2mjRf-mgdIMI3LgEwP01pAwr_1LbRwZT602PeRcSujPb463_dqhZHgF3SI5ignJwPHrKbxcGj1RRXS2Gk54hOp3i6RGTh3SrX9FkKX18EIqJOf0tRNjE7HiBoAAQOPnrhwCkBoruatoe430rK5XWZLyeGtHxmcyyO1AaQbpe68Vaah-jO2k9GIA4fimQd_Tlkza0e5b4F758Tg1-DYUCTSbYHdQRUCGBZ-SGf1tzPWdH2pJtTvM8YdRcMTu5QZpQ_eH3uI-ZuqqztATqOThD-yTDi_iVw8Mzqg_IDKNVYN2Gi2OURYudS7dBbsCh_P1SntzNdtaO4us_wRvygumc32oVwXSOl8e-Zr_UVcS3Kr_opkGUxqNqtrp3Wa-Wz6yseZRtzyCBi8f5ThzzIpk9GqYqT-1nwmwflb2ogtmJy6k4WaG0qpfbrkAeWmitLURNXOJB_9cMqnqU76rg5gUZsq5OVruzmXR0fiU_UP4ovdh6KmP5n7-DxfYhKmOZSqn_XqhHqtFuDb7U=w590-h331-no" alt="Add import java.sql.*;" /><br />

The first argument to the DriverManager's getConnection() method is URL.
The second argument is the user, and the third argument is the user's password.
Since we decided to create a table and a sequence in the Scott account, the second and third argument values are scott and tiger.<br />

<img src="https://lh3.googleusercontent.com/KjzjiTNzDJWuWhSQsfoDt-qzbCV2Rb8aXtf4A6dDJuYzZts08JCW4IEu2IYUYi9ok0F7_kGdnRVIiARbablYQ1Uu0P09oumE6JUn47v4luYsPoVmI6LyxwT9f2YYSkrD7A6k88FNSSqlNIKOmwn7dEnW8TTmgDEW5IxP0UUtvlNjYCyP9zxcdWTIx0EvQtba4LskO5xgDGVaEXXGK0MKLuGxiNJ5ZqlUQgmj3vqJvKx2iqaA8DrGwuI0jiUSGINvKBxOHWZA5idQoYuspjSXzyx_yB00cDowwjV2bqQ2NkjJc3TLnl0uJ6jqdqDiJl2R7S-TsEWI_1Q8fxlmXYQO3cfEKN01oziQzf2PyC2MTv2EsDvksh5aAc2zHMCV1xNgd5FZy3lANfFQxRC3f0K5B3laTCe0jy3gZNI9eeqeGG6xzJNyrQIfognqwUr0R16a58xb4UUFO6em3_Hb772HlOtBt0fABJ_SQnsU4uSDBiwLZldktltE0M1d9y4OQS3AJ4_mp0bRGYypKa7oj9U6qF_n2pp-sSjKpdzdHZWvfcPxz2OUWidNaHTAi-6ubZc11hKzvqQO01kopzJm61YdGoaTSPANH02TF6T5_3lFaUVtUIhu3iX3tKRudAyQG-0wzQFHM1DNW_S4zC73AYJDAtMl72_VNus=w778-h338-no" alt="DriverManager.getConnection(String,String,String) " /><br />

The DriverManager's getConnection() method can raise an SQLException.
Select the second solution of the code assist and handle the exception with a try ~ catch statement.<br />
 
<img src="https://lh3.googleusercontent.com/JlrW716tS8s-llQ01sHWJyVVqdacWsHjhMJXSRz22RyC4aKlox-_zrCZ3aSI0ZUrEkt0KWhh0-2q8DQTCsnOTfPZqfzgKHdYe7QzAG4wbox9Ljx7UQTykL75z3gIrcuhG8SYSZY8UVGrDriMKm_mjvWPyiPUMg2zfPrOzEp5Vxoje-uTDTZq7LuN0Q4gjIQJaW6nx835zDoVmvHdOR8tysL84-Y832uLWTv9KJKHi0qe1pdQNrqQKqJBSIDBqufMnRzCfK3ki34eYQf9RiQvkfaVLw26mPhVcMI1HmL2DAi2uekiFZvhHCRH9JAzKhBbzilvs_ahGRrAlxl3n4G-snu8TFfG_uewrX6wOwe11bx7JWgpUwwWBBbmwf2o9qZ01lwjbAsOVR4tTCZQCYm8odFnaWhcfy-Zkz9ZdRNlvIPd5GwvpmgQHDrxKWx0tzhMKxUk9YLZwad2Nx2UUEz7gip0oK2glKfklgZT6mDj_RjgkWgTJsG5yXOnVaIlOW4HdkEv8V4oCCSGMkyIsUNcqL4V_O7j1mDXGsQhXG4BVl42RQ5ap-ShwyLy-hokRGhS9HC13LSvZtj3rLOUgtS_XTSfTC-wBhPOp_uSa8m5MijnQgIjvOp3gI4aNukWyyPVLWTU9t3bSIDvFlSDGkQXkTTlVMkX1B8=w590-h430-no" alt="Handing a SQLException" /><br />

DriverManager's getConnection() and the Connection interface's methods are all methods that must handle SQLException. So put the getConnection() in a try block.
The Connection instances used in the try block must be returned in the finally block.
So declare the con variable of the Connection type outside the try block.<br />
<img src="https://lh3.googleusercontent.com/hDWqbX0PRSkaC601jiEO8Cw_qFynRQ8O_8wqpMRhn5Oj-B2b1JnNOWb_R45updGYAZzSXUglZR8nuuRzm0S49hRNAkF8yDsDJnRYkMIBJW3n3j5JLJeAw6FbvGb_mtuenC9FHR2XqU3t9eiBMd9Pwusqwj-XqtZYp3uNpRhTBWrE8-oVb4zcL3qzl3QwhfClefjVrlvygD6NNFeXTwNzaGRnL0SFIeBGuSYXDluD5Jw0rvAc6iPuGpTAiraiodSyvY-DcbJvJmPUqDOYQui2Vk-HmKEbkk2diu8-YO6JEFHHOfXjwK31rnwQx9Oy8olzQtilK1xhG_WIkQ8hmKjnPma3JFhaoUW3efzUJkn1Y1_F6PKstkyh6dy-_lAE0mLZ2rb82u9OS66_Hnrf5QNqnMlRX9Pn23uT_O5Stbs-6v40zXLieACsKl4eXqeajqyub6g3FYJC5PpLy2Ieamoy2Z0A8pyXy4rAkMFU3dn3bsduzYhj1RtKDtFpBNd_aCQSzcbkC9OVjI1X7OOrl5PZ0Mr8xIRX2EwbqKxa_ZoOq_1HNxTWCj5FC5akGLWhtnNcUtks7rJOGgQRM3zMC6_RV4Ye6au8EBCYSQii6QO74xIqjE1Q-vboPo6GxtlTrGgEnp2jFD52WkFWsR1blOba9aw-qtGzOWE=w590-h499-no" alt="con variable declaration must be outside the try block" /><br />
</p>

<h3>3. Getting a Statement</h3>

<p>
Decalre the stmt variable of the Statement type outside the try block.
The reason for declaring the variable con outside the try block is the same.
If the "Statement is of an unresolved type" compile error occurs, let the code assist function of Eclipse to add "import java.sql.Statement;".<br />

<img src="https://lh3.googleusercontent.com/9_u22r5PSeyZp90RAvCDHvWQvtADkM4AyunrQ5EZbuz3-_ndGMZ8Kl8pkSWQmRYurZqRioBaGarHR1fDDACKSM6iYSGcYrA7TKVoKyQj3nq0dM5J-g84odfxq5ZJkaSSX1wmf2wh0YFnXqVtpTmgCU1ycC4O1cvFpHoJRGIkuzT8oM3CrW_I8OMTI5cTfDZOEe9A6LrJw3t0gO-X6vD0CSOipgjlLTXSUH-mt_45wOGZeqL3DfTh8z_LdDGE7uPAGWuYLgZwK43Lui71ZEsuhWDdlF-CgjBsyhNaIC4knVcRE7USiWha5ejqy23nZFFuuRV2uDRtInQISv_OjQES5gqu5w7czxsNTNHDnW-QmlH74n8QOb6J2iMspwoQCVQ0v1u93-XGYdnFm1D0vO1JdxxEWQg_jaEyMqyYuN2Wt8SX-LoC2d4Qu-phRkvVxiZF7VWy5cmRPSypYBiPscSeziJ2c6UpMTm0S4ASHSHSO2gNV1YGa7oX27-JMRVnB3Xpx0EX2tOgfzCWSsxoHRfKfLR7ls2XUxyUOPOBpu3OauZkU713GT6kb7p9mrnsgPUkdQBWLq566o0PBzRNRP10g_Ov1LhKZqr0Ce-xR_Y2t3txw-ATumQ68IgjoCu1mrv-GgCLTj5YxFiwNrTu1r5BNpiEPmZho5Q=w590-h530-no" alt="stmt variable declaration must be outside the try block. Add import java.sql.Statement;"/><br />
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
<img src="https://lh3.googleusercontent.com/-jpoxCcT--4o/VYFYTaKNRII/AAAAAAAACSY/lNqcqLejT2E4NucAhB2rJG6Bw3MwlXqSgCCo/s553/stmt-close-11.gif" alt="SQLException compile error" /><br />

Since the close() method of the Statement must handle an SQLException, the compile error occurs.
Use Eclipse's code assists to insert a try - catch block.
The close() method of the Connection interface also must handle an SQLException. 
Use Eclipse's code assists to insert a try ~ catch block.<br />

<img src="https://lh3.googleusercontent.com/-xcPqDZqis0I/VYFYRAYVryI/AAAAAAAACRk/cQB0K_kHNBk99Ea1FwgExxvMRynu7jGaACCo/s550/close-12.gif" alt="Returning Resources Completed." /><br />
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

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jdbc/preparedstatement"/>">PreparedStatement</a></li>
		<li>Prev : <a href="<c:url value="/jdbc/jdbc-guide"/>">JDBC Guide</a></li>
	</ul>
</div>

</article>