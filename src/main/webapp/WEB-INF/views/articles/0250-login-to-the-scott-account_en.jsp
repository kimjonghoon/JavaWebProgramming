<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>SCOTT account</h1>

<p>
Oracle 11g XE does not have the Scott account.<br />
If you installed Oracle Database 11g Release 2 but not XE, the SCOTT account exits.
But the SCOTT account is locked.
To unlock, you need to log in as an administrator and run the following:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
alter user scott account unlock;
</pre>

<p>
When you first access the Scott account in 11g Release 2, Oracle instructs you to change Scott's password.
Change it to the <strong>tiger</strong> for consistency in subsequent JDBC articles.
</p>

<p>
If you installed 11g XE by selecting the installation partition as C:\, the SCOTT schema script file path is as follows.<br />
<em class="path">C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql</em><br />
Use this file to create a Scott account. Connect to SQL * Plus with the SYSTEM account.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\java&gt;<span class="prompt-selection">sqlplus</span>

SQL*Plus: Release 11.2.0.2.0 Production on Tue Jun 7 13:29:14 2016

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: <span class="prompt-selection">system</span>
Enter password: <span class="prompt-selection">&lt;Admin Password&gt;</span>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt;
</pre>

<p>
SQL * Plus is an Oracle command-line program that can execute SQL.
Run the SCOTT schema script file.
To run a file in SQL * Plus, prepend the full path to the file with @.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql</span>
SQL&gt;
</pre>

<p>
If there are no errors, identify the users as below.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">show user</span>
USER is "SCOTT"
SQL&gt;
</pre>

<p>
You can see that the connected user has changed from SYSTEM to SCOTT.
Change the password for the SCOTT account to the tiger.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">alter user scott identified by tiger;</span>
User altered.
SQL&gt;
</pre>

<p>
Exit SQL * Plus by executing exit.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">exit</span>
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0
- 64bit Production
C:\Users\kim&gt;
</pre>

<p>
Users can use their Oracle objects -- tables, views, sequences, and indexes.
The scott.sql schema script file creates the SCOTT account and tables for the SCOTT.
Reconnect to the SCOTT account with SQL * Plus and confirm tables in the SCOTT account.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\java&gt;<span class="prompt-selection">sqlplus scott/tiger</span>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt; <span class="prompt-selection">select * from tab;</span>

TNAME                                                        TABTYPE
---------------------------------------------------------------------
BONUS                                                        TABLE
DEPT                                                         TABLE
EMP                                                          TABLE
SALGRADE                                                     TABLE

SQL&gt;
</pre>

<p>
The Scott account has tables BONUS, DEPT, EMP, and SALGRADE.
To view the DEPT table structure, run the following.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">desc dept;</span>
NAME                                      NULL?      TYPE
----------------------------------------- -------- -------------------

DEPTNO                                    NOT NULL NUMBER(2)
DNAME                                              VARCHAR2(14)
LOC                                                VARCHAR2(13)

SQL&gt;
</pre>

<p>
NAME is the column name.<br />
TYPE is the data type specified in the column.<br />
</p>

<p>
The first column is named DEPTNO, can not be null, and its type is NUMBER.<br />
The second column is named DNAME and can be null, and its type is VARCHAR2.<br />
The third column is named LOC and can be null, and its type is VARCHAR2.
</p>

<dl class="note">
<dt>NULL</dt>
<dd>
NULL means that the column does not contain any value.
Neither space character nor zero.
The calculation and comparison with NULL are impossible.
The result of the arithmetic operation involving NULL is NULL.
You cannot compare values with NULL.
</dd>
<dt>Oracle's main data types</dt>
<dd>
<strong>NUMBER</strong>(PRECISION,SCALE)<br />
It is a data type for numbers.
PRECISION: Total digits including decimal point.<br />
SCALE: Decimal places.<br />
For example, 72.5 is NUMBER(3,1), 10 is NUMBER(2),
7788 is NUMBER(4), and all numeric types are NUMBER.<br />
<strong>DATE</strong><br />
It is a data type that stores dates and times<br />
<strong>VARCHAR2</strong>(Number)<br />
It is a data type that stores variable-length character strings.<br />
The number in parentheses means the number of bytes.<br />
VARCHAR2(15) column can store a maximum of 15 bytes string.
</dd>
</dl>

<p>
Let's look at the records in the DEPT table.
(Record means one row)
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">select * from dept;</span>

    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON

SQL&gt;
</pre>

<p>
A select statement retrieves records from the table.
SQL statements are case-insensitive. However, this does not mean that the data is case-insensitive.
The DEPT is a department table. The DEPTNO column stores the department number, the DNAME column stores the department name, and the LOC column stores the department location information.
</p>

<p>
Let's look at the structure of the EMP table.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">desc emp;</span>

 NAME                                      NULL?      TYPE
 ----------------------------------------- -------- ----------------------------

 EMPNO                                     NOT NULL NUMBER(4)
 ENAME                                              VARCHAR2(10)
 JOB                                                VARCHAR2(9)
 MGR                                                NUMBER(4)
 HIREDATE                                           DATE
 SAL                                                NUMBER(7,2)
 COMM                                               NUMBER(7,2)
 DEPTNO                                             NUMBER(2)

SQL&gt;
</pre>

<p>
What the EMP table column means are:
</p>

<ol>
	<li>EMPNO(Employee number)</li>
	<li>ENAME(Employee Name)</li>
	<li>JOB</li>
	<li>MGR(Supervisor-employee number)</li>
	<li>HIREDATE(Hire date)</li>
	<li>SAL(Salary)</li>
	<li>COMM(Commission)</li>
	<li>DEPTNO(Department number)</li>
</ol>

<p>
Retrieve all employee records contained in the EMP table.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">select * from emp;</span>

EMPNO ENAME  JOB           MGR  HIREDATE   SAL     COMM    DEPTNO   
---- -------------------------- --------   ------- ------- -------
7369 SMITH   CLERK         7902 80/12/17   800               20   
7499 ALLEN   SALESMAN      7698 81/02/20   1600     300      30   
7521 WARD    SALESMAN      7698 81/02/22   1250     500      30   
7566 JONES   MANAGER       7839 81/04/02   2975              20   
7654 MARTIN  SALESMAN      7698 81/09/28   1250     1400     30   
7698 BLAKE   MANAGER       7839 81/05/01   2850              30   
7782 CLARK   MANAGER       7839 81/06/09   2450              10   
7839 KING    PRESIDENT          81/11/17   5000              10   
7844 TURNER  SALESMAN      7698 81/09/08   1500       0      30   
7900 JAMES   CLERK         7698 81/12/03   950               30   
7902 FORD    ANALYST       7566 81/12/03   3000              20   
7934 MILLER  CLERK         7782 82/01/23   1300              10   

12 rows selected.

SQL&gt;
</pre>

<p>
There are a total of 12 employees.
Only employees whose job (JOB) is sales (SALESMAN) have values in the COMM (commission) column. The commission column for the remaining employees is NULL.
</p>

<p>
Since KING is a PRESIDENT, the employee number of his manager is NULL.
</p>

<p>
Check the structure of the SALGRADE table.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">desc salgrade;</span>
NAME                                      NULL?      TYPE
----------------------------------------- -------- -------

GRADE                                              NUMBER
LOSAL                                              NUMBER
HISAL                                              NUMBER

SQL&gt;
</pre>

<p>
The SALGRADE table is a table of salary levels.
GRADE is the salary grade, In the same salary grade, LOSAL is the minimum salary, and HISAL is the maximum salary.
</p>

<p>
Retrieve all the data from the SALGRADE table.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
SQL&gt; <span class="prompt-selection">select * from salgrade;</span>

     GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999

SQL&gt;
</pre>

<h3>Create a SCOTT account on Linux</h3>

<p>
Start SQL*PLUS and login as sys:
</p>

<pre class="shell-prompt">
<strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on Wed May 9 12:12:16 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>**********</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt;<strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

</article>