<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2020.4.11</div>

<h1>JavaBank 예제 모듈화</h1>

<p>
이 글은 <a href="/jdbc/JavaBank">자바 은행</a> 예제를 모듈화하는 과정을 다룬다.<br />
자바 은행 소스에 내려받는다.
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/JavaBank
</pre>

<p>
<a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">오라클 JDBC 드라이버</a>와 
<a href="http://www.slf4j.org/download.html">SLF4J</a>의 Maven central 링크를 클릭해서 내려받은 최신 버전의 slf4j-api 와 slf4j-simple 을 lib/ 폴더에 복사한다.
</p>

<pre lang="en">
src/
├── net
│   └── java_school
│       └── bank
│            ├── Account.java
│            ├── Bank.java
│            ├── BankDao.java
│            ├── BankUi.java
│            ├── MyBank.java
│            ├── MyBankDao.java
│            └── Transaction.java
├── simplelogger.properties
lib/
├── ojdbc6.jar
├── slf4j-api-1.7.30.jar
└── slf4j-simple-1.7.30.jar
</pre>

<p>
SCOTT 계정에서 은행 계좌 테이블과 거래명세 테이블, 그리고 입금과 출금 시 거래명세 테이블에 입출금 정보를 인서트하는 트리거를 생성한다.
</p>

<pre class="prettyprint">
create table bankaccount (
	accountno varchar2(50),
	owner varchar2(20) not null,
	balance number,
	kind varchar2(10),
	constraint PK_BANKACCOUNT primary key(accountno),
	constraint CK_BANKACCOUNT_NORMAL 
		CHECK (balance &gt;= CASE WHEN kind='NORMAL' THEN 0 END),
	constraint CK_BANKACCOUNT_KIND CHECK (kind in ('NORMAL', 'MINUS'))
);  

create table transaction (
    transactiondate timestamp,
    kind varchar2(10),
    amount number,
    balance number,
    accountno varchar2(50),
    constraint FK_TRANSACTION FOREIGN KEY(accountno)
    	REFERENCES bankaccount(accountno)
);

create or replace trigger bank_trigger
after insert or update of balance on bankaccount
for each row
begin
	if :new.balance &gt; :old.balance then
		insert into transaction 
		values 
		(
			systimestamp,
			'DEPOSIT',
			:new.balance - :old.balance,
			:new.balance,
			:old.accountno
		);
	end if;
	if :new.balance &lt; :old.balance then
		insert into transaction 
		values 
		(
			systimestamp,
			'WITHDRAW',
			:old.balance - :new.balance,
			:new.balance,
			:old.accountno
		);
	end if;
end;
/
</pre>

<p>
모듈화하기 전 프로그램이 동작하는지 확인한다.
</p>

<h4>윈도에서 테스트</h4>

<p>
컴파일
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mkdir out
set classpath=lib\slf4j-api-1.7.30.jar
javac -d out src\net\java_school\bank\*.java
</pre>

<p>
프로퍼티 파일 복사
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\simplelogger.properties out\
</pre>

<p>
실행
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=lib\slf4j-api-1.7.30.jar;lib\slf4j-simple-1.7.30.jar;lib\ojdbc6.jar;out
java net.java_school.bank.BankUi
</pre>

<h4>리눅스에서 테스트</h4>

<p>
컴파일
</p>

<pre class="shell-prompt">
CP=lib/slf4j-api-1.7.30.jar
javac -cp $CP -d out -sourcepath src $(find src -name "*.java")
</pre>

<p>
프로퍼티 파일 복사
</p>

<pre class="shell-prompt">
cp src/simplelogger.properties out/
</pre>

<p>
실행
</p>

<pre class="shell-prompt">
CP+=:lib/slf4j-simple-1.7.30.jar
CP+=:lib/ojdbc6.jar
java -cp $CP:out net.java_school.bank.BankUi
</pre>

<p>
모듈화를 진행하기 전에 다음을 실행하여 자바 은행이 의존하는 외부 라이브러리를 확인한다.
</p>

