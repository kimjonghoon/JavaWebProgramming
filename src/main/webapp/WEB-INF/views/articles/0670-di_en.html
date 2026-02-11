<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Spring DI</title>
<meta name="Keywords" content="java,maven,mvn archetype:generate,mvn install,mvn clean,mvn compile,java config,@Configuration,@Bean" />
<meta name="Description" content="This article describes Spring DI" />
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

<h1>Spring DI</h1>

<h2>Set up the project</h2>

<p>
Execute the following command in your workspace.<br />
(↵ is an indication to press the enter key. Enter chooses the default value)
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
<span class="prompt-selection">mvn archetype:generate</span>

Choose a number or apply filter 
    (format: [groupId:]artifactId, case sensitive contains): 2005: ↵

Choose org.apache.maven.archetypes:maven-archetype-quickstart version: 
1: 1.0-alpha-1
2: 1.0-alpha-2
3: 1.0-alpha-3
4: 1.0-alpha-4
5: 1.0
6: 1.1
7: 1.3
8: 1.4
Choose a number: 8: ↵
Define value for property 'groupId': : <span class="prompt-selection">net.java_school</span>
Define value for property 'artifactId': : <span class="prompt-selection">bank</span>
Define value for property 'version':  1.0-SNAPSHOT: : ↵
Define value for property 'package':  net.java_school: : ↵
Confirm properties configuration:
groupId: net.java_school
artifactId: bank
version: 1.0-SNAPSHOT
package: net.java_school
 Y: : ↵
</pre>

<p>
Access the Scott account with SQL * PLUS and Create the following table.
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
</pre>

<p>
Create a trigger that inserts data into a transaction table when depositing or withdrawing. 
</p>

<pre class="prettyprint">
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
Copy <a href="https://github.com/kimjonghoon/JavaBank">https://github.com/kimjonghoon/JavaBank</a> sources and paste them to the following locations:
</p>

<pre lang="en">src
└── main
    └── java
        └── net
            └── java_school
                └── bank
                    ├── Account.java
                    ├── Bank.java
                    ├── BankDao.java
                    ├── BankUi.java
                    ├── MyBank.java
                    ├── MyBankDao.java
                    └── Transaction.java
</pre>

<p>
Edit pom.xml as shown below.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                        http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;net.java_school&lt;/groupId&gt;
  &lt;artifactId&gt;bank&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;name&gt;bank&lt;/name&gt;
  &lt;url&gt;http://maven.apache.org&lt;/url&gt;

  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;<strong>21</strong>&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;<strong>21</strong>&lt;/maven.compiler.target&gt;
    <strong>&lt;spring.version&gt;6.2.8&lt;/spring.version&gt;</strong>
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;junit&lt;/groupId&gt;
      &lt;artifactId&gt;junit&lt;/artifactId&gt;
      &lt;version&gt;4.11&lt;/version&gt;
      &lt;scope&gt;test&lt;/scope&gt;
    &lt;/dependency&gt;
    <strong>&lt;!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.slf4j&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;slf4j-api&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;2.0.6&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;ch.qos.logback&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;logback-classic&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;1.4.5&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-context&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc6 --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;ojdbc6&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;11.2.0.4&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  <strong>&lt;/dependencies&gt;</strong>

  &lt;build&gt;
    &lt;finalName&gt;bank&lt;/finalName&gt;
    &lt;pluginManagement&gt;
      &lt;plugins&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.1.0&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-resources-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.0.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.8.0&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.22.1&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.2.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.5.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.8.2&lt;/version&gt;
        &lt;/plugin&gt;
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
compile
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span>
</pre>

<h3>Migrating to Spring project</h3>

<p>
Modify the following:
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
public void setDao(BankDao dao);//added
</pre>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
//private BankDao dao = new MyBankDao();

//added
private BankDao dao;

public void setDao(BankDao dao) {
  this.dao = dao;
}
</pre>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//..omit..

import java.io.PrintStream;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//..omit..
//private Bank bank = new MyBank();
private Bank bank;

public void setBank(Bank bank) {
  this.bank = bank;
}

private PrintStream stream;

public void setStream(PrintStream stream) {
  this.stream = stream;
}

/* 
Modify System.out.println() to stream.println(), System.out.println() to stream.println().
*/

//..omit..

public static void main(String[] args) {
  ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}

</pre>

<p>
Create src/main/resources folder. (This is also the Maven project directory) Copy logback.xml in <a href="../java/Logging">Logging</a> and paste it into resources folder. Create an applicationContext.xml in the resources folder.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd"&gt;

    &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
        &lt;property name="stream" value="#{T(System).out}" /&gt;
        &lt;property name="bank" ref="myBank" /&gt;
    &lt;/bean&gt;
    
    &lt;bean id="myBank" class="net.java_school.bank.MyBank"&gt;
        &lt;property name="dao" ref="myBankDao" /&gt;
    &lt;/bean&gt;

    &lt;bean id="myBankDao" class="net.java_school.bank.MyBankDao"&gt;
    &lt;/bean&gt;

&lt;/beans&gt;
</pre>

<pre lang="en">src
└── main
    └── resources
        ├── logback.xml
        └── applicationContext.xml
</pre>

<p>
compile
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span>
</pre>

<h2>Set up the project in Eclipse</h2>

<p>
Start Eclipse. (It does not matter where your workspace is) In the Project Explorer view, use the right mouse button to display the context menu. Import the JavaBank project into Eclipse as shown below.
</p>

<p>
<img alt="Open Import menu in context menu" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png">
</p>

<p>
<img alt="Import the JavaBank project" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png">
</p>

<p>
It would help if you synchronize Eclipse with pom.xml. With the project selected in the Package Explorer, open the context menu with the right mouse button. Select Maven, then Update Project Configuration.  Whenever pom.xml changes afterwards, you should synchronize Eclipse with it again.
</p>

<h2>JavaConfig</h2>

<p>
It is possible to make beans configuration with Java classes instead of XML files nowdays. You can write beans configuration classes using @Configuration and @Bean annotations. In beans configuration classes, the method name annotated with @Bean becomes a bean object.
</p>

<p>
Create a bean configuration class as follows:
</p>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BankConfig {
  
  @Bean
  public BankDao myBankDao() {
    return new MyBankDao();
  }
  
  @Bean
  public Bank myBank() {
    Bank bank = new MyBank();
    bank.setDao(myBankDao());
    return bank;
  }
  
  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(myBank());
    ui.setStream(System.out);
    return ui;
  }
}
</pre>

<p>
Modify the main method of the BankUi class as shown below.
</p>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//the following import statement is added
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

//..omit..

public static void main(String[] args) {
  //ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class);
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/di">https://github.com/kimjonghoon/di</a>
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="../jdbc/JavaBank">Java Bank</a></li>
  <li><a href="../java/Logging">Logging</a></li>
</ul>

</article>

</body>
</html>
