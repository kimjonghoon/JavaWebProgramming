<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Java bank - Application Design</h1>

<p>
We can create classes based on class diagrams. Let's write the transaction class first to avoid compilation errors.
</p>

<h6 class="src">Transaction.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

public class Transaction {
  private String transactionDate;
  private String transactionTime;
  private String kind;
  private double amount;
  private double balance;

  public Transaction() {}
	
  public Transaction(String transactionDate,
      String transactionTime,
      String kind,
      double amount,
      double balance) {
    this.transactionDate = transactionDate;
    this.transactionTime = transactionTime;		
    this.kind = kind;
    this.amount = amount;
    this.balance = balance;
  }
	
  public String getTransactionDate() {
    return transactionDate;
  }
  public void setTransactionDate(String transactionDate) {
    this.transactionDate = transactionDate;
  }
  public String getTransactionTime() {
    return transactionTime;
  }
  public void setTransactionTime(String transactionTime) {
    this.transactionTime = transactionTime;
  }
  public String getKind() {
    return kind;
  }
  public void setKind(String kind) {
    this.kind = kind;
  }
  public long getAmount() {
    return amount;
  }
  public void setAmount(double amount) {
    this.amount = amount;
  }
  public long getBalance() {
    return balance;
  }
  public void setBalance(double balance) {
    this.balance = balance;
  }
	
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(transactionDate);
    sb.append("|");
    sb.append(transactionTime);
    sb.append("|");
    sb.append(kind);
    sb.append("|");
    sb.append(amount);
    sb.append("|");
    sb.append(balance);

    return sb.toString();
  }
}
</pre>

<p>
Override toString() that is not in the class diagram for convenient output.
</p>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Account {
  private String accountNo;
  private String name;
  private double balance;
  private Transaction[] transactions = new Transaction[100];
  private int totalTransaction;

  static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
  static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
  static final String DEPOSIT = "Deposit";
  static final String WITHDRAW = "Withdrawal";

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
    transactions[totalTransaction++] = transaction;
  }

  public void withdraw(double amount) {
    if (amount &gt; balance) {
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
    transactions[totalTransaction++] = transaction;
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

  public Transaction[] getTransactions() {
    return transactions;
  }

  public int getTotalTransaction() {
    return totalTransaction;
  }

  public void setTotalTransaction(int totalTransaction) {
    this.totalTransaction = totalTransaction;
  }

  public void setTransactions(Transaction[] transactions) {
    this.transactions = transactions;
  }

  @Override
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append(accountNo);
    sb.append("|");
    sb.append(name);
    sb.append("|");
    sb.append(balance);

    return sb.toString();
  }
}
</pre>

<pre class="prettyprint no-border">
private Transaction [] transactions = new Transaction [100];
</pre>

<p>
The variable is assigned an array object of size 100. --You can not create an array without specifying its length--
</p>

<pre class="prettyprint no-border">
private int totalTransaction;
</pre>

<p>
The variable named totalTransaction, which stores the total number of transactions, is used to put the values into the array variable transactions in order.
</p>

<p>
Not in the class diagram, add the following to the Account class:
</p>

<p>
1. Four static constants.
</p>

<ul>
	<li><b>DATE_FORMAT</b> stores the deposit/withdrawal date format</li>
	<li><b>TIME_FORMAT</b> stores the deposit/withdraw time format</li>
	<li><b>DEPOSIT</b> stores Deposit string</li>
	<li><b>WITHDRAW</b> stores Withdrawal string</li>
</ul>

<p>
2. Three constructors.
</p>

<ol>
	<li>Default constructor</li>
	<li>Constructor with the account number and owner name as arguments</li>
	<li>Constructor with the account number, owner name, and balance as arguments</li>
</ol>

<p>
3. Overridden toString() method.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

public class Bank {
  private Account[] accounts = new Account[10];
  private int totalAccount;

  public void addAccount(String accountNo, String name) {
    accounts[totalAccount++] = new Account(accountNo, name);
  }
	
  public void addAccount(String accountNo, String name, double balance) {
    accounts[totalAccount++] = new Account(accountNo, name, balance);
  }

  public Account getAccount(String accountNo) {
    for (int i = 0; i &lt; totalAccount; i++) {
      if (accountNo.equals(accounts[i].getAccountNo())) {
        return accounts[i];
      }
    }
    return null;
  }

  public Account[] findAccountByName(String name) {
    Account[] temp = new Account[totalAccount];
    int total = 0;
    for (int i = 0; i &lt; totalAccount; i++) {
      if (name.equals(accounts[i].getName())) {
        temp[total++] = accounts[i];
      }
    }
    Account[] matched = new Account[total];
    for (int i = 0; i &lt; total; i++) {
      matched[i] = temp[i];
    }

    return matched;
  }

  public Account[] getAccounts() {
    return accounts;
  }

  public int getTotalAccount() {
    return totalAccount;
  }
}	
</pre>

<pre class="prettyprint no-border">
private Account[] accounts = new Account[10];
</pre>

<p>
The variable is assigned an array object of size 10.
</p>

<p>
The variable named totalAccount, which stores the total number of accounts, is used to put the values into the array variable accounts in order.
</p>

<p>
The findAccountByName() finds an account by owner name. Since there may be multiple accounts with the same owner name, the return type is an array.
</p>

<p>
Create a class for testing. 
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

public class Test {
  static final String ACCOUNTS_HEADING = "Account No|Owner|Balance";
  static final String TRANSACTIONS_HEADING = "Date|Time|D/W|Amount|Balance";