<pre class="shell-prompt">
jdeps -summary -cp lib/*.jar out
</pre>

<pre class="shell-prompt">
..
<b>out -> lib/slf4j-api-1.7.30.jar</b>
..
</pre>

<p>
자바 은행이 slf4j-api-1.7.30.jar를 의존함을 확인했다.<br />
이와 같은 라이브러리는 모듈 패스에 추가한다.
</p>

<h3>모듈화</h3>

<p>
자바 은행에 사용할, 모듈화된 사용자 정의 커넥션 풀을 내려받는다.
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/java-module-test
</pre>

<p>
java-module-test의 src/ 폴더에 자바 은행을 다음과 같이 배치한다.<br />
--main.app 모듈과 net.java_school.db.dbpool.mysql 모듈은 제거한다--
</p>

<pre lang="en">
src/
├── net.java_school.javabank
│   ├── net
│   │   └── java_school
│   │       └── bank
│   │            ├── Account.java
│   │            ├── Bank.java
│   │            ├── BankDao.java
│   │            ├── BankUi.java
│   │            ├── MyBank.java
│   │            ├── MyBankDao.java
│   │            └── Transaction.java
│   ├── module-info.java
│   └── simplelogger.properties
├── net.java_school.db.dbpool.api
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               └── api
│   │                   └── ConnectionManageable.java
│   └── module-info.java
├── net.java_school.db.dbpool
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               ├── DBConnectionPool.java
│   │               ├── DBConnectionPoolManager.java
│   │               └── ConnectionManager.java
│   └── module-info.java
├── net.java_school.db.dbpool.oracle
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               └── oracle
│   │                   └── OracleConnectionManager.java
│   ├── module-info.java
│   └── oracle.properties
lib/
├── slf4j-simple-1.7.30.jar
jars/
├── ojdbc6.jar
└── slf4j-api-1.7.30.jar
</pre>

<p>
jar 파일을 lib/ 와 jars/ 로 분리해서 배치했는지 설명이 필요하다.<br />
jars/는 모듈 패스에 추가할 것이다.<br />
모듈 패스에 있는, 모듈이 아닌 jar는 자동 모듈이 된다.<br />
lib/는 클래스 패스로 사용할 것이다.<br />
클래스 패스에 있는, 모듈이 아닌 jar는 이름 없는 모듈이 된다.<br />
자동 모듈만이 이름 없는 모듈을 읽을 수 있다.<br />
slf4j-api 가 slf4j-simple 을 읽으리라는 건 이름에서 쉽게 유추할 수 있다.<br />
자동 모듈 slf4j-api 가 이름 없는 모듈 slf4j-simple 을 읽도록 배치한 것이다.
</p>

<p>
자바 은행 모듈의 디스크립터를 생성한다.
</p>

<pre class="prettyprint">
module net.java_school.javabank {
  requires net.java_school.db.dbpool.api;
  
  uses net.java_school.db.dbpool.api.ConnectionManageable;
}
</pre>

<p>
자동 모듈의 이름이 어떻게 결정되는지 알기 위해 일단 컴파일한다.
</p>

<p>윈도에서 컴파일</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
javac -p jars -d out --module-source-path src ^
-m net.java_school.javabank,net.java_school.db.dbpool.api,
net.java_school.db.dbpool,net.java_school.db.dbpool.oracle
</pre>

<p>리눅스에서 컴파일</p>

<pre class="shell-prompt">
javac -p jars -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
컴파일 에러가 발생한다.
</p>

<pre class="shell-prompt">
src/net.java_school.javabank/net/java_school/bank/MyBankDao.java:12: error: package org.slf4j is not visible
import org.slf4j.Logger;
          ^
  (package org.slf4j is declared in module org.slf4j, but module net.java_school.javabank does not read it)
src/net.java_school.javabank/net/java_school/bank/MyBankDao.java:13: error: package org.slf4j is not visible
import org.slf4j.LoggerFactory;
          ^
  (package org.slf4j is declared in module org.slf4j, but module net.java_school.javabank does not read it)
2 errors
</pre>

<p>
에러 메시지 중
(package org.slf4j is declared in module <b>org.slf4j</b>, but module net.java_school.javabank does not read it)
에서 모듈 이름이 org.slf4j 임을 알 수 있다.<br />
자바 은행 모듈이 org.slf4j 모듈을 사용한다는 선언을 모듈 디스크립터에 추가한다.
</p>

<pre class="prettyprint">
module net.java_school.javabank {
  requires net.java_school.db.dbpool.api;
  <b>requires org.slf4j;</b>
  
  uses net.java_school.db.dbpool.api.ConnectionManageable;
}
</pre>

<h4>윈도에서 테스트</h4>

<p>
컴파일
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -p jars -d out --module-source-path src ^
-m net.java_school.javabank,net.java_school.db.dbpool.api,
net.java_school.db.dbpool,net.java_school.db.dbpool.oracle
</pre>

<p>
프로퍼티 파일 복사
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\net.java_school.db.dbpool.oracle\oracle.properties ^
out\net.java_school.db.dbpool.oracle\
copy src\net.java_school.javabank\simplelogger.properties ^
out\net.java_school.javabank\
</pre>

<p>
실행
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=lib\slf4j-simple-1.7.30.jar
java -p jars;out ^ 
-m net.java_school.javabank/net.java_school.bank.BankUi
</pre>

<h4>리눅스에서 테스트</h4>

<p>
컴파일
</p>

<pre class="shell-prompt">
javac -p jars -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
프로퍼티 파일 복사
</p>

<pre class="shell-prompt">
cp src/net.java_school.db.dbpool.oracle/oracle.properties \
out/net.java_school.db.dbpool.oracle/
cp src/net.java_school.javabank/simplelogger.properties \
out/net.java_school.javabank/
</pre>

<p>
실행
</p>

<pre class="shell-prompt">
CP=lib/slf4j-simple-1.7.30.jar
java -cp $CP -p jars:out \
-m net.java_school.javabank/net.java_school.bank.BankUi
</pre>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="/jdbc/JavaBank">JDBC 예제 - 자바 은행</a></li>
	<li><a href="/blog/2019/java-9-modules">자바 9 모듈</a></li>
	<li><a href="/blog/2020/java-modules-javabank">자바 은행 예제 모듈화</a></li>
</ul>

<span id="refer">참조</span>
<ul id="references">
	<li><a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">Oracle JDBC Driver Download</a></li>
	<li><a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a></li>
</ul>

</article>
