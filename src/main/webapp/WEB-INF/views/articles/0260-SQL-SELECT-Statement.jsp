<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Select</title>
<meta name="Keywords" content="SQL,select,from,where,group by,union,union all,order by,ed,join,cartesian product,subqueries" />
<meta name="Description" content="다양한 Select 문을 실습합니다" />
<link rel="stylesheet" href="../../static/css/english.css" type="text/css" />
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

<h1>Select</h1>

<p>
SQL도 역시 표준이 존재한다.
여기서는 오라클을 사용하지만 표준 SQL 위주로 실습한다.
SELECT 문장은 순서가 중요하다.
</p>

<pre class="prettyprint">
SELECT 칼럼,칼럼...
FROM 테이블명 
WHERE 조건 
GROUP BY 구문 
UNION/UNION ALL/INTERSECT/MINUS 구문 
ORDER BY 구문
</pre>

<p>
오라클의 경우, SELECT <em>column1,column2,..</em> FROM <em>table_name</em>까지는 작성해야 한다.<br />
</p>

<p>
아래 모든 예제는 SCOTT 계정의 테이블이 대상이다.
SCOTT 계정이 없다면 다음을 참조하여 실습 환경을 만든다.
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

<h3>사원 테이블의 모든 레코드 조회</h3>

<pre class="prettyprint">
SELECT * 
FROM EMP
</pre>

<pre class="prettyprint">
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO 
FROM EMP
</pre>

<p>
위 두 쿼리문은 같은 레코드를 가져온다.
select 다음에  * 사용하면 <em>테이블을 구성하는 순서대로 칼럼 모두</em>를 의미한다.
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

<h3>사원 이름과 입사일 조회</h3>

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

<h3>부서 번호와 사원 이름을 조회</h3>

<pre class="prettyprint">
SELECT DEPTNO,ENAME 
FROM EMP;
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

<p>
칼럼을 선택하여 조회할 수 있고 칼럼의 순서를 바꾸어 조회할 수 있다. 
</p>

<h3>직책(Job) 목록</h3>

<pre class="prettyprint">
SELECT DISTINCT JOB
FROM EMP;
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
DISTINCT는 검색 결과에서 중복된 레코드는 한 번만 보여주어야 할 때 사용한다.
</p>

<h3>총 사원수</h3>

<pre class="prettyprint">
SELECT COUNT(EMPNO)
FROM EMP;
</pre>

<pre>
COUNT(EMPNO)
------------
	  14
</pre>

<p>
COUNT는 그룹함수로 검색된 레코드의 수를 반환한다.
COUNT(칼럼명)은 NULL이 아닌 레코드의 수를, COUNT(*)은 NULL을 포함한 레코드의 수를 반환한다. 
</p>

<h2>WHERE 조건</h2>

<h3>부서 번호가 10인 부서에 근무하는 사원</h3>

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

<h3>급여가 2500이상 되는 사원</h3>

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
WHERE 절이 추가되었다.
이제 WHERE 다음에 나오는 조건에 부합하는 레코드는 배제된다.
위 쿼리문은 WHERE 조건에  =,&gt;,&gt;=,&lt;=,&lt; 비교 연산자를 사용한 예이다.
</p>

<h3>이름이 'KING'인 사원</h3>

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
쿼리문은 대소문자를 가리지 않는다.
하지만 칼럼에 들어가는 데이터는 당연히 대소문자를 가린다. 
KING라고 저장되어 있는데 king로는 검색되지 않는다.
</p>

<dl class="note">
<dt>MySQL은 대소문자를 구별한다.</dt>
<dd>
오라클과 달리, MySQL의 테이블과 칼럼 이름은 대소문자를 구별한다.
</dd>
</dl>

<h3>사원 이름이 'S'로 시작하는 사원의 사원 번호와 이름</h3>   

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

<h3>사원 이름에 T가 포함된 사원의 사원 번호와 이름</h3>

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
LIKE는  % 와 _문자와 함께 검색할 때 사용된다.
</p>

<dl class="note">
<dt>SQL*PLUS 사용법</dt>
<dd>
명령 버퍼에 있는 SQL문을 편집하는 방법을 소개한다.
SQL문을 잘못 입력했을 때 유용하다.
<strong style="display: block;">ed</strong>
SQL*PLUS 에서 ed 명령어를 실행하면 버퍼에 있는 내용을 시스템의 디폴트 편집기가 실행되면서 보여준다.
윈도우의 경우 메모장이 실행되면서 버퍼에 저장된 SQL문를 보여주게 된다.
메모장에 있는 내용을 수정하고 닫은 다음에 / 명령으로 버퍼의 SQL문을 실행할 수 있다.
<strong style="display: block;">/</strong>
</dd>
</dl>

