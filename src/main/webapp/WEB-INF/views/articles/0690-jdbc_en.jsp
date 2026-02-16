<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Spring JDBC</h1>

<p>
This section explains how to replace the JDBC code used by Java Bank with Spring JDBC.
</p>

<p>
Add the following to pom.xml.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Modify MyBankDao to inherit NamedParameterJdbcDaoSupport and remove constructors, getConnection(), and close(rs, pstmt, con) methods of MyBankDao.
</p>

<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

public class MyBankDao <strong>extends NamedParameterJdbcDaoSupport</strong> implements BankDao {

  //Remove URL, USER, PASSWORD fields.
  //Remove constructors, getConnection(), close(rs,pstmt,con) methods.
  
  //..omit..

}
</pre>

<p>
Modify MyBankDao's methods by referring to [before] and [after] below.
</p>

<h6 class="src">[Before]</h6>
<pre class="code">
@Override
public void insertAccount(String accountNo, String name, String kind) {
  
  Connection con = null;
  PreparedStatement pstmt = null;
  
  String sql = "INSERT INTO bankaccount VALUES (?, ?, 0, ?)";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    pstmt.setString(2, name);
    pstmt.setString(3, kind);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(null, pstmt, con);
  }
  
}
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String INSERT_ACCOUNT = 
    "INSERT INTO " +
    "bankaccount (accountno, owner, balance, kind) " +
    "VALUES (:accountNo, :name, 0, :kind)";
   
@Override
public void insertAccount(String accountNo, String name, String kind) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);
  params.put("name", name);
  params.put("kind", kind);
  
  getNamedParameterJdbcTemplate().update(INSERT_ACCOUNT, params);    
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
@Override
public Account selectOneAccount(String accountNo) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "WHERE accountNo = ?";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      
      return account;
      
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }
  return null;
}
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String SELECT_ONE_ACCOUNT = 
    "SELECT accountno,owner,balance,kind " +
    "FROM bankaccount " +
    "WHERE accountno = :accountNo";

@Override
public Account selectOneAccount(String accountNo) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);
  
  return getNamedParameterJdbcTemplate().queryForObject(
    SELECT_ONE_ACCOUNT,
    params,
    new RowMapper&lt;Account&gt;() {
      public Account mapRow(ResultSet rs,int rowNum) throws SQLException {
        Account account = new Account();
        account.setAccountNo(rs.getString("accountNo"));
        account.setName(rs.getString("owner"));
        account.setBalance(rs.getDouble("balance"));
        account.setKind(rs.getString("kind"));
        
        return account;
      }
    }
  );
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
@Override
public List&lt;Account&gt; selectAccountsByName(String name) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Account&gt; matched = new ArrayList&lt;Account&gt;();
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "WHERE owner = ? " +
      "ORDER By accountNo DESC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, name);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      matched.add(account);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return matched;
}
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String SELECT_ACCOUNTS_BY_NAME = 
    "SELECT accountno,owner,balance,kind " +
    "FROM bankaccount " +
    "WHERE owner = :name";

@Override
public List&lt;Account&gt; selectAccountsByName(String name) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("name", name);
  RowMapper&lt;Account&gt; rowMapper = new AccountRowMapper();
  
  return getNamedParameterJdbcTemplate().query(SELECT_ACCOUNTS_BY_NAME,params,rowMapper);
}

protected class AccountRowMapper implements RowMapper&lt;Account&gt; {

