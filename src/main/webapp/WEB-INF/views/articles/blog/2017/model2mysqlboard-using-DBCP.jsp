<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2017.9.5</div>
	
<h1>DBCP를 사용하는 MySQL 모델 2 게시판</h1>

<p>
예제 소스 : <a href="https://github.com/kimjonghoon/model2mysqlboard-using-DBCP">https://github.com/kimjonghoon/model2mysqlboard-using-DBCP</a>
</p>

<p>
실습할 예제는 사용자 정의 커넥션 풀 대신 아파치의 DBCP를 사용하는, MySQL용 답변형 게시판이다.
DBCP에 대한 자세한 설명은 <a href="${ctx}/jdbc/Connection-Pool#DBCP">DBCP</a>를 참조한다.
</p>

<p>
예제에서 사용하는 테이블과 테스트 데이터는 아래를 참조하여 생성한다.
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
family,parent,depth,indent 컬럼에 대한 자세한 설명은 <a href="${ctx}/jsp/Thread-BBS">계층형 게시판</a>을 참조한다.
</p>


<h3>테스트</h3>

<p>
루트 디렉터리로 이동하여 mvn jetty:run 을 실행한 후, http://localhost:8080을 방문한다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="${ctx}/jsp/Thread-BBS">계층형 게시판</a></li>
	<li><a href="${ctx}/java/Logging#logback">Logback</a>
	<li><a href="${ctx}/jdbc/Connection-Pool#DBCP">DBCP</a>
	<li><a href="${ctx}/jsp/Model2">모델 2</a></li>
</ul>

</article>
