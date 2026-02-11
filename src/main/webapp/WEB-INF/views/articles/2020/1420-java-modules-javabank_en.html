<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Modularization - JavaBank</title>
<meta name="Keywords" content="java,java modules,Javabank,JavaBank Modularization" />
<meta name="Description" content="JavaBank Modularization" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 6.25.2025</div>

<h1>Modularization - JavaBank</h1>

<p>
This article covers the modularization of the <a th:href="@{/jdbc/JavaBank}">JDBC Example JavaBank</a>.
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

	<li>ojdbc17.jar from<a href="https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html">https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html</a></li>
	<li>slf4j-api-1.7.36.jar and slf4j-simple-1.7.36.jar from <a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a></li>
</ul>

<p>
Copy ojdbc17.jar, slf4j-api-1.7.36.jar and slf4j-simple-1.7.36.jar to lib/ directory.
</p>

<pre lang="en" class="tree">
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
├── ojdbc17.jar
├── slf4j-api-1.7.36.jar
└── slf4j-simple-1.7.36.jar
</pre>

<p>
Connect to the SCOTT account with SQL*PLUS and create the following tables and a trigger that inserts transaction history data in the transaction table whenever the account balance changes.
</p>

<pre class="db-schema">
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

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mkdir out
set classpath=lib\slf4j-api-1.7.36.jar
javac -d out src\net\java_school\bank\*.java
</pre>

<p>
Copy properties to out/ directory.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">copy src\simplelogger.properties out\
</pre>

<p>
Run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">set classpath=lib\slf4j-api-1.7.36.jar;lib\slf4j-simple-1.7.36.jar;lib\ojdbc17.jar;out
java net.java_school.bank.BankUi
</pre>

<h4>Test on Linux</h4>

<p>
Compile
</p>

<pre class="shell-prompt">
CP=lib/slf4j-api-1.7.36.jar
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
CP+=:lib/slf4j-simple-1.7.36.jar
CP+=:lib/ojdbc17.jar
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
<b>out -> lib/slf4j-api-1.7.36.jar</b>
..
</pre>

<p>
We found that JavaBank depends on slf4j-api-1.7.36.jar. Remember that a library like this should be in the module path. Jars that are not modules in the module path become automatic modules.
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

<pre lang="en" class="tree">
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
├── slf4j-simple-1.7.36.jar
jars/
├── ojdbc17.jar
└── slf4j-api-1.7.36.jar
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

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">javac -p jars -d out --module-source-path src ^
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

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">javac -p jars -d out --module-source-path src ^
-m net.java_school.javabank,net.java_school.db.dbpool.api,
net.java_school.db.dbpool,net.java_school.db.dbpool.oracle
</pre>

<p>
Copy properties to the module directory.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">copy src\net.java_school.db.dbpool.oracle\oracle.properties ^
out\net.java_school.db.dbpool.oracle\
copy src\net.java_school.javabank\simplelogger.properties ^
out\net.java_school.javabank\
</pre>

<p>
Run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">set classpath=lib\slf4j-simple-1.7.36.jar
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
CP=lib/slf4j-simple-1.7.36.jar
java -cp $CP -p jars:out \
-m net.java_school.javabank/net.java_school.bank.BankUi
</pre>

<p>
<span class="repository">https://github.com/kimjonghoon/java-modules-javabank</span>
</p>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/jdbc/JavaBank}">JavaBank</a></li>
	<li><a href="#" th:href="@{/blog/2019/java-9-modules}">Java 9 Modules</a></li>
	<li><a href="#" th:href="@{/blog/2020/java-modules-javabank}">Modularization - JavaBank</a></li>
</ul>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html">https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html</a></li>
	<li><a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a></li>
</ul>

</article>
</body>
</html>