  public Account mapRow(ResultSet rs,int rowNum) throws SQLException {

    String accountNo = rs.getString("accountNo");
    String name = rs.getString("owner");
    double balance = rs.getDouble("balance");
    String kind = rs.getString("kind");
    
    Account account = new Account();
    account.setAccountNo(accountNo);
    account.setName(name);
    account.setBalance(balance);
    account.setKind(kind);
    
    return account;
  }
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
@Override
public List&lt;Account&gt; selectAllAccounts() {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Account&gt; all = new ArrayList&lt;Account&gt;();
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "ORDER By accountNo DESC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      all.add(account);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return all;

}
</pre>

<h6 class="src">[Atter]</h6>
<pre class="prettyprint">
private static final String SELECT_ALL_ACCOUNTS = 
    "SELECT accountNo,owner,balance,kind " +
    "FROM bankaccount " +
    "ORDER BY accountNo DESC";

@Override
public List&lt;Account&gt; selectAllAccounts() {
  RowMapper&lt;Account&gt; rowMapper = new AccountRowMapper();
  return getJdbcTemplate().query(SELECT_ALL_ACCOUNTS,rowMapper);
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
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
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String DEPOSIT = 
    "UPDATE bankaccount " +
    "SET balance = balance + :amount " +
    "WHERE accountno = :accountNo";

@Override
public void deposit(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  getNamedParameterJdbcTemplate().update(DEPOSIT, params);
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
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
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String WITHDRAW = 
    "UPDATE bankaccount " +
    "SET balance = balance - :amount " +
    "WHERE accountno = :accountNo";

@Override
public void withdraw(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  getNamedParameterJdbcTemplate().update(WITHDRAW, params);    
}
</pre>

<h6 class="src">[Before]</h6>
<pre class="code">
@Override
public List&lt;Transaction&gt; selectAllTransactions(String accountNo) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Transaction&gt; all = new ArrayList&lt;Transaction&gt;();
  Transaction transaction = null;
  
  String sql = "SELECT transactionDate,kind,amount,balance " +
      "FROM transaction " +
      "WHERE accountNo = ? " +
      "ORDER By transactionDate ASC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      transaction = new Transaction();
      String date = Account.DATE_FORMAT.format(rs.getTimestamp("transactionDate"));
      String time = Account.TIME_FORMAT.format(rs.getTimestamp("transactionDate"));
      transaction.setTransactionDate(date);
      transaction.setTransactionTime(time);
      transaction.setKind(rs.getString("kind"));
      transaction.setAmount(rs.getDouble("amount"));
      transaction.setBalance(rs.getDouble("balance"));
      all.add(transaction);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return all;

}
</pre>

<h6 class="src">[After]</h6>
<pre class="prettyprint">
private static final String SELECT_ALL_TRANSACTIONS = 
    "SELECT transactionDate,kind,amount,balance " +
    "FROM transaction " +
    "WHERE accountno = :accountNo " +
    "ORDER By transactionDate ASC";

@Override
public List&lt;Transaction&gt; selectAllTransactions(String accountNo) {
  RowMapper&lt;Transaction&gt; rowMapper = new TransactionRowMapper();
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);

  return getNamedParameterJdbcTemplate().query(SELECT_ALL_TRANSACTIONS,params,rowMapper);
}

protected class TransactionRowMapper implements RowMapper&lt;Transaction&gt; {

  public Transaction mapRow(ResultSet rs,int rowNum) throws SQLException {

    String date = Account.DATE_FORMAT.format(rs.getTimestamp("transactionDate"));
    String time = Account.TIME_FORMAT.format(rs.getTimestamp("transactionDate"));
    String kind = rs.getString("kind");
    double amount = rs.getDouble("amount");
    double balance = rs.getDouble("balance");

    Transaction transaction = new Transaction();
    transaction.setTransactionDate(date);
    transaction.setTransactionTime(time);
    transaction.setKind(kind);
    transaction.setAmount(amount);
    transaction.setBalance(balance);
    
    return transaction;
  }
}
</pre>

<h3>XML configuration</h3>

<p>
Modify applicationContext.xml like below.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:aop="http://www.springframework.org/schema/aop" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop 
        http://www.springframework.org/schema/aop/spring-aop.xsd"&gt;

  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;

  &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
    &lt;property name="stream" value="#{T(System).out}" /&gt;
    &lt;property name="bank" ref="myBank" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBank" class="net.java_school.bank.MyBank"&gt;
    &lt;property name="dao" ref="myBankDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBankDao" class="net.java_school.bank.MyBankDao"&gt;
    <strong>&lt;property name="dataSource" ref="dataSource" /&gt;</strong>
  &lt;/bean&gt;
  <strong>
  &lt;bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE" /&gt;
    &lt;property name="username" value="scott" /&gt;
    &lt;property name="password" value="tiger" /&gt;
  &lt;/bean&gt;
  </strong>
&lt;/beans&gt;
</pre>

<p>
Modify the main method of BankUi.java.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Let's try to transfer from account 101 to account 505 in a situation where account 101 exist, but account 505 does not exist. You will see that the balance of account 101 decreases by the amount of the transfer. The <a href="<c:url value="/spring/transaction"/>">Spring Transaction</a> section will cover this issue.
</p>

<h3>JavaConfig configuration</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import javax.sql.DataSource;

import net.java_school.commons.TestLogger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@EnableAspectJAutoProxy
public class BankConfig {

  @Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }
  <strong>
  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    dataSource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:XE");
    dataSource.setUsername("scott");
    dataSource.setPassword("tiger");
    return dataSource;
  }
  </strong>
  @Bean
  public BankDao myBankDao() {
    MyBankDao bankDao = new MyBankDao();
    <strong>bankDao.setDataSource(dataSource());</strong>
    return bankDao;
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
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java like below.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/jdbc">https://github.com/kimjonghoon/jdbc</a>
</p>

</article>