  public static void main(String[] args) {
	
    //Create test accounts
    Bank bank = new Bank();
    bank.addAccount("101", "Alison");
    bank.addAccount("202", "Bill");
    bank.addAccount("303", "Carol");
    bank.addAccount("404", "Alison");
		
    //1. Print out the total account list.
    System.out.println("1. Print out the total account list.");
    Account[] accounts = bank.getAccounts();
    int totalAccount = bank.getTotalAccount();
    System.out.println(ACCOUNTS_HEADING);
    for (int i = 0; i &lt; totalAccount; i++) {
      System.out.println(accounts[i]);
    }

    System.out.println();
				
    //2. Deposit $ 10 into 101 account.
    System.out.println("2. Deposit $ 10 into 101 account.");		
    Account alison = bank.getAccount("101");
    alison.deposit(10);
    System.out.println(ACCOUNTS_HEADING);
    System.out.println(alison);

    System.out.println();
				
    //3. Withdraw $ 5 from 101 account.
    System.out.println("3. Withdraw $ 5 from 101 account.");		
    alison.withdraw(5);
    System.out.println(ACCOUNTS_HEADING);
    System.out.println(alison);

    System.out.println();
				
    //4. Print transaction history of the 101 account.
    System.out.println("4. Print transaction history of the 101 account.");		
    Transaction[] transactions = alison.getTransactions();
    int totalTransaction = alison.getTotalTransaction();
    System.out.println(TRANSACTIONS_HEADING);
    for (int i = 0; i &lt; totalTransaction; i++) {
      System.out.println(transactions[i]);
    }

    System.out.println();
		
    //5. Find your account by customer name.
    System.out.println("5. Find Alison's Account.");
    Account[] matched = bank.findAccountByName("Alison");
    System.out.println(ACCOUNTS_HEADING);
    for (Account account : matched) {
      System.out.println(account);
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">1. Print out the total list.
AccountNo|Owner|Balance
101|Alison|0
202|Bill|0
303|Carol|0
404|Alison|0

2. Deposit $ 10 into 101 account.
AccountNo|Owner|Balance
101|Alison|10

3. Withdraw $ 5 from 101 account.
AccountNo|Owner|Balance
101|Alison|5

4. Print transaction history of the 101 account.
Date|Time|D/W|Amount|Balance
2020/12/15|17:50:29|Deposit|10|10
2020/12/15|17:50:29|Withdrawal|5|5

5. Find Alison's Account.
AccountNo|Owner|Balance
101|Alison|5
404|Alison|0</strong></pre>

<h2>Date and Time</h2>

<p>
Here are Java API classes for date and time.
</p>

<ul>
	<li>java.util.Calendar</li>
	<li>java.util.Date</li>
	<li>java.util.Time</li>
</ul>

<p>
The above classes are not enough to make a program that deals with time and date in depth.<br />
The joda-Time and the apache project FastDateFormat are external libraries for date and time. The following example shows how to use them.
</p>
 
<h6 class="src">DateExample.java</h6>
<pre class="prettyprint">
package net.java_school.example.basic;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class DateExample {

  public static void main(String[] args) {
		
    Date date = new Date();

    //1.Date object's toString() call
    System.out.println("1: " + date);

    //2.JDK SimpleDateFormat
    SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    System.out.println("2-1: " + DATE_FORMAT1.format(date));

    SimpleDateFormat DATE_FORMAT2 = new SimpleDateFormat("yy/M/d H:m:s");
    System.out.println("2-2: " + DATE_FORMAT2.format(date));

    //3.joda-Time 
    DateTime dt = new DateTime(date);
    System.out.println("3-1: " + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth());

    DateTimeFormatter fmt1 = ISODateTimeFormat.dateTime();
    System.out.println("3-2: " + fmt1.print(dt));

    DateTimeFormatter fmt2 = DateTimeFormat.forPattern("yyyy.MM.dd HH:mm:ss");
    System.out.println("3-3: " + fmt2.print(dt));

    //4.apache FastDateFormat
    System.out.println("4-1: " + DateFormatUtils.ISO_DATETIME_FORMAT.format(date));
    System.out.println("4-2: " + DateFormatUtils.ISO_DATETIME_TIME_ZONE_FORMAT.format(date));
  }
}
</pre>

<pre class="console"><strong class="console-result">1: Mon Dec 07 15:44:55 KST 2015
2-1: 2015.12.07 15:44:55
2-2: 15/12/7 15:44:55
3-1: 2015/12/7
3-2: 2015-12-07T15:44:55.440+09:00
3-3: 2015.12.07 15:44:55
4-1: 2015-12-07T15:44:55
4-2: 2015-12-07T15:44:55+09:00</strong></pre>

<h3>TODO</h3>
<ol>
	<li>Modify the Account class to use an ArrayList instead of an array.</li>
	<li>Modify the Account class to avoid duplicate account number.</li>
</ol>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.joda.org/joda-time/">http://www.joda.org/joda-time/</a></li>
	<li><a href="http://www.joda.org/joda-time/userguide.html">joda-Time userguide</a></li>
	<li><a href="https://commons.apache.org/proper/commons-lang/">Apache Commons Lang</a></li>
	<li><a href="http://examples.javacodegeeks.com/core-java/apache/commons/lang3/date-andtime-format/">Date and Time format examples using Apache Commons Lang</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/javabank-inheritance"/>">Java bank - Inheritance</a></li>
    <li>Prev : <a href="<c:url value="/java/javabank-requirements-analysis"/>">Java bank - Requirements Analysis</a></li>
  </ul>
</div>
</article>