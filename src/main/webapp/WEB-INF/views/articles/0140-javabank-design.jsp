<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>자바은행 - 구현</h1>

<p>
분석 작업의 결과물인 클래스 다이어그램을 토대로 각각의 클래스를 작성한다.
먼저 입출금 명세 클래스를 작성한다.
클래스 다이어그램에서 toString() 메소드가 추가되었다.
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
다음으로 계좌 클래스를 작성한다.
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
  static final String DEPOSIT = "입금";
  static final String WITHDRAW = "출금";

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

<p>
다음은 클래스 다이어그램과 차이가 나는 부분이다.<br />
private Transaction[] transactions = new Transaction[100];<br />
크기 100은 임의로 지정했다.<br />
자바의 배열은 길이를 정하지 않고 생성할 수 없기 때문이다.
</p>

<p>
private int totalTransaction;은 transactions 배열에 값을 순서대로 넣기 위해 추가했다.<br />
4개의 스태틱 상수를 추가했다.<br />
DATE_FORMAT은 거래 내용의 날자 포맷을, TIME_FORMAT은 거래 내용의 시간 포맷을 저장하고, DEPOSIT는 입금, WITHDRAW는 출금이라는 문자열을 저장한다.
</p>

<p>
생성자 3개를 추가했다.<br />
디폴트 생성자와, 계좌번호와 소유자 명을 전달받는 생성자와 계좌번호와 소유자명과 잔액을 전달받는 생성자다.
</p>

<p>
출력을 간편하게 하려고 toString() 메소드를 오버라이딩했다.<br />
다음은 은행 클래스다.
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

<p>
private Account[] accounts = new Account[10];<br />
accounts 배열 크기를 10으로 지정했다. 이로써 은행은 최대 10개의 계좌를 관리할 수 있다.<br />
totalAccount 인스턴스 변수는 총 계좌 수를 저장할 변수로 배열 변수 accounts에 값을 순서대로 넣기 위해 사용된다.<br />
findAccountByName() 메소드는 소유자 명으로 계좌를 찾는 메소드이다.<br />
소유자 이름이 같은 계좌가 있을 수 있으므로 반환 타입은 Account[]이다.<br />
findAccountByName() 메소드는 조건에 맞는 계좌를 찾은 다음에, 찾은 계좌 수 크기만큼 배열 요소를 가지는 배열을 만들고 찾은 계좌를 배열에 넣은 후 배열을 반환한다.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

public class Test {
  static final String ACCOUNTS_HEADING = "계좌번호|소유자명|잔액";
  static final String TRANSACTIONS_HEADING = "거래일|거래시간|입/출금|거래금액|잔액";

  public static void main(String[] args) {

    //테스트 계좌를 추가한다.
    Bank bank = new Bank();
    bank.addAccount("101", "홍길동");
    bank.addAccount("202", "임꺽정");
    bank.addAccount("303", "장길산");
    bank.addAccount("404", "홍길동");
        
    //1. 총계좌목록을 출력한다.
    System.out.println("1. 총계좌목록을 출력한다.");
    Account[] accounts = bank.getAccounts();
    int totalAccount = bank.getTotalAccount();
    System.out.println(ACCOUNTS_HEADING);
    for (int i = 0; i &lt; totalAccount; i++) {
      System.out.println(accounts[i]);
    }

    System.out.println();
       
    //2. 101계좌에 10,000원을 입금한다.
    System.out.println("2. 101계좌에 10,000원을 입금한다.");
    Account hong = bank.getAccount("101");
    hong.deposit(10000);
    System.out.println(ACCOUNTS_HEADING);
    System.out.println(hong);

    System.out.println();
        
    //3. 101계좌에 5,000원을 출금한다.
    System.out.println("3. 101계좌에서 5,000원을 출금한다.");
    hong.withdraw(5000);
    System.out.println(ACCOUNTS_HEADING);
    System.out.println(hong);

    System.out.println();
        
    //4. 101계좌 거래 내용을 출력한다.
    System.out.println("4. 101계좌 거래 내용을 출력한다.");
    Transaction[] transactions = hong.getTransactions();
    int totalTransaction = hong.getTotalTransaction();
    System.out.println(TRANSACTIONS_HEADING);
    for (int i = 0; i &lt; totalTransaction; i++) {
      System.out.println(transactions[i]);
    }

    System.out.println();
        
    //5. 고객명으로 계좌를 찾는다.
    System.out.println("5. 고객명으로 계좌를 찾는다");
    Account[] matched = bank.findAccountByName("홍길동");
    System.out.println(ACCOUNTS_HEADING);
    for (Account account : matched) {
      System.out.println(account);
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">1. 총계좌목록을 출력한다.
계좌번호|소유자명|잔액
101|홍길동|0
202|임꺽정|0
303|장길산|0
404|홍길동|0

2. 101계좌에 10,000원을 입금한다.
계좌번호|소유자명|잔액
101|홍길동|10000

3. 101계좌에서 5,000원을 출금한다.
계좌번호|소유자명|잔액
101|홍길동|5000

4. 101계좌 거래 내용을 출력한다.
거래일|거래시간|입/출금|거래금액|잔액
2020/12/16|14:20:47|입금|10000|10000
2020/12/16|14:20:47|출금|5000|5000

5. 고객명으로 계좌를 찾는다.
계좌번호|소유자명|잔액
101|홍길동|5000
404|홍길동|0</strong></pre>

<h2>날짜와 시간</h2>

<p>
자바는 날짜와 시간을 다루기 위해 다음 두 클래스를 제공한다.
</p>

<ul>
	<li>java.util.Date</li>
	<li>java.util.Time</li>
</ul>

<p>
joda-Time이나 아파치 프로젝트인 FastDateFormat과 같은 외부 라이브러리도 많이 사용된다.
</p>
 
<h6 class="filename">DateExample.java</h6>
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

<h3>과제</h3>
<ol>
	<li>배열은 모두 ArrayList로 변경한다.</li>
	<li>중복된 계좌번호가 생성되지 않도록 한다.</li>
	<li>금액 표시는 1,000,000 같이 세 자리마다 ,(콤마)를 표시한다.</li>
</ol>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://www.joda.org/joda-time/">http://www.joda.org/joda-time/</a></li>
	<li><a href="http://www.joda.org/joda-time/userguide.html">joda-Time userguide</a></li>
	<li><a href="https://commons.apache.org/proper/commons-lang/">Apache Commons Lang</a></li>
	<li><a href="http://examples.javacodegeeks.com/core-java/apache/commons/lang3/date-andtime-format/">Date and Time format examples using Apache Commons Lang</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>다음 : <a href="<c:url value="/java/javabank-inheritance"/>">자바은행 - 상속 적용</a></li>
    <li>이전 : <a href="<c:url value="/java/javabank-requirements-analysis"/>">자바은행 - 요구사항 분석</a></li>
  </ul>
</div>
</article>