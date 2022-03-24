<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Modularization - JavaBank</h1>

<p>
This article covers the modularization of the <a href="/jdbc/JavaBank">JDBC Example JavaBank</a>.
</p>

<p>
Download the JavaBank source with the following command:
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/JavaBank
</pre>

<p>
Download the followings: 
</p>

<ul>
	<li>Oracle JDBC Driver from <a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox</a></li>
	<li>The latest binary release of slf4j-api and slf4j-simple from <a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a></li>
</ul>

<p>
Copy ojdbc6.jar, slf4j-api-1.7.30.jar and slf4j-simple-1.7.30.jar to lib/ directory.
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
Connect to the SCOTT account with SQL*PLUS and create the following tables and a trigger that inserts transaction history data in the transaction table whenever the account balance changes.
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
Before modularization, check if the program works.
</p>

<h4>Test on Windows</h4>

<p>
Compile
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mkdir out
set classpath=lib\slf4j-api-1.7.30.jar
javac -d out src\net\java_school\bank\*.java
</pre>

<p>
Copy properties to out/ directory.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\simplelogger.properties out\
</pre>

<p>
Run
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=lib\slf4j-api-1.7.30.jar;lib\slf4j-simple-1.7.30.jar;lib\ojdbc6.jar;out
java net.java_school.bank.BankUi
</pre>

<h4>Test on Linux</h4>

<p>
Compile
</p>

<pre class="shell-prompt">
CP=lib/slf4j-api-1.7.30.jar
javac -cp $CP -d out -sourcepath src $(find src -name "*.java")
</pre>

<p>
Copy properties to out/ directory.
</p>

<pre class="shell-prompt">
cp src/simplelogger.properties out/
</pre>

<p>
Run
</p>

<pre class="shell-prompt">
CP+=:lib/slf4j-simple-1.7.30.jar
CP+=:lib/ojdbc6.jar
java -cp $CP:out net.java_school.bank.BankUi
</pre>

<p>
Run the following to check the external library on which JavaBank depends.
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
We found that JavaBank depends on slf4j-api-1.7.30.jar. Remember that a library like this should be in the module path. Jars that are not modules in the module path become automatic modules.
</p>

<h3>Modularization</h3>

<p>
Download the custom connection pool modules.
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/java-module-test
</pre>

<p>
Place the JavaBank sources in the src/ folder of java-module-test and Remove the main.app and net.java_school.db.dbpool.mysql modules in java-module-test.
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
Add jars/ to the module path. Non-module jars in the module path become automatic modules.
</p>

<p>
Add lib/ to the classpath. Non-module jars in the classpath become unnamed modules.
</p>

<p>
Only automatic modules can read unnamed modules. You can easily infer that slf4j-api will read slf4j-simple from their name.
</p>

<p>
Create the module-info.java of the net.java_school.javabank module.
</p>

<pre class="prettyprint">
module net.java_school.javabank {
  requires net.java_school.db.dbpool.api;
  
  uses net.java_school.db.dbpool.api.ConnectionManageable;
}
</pre>

<p>
Compile to see how the names of the automatic modules are determined.
</p>

<p>Compile on Windows</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -p jars -d out --module-source-path src ^
-m net.java_school.javabank,net.java_school.db.dbpool.api,
net.java_school.db.dbpool,net.java_school.db.dbpool.oracle
</pre>

<p>Compile on Linux</p>

<pre class="shell-prompt">
javac -p jars -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
Compile error occurs.
</p>

<pre class="shell-prompt">
src/net.java_school.javabank/net/java_school/bank/MyBankDao.java:12: error: package org.slf4j is not visible
import org.slf4j.Logger;
          ^
  (package org.slf4j is declared in module org.slf4j, but module net.java_school.javabank does not read it)
src/net.java_school.javabank/net/java_school/bank/MyBankBankDao.java:13: error: package org.slf4j is not visible
import org.slf4j.LoggerFactory;
          ^
  (package org.slf4j is declared in module org.slf4j, but module net.java_school.javabank does not read it)
2 errors
</pre>

<p>
(package org.slf4j is declared in module <b>org.slf4j</b>, but module net.java_school.javabank does not read it)<br />
You found the module name is <b>org.slf4j</b> from the error message. Edit the module-info.java in the net.java_school.javabank module as follows.
</p>

<pre class="prettyprint">
module net.java_school.javabank {
  requires net.java_school.db.dbpool.api;
  <b>requires org.slf4j;</b>
  
  uses net.java_school.db.dbpool.api.ConnectionManageable;
}
</pre>

<h4>Test on Windows</h4>

<p>
Compile
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -p jars -d out --module-source-path src ^
-m net.java_school.javabank,net.java_school.db.dbpool.api,
net.java_school.db.dbpool,net.java_school.db.dbpool.oracle
</pre>

<p>
Copy properties to the module directory.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\net.java_school.db.dbpool.oracle\oracle.properties ^
out\net.java_school.db.dbpool.oracle\
copy src\net.java_school.javabank\simplelogger.properties ^
out\net.java_school.javabank\
</pre>

<p>
Run
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=lib\slf4j-simple-1.7.30.jar
java -p jars;out ^ 
-m net.java_school.javabank/net.java_school.bank.BankUi
</pre>

<h4>Test on Linux</h4>

<p>
Compile
</p>

<pre class="shell-prompt">
javac -p jars -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
Copy properties to the module directory.
</p>

<pre class="shell-prompt">
cp src/net.java_school.db.dbpool.oracle/oracle.properties \
out/net.java_school.db.dbpool.oracle/
cp src/net.java_school.javabank/simplelogger.properties \
out/net.java_school.javabank/
</pre>

<p>
Run
</p>

<pre class="shell-prompt">
CP=lib/slf4j-simple-1.7.30.jar
java -cp $CP -p jars:out \
-m net.java_school.javabank/net.java_school.bank.BankUi
</pre>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/jdbc/JavaBank">JavaBank</a></li>
	<li><a href="/blog/2019/java-9-modules">Java 9 Modules</a></li>
	<li><a href="/blog/2020/java-modules-javabank">Modularization - JavaBank</a></li>
</ul>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">Oracle JDBC Driver Download</a></li>
	<li><a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a></li>
</ul>

</article>
