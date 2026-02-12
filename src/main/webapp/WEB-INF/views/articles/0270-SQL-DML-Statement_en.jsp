<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Insert Update Delete</title>
<meta name="Keywords" content="SQL,insert,update,delete" />
<meta name="Description" content="This article describes SQL Insert, Update, Delete Statements" />
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
	
<h1>Insert Update Delete</h1>

<h2>Insert</h2>

<h3>Usage:</h3>

<pre th:inline="none">
INSERT INTO tablename [(COLUM1,COLUM2, ...)] VALUES (VALUE1,VALUE2, ...);
</pre>

<p>
After accessing the Scott account with SQL * PLUS, run the following:
</p>

<pre class="prettyprint">
INSERT INTO EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) 
VALUES (1562,'Alison','SALESMAN',7698,SYSDATE,2000,1000,30);
</pre>

<p>
If you supply all the values according to the column order, you can omit the column list in parentheses after the table name.
You can omit Single quotes for column value of type NUMBER.
SYSDATE stores the current date data in Oracle.
</p>

<pre class="prettyprint">
INSERT INTO EMP 
VALUES (1500,'Bill','SALESMAN',7698,SYSDATE,1800,1200,30);
</pre>

<p>
The employee number is the primary key.
Therefore, anohter employee with the same employee number can not exist in the table.
</p>

<pre class="prettyprint">
INSERT INTO EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
VALUES (1697,'Carol','MANAGER',7839,SYSDATE,3000,30);
</pre>

<p>
There is no COMM from column list and no value for the COMM column from the value list, that inserts NULL into the COMM column.
</p>

<h2>Update</h2>

<h3>Usage:</h3>

<pre>
UPDATE tableName 
SET column1='value1', column2='value2', ...
[WHERE Conditions]
</pre>

<p>
SET: Used to change the value of a specific column with the UPDATE statement.<br />
The value can be a number or character, or combination of an operable column and an operator.<br />
[WHERE Conditions]: Used to change the value of a column that meets the condition.<br />
If you omit the WHERE condition in the UPDATE statement, all records in the table are changed.
</p>

<h3>Change Bill's salary to 2800</h3>

<pre class="prettyprint">
UPDATE EMP 
SET SAL=2800
WHERE ENAME='Bill';
</pre>

<h3>Increase Alison's salary by 300 and change COMM to 500</h3>

<pre class="prettyprint">
UPDATE EMP 
SET SAL=SAL + 300,COMM=500
WHERE ENAME='Alison';
</pre>

<p>
After executing INSERT and UPDATE, run COMMIT to manage data permanently.
</p>

<pre class="prettyprint">
COMMIT;
</pre>

<h2>Delete</h2>

<h3>Usage:</h3>

<pre>
DELETE FROM tableName 
[WHERE conditions]
</pre>

<p>
If you omit the WHERE conditions in the DELETE statement, that will delete all records.
</p>

<h3>Delete Alison, Bill, and Carol from the Employee table</h3>

<pre class="prettyprint">
DELETE FROM EMP 
WHERE ENAME IN ('Alison','Bill','Carol');
</pre>

</article>

</body>
</html>
