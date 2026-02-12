<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Spring AOP</title>
<meta name="Keywords" content="java,spring,aop,java config,@Configuration,@EnableAspectJAutoProxy,@Bean,java bank" />
<meta name="Description" content="This article describes Spring AOP" />
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

<h1>Spring AOP</h1>

<p>
AOP stands for Aspect-Oriented Programming, which is programming for cross-sectional concerns. Cross-sectional concerns refer to functions common to multiple modules. For example, logging is a function that both the member module and the bulletin board module have. The following AOP example will show us how to separate cross-sectional concerns.
</p>

<p>
Add the following to pom.xml.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-aspects&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.aspectj&lt;/groupId&gt;
  &lt;artifactId&gt;aspectjweaver&lt;/artifactId&gt;
  &lt;version&gt;1.9.19&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Create TestLogger.java like below.
</p>

<h6 class="src">TestLogger.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class TestLogger {
  Logger logger = LoggerFactory.getLogger(this.getClass());
  
  @AfterReturning("execution(* net.java_school.bank.BankDao.deposit(..))")
  public void depositLog(JoinPoint point) {
    Object[] a = point.getArgs();
    String accountNo = (String) a[0];
    Long amount = (Long) a[1];
    String methodName = point.getSignature().getName();
    logger.debug("{}|{}|{}", methodName, accountNo, amount);
  }
  
  @AfterReturning("execution(* withdraw(..)) &amp;&amp; args(accountNo, amount)")
  public void withdrawLog(String accountNo, double amount) {
    logger.debug("WITHDRAW|{}|{}", accountNo, amount);
  }
}
</pre>

<p>
Remove logging code from all Java sources like below.
</p>

<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyBankDao implements BankDao {
  static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  static final String USER = "scott";
  static final String PASSWORD = "tiger";
  
  //..omit..
  
  @Override
  public void deposit(String accountNo, double amount) {
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String sql = "UPDATE bankaccount " +
        "SET balance = balance + ? " +
        "WHERE accountNo = ?";
    
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, amount);
      pstmt.setString(2, accountNo);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(null, pstmt, con);
    }
  }

  @Override
  public void withdraw(String accountNo, double amount) {
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String sql = "UPDATE bankaccount " +
        "SET balance = balance - ? " +
        "WHERE accountNo = ?";
    
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, amount);
      pstmt.setString(2, accountNo);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(null, pstmt, con);
    }
  }
  
  //..omit..
  
}  
</pre>

<h3>XML configuration</h3>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  <strong>xmlns:aop="http://www.springframework.org/schema/aop"</strong> 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    <strong>http://www.springframework.org/schema/aop 
    http://www.springframework.org/schema/aop/spring-aop.xsd</strong>"&gt;
  <strong>
  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;
    </strong>
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

<p>
Modify the main method of BankUi.java.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<h3>JavaConfig configuration</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

<strong>import net.java_school.commons.TestLogger;</strong>

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
<strong>import org.springframework.context.annotation.EnableAspectJAutoProxy;</strong>

@Configuration
<strong>@EnableAspectJAutoProxy</strong>
public class BankConfig {
  
  <strong>@Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }</strong>

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
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java as follows.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>  
We confirmed that the limitations of Object-Oriented Programming could be supplemented by applying AOP to the cross-sectional concerns of the system in this section.
</p>

<p>
Final Source: <a href="https://github.com/kimjonghoon/aop">https://github.com/kimjonghoon/aop</a>
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html">http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html</a></li>
</ul>
</article>

</body>
</html>
