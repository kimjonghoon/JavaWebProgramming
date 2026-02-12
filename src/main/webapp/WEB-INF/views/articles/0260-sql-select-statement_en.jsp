<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Select</h1>

<p>
SQL also has a standard.<br />
In this section, we will practice SELECT statements with standard SQL.<br />
The SELECT has the following order.
</p>

<pre class="prettyprint">
SELECT column, column ...
FROM table name
WHERE condition
GROUP BY statement
UNION/UNION ALL/INTERSECT/MINUS
ORDER BY statement
</pre>

<p>
For Oracle, you must write up to <b>FROM table_name</b>.
</p>

<p>
All examples below use tables from the SCOTT account.<br />
If you do not have a SCOTT account, refer to the following to create tables. 
</p>

<h6 class="src">Oracle</h6>
<pre class="prettyprint">
CREATE TABLE DEPT (
	DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP (
	EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
CREATE TABLE SALGRADE ( 
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,to_date('13-7-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
</pre>

<h6 class="src">MySQL</h6>
<pre class="prettyprint">
CREATE TABLE DEPT (
	DEPTNO DECIMAL(2),
	DNAME VARCHAR(14),
	LOC VARCHAR(13),
	CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
	EMPNO DECIMAL(4),
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR DECIMAL(4),
	HIREDATE DATE,
	SAL DECIMAL(7,2),
	COMM DECIMAL(7,2),
	DEPTNO DECIMAL(2),
	CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
	CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
	GRADE TINYINT,
	LOSAL SMALLINT,
	HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
</pre>

<h3>All the records on the employee table</h3>

<pre class="prettyprint">
SELECT * 
FROM EMP
</pre>

<pre class="prettyprint">
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO 
FROM EMP
</pre>

<p>
The above two SQL statements show the same result. After the select keyword, * means all the columns in order.
</p>

<pre>
     EMPNO ENAME      JOB	       MGR HIREDATE	   SAL	     COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7369 SMITH      CLERK	      7902 80/12/17	   800			  20
      7499 ALLEN      SALESMAN	      7698 81/02/20	  1600	      300	  30
      7521 WARD       SALESMAN	      7698 81/02/22	  1250	      500	  30
      7566 JONES      MANAGER	      7839 81/04/02	  2975			  20
      7654 MARTIN     SALESMAN	      7698 81/09/28	  1250	     1400	  30
      7698 BLAKE      MANAGER	      7839 81/05/01	  2850			  30
      7782 CLARK      MANAGER	      7839 81/06/09	  2450			  10
      7788 SCOTT      ANALYST	      7566 87/07/13	  3000			  20
      7839 KING       PRESIDENT 	   81/11/17	  5000			  10
      7844 TURNER     SALESMAN	      7698 81/09/08	  1500		0	  30
      7876 ADAMS      CLERK	      7788 87/07/13	  1100			  20
      7900 JAMES      CLERK	      7698 81/12/03	   950			  30
      7902 FORD       ANALYST	      7566 81/12/03	  3000			  20
      7934 MILLER     CLERK	      7782 82/01/23	  1300			  10
</pre>

<h3>employee's name and hire date</h3>

<pre class="prettyprint">
SELECT ENAME,HIREDATE
FROM EMP;
</pre>

<pre>
ENAME	   HIREDATE
---------- --------
SMITH	   80/12/17
ALLEN	   81/02/20
WARD	   81/02/22
JONES	   81/04/02
MARTIN	   81/09/28
BLAKE	   81/05/01
CLARK	   81/06/09
SCOTT	   87/07/13
KING	   81/11/17
TURNER	   81/09/08
ADAMS	   87/07/13
JAMES	   81/12/03
FORD	   81/12/03
MILLER	   82/01/23
</pre>

<h3>Department number and employee's name</h3>

<pre class="prettyprint">
SELECT DEPTNO,ENAME 
FROM EMP
</pre>

<pre>
    DEPTNO ENAME
---------- ----------
	20 SMITH
	30 ALLEN
	30 WARD
	20 JONES
	30 MARTIN
	30 BLAKE
	10 CLARK
	20 SCOTT
	10 KING
	30 TURNER
	20 ADAMS
	30 JAMES
	20 FORD
	10 MILLER
</pre>

<h3>Jobs List</h3>

<pre class="prettyprint">
SELECT DISTINCT JOB
FROM
EMP
</pre>

<pre>
JOB
---------
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST
</pre>

<p>
DISTINCT makes duplicate records to be shown only once in query results.
</p>

<h3>Total number of employees</h3>

<pre class="prettyprint">
SELECT COUNT(EMPNO)
FROM
EMP
</pre>

<pre>
COUNT(EMPNO)
------------
	  14
</pre>

<p>
COUNT returns the number of records retrieved as one of the group functions.
COUNT (column name) returns the number of non-NULL records for which that column is not NULL, and COUNT (*) returns the total number of them.
</p>

<h2>WHERE conditions</h2>

<h3>Employees working in a department with department number 10</h3>

<pre class="prettyprint">
SELECT * 
FROM EMP
WHERE DEPTNO = 10;
</pre>

<pre>
     EMPNO ENAME      JOB	       MGR HIREDATE	   SAL	     COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7782 CLARK      MANAGER	      7839 81/06/09	  2450			  10
      7839 KING       PRESIDENT 	   81/11/17	  5000			  10
      7934 MILLER     CLERK	      7782 82/01/23	  1300			  10
</pre>

<h3>Employees receiving more than 2500</h3>

<pre class="prettyprint">
SELECT *
FROM EMP
WHERE SAL &gt;= 2500;
</pre>

<pre>
     EMPNO ENAME      JOB	       MGR HIREDATE	   SAL	     COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7566 JONES      MANAGER	      7839 81/04/02	  2975			  20
      7698 BLAKE      MANAGER	      7839 81/05/01	  2850			  30
      7788 SCOTT      ANALYST	      7566 87/07/13	  3000			  20
      7839 KING       PRESIDENT 	   81/11/17	  5000			  10
      7902 FORD       ANALYST	      7566 81/12/03	  3000			  20
</pre>

<p>
When you add the WEREE conditions to the query, you can fetch records matching the WHERE conditions.
You can use =, &gt;, &gt;=, &lt;=, &lt; in the WHERE conditions.
</p>

<h3>Employee whose name is KING</h3>

<pre class="prettyprint">
SELECT *
FROM EMP
WHERE ENAME = 'KING';
</pre>

<pre>
     EMPNO ENAME      JOB	       MGR HIREDATE	   SAL	     COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7839 KING       PRESIDENT 	   81/11/17	  5000			  10
</pre>

<p>
SQL statements are case-insensitive. However, the data in the column is, of course, case-sensitive.
</p>

<dl class="note">
<dt>MySQL is case-sensitive</dt>
<dd>
Unlike Oracle, table and column names in MySQL are case-sensitive.
</dd>
</dl>

<h3>Employee number and name of employees whose name begins with S</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE 'S%';
</pre>

<pre>
     EMPNO ENAME
---------- ----------
      7369 SMITH
      7788 SCOTT
</pre>

<h3>Employee number and name of the employees whose name includes T</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE '%T%';
</pre>

<pre>
     EMPNO ENAME
---------- ----------
      7369 SMITH
      7654 MARTIN
      7788 SCOTT
      7844 TURNER
</pre>

<p>
LIKE is used in searches with % and _.
</p>

<dl class="note">
<dt>SQL*PLUS Tips</dt>
<dd>
Here's how to edit the SQL statement in the command buffer. <br />
This is useful when you run an incorrect SQL statement. <br />
<strong>ed</strong><br />
When you run ed in SQL*PLUS, the system's default editor runs and displays the buffer.
In Windows, Notepad runs.
After modifying the contents and closing it in Notepad, execute / to run the SQL statement in the buffer.<br />
<strong>/</strong>
</dd>
</dl>

<h3>Employee number, name, and commission of the employees who earn 300, 500, or 1400 commissions</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,COMM
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;
</pre>

<pre>
     EMPNO ENAME	    COMM
---------- ---------- ----------
      7499 ALLEN	     300
      7521 WARD 	     500
      7654 MARTIN	    1400
</pre>

<pre class="prettyprint">
SELECT EMPNO,ENAME,COMM
FROM EMP
WHERE COMM IN (300,500,1400);
</pre>

<pre>
     EMPNO ENAME	    COMM
---------- ---------- ----------
      7499 ALLEN	     300
      7521 WARD 	     500
      7654 MARTIN	    1400
</pre>

<p>
Both are SQL statements that show the same result.
The first SQL statement used the logical operator, OR, and the second used IN.
</p>

<h3>Employee number, name, and salary of employees whose salary is between 1200 and 3500</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL BETWEEN 1200 AND 3500;
</pre>

<pre>
     EMPNO ENAME	     SAL
---------- ---------- ----------
      7499 ALLEN	    1600
      7521 WARD 	    1250
      7566 JONES	    2975
      7654 MARTIN	    1250
      7698 BLAKE	    2850
      7782 CLARK	    2450
      7788 SCOTT	    3000
      7844 TURNER	    1500
      7902 FORD 	    3000
      7934 MILLER	    1300
</pre>

<p>
SAL BETWEEN 1200 AND 3500 is mathematically 1200 &lt; = SAL &lt; = 3500.
</p>

<h3>Employee name, employee number, job, department number of the employees whose job title is manager and department number is 30</h3>

<pre class="prettyprint">
SELECT ENAME,EMPNO,JOB,DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'MANAGER';
</pre>

<pre>
ENAME		EMPNO JOB	    DEPTNO
---------- ---------- --------- ----------
BLAKE		 7698 MANAGER		30
</pre>

<h3>Employee number, name, and department number of an employees whose department number is not 30</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE NOT DEPTNO = 30;
</pre>

<pre>
     EMPNO ENAME	  DEPTNO
---------- ---------- ----------
      7369 SMITH	      20
      7566 JONES	      20
      7782 CLARK	      10
      7788 SCOTT	      20
      7839 KING 	      10
      7876 ADAMS	      20
      7902 FORD 	      20
      7934 MILLER	      10
</pre>

<h3>Employee number, name, and commission of the employees whose commission are not 300, 500, or 1400</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,COMM
FROM EMP
WHERE COMM NOT IN (300,500,1400);
</pre>

<pre>
     EMPNO ENAME	    COMM
---------- ---------- ----------
      7844 TURNER	       0
</pre>

<h3>Employee number and name of the employees whose name does not contain an S</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME NOT LIKE '%S%';
</pre>

<pre>
     EMPNO ENAME
---------- ----------
      7499 ALLEN
      7521 WARD
      7654 MARTIN
      7698 BLAKE
      7782 CLARK
      7839 KING
      7844 TURNER
      7902 FORD
      7934 MILLER
</pre>

<h3>Employee number, name, and salary of employees whose salary is less than 1200 or exceeds 3700</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL NOT BETWEEN 1200 AND 3700;
</pre>

<pre>
     EMPNO ENAME	     SAL
---------- ---------- ----------
      7369 SMITH	     800
      7839 KING 	    5000
      7876 ADAMS	    1100
      7900 JAMES	     950
</pre>

<h3>Employee name and job of the employees without their manager</h3>

<p>
To check if a column is NULL, use the IS NULL and IS NOT NULL statements. 
</p>

<pre class="prettyprint">
SELECT ENAME,JOB
FROM EMP
WHERE MGR IS NULL;
</pre>

<pre>
ENAME	   JOB
---------- ---------
KING	   PRESIDENT
</pre>

<h2>GROUP BY</h2>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
</pre>

<pre>
SELECT DEPTNO,AVG(SAL)
       *
ERROR at line 1:
ORA-00937: not a single-group group function
</pre>

<p>
The above SQL statement intents to find the salary average by DEPTNO.<br />
At this time, DEPTNO is a column for grouping.<br />
A group function is used together with a column for grouping.<br />
You should specify that column after GROUP BY.
</p>

<h3>Average salary by department number</h3>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
GROUP BY DEPTNO;
</pre>

<pre>
    DEPTNO   AVG(SAL)
---------- ----------
	30 1566.66667
	20	 2175
	10 2916.66667
</pre>

<h3>Total number of employees and employees receiving commissions by department number</h3>

<pre class="prettyprint">
SELECT DEPTNO,COUNT(*),COUNT(COMM)
FROM EMP
GROUP BY DEPTNO;
</pre>

<pre>
    DEPTNO   COUNT(*) COUNT(COMM)
---------- ---------- -----------
	30	    6		4
	20	    5		0
	10	    3		0
</pre>

<h3>Maximum salary and minimum salary by department number</h3>

<pre class="prettyprint">
SELECT DEPTNO,MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;
</pre>

<pre>
    DEPTNO   MAX(SAL)	MIN(SAL)
---------- ---------- ----------
	30	 2850	     950
	20	 3000	     800
	10	 5000	    1300
</pre>

<p>
HAVING is used to extract data from the GROUP BY clause.
</p>

<h3>Average salary by department number for those with a salary of 2000 or higher</h3>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
WHERE AVG(SAL) &gt;= 2000;
GROUP BY DEPTNO;
</pre>

<pre>
GROUP BY DEPTNO;  2    3  WHERE AVG(SAL) &gt;= 2000
      *
ERROR at line 3:
ORA-00934: group function is not allowed here
</pre>

<p>
You can not use a WHERE conditional statement when giving a condition using the GROUP BY clause. Therefore, the above query generates an error. Use the HAVING clause instead of the WHERE clause. Note that in the HAVING clause only has the group functions and the columns for grouping.
</p>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) &gt;= 2000;
</pre>

<pre>
    DEPTNO   AVG(SAL)
---------- ----------
	20	 2175
	10 2916.66667
</pre>

<h3>Salary averages by department number only for employees whose salary is 1000 or higher (only records with an average of 2000 or higher)</h3>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
WHERE SAL &gt;= 1000
GROUP BY DEPTNO
HAVING AVG(SAL) &gt;= 2000;
</pre>

<pre>
    DEPTNO   AVG(SAL)
---------- ----------
	20    2518.75
	10 2916.66667
</pre>

<p>
The WHERE clause retrieves records matching specific conditions from a table.
The HAVING clause retrieves records matching specific conditions from the query result of the GROUP BY clause.
</p>

<h2>ORDER BY</h2>

<p>
You can use the ORDER BY clause to sort the SELECT statement's result based on a column or columns.<br />
The usage is as follows.<br />
ORDER BY ColumnName ASC; or ORDER BY ColumnName DESC;<br />
ASC: Ascending order (You can omit it)<br />
DESC: Descending order<br />
</p>

<h3>Fetch employee number, name, and salary in descending order of their salary (For same salary employees, sort by name in ascending order)</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,SAL
FROM EMP
ORDER BY SAL DESC,ENAME ASC;
</pre>

<pre>
     EMPNO ENAME	     SAL
---------- ---------- ----------
      7839 KING 	    5000
      7902 FORD 	    3000
      7788 SCOTT	    3000
      7566 JONES	    2975
      7698 BLAKE	    2850
      7782 CLARK	    2450
      7499 ALLEN	    1600
      7844 TURNER	    1500
      7934 MILLER	    1300
      7654 MARTIN	    1250
      7521 WARD 	    1250
      7876 ADAMS	    1100
      7900 JAMES	     950
      7369 SMITH	     800
</pre>

<h2>Join</h2>

<p>
Joins means query data from two or more tables.<br />
Join requires N-1 join conditions when joining N tables.<br />
Join without any join condition is called Cartesian product.
</p>

<h3>Cartesian product</h3>

<pre class="prettyprint">
SELECT EMP.ENAME,DEPT.DNAME
FROM EMP,DEPT
</pre>

<pre>
ENAME	   DNAME
---------- --------------
SMITH	   ACCOUNTING
ALLEN	   ACCOUNTING
WARD	   ACCOUNTING
JONES	   ACCOUNTING
MARTIN	   ACCOUNTING
BLAKE	   ACCOUNTING
CLARK	   ACCOUNTING
SCOTT	   ACCOUNTING
KING	   ACCOUNTING
TURNER	   ACCOUNTING
ADAMS	   ACCOUNTING
JAMES	   ACCOUNTING
FORD	   ACCOUNTING
MILLER	   ACCOUNTING
SMITH	   RESEARCH
ALLEN	   RESEARCH
WARD	   RESEARCH
JONES	   RESEARCH
MARTIN	   RESEARCH
BLAKE	   RESEARCH
CLARK	   RESEARCH
SCOTT	   RESEARCH
KING	   RESEARCH
TURNER	   RESEARCH
ADAMS	   RESEARCH
JAMES	   RESEARCH
FORD	   RESEARCH
MILLER	   RESEARCH
SMITH	   SALES
ALLEN	   SALES
WARD	   SALES
JONES	   SALES
MARTIN	   SALES
BLAKE	   SALES
CLARK	   SALES
SCOTT	   SALES
KING	   SALES
TURNER	   SALES
ADAMS	   SALES
JAMES	   SALES
FORD	   SALES
MILLER	   SALES
SMITH	   OPERATIONS
ALLEN	   OPERATIONS
WARD	   OPERATIONS
JONES	   OPERATIONS
MARTIN	   OPERATIONS
BLAKE	   OPERATIONS
CLARK	   OPERATIONS
SCOTT	   OPERATIONS
KING	   OPERATIONS
TURNER	   OPERATIONS
ADAMS	   OPERATIONS
JAMES	   OPERATIONS
FORD	   OPERATIONS
MILLER	   OPERATIONS
</pre>

<p>
Cartesian product of EMP and DEPT tables generate 48 rows by multiplying 12 records existing in the EMP table and 4 in the DEPT table.
</p>

<p>
You better write the join condition while considering the Cartesian product as above.
</p>

<p>
If the column name is distinct from other columns in the join tables, you can omit the table name in the column list. In the above example, you can use ENAME instead of EMP.ENAME.
</p>

<h3>Employee name and department name</h3>

<pre class="prettyprint">
SELECT ENAME,DNAME
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
</pre>

<pre>
ENAME	   DNAME
---------- --------------
SMITH	   RESEARCH
ALLEN	   SALES
WARD	   SALES
JONES	   RESEARCH
MARTIN	   SALES
BLAKE	   SALES
CLARK	   ACCOUNTING
SCOTT	   RESEARCH
KING	   ACCOUNTING
TURNER	   SALES
ADAMS	   RESEARCH
JAMES	   SALES
FORD	   RESEARCH
MILLER	   ACCOUNTING
</pre>

<p>
You can give the table name alias in the FROM clause.
</p>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO;
</pre>

<pre>
ENAME	   DNAME
---------- --------------
SMITH	   RESEARCH
ALLEN	   SALES
WARD	   SALES
JONES	   RESEARCH
MARTIN	   SALES
BLAKE	   SALES
CLARK	   ACCOUNTING
SCOTT	   RESEARCH
KING	   ACCOUNTING
TURNER	   SALES
ADAMS	   RESEARCH
JAMES	   SALES
FORD	   RESEARCH
MILLER	   ACCOUNTING
</pre>

<h3>Employee name and their manager name</h3>

<p>
You can obtain the same result by using an INNER JOIN.
</p>

<pre class="prettyprint">
SELECT E.ENAME, M.ENAME 
FROM EMP E INNER JOIN EMP M ON E.MGR = M.EMPNO;
</pre>

<pre>
ENAME	   ENAME
---------- ----------
FORD	   JONES
SCOTT	   JONES
JAMES	   BLAKE
TURNER	   BLAKE
MARTIN	   BLAKE
WARD	   BLAKE
ALLEN	   BLAKE
MILLER	   CLARK
ADAMS	   SCOTT
CLARK	   KING
BLAKE	   KING
JONES	   KING
SMITH	   FORD
</pre>

<h3>Employee name, salary, and salary grade</h3>

<pre class="prettyprint">
SELECT E.ENAME,E.SAL,S.GRADE
FROM EMP E,SALGRADE S
WHERE E.SAL &gt;= S.LOSAL AND E.SAL &lt;= S.HISAL;
</pre>

<pre>
ENAME		  SAL	   GRADE
---------- ---------- ----------
SMITH		  800	       1
ADAMS		 1100	       1
JAMES		  950	       1
WARD		 1250	       2
MARTIN		 1250	       2
MILLER		 1300	       2
ALLEN		 1600	       3
TURNER		 1500	       3
JONES		 2975	       4
BLAKE		 2850	       4
CLARK		 2450	       4
SCOTT		 3000	       4
FORD		 3000	       4
KING		 5000	       5
</pre>

<pre class="prettyprint">
SELECT E.ENAME,E.SAL,S.GRADE
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
</pre>

<pre>
ENAME		  SAL	   GRADE
---------- ---------- ----------
SMITH		  800	       1
ADAMS		 1100	       1
JAMES		  950	       1
WARD		 1250	       2
MARTIN		 1250	       2
MILLER		 1300	       2
ALLEN		 1600	       3
TURNER		 1500	       3
JONES		 2975	       4
BLAKE		 2850	       4
CLARK		 2450	       4
SCOTT		 3000	       4
FORD		 3000	       4
KING		 5000	       5
</pre>

<h3>Employee name, department name, and salary grade</h3>

<pre class="prettyprint">
SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMP E,DEPT D,SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;
</pre>

<pre>
ENAME	   DNAME	       GRADE
---------- -------------- ----------
SMITH	   RESEARCH		   1
ALLEN	   SALES		   3
WARD	   SALES		   2
JONES	   RESEARCH		   4
MARTIN	   SALES		   2
BLAKE	   SALES		   4
CLARK	   ACCOUNTING		   4
SCOTT	   RESEARCH		   4
KING	   ACCOUNTING		   5
TURNER	   SALES		   3
ADAMS	   RESEARCH		   1
JAMES	   SALES		   1
FORD	   RESEARCH		   4
MILLER	   ACCOUNTING		   2
</pre>

<h3>Employee name and their manager name</h3>

<pre class="prettyprint">
SELECT E.ENAME,M.ENAME
FROM EMP E,EMP M
WHERE E.MGR = M.EMPNO;
</pre>

<pre>
ENAME	   ENAME
---------- ----------
FORD	   JONES
SCOTT	   JONES
JAMES	   BLAKE
TURNER	   BLAKE
MARTIN	   BLAKE
WARD	   BLAKE
ALLEN	   BLAKE
MILLER	   CLARK
ADAMS	   SCOTT
CLARK	   KING
BLAKE	   KING
JONES	   KING
SMITH	   FORD
</pre>

<p>
The above results are missing the president's record. There is no employee whose employee number is NULL, so the president's record does not match the join condition. Nevertheless, if you want to see the president's records, use the following query: 
</p>

<pre class="prettyprint">
SELECT E.ENAME,M.ENAME
FROM EMP E LEFT JOIN EMP M ON E.MGR = M.EMPNO;
</pre>

<pre>
ENAME	   ENAME
---------- ----------
FORD	   JONES
SCOTT	   JONES
JAMES	   BLAKE
TURNER	   BLAKE
MARTIN	   BLAKE
WARD	   BLAKE
ALLEN	   BLAKE
MILLER	   CLARK
ADAMS	   SCOTT
CLARK	   KING
BLAKE	   KING
JONES	   KING
SMITH	   FORD
KING
</pre>

<p>
This join is called an OUTER join.<br />
</p>

<h3>A LEFT JOIN B</h3>

<p>
Even if the rows do not satisfy the join condition, it includes those rows of the left table, A.
</p>

<h3>Employee name, department name (Even if there are no employees in the department with department number 40, the result must include department 40)</h3>

<pre class="prettyprint">
SELECT E.ENAME, D.DNAME
FROM DEPT D LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO;
</pre>

<pre>
ENAME	   DNAME
---------- --------------
SMITH	   RESEARCH
ALLEN	   SALES
WARD	   SALES
JONES	   RESEARCH
MARTIN	   SALES
BLAKE	   SALES
CLARK	   ACCOUNTING
SCOTT	   RESEARCH
KING	   ACCOUNTING
TURNER	   SALES
ADAMS	   RESEARCH
JAMES	   SALES
FORD	   RESEARCH
MILLER	   ACCOUNTING
	   OPERATIONS
</pre>


<h3>Employee name, department number, department name</h3>

<pre class="prettyprint">
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO;
</pre>

<pre>
ENAME	       DEPTNO DNAME
---------- ---------- --------------
SMITH		   20 RESEARCH
ALLEN		   30 SALES
WARD		   30 SALES
JONES		   20 RESEARCH
MARTIN		   30 SALES
BLAKE		   30 SALES
CLARK		   10 ACCOUNTING
SCOTT		   20 RESEARCH
KING		   10 ACCOUNTING
TURNER		   30 SALES
ADAMS		   20 RESEARCH
JAMES		   30 SALES
FORD		   20 RESEARCH
MILLER		   10 ACCOUNTING
</pre>

<pre class="prettyprint">
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
</pre>

<pre>
ENAME	       DEPTNO DNAME
---------- ---------- --------------
SMITH		   20 RESEARCH
ALLEN		   30 SALES
WARD		   30 SALES
JONES		   20 RESEARCH
MARTIN		   30 SALES
BLAKE		   30 SALES
CLARK		   10 ACCOUNTING
SCOTT		   20 RESEARCH
KING		   10 ACCOUNTING
TURNER		   30 SALES
ADAMS		   20 RESEARCH
JAMES		   30 SALES
FORD		   20 RESEARCH
MILLER		   10 ACCOUNTING
</pre>

<p>
The above two queries retrieve the same result. 
</p>

<h3>Employee name, job, department number, and department location of the employees with department number 30</h3>

<pre class="prettyprint">
SELECT ENAME, JOB, E.DEPTNO, LOC
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO AND D.DEPTNO = 30;
</pre>

<pre>
ENAME	   JOB		 DEPTNO LOC
---------- --------- ---------- -------------
ALLEN	   SALESMAN	     30 CHICAGO
WARD	   SALESMAN	     30 CHICAGO
MARTIN	   SALESMAN	     30 CHICAGO
BLAKE	   MANAGER	     30 CHICAGO
TURNER	   SALESMAN	     30 CHICAGO
JAMES	   CLERK	     30 CHICAGO
</pre>

<pre class="prettyprint">
SELECT ENAME,JOB,E.DEPTNO,LOC
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DEPTNO = 30;
</pre>

<pre>
ENAME	   JOB		 DEPTNO LOC
---------- --------- ---------- -------------
ALLEN	   SALESMAN	     30 CHICAGO
WARD	   SALESMAN	     30 CHICAGO
MARTIN	   SALESMAN	     30 CHICAGO
BLAKE	   MANAGER	     30 CHICAGO
TURNER	   SALESMAN	     30 CHICAGO
JAMES	   CLERK	     30 CHICAGO
</pre>

<h3>Employee name, commission, department name, and department location of the employees receiving the commission</h3>

<pre class="prettyprint">
SELECT ENAME,COMM,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND EMP.COMM IS NOT NULL AND EMP.COMM &lt;&gt; 0;
</pre>

<pre>
ENAME		 COMM DNAME	     LOC
---------- ---------- -------------- -------------
ALLEN		  300 SALES	     CHICAGO
WARD		  500 SALES	     CHICAGO
MARTIN		 1400 SALES	     CHICAGO
</pre>

<pre class="prettyprint">
SELECT ENAME,COMM,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND EMP.COMM IS NOT NULL AND EMP.COMM != 0;
</pre>

<pre>
ENAME		 COMM DNAME	     LOC
---------- ---------- -------------- -------------
ALLEN		  300 SALES	     CHICAGO
WARD		  500 SALES	     CHICAGO
MARTIN		 1400 SALES	     CHICAGO
</pre>

<pre class="prettyprint">
SELECT ENAME,COMM,DNAME,LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND EMP.COMM IS NOT NULL AND EMP.COMM NOT IN(0);
</pre>

<pre>
ENAME		 COMM DNAME	     LOC
---------- ---------- -------------- -------------
ALLEN		  300 SALES	     CHICAGO
WARD		  500 SALES	     CHICAGO
MARTIN		 1400 SALES	     CHICAGO
</pre>

<pre class="prettyprint">
SELECT ENAME,COMM,DNAME,LOC
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.COMM IS NOT NULL AND EMP.COMM &lt;&gt; 0;
</pre>

<pre>
ENAME		 COMM DNAME	     LOC
---------- ---------- -------------- -------------
ALLEN		  300 SALES	     CHICAGO
WARD		  500 SALES	     CHICAGO
MARTIN		 1400 SALES	     CHICAGO
</pre>

<h3>Employee name, job, department number, department name of the employees who work at DALLAS</h3>

<pre class="prettyprint">
SELECT E.ENAME,E.JOB,D.DEPTNO,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'DALLAS';
</pre>

<pre>
ENAME	   JOB		 DEPTNO DNAME
---------- --------- ---------- --------------
SMITH	   CLERK	     20 RESEARCH
JONES	   MANAGER	     20 RESEARCH
SCOTT	   ANALYST	     20 RESEARCH
ADAMS	   CLERK	     20 RESEARCH
FORD	   ANALYST	     20 RESEARCH
</pre>

<pre class="prettyprint">
SELECT E.ENAME,E.JOB,D.DEPTNO,D.DNAME
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';
</pre>

<pre>
ENAME	   JOB		 DEPTNO DNAME
---------- --------- ---------- --------------
SMITH	   CLERK	     20 RESEARCH
JONES	   MANAGER	     20 RESEARCH
SCOTT	   ANALYST	     20 RESEARCH
ADAMS	   CLERK	     20 RESEARCH
FORD	   ANALYST	     20 RESEARCH
</pre>

<h3>Employee name and department name of the employee whose name contains A</h3>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME LIKE '%A%';
</pre>

<pre>
ENAME	   DNAME
---------- --------------
ALLEN	   SALES
WARD	   SALES
MARTIN	   SALES
BLAKE	   SALES
CLARK	   ACCOUNTING
ADAMS	   RESEARCH
JAMES	   SALES
</pre>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME LIKE '%A%';
</pre>

<pre>
ENAME	   DNAME
---------- --------------
ALLEN	   SALES
WARD	   SALES
MARTIN	   SALES
BLAKE	   SALES
CLARK	   ACCOUNTING
ADAMS	   RESEARCH
JAMES	   SALES
</pre>

<h3>Employee name, job, salary, salary grade</h3>

<pre class="prettyprint">
SELECT E.ENAME,E.JOB,E.SAL,S.GRADE
FROM EMP E,SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
</pre>

<pre>
ENAME	   JOB		    SAL      GRADE
---------- --------- ---------- ----------
SMITH	   CLERK	    800 	 1
ADAMS	   CLERK	   1100 	 1
JAMES	   CLERK	    950 	 1
WARD	   SALESMAN	   1250 	 2
MARTIN	   SALESMAN	   1250 	 2
MILLER	   CLERK	   1300 	 2
ALLEN	   SALESMAN	   1600 	 3
TURNER	   SALESMAN	   1500 	 3
JONES	   MANAGER	   2975 	 4
BLAKE	   MANAGER	   2850 	 4
CLARK	   MANAGER	   2450 	 4
SCOTT	   ANALYST	   3000 	 4
FORD	   ANALYST	   3000 	 4
KING	   PRESIDENT	   5000 	 5
</pre>

<h3>Employee name and department number of the employee who works with ALLEN</h3>

<pre class="prettyprint">
SELECT C.ENAME,C.DEPTNO
FROM EMP E,EMP C
WHERE E.EMPNO &lt;&gt; C.EMPNO
AND E.DEPTNO = C.DEPTNO
AND E.ENAME = 'ALLEN'
ORDER BY C.ENAME;
</pre>

<pre>
ENAME	       DEPTNO
---------- ----------
BLAKE		   30
JAMES		   30
MARTIN		   30
TURNER		   30
WARD		   30
</pre>

<pre class="prettyprint">
SELECT C.ENAME,C.DEPTNO
FROM EMP E INNER JOIN EMP C ON E.DEPTNO = C.DEPTNO 
WHERE E.EMPNO &lt;&gt; C.EMPNO
AND E.ENAME = 'ALLEN'
ORDER BY C.ENAME;
</pre>

<pre>
ENAME	       DEPTNO
---------- ----------
BLAKE		   30
JAMES		   30
MARTIN		   30
TURNER		   30
WARD		   30
</pre>

<h2>Subqueries</h2>

<p>
A subquery is another SELECT enclosed in parentheses() in a SELECT and passes the result of a subquery to the main query.
</p>

<h3>Name of the department to which JONES belongs</h3>

<pre class="prettyprint">
SELECT DNAME 
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');
</pre>

<pre>
DNAME
--------------
RESEARCH
</pre>

<p>
The query that asks for the department number is a subquery.
This subquery is called a single-row subquery because it obtains only one result.
</p>

<h3>Employee name and department name of employees in a department with department number 10</h3>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DEPTNO = 10;
</pre>

<pre>
ENAME	   DNAME
---------- --------------
CLARK	   ACCOUNTING
KING	   ACCOUNTING
MILLER	   ACCOUNTING
</pre>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
FROM EMP E,
(
	SELECT DEPTNO,DNAME
	FROM DEPT
	WHERE DEPTNO = 10
) D
WHERE E.DEPTNO = D.DEPTNO;
</pre>

<pre>
ENAME	   DNAME
---------- --------------
CLARK	   ACCOUNTING
KING	   ACCOUNTING
MILLER	   ACCOUNTING
</pre>

<h3>Employee number, name, and salary of employees who receive more than average salary</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL &gt; (SELECT AVG(SAL)
	      FROM EMP)
ORDER BY SAL DESC;
</pre>

<pre>
     EMPNO ENAME	     SAL
---------- ---------- ----------
      7839 KING 	    5000
      7902 FORD 	    3000
      7788 SCOTT	    3000
      7566 JONES	    2975
      7698 BLAKE	    2850
      7782 CLARK	    2450
</pre>

<h3>Employee number and employee name of the employee with the highest salary among the employees to which belong department 10</h3>

<pre class="prettyprint">
SELECT EMPNO,ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL) 
	     FROM EMP 
	     WHERE DEPTNO = 10);
</pre>

<pre>
     EMPNO ENAME
---------- ----------
      7839 KING
</pre>

</article>