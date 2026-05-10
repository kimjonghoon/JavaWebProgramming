<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>Java bank - Inheritance</h1>

<p>
Suppose that Java bank needs an account with which the owner can withdraw money even if the withdrawal amount is greater than the balance.
</p>

<p>
You can extend an existing account class to create a subclass that can have negative balances. Let's name an account with a negative balance as a minus account. A minus account class only needs to override the withdraw() of the superclass, Account class.
</p>

<p>
The addAccount(String accountNo, String name, double balance) method of the Bank class should determine whether an account to create is a regular or a minus account. So add the parameter to the addAccount() as below.
</p>

<pre class="prettyprint">public void addAccount(String accountNo, String name, double balance, <strong>String kind</strong>) {
  //..Omitted
}
</pre>

<p>
Suppose that the kind parameter is assigned the dash character (-) when creating a minus account.
</p>

<pre class="prettyprint">public void addAccount(String accountNo, String name, double balance, String kind) {
  Account account = this.getAccount(accountNo);
  if (account == null) {
    if (kind != null &amp;&amp; kind.equals("-") {
      accounts.add(new MinusAccount(accountNo, name, balance));
    } else {
      accounts.add(new Account(accountNo, name, balance));
    } 
  }
}
</pre>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.util.Date;

public class Account {
  private String accountNo;
  private String name;
  <strong>protected</strong> double balance;
  <strong>protected</strong> List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();
	
  <strong>static final String KIND = "Normal";</strong>
  static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
  static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
  static final String DEPOSIT = "Deposit";
  static final String WITHDRAW = "Withdrawal";
  <strong>static final NumberFormat NUMBER_FORMAT = NumberFormat.getInstance();</strong>

  public Account() {}
	
  public Account(String accountNo, String name) {
    this.accountNo = accountNo;
    this.name = name;
  }
	
  public Account(String accountNo, String name, double balance) {
    this.accountNo = accountNo;
    this.name = name;
    this.balance = balance;
  }
	
  public void deposit(double amount) {
    balance = balance + amount;
    Transaction transaction = new Transaction();
    Calendar cal = Calendar.getInstance();
    Date date = cal.getTime();
    transaction.setTransactionDate(DATE_FORMAT.format(date));
    transaction.setTransactionTime(TIME_FORMAT.format(date));
    transaction.setAmount(amount);
    transaction.setBalance(balance);
    transaction.setKind(DEPOSIT);
    transactions.add(transaction);
  }
	
  public void withdraw(double amount) {
    if (amount &gt; this.balance) {
      return;
    }
    balance = balance - amount;
    Transaction transaction = new Transaction();
    Calendar cal = Calendar.getInstance();
    Date date = cal.getTime();
    transaction.setTransactionDate(DATE_FORMAT.format(date));
    transaction.setTransactionTime(TIME_FORMAT.format(date));
    transaction.setAmount(amount);
    transaction.setBalance(balance);
    transaction.setKind(WITHDRAW);
    transactions.add(transaction);
  }
	
  public String getName() {
    return name;
  }
	
  public void setName(String name) {
    this.name = name;
  }
	
  public String getAccountNo() {
    return accountNo;
  }
	
  public void setAccountNo(String accountNo) {
    this.accountNo = accountNo;
  }
	
  public long getBalance() {
    return balance;
  }
	
  public void setBalance(double balance) {
    this.balance = balance;
  }
	
  public <strong>List&lt;Transaction&gt;</strong> getTransactions() {
    return transactions;
  }
	
  public void setTransactions(<strong>List&lt;Transaction&gt;</strong> transactions) {
    this.transactions = transactions;
  }
  <strong>
  public String getKind() {
    return KIND;
  }
  </strong>
  @Override
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append(accountNo);
    sb.append("|");		
    sb.append(name);
    sb.append("|");
    <strong>sb.append(NUMBER_FORMAT.format(balance));
    sb.append("|");
    sb.append(getKind());</strong>
			
    return sb.toString();
  }
}
</pre>

<p>
Modify the toString() method of the Transaction class as follows:
</p>

<h6 class="src">Transaction.java</h6>
<pre class="prettyprint">
@Override
public String toString() {
  StringBuilder sb = new StringBuilder();
  sb.append(transactionDate);
  sb.append("|");
  sb.append(transactionTime);
  sb.append("|");
  sb.append(kind);
  sb.append("|");
  <strong>sb.append(Account.NUMBER_FORMAT.format(amount));</strong>
  sb.append("|");
  <strong>sb.append(Account.NUMBER_FORMAT.format(balance));</strong>
	
  return sb.toString();
}
</pre>

<h6 class="src">MinusAccount.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class MinusAccount <strong>extends Account</strong> {
  <strong>static final String KIND = "Minus";</strong>
	
  public MinusAccount() {}
	
  public MinusAccount(String accountNo, String name) {
    super(accountNo, name);
  }

  public MinusAccount(String accountNo, String name, double balance) {
    super(accountNo, name, balance);
  }
	
  <strong>@Override
  public String getKind() {
    return KIND;
  }</strong>

  @Override
  public void withdraw(double amount) {
    balance = balance - amount;
    Transaction transaction = new Transaction();
    Calendar cal = Calendar.getInstance();
    Date date = cal.getTime();
    transaction.setTransactionDate(Account.DATE_FORMAT.format(date));
    transaction.setTransactionTime(Account.TIME_FORMAT.format(date));
    transaction.setAmount(amount);
    transaction.setBalance(balance);
    transaction.setKind(Account.WITHDRAW);
    transactions.add(transaction);
  }
}
</pre>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.ArrayList;
import java.util.List;

public class Bank {
  private List&lt;Account&gt; accounts = new ArrayList&lt;Account&gt;();

  public void addAccount(String accountNo, String name) {
    Account account = this.getAccount(accountNo);
    if (account == null) {
      accounts.add(new Account(accountNo, name));
    }
  }
    
  public void addAccount(String accountNo, String name, double balance) {
    Account account = this.getAccount(accountNo);
    if (account == null) {
      accounts.add(new Account(accountNo, name, balance));
    }
  }

  public void addAccount(String accountNo, String name, <strong>String kind</strong>) {
    <strong>Account account = this.getAccount(accountNo);</strong>
    <strong>if (account == null) {</strong>
      <strong>if (kind != null &amp;&amp; kind.equals("-")) {</strong>
        <strong>accounts.add(new MinusAccount(accountNo, name));</strong>
      <strong>} else {</strong>
        <strong>accounts.add(new Account(accountNo, name));</strong>
      <strong>}</strong>
    <strong>}</strong>
  }
    
  public void addAccount(String accountNo, String name, double balance, <strong>String kind</strong>) {
    <strong>Account account = this.getAccount(accountNo);</strong>
    <strong>if (account == null) {</strong>
      <strong>if (kind != null &amp;&amp; kind.equals("-")) {</strong>
        <strong>accounts.add(new MinusAccount(accountNo, name, balance));</strong>
      <strong>} else {</strong>
        <strong>accounts.add(new Account(accountNo, name, balance));</strong>
      <strong>}</strong>
    <strong>}</strong>
  }
    
  public Account getAccount(String accountNo) {
    int size = accounts.size();
    for (int i = 0; i &lt; size; i++) {
      if (accountNo.equals(accounts.get(i).getAccountNo())) {
        return accounts.get(i);
      }
    }
    return null;
  }
    
  public List&lt;Account&gt; findAccountByName(String name) {
    List&lt;Account&gt; matched = new ArrayList&lt;Account&gt;();
    int size = accounts.size();
    for (int i = 0; i &lt; size; i++) {
      if (name.equals(accounts.get(i).getName())) {
        matched.add(accounts.get(i));
      }
    }
    return matched;
  }
    
  public List&lt;Account&gt; getAccounts() {
    return accounts;
  }
}
</pre>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

<strong>import java.util.List;</strong>

public class Test {
  static final String ACCOUNTS_HEADING = "AccountNo|Owner|Balance<strong>|N/M</strong>";
  static final String TRANSACTIONS_HEADING = "Date|Time|D/W|Amount|Balance";

  public static void main(String[] args) {
    
    //Create test accounts
    Bank bank = new Bank();
    bank.addAccount("101", "Alison");
    bank.addAccount("202", "Bill");
    bank.addAccount("303", "Carol");
    bank.addAccount("404", "Alison", <strong>"-"</strong>);
        
    //..Omitted

    <strong>System.out.println();</strong>

    <strong>//6.Withdraw $ 5 from 404 account.</strong>
    <strong>System.out.println("6.Withdraw $ 5 from 404 account.");</strong>
    <strong>Account alison404 = bank.getAccount("404");</strong>
    <strong>alison404.withdraw(5);</strong>
    <strong>System.out.println(ACCOUNTS_HEADING);</strong>
    <strong>System.out.println(alison404);</strong>
  }
}
</pre>

<pre class="console"><strong class="console-result">6.Withdraw $ 5 from 404 account.
AccountNo|Owner|Balance
404|Alison|-5|Minus</strong></pre>

<h3>TODO</h3>

<p>
Create the following custom exceptions and apply them to the example.
</p>

<ul>
	<li>InsufficientBalanceException</li>
	<li>DuplicateAccountException</li>
</ul>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/javabank-abstract-class"/>">Java bank - Abstract class</a></li>
    <li>Prev : <a href="<c:url value="/java/javabank-design"/>">Java bank - Application Design</a></li>
  </ul>
</div>
</article>