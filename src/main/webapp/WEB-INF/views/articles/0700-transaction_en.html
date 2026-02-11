<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Spring Transaction</title>
<meta name="Keywords" content="java,spring,transaction,jdbc,@Transactional,java config,@Configuration,@EnableAspectJAutoProxy,@Bean,@EnableTransactionManagement,java bank" />
<meta name="Description" content="This article describes Spring Transaction" />
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

<h1>Spring Transaction</h1>

<p>
This section describes how to troubleshoot the transfer example in the <a th:href="@{/spring/jdbc}">Spring JDBC</a> section.
</p>

<p>
Modify applicationContext.xml like below.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:aop="http://www.springframework.org/schema/aop" 
  <strong>xmlns:tx="http://www.springframework.org/schema/tx"</strong>
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop 
        http://www.springframework.org/schema/aop/spring-aop.xsd
        <strong>http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx.xsd</strong>"&gt;
  <strong>
  &lt;bean id="transactionManager" 
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
  &lt;/bean&gt;

  &lt;tx:annotation-driven transaction-manager="transactionManager" /&gt;
  </strong>
  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;

  &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
    &lt;property name="stream" value="#{T(System).out}" /&gt;
    &lt;property name="bank" ref="bank" /&gt;
  &lt;/bean&gt;

  &lt;bean id="bank" class="net.java_school.bank.MyBank"&gt;
    &lt;property name="dao" ref="bankDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="bankDao" class="net.java_school.bank.MyBankDao"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
  &lt;/bean&gt;

  &lt;bean id="dataSource"
    class="org.springframework.jdbc.datasource.DriverManagerDataSource"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE" /&gt;
    &lt;property name="username" value="scott" /&gt;
    &lt;property name="password" value="tiger" /&gt;
  &lt;/bean&gt;

&lt;/beans&gt;
</pre>

<p>
Since we made deposit and withdrawal methods to return nothing, so we don't know whether the deposit or withdrawal was successful or not.
</p>

<p>
Modify deposit and withdrawal methods to return an integer value.
</p>

<h6 class="src">BankDao.java</h6>
<pre class="prettyprint">
public <strong>int</strong> deposit(String accountNo, double amount);

public <strong>int</strong> withdraw(String accountNo, double amount);
</pre>


<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
@Override
public <strong>int</strong> deposit(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  <strong>return</strong> getNamedParameterJdbcTemplate().update(DEPOSIT, params);
}
@Override
public <strong>int</strong> withdraw(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  <strong>return</strong> getNamedParameterJdbcTemplate().update(WITHDRAW, params);    
}
</pre>

<p>
Set the transaction using annotations like below.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

<strong>import org.springframework.transaction.annotation.Transactional;</strong>

public class MyBank implements Bank {
  
  //..omit..
  
  @Override
  <strong>@Transactional</strong>
  public void transfer(String from, String to, double amount) {
  <strong>
    try {
      int check = dao.withdraw(from, amount);
      if (check &lt; 1) throw new RuntimeException("Withdrawal Failed!");
      check = dao.deposit(to, amount);
      if (check &lt; 1) throw new RuntimeException("Deposit Failed!");
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  </strong>
  }
  //..omit..
}
</pre>

<p>
Modify the main method of BankUi.java like below.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Try to transfer some money from account 101 to account 505 that do not exist. You can see that the transaction manager cancels the transfer, leaving the balance in account 101 intact.
</p>

<p>
Remove the @Transactional(propagation = Propagation.REQUIRED) above the transfer() method in the MyBank.java and try transfer again to see the difference. 
</p>

<h3>JavaConfig</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import javax.sql.DataSource;

import net.java_school.commons.TestLogger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
<strong>import org.springframework.jdbc.datasource.DataSourceTransactionManager;</strong>
import org.springframework.jdbc.datasource.DriverManagerDataSource;
<strong>import org.springframework.transaction.PlatformTransactionManager;</strong>
<strong>import org.springframework.transaction.annotation.EnableTransactionManagement;</strong>

@Configuration
@EnableAspectJAutoProxy
<strong>@EnableTransactionManagement</strong>
public class BankConfig {

  @Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }

  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    dataSource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:XE");
    dataSource.setUsername("scott");
    dataSource.setPassword("tiger");
    return dataSource;
  }
  <strong>
  @Bean
  public PlatformTransactionManager transactionManager() {
    return new DataSourceTransactionManager(dataSource());
  }
  </strong>
  @Bean
  public BankDao bankDao() {
    MyBankDao bankDao = new MyBankDao();
    bankDao.setDataSource(dataSource());
    return bankDao;
  }

  @Bean
  public Bank bank() {
    Bank bank = new MyBank();
    bank.setDao(bankDao());
    return bank;
  }

  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(bank());
    ui.setStream(System.out);
    return ui;
  }
}
</pre>

<p>
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java as shown below.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/transaction">https://github.com/kimjonghoon/transaction</a>
</p>

</article>

</body>
</html>
