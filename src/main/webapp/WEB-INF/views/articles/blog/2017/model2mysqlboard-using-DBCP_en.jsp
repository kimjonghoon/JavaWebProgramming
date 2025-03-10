<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.12.1</div>
	
<h1>MySQL Model 2 Board program using DBCP</h1>

<p>
Source: <a href="https://github.com/kimjonghoon/model2mysqlboard-using-DBCP">https://github.com/kimjonghoon/model2mysqlboard-using-DBCP</a><br />
For more information about DBCP, See <a href="${ctx}/jdbc/Connection-Pool#DBCP">DBCP</a>.
</p>

<p>
Create the following table and sequence in the SCOTT account and insert test records.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql

create user 'java'@'%' identified by 'school';
grant all privileges on *.* to 'java'@'%';

create database javaskool;
exit;

mysql --user=java --password javaskool

create table thread_article (
  articleno int NOT NULL AUTO_INCREMENT,
  title varchar(200) NOT NULL,
  content text,
  regdate datetime,
  family int,
  parent int,
  depth tinyint,
  indent tinyint,
  constraint PK_ARTICLE PRIMARY KEY(articleno)
);

insert into thread_article (title,content,regdate) values ('000001','',now());
insert into thread_article (title,content,regdate) values ('000002','',now());
insert into thread_article (title,content,regdate) values ('000003','',now());
insert into thread_article (title,content,regdate) values ('000004','',now());
insert into thread_article (title,content,regdate) values ('000005','',now());
insert into thread_article (title,content,regdate) values ('000006','',now());
insert into thread_article (title,content,regdate) values ('000007','',now());
insert into thread_article (title,content,regdate) values ('000008','',now());
insert into thread_article (title,content,regdate) values ('000009','',now());
insert into thread_article (title,content,regdate) values ('000010','',now());
insert into thread_article (title,content,regdate) values ('000011','',now());
insert into thread_article (title,content,regdate) values ('000012','',now());
insert into thread_article (title,content,regdate) values ('000013','',now());
insert into thread_article (title,content,regdate) values ('000014','',now());
insert into thread_article (title,content,regdate) values ('000015','',now());
insert into thread_article (title,content,regdate) values ('000016','',now());
insert into thread_article (title,content,regdate) values ('000017','',now());
insert into thread_article (title,content,regdate) values ('000018','',now());
insert into thread_article (title,content,regdate) values ('000019','',now());
insert into thread_article (title,content,regdate) values ('000020','',now());
insert into thread_article (title,content,regdate) values ('000021','',now());
insert into thread_article (title,content,regdate) values ('000022','',now());
insert into thread_article (title,content,regdate) values ('000023','',now());
insert into thread_article (title,content,regdate) values ('000024','',now());
insert into thread_article (title,content,regdate) values ('000025','',now());
insert into thread_article (title,content,regdate) values ('000026','',now());
insert into thread_article (title,content,regdate) values ('000027','',now());
insert into thread_article (title,content,regdate) values ('000028','',now());
insert into thread_article (title,content,regdate) values ('000029','',now());
insert into thread_article (title,content,regdate) values ('000030','',now());
insert into thread_article (title,content,regdate) values ('000031','',now());
insert into thread_article (title,content,regdate) values ('000032','',now());
insert into thread_article (title,content,regdate) values ('000033','',now());
insert into thread_article (title,content,regdate) values ('000034','',now());
insert into thread_article (title,content,regdate) values ('000035','',now());
insert into thread_article (title,content,regdate) values ('000036','',now());
insert into thread_article (title,content,regdate) values ('000037','',now());
insert into thread_article (title,content,regdate) values ('000038','',now());
insert into thread_article (title,content,regdate) values ('000039','',now());
insert into thread_article (title,content,regdate) values ('000040','',now());
insert into thread_article (title,content,regdate) values ('000041','',now());
insert into thread_article (title,content,regdate) values ('000042','',now());
insert into thread_article (title,content,regdate) values ('000043','',now());
insert into thread_article (title,content,regdate) values ('000044','',now());
insert into thread_article (title,content,regdate) values ('000045','',now());
insert into thread_article (title,content,regdate) values ('000046','',now());
insert into thread_article (title,content,regdate) values ('000047','',now());
insert into thread_article (title,content,regdate) values ('000048','',now());
insert into thread_article (title,content,regdate) values ('000049','',now());
insert into thread_article (title,content,regdate) values ('000050','',now());
insert into thread_article (title,content,regdate) values ('000051','',now());
insert into thread_article (title,content,regdate) values ('000052','',now());
insert into thread_article (title,content,regdate) values ('000053','',now());
insert into thread_article (title,content,regdate) values ('000054','',now());
insert into thread_article (title,content,regdate) values ('000055','',now());
insert into thread_article (title,content,regdate) values ('000056','',now());
insert into thread_article (title,content,regdate) values ('000057','',now());
insert into thread_article (title,content,regdate) values ('000058','',now());
insert into thread_article (title,content,regdate) values ('000059','',now());
insert into thread_article (title,content,regdate) values ('000060','',now());
insert into thread_article (title,content,regdate) values ('000061','',now());
insert into thread_article (title,content,regdate) values ('000062','',now());
insert into thread_article (title,content,regdate) values ('000063','',now());
insert into thread_article (title,content,regdate) values ('000064','',now());
insert into thread_article (title,content,regdate) values ('000065','',now());
insert into thread_article (title,content,regdate) values ('000066','',now());
insert into thread_article (title,content,regdate) values ('000067','',now());
insert into thread_article (title,content,regdate) values ('000068','',now());
insert into thread_article (title,content,regdate) values ('000069','',now());
insert into thread_article (title,content,regdate) values ('000070','',now());
insert into thread_article (title,content,regdate) values ('000071','',now());
insert into thread_article (title,content,regdate) values ('000072','',now());
insert into thread_article (title,content,regdate) values ('000073','',now());
insert into thread_article (title,content,regdate) values ('000074','',now());
insert into thread_article (title,content,regdate) values ('000075','',now());
insert into thread_article (title,content,regdate) values ('000076','',now());
insert into thread_article (title,content,regdate) values ('000077','',now());
insert into thread_article (title,content,regdate) values ('000078','',now());
insert into thread_article (title,content,regdate) values ('000079','',now());
insert into thread_article (title,content,regdate) values ('000080','',now());
insert into thread_article (title,content,regdate) values ('000081','',now());
insert into thread_article (title,content,regdate) values ('000082','',now());
insert into thread_article (title,content,regdate) values ('000083','',now());
insert into thread_article (title,content,regdate) values ('000084','',now());
insert into thread_article (title,content,regdate) values ('000085','',now());
insert into thread_article (title,content,regdate) values ('000086','',now());
insert into thread_article (title,content,regdate) values ('000087','',now());
insert into thread_article (title,content,regdate) values ('000088','',now());
insert into thread_article (title,content,regdate) values ('000089','',now());
insert into thread_article (title,content,regdate) values ('000090','',now());
insert into thread_article (title,content,regdate) values ('000091','',now());
insert into thread_article (title,content,regdate) values ('000092','',now());
insert into thread_article (title,content,regdate) values ('000093','',now());
insert into thread_article (title,content,regdate) values ('000094','',now());
insert into thread_article (title,content,regdate) values ('000095','',now());
insert into thread_article (title,content,regdate) values ('000096','',now());
insert into thread_article (title,content,regdate) values ('000097','',now());
insert into thread_article (title,content,regdate) values ('000098','',now());
insert into thread_article (title,content,regdate) values ('000099','',now());
insert into thread_article (title,content,regdate) values ('000100','',now());
insert into thread_article (title,content,regdate) values ('000101','',now());

update thread_article set family = articleno, parent = 0, depth = 0, indent = 0;

commit;
</pre>

<p>
For more information about family, parent, depth, indent column, See <a href="${ctx}/jsp/Thread-BBS">Bulletin Boards with replies</a>
</p>


<h3>Test</h3>

<p>
Go to the root directory and run <strong>mvn jetty:run</strong> and visit http://localhost:8080.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="${ctx}/jsp/Thread-BBS">Bulletin Boards with replies</a></li>
  <li><a href="${ctx}/java/Logging#logback">Logback</a>
  <li><a href="${ctx}/jdbc/Connection-Pool#DBCP">DBCP</a>
  <li><a href="${ctx}/jsp/Model2">Model 2</a></li>
</ul>

</article>