<h3>커미션이 300, 500, 1400인 사원의 사원 번호, 이름, 커미션</h3>

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
둘 다 같은 결과를 보여준다.
첫번째 쿼리문은 논리 연산자 OR를 사용했고 두번째는 IN을 사용했다.
</p>

<h3>급여가 1200에서 3500 사이인 사원의 사원 번호, 이름, 급여</h3>

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
위 쿼리는 BETWEEN ~ AND ~ 사용법을 보여준다.
<em>SAL BETWEEN 1200 AND 3500</em>은 수학적으로 1200 &lt;= SAL &lt;= 3500이다.
</p>

<h3>직급이 매니저이고 부서 번호가 30번인 부서에 근무하는 사원의 이름, 사원 번호, 직급, 부서 번호</h3>

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

<h3>부서 번호가 30인 부서에 근무하지 않는 사원의 사원 번호, 이름, 부서 번호</h3>

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

<h3>커미션이 300, 500, 1400이 모두 아닌 사원의 사원 번호, 이름, 커미션</h3>

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

<h3>이름에 'S'가 포함되지 않는 사원의 사원 번호, 이름</h3>

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

<h3>급여가 1200 미만이거나 3700을 초과하는 사원의 사원 번호, 이름, 급여</h3>

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

<h3>매니저가 NULL인 사원의 이름과 직급</h3>

<p>
칼럼이 NULL인지 판단하기 위해선, IS NULL, IS NOT NULL 문장을 사용한다. 
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

<h2>GROUP BY 구문</h2>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP;
</pre>

<pre>
SELECT DEPTNO,AVG(SAL)
       *
ERROR at line 1:
ORA-00937: not a single-group group function
</pre>

<p>
부서별 평균 급여가 위 쿼리문의 의도다.
이때 그룹화의 기준이 되는 칼럼은 DEPTNO다.
그룹함수와 그룹화의 기준이 되는 칼럼이 함께 쓰일 때는 이 칼럼을 GROUP BY로 명시해 주어야 에러를 피할 수 있다.
</p>

<h3>부서별 평균 급여</h3>

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

<h3>부서별 총 사원 수와 커미션을 받는 사원들의 총수</h3>

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

<h3>부서별 최대 급여와 최소 급여</h3>

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
HAVING은 GROUP BY 절에서 생성된 결과 값 중 원하는 조건에 부합하는 자료만 추출하기 위해 사용한다.
</p>

<h3>부서별로 평균 급여 (단, 평균 급여가 2000 미만인 부서는 제외)</h3>

<pre class="prettyprint">
SELECT DEPTNO,AVG(SAL)
FROM EMP
WHERE AVG(SAL) &gt;= 2000;
GROUP BY DEPTNO;
</pre>

<pre>
GROUP BY DEPTNO;  2    3  WHERE AVG(SAL) >= 2000
      *
ERROR at line 3:
ORA-00934: group function is not allowed here
</pre>

<p>
GROUP BY 구문을 사용하면서 이 결과에 조건을 줄 때 WHERE 조건문을 사용할 수 없다.
따라서 위 쿼리는 에러를 발생한다.
GROUP BY 구문을 사용하면서 조건을 주기 위해서는 대신 HAVING 구문을 사용한다.
HAVING 구문에서는 그룹화의 기준이 되는 칼럼과 그룹함수만이 사용 할 수 있다는 점에 주의한다.
위 쿼리문에서 그룹화의 기준이 되는 칼럼이 DEPTNO이므로, DEPTNO는 HAVING 구문에 사용할 수 있다.
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

<h3>급여가 1000 이상인 사원을 대상으로 부서별 평균 급여(단, 평균 급여가 2000 이만인 부서는 제외)</h3>

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
WHERE 절은 테이블에서 데이터를 가져올 때 그 테이블에서 특정 조건에 부합하는 레코드만을 가져올 때 사용하고,
HAVING 절은 GROUP BY 구문을 사용하여 구한 레코드 중에서 원하는 조건에 맞는 레코드만을 가져올 때 사용한다.
</p>

<h2>ORDER BY 구문</h2>

<p>
SELECT 문장을 사용하여 레코드를 검색할 때 임의의 칼럼을 기준으로 정렬을 해야 할 필요가 발생한다.
이런 경우 사용하는 구문이 ORDER BY 이다.
사용형식은 아래와 같다.
<strong style="display: block;">ORDER BY 정렬의 기준이 되는 칼럼 ASC 또는 DESC;</strong>
여기서 ASC는 오름차순을 의미한다. ASC는 생략할 수 있다.
DESC는 내림차순을 의미한다.
</p>

<h3>사원 번호, 이름, 급여를 급여가 높은 순으로 정렬(단, 급여가 같을 경우 이름 철자가 빠른 사원이 먼저 나오도록 한다)</h3>

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

<h2>조인</h2>

<p>
조인은 2개 이상의 테이블에서 데이터를 조회할 때 사용한다.
조인조건은 테이블 N개를 조인할 때 N-1 개의 조인 조건이 필요하다.
사용형식은 다음과 같다.
<strong style="display: block">SELECT 테이블1.칼럼,테이블2.칼럼,....FROM 테이블1,테이블2,...</strong>
</p>

<h3>카테시안 곱</h3>

<pre class="prettyprint">
SELECT EMP.ENAME,DEPT.DNAME
FROM EMP,DEPT;
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
조인의 조건이 없는 단순 조인이다. 
앞으로 나오는 조인 예제는 이러한 단순 조인 결과를 머릿속에 그리면서 실습해야 한다.
총 56개의 행은 EMP 테이블에 존재하는 14개의 레코드와 DEPT 테이블에 존재하는 4개의 레코드의 곱으로 생성된다.
조회 대상이 되는 각 테이블의 칼럼이 명백히 어느 테이블의 칼럼인지가 확실하다면 EMP.ENAME을 ENAME처럼 테이블 이름을 생략할 수 있다.
</p>

<h3>사원 이름과 부서 이름</h3>

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
테이블에 별칭을 사용할 수 있다.
이로써 복잡한 조인문이 간단해 질 수 있다.
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

<h3>사원 이름과 사원의 관리자 이름</h3>

<p>
같은 테이블을 조인할 수 있다. 
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

<h3>이름, 급여, 급여 등급</h3>

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

<p>
WHERE 조건에 조인조건을 = 이외의 비교 연산자를 사용한 조인문이다.
이 SQL문을 BETWEEN ~ AND 문으로 변경하면 아래와 같다.
</p>

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

<h3>이름, 부서 이름, 급여 등급</h3>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME,S.GRADE
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

<h3>사원 이름과 사원의 관리자 이름</h3>

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
결과에 회장(PRESIDENT)에 대한 레코드가 배제됐다.
회장은 매니저가 없으므로 MGR 칼럼이 NULL이고 사원 번호가 NULL인 사원은 없기 때문에 조인조건에 만족하지 않는다.
그럼에도 불구하고 결과에 회장 레코드를 보여야 한다면 아래처럼 질의해야 한다.
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
위와 같은 조인을 외부<sup>OUTER</sup>조인이라 한다.
A LEFT JOIN B는 조인 조건에 만족하지 못하더라도 왼쪽 테이블 A의 행을 나타내고 싶을 때 사용한다.
</p>

<h3>이름, 부서 이름(단, 사원 테이블에 부서 번호가 40에 속한 사원이 없지만 부서 번호 40인 부서 이름도 출력되도록 한다)</h3>

<pre class="prettyprint">
SELECT E.ENAME,D.DNAME
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

<h3>이름, 부서 번호, 부서 이름</h3>

<pre class="prettyprint">
SELECT ENAME,E.DEPTNO,DNAME
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
SELECT ENAME,E.DEPTNO,DNAME
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
위 두 쿼리는 결과는 같다. 
</p>

<h3>부서 번호가 30인 부서에 근무하는 사원의 이름, 직급, 부서 번호, 부서 위치</h3>

<pre class="prettyprint">
SELECT ENAME,JOB,E.DEPTNO,LOC
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

<h3>커미션을 받는 사원의 이름, 커미션, 부서 이름, 부서 위치</h3>

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

<h3>DALLAS에 근무하는 사원의 이름, 직급, 부서 번호, 부서 이름</h3>

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

<h3>이름에 'A'가 들어가는 사원의 이름, 부서 이름</h3>

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

<h3>이름, 직급, 급여, 급여 등급</h3>

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

<h3>ALLEN과 같은 부서에 근무하는 사원의 이름, 부서 번호</h3>

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

<h2>서브쿼리</h2>

<p>
서브 쿼리는 SELECT 문 안에서 ()로 둘러싸인 SELECT 문을 말하며 쿼리문의 결과를 메인 쿼리로 전달하기 위해 사용된다.
</p>

<h3>이름이 'JONES'인 사원이 일하는 부서 이름</h3>

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
부서 번호를 알아내기 위한 쿼리가 서브 쿼리로 사용되고, 이 서브쿼리는 단 하나의 결과값을 얻기 때문에 단일 행 서브 쿼리라 한다.
</p>

<h3>부서 번호가 10인 부서에서 근무하는 사원의 이름과 부서 이름</h3>

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

<h3>평균 급여보다 더 많은 급여를 받은 사원의 사원 번호, 이름, 급여</h3>

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

<h3>부서 번호가 10인 부서에 근무하는 사원 중에서 최대 급여를 받는 사원과 동일한 급여를 받는 사원의 사원 번호와 이름</h3>

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

</body>
</html>