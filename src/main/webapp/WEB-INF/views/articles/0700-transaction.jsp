<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>스프링 트랜잭션</title>
<meta name="Keywords" content="java,spring,transaction,jdbc,@Transactional,java config,@Configuration,@EnableAspectJAutoProxy,@Bean,@EnableTransactionManagement,java bank" />
<meta name="Description" content="스프링 트랜잭션에 대해 설명합니다" />
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

<h1>스프링 트랜잭션</h1>

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
  &lt;bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager"&gt;
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
지금까지 입금과 출금 메소드는 void를 반환하도록 설계했기에 입금이나 출금이 성공 또는 실패했는지를 알 수 없었다.
입금과 출금시 dao가 정수값을 리턴하도록 자바 클래스를 수정한다.
</p>

<h6 class="src">BankDao.java</h6>
<pre class="prettyprint">
//입금
public <strong>int</strong> deposit(String accountNo, double amount);

//출금
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
다음과 같이 어노테이션을 사용해 트랜잭션을 설정한다.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

<strong>import org.springframework.transaction.annotation.Transactional;</strong>

public class MyBank implements Bank {
  
  //..중간 생략..
  
  @Override
  <strong>@Transactional</strong>
  public void transfer(String from, String to, double amount) {
    <strong>
    try {
      int check = dao.withdraw(from, amount);
      if (check &lt; 1) throw new RuntimeException("출금 실패");
      check = dao.deposit(to, amount);
      if (check &lt; 1) throw new RuntimeException("입금 실패");
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    </strong>
  }

  //..중간 생략..
}
</pre>

<p>
테스트하기 전에 BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
컴파일하고 실행한 후,
101 계좌에서 505 계좌(존재하는 않는 계좌)로 이체를 시도한다.
테스트에 성공했다면(즉, 이체가 취소되었다면), MyBank 클래스에서 transfer() 메소드 위에 있는 @Transactional을 제거하고 다시 이체를 시도한다.
</p>

<h3>JavaConfig 설정</h3>

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
테스트하기 전에, applicationContext.xml 설정을 모두 주석 처리한다.
BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
최종 소스: <a href="https://github.com/kimjonghoon/transaction">https://github.com/kimjonghoon/transaction</a>
</p>

</article>

</body>
</html>
