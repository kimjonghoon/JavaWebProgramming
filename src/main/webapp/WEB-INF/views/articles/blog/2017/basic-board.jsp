<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2017.8.31</div>
	
<h1>기본 게시판</h1>

<p>
예제 소스 : <a href="https://github.com/kimjonghoon/basic-board">https://github.com/kimjonghoon/basic-board</a><br />
(예제는 게시판 기본 기능을 다룬다. <a href="${ctx}/jsp/BBS-Study">게시판 프로그램 이해하기</a> 참조) 
</p>

<p>
SCOTT 계정에 다음 테이블과 시퀀스, 테스트 레코드를 생성한다.
('게시판 프로그램 이해하기'에서의 테이블과 시퀀스 이름이 다르다.) 
</p>

<pre class="prettyprint">
create table article (
    articleno number,
    title varchar2(200) NOT NULL,
    content varchar2(4000),
    regdate date,
    constraint PK_ARTICLE PRIMARY KEY(articleno)
);

create sequence seq_article
increment by 1
start with 1;

insert into article values (seq_article.nextval, '000001','',sysdate);
insert into article values (seq_article.nextval, '000002','',sysdate);
insert into article values (seq_article.nextval, '000003','',sysdate);
insert into article values (seq_article.nextval, '000004','',sysdate);
insert into article values (seq_article.nextval, '000005','',sysdate);
insert into article values (seq_article.nextval, '000006','',sysdate);
insert into article values (seq_article.nextval, '000007','',sysdate);
insert into article values (seq_article.nextval, '000008','',sysdate);
insert into article values (seq_article.nextval, '000009','',sysdate);
insert into article values (seq_article.nextval, '000010','',sysdate);
insert into article values (seq_article.nextval, '000011','',sysdate);
insert into article values (seq_article.nextval, '000012','',sysdate);
insert into article values (seq_article.nextval, '000013','',sysdate);
insert into article values (seq_article.nextval, '000014','',sysdate);
insert into article values (seq_article.nextval, '000015','',sysdate);
insert into article values (seq_article.nextval, '000016','',sysdate);
insert into article values (seq_article.nextval, '000017','',sysdate);
insert into article values (seq_article.nextval, '000018','',sysdate);
insert into article values (seq_article.nextval, '000019','',sysdate);
insert into article values (seq_article.nextval, '000020','',sysdate);
insert into article values (seq_article.nextval, '000021','',sysdate);
insert into article values (seq_article.nextval, '000022','',sysdate);
insert into article values (seq_article.nextval, '000023','',sysdate);
insert into article values (seq_article.nextval, '000024','',sysdate);
insert into article values (seq_article.nextval, '000025','',sysdate);
insert into article values (seq_article.nextval, '000026','',sysdate);
insert into article values (seq_article.nextval, '000027','',sysdate);
insert into article values (seq_article.nextval, '000028','',sysdate);
insert into article values (seq_article.nextval, '000029','',sysdate);
insert into article values (seq_article.nextval, '000030','',sysdate);
insert into article values (seq_article.nextval, '000031','',sysdate);
insert into article values (seq_article.nextval, '000032','',sysdate);
insert into article values (seq_article.nextval, '000033','',sysdate);
insert into article values (seq_article.nextval, '000034','',sysdate);
insert into article values (seq_article.nextval, '000035','',sysdate);
insert into article values (seq_article.nextval, '000036','',sysdate);
insert into article values (seq_article.nextval, '000037','',sysdate);
insert into article values (seq_article.nextval, '000038','',sysdate);
insert into article values (seq_article.nextval, '000039','',sysdate);
insert into article values (seq_article.nextval, '000040','',sysdate);
insert into article values (seq_article.nextval, '000041','',sysdate);
insert into article values (seq_article.nextval, '000042','',sysdate);
insert into article values (seq_article.nextval, '000043','',sysdate);
insert into article values (seq_article.nextval, '000044','',sysdate);
insert into article values (seq_article.nextval, '000045','',sysdate);
insert into article values (seq_article.nextval, '000046','',sysdate);
insert into article values (seq_article.nextval, '000047','',sysdate);
insert into article values (seq_article.nextval, '000048','',sysdate);
insert into article values (seq_article.nextval, '000049','',sysdate);
insert into article values (seq_article.nextval, '000050','',sysdate);
insert into article values (seq_article.nextval, '000051','',sysdate);
insert into article values (seq_article.nextval, '000052','',sysdate);
insert into article values (seq_article.nextval, '000053','',sysdate);
insert into article values (seq_article.nextval, '000054','',sysdate);
insert into article values (seq_article.nextval, '000055','',sysdate);
insert into article values (seq_article.nextval, '000056','',sysdate);
insert into article values (seq_article.nextval, '000057','',sysdate);
insert into article values (seq_article.nextval, '000058','',sysdate);
insert into article values (seq_article.nextval, '000059','',sysdate);
insert into article values (seq_article.nextval, '000060','',sysdate);
insert into article values (seq_article.nextval, '000061','',sysdate);
insert into article values (seq_article.nextval, '000062','',sysdate);
insert into article values (seq_article.nextval, '000063','',sysdate);
insert into article values (seq_article.nextval, '000064','',sysdate);
insert into article values (seq_article.nextval, '000065','',sysdate);
insert into article values (seq_article.nextval, '000066','',sysdate);
insert into article values (seq_article.nextval, '000067','',sysdate);
insert into article values (seq_article.nextval, '000068','',sysdate);
insert into article values (seq_article.nextval, '000069','',sysdate);
insert into article values (seq_article.nextval, '000070','',sysdate);
insert into article values (seq_article.nextval, '000071','',sysdate);
insert into article values (seq_article.nextval, '000072','',sysdate);
insert into article values (seq_article.nextval, '000073','',sysdate);
insert into article values (seq_article.nextval, '000074','',sysdate);
insert into article values (seq_article.nextval, '000075','',sysdate);
insert into article values (seq_article.nextval, '000076','',sysdate);
insert into article values (seq_article.nextval, '000077','',sysdate);
insert into article values (seq_article.nextval, '000078','',sysdate);
insert into article values (seq_article.nextval, '000079','',sysdate);
insert into article values (seq_article.nextval, '000080','',sysdate);
insert into article values (seq_article.nextval, '000081','',sysdate);
insert into article values (seq_article.nextval, '000082','',sysdate);
insert into article values (seq_article.nextval, '000083','',sysdate);
insert into article values (seq_article.nextval, '000084','',sysdate);
insert into article values (seq_article.nextval, '000085','',sysdate);
insert into article values (seq_article.nextval, '000086','',sysdate);
insert into article values (seq_article.nextval, '000087','',sysdate);
insert into article values (seq_article.nextval, '000088','',sysdate);
insert into article values (seq_article.nextval, '000089','',sysdate);
insert into article values (seq_article.nextval, '000090','',sysdate);
insert into article values (seq_article.nextval, '000091','',sysdate);
insert into article values (seq_article.nextval, '000092','',sysdate);
insert into article values (seq_article.nextval, '000093','',sysdate);
insert into article values (seq_article.nextval, '000094','',sysdate);
insert into article values (seq_article.nextval, '000095','',sysdate);
insert into article values (seq_article.nextval, '000096','',sysdate);
insert into article values (seq_article.nextval, '000097','',sysdate);
insert into article values (seq_article.nextval, '000098','',sysdate);
insert into article values (seq_article.nextval, '000099','',sysdate);
insert into article values (seq_article.nextval, '000100','',sysdate);
commit;
</pre>

<p>
<a href="${ctx}/spring/di#Oralce-JDBC-Driver-Dependency">오라클 JDBC 드라이버를 로컬 저장소에 설치하기</a>를 참조하여 오라클 JDBC 드라이버를 로컬 저장소에 등록시킨다.
</p>


<h3>테스트</h3>

<p>
압축을 풀고 루트 디렉터리로 이동하여 mvn jetty:run 을 실행한 후, http://localhost:8080을 방문한다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="${ctx}/jsp/BBS-Study">게시판 프로그램 이해하기</a></li>
	<li><a href="${ctx}/spring/di#Oralce-JDBC-Driver-Dependency">오라클 JDBC 드라이버를 로컬 저장소에 설치하기</a></li>
</ul>

</article>
