<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>자바은행 - 상속</title>
<meta name="Keywords" content="자바은행,java bank,상속,Inheritance" />
<meta name="Description" content="상속을 사용하는 방법을 설명합니다" />
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
	
<h1>자바은행 - 상속 적용</h1>

<p>
프로그램에 새로운 요구 사항이 생겼다.<br />
잔액이 음수여도 되는 계좌가 필요하다고 한다.<br />
상속을 적용하면 기존 계좌를 슈퍼 클래스로, 잔액이 음수여도 되는 계좌를 서브 클래스로 둘 수 있다.<br />
잔액이 음수가 가능한 계좌를 마이너스 계좌라고 부른다면, 마이너스 계좌는 슈퍼 클래스인 계좌 클래스의 출금 메소드인 withdraw()만 오버라이딩하면 된다.<br />
은행 클래스의 계좌를 생성하는 메소드, addAccount(String accountNo, String name, double balance)는 생성할 계좌가 일반 계좌인지 마이너스 계좌인지를 판단해야 한다.<br />
그러기 위해서는 파라미터가 추가로 필요하다.<br />
kind 파라미터를 추가하고, 마이너스 계좌를 생성할 때 이 파라미터에 대시 (-) 문자를 넘기도록 한다.<br />
마이너스 계좌 클래스를 MinusAccount로 이름 짓는다면 은행의 addAccount() 메소드는 다음과 같이 구현할 수 있다.
</p>

<pre class="prettyprint">public void addAccount(String accountNo, String name, double balance, <strong>String kind</strong>) {
  Account account = this.getAccount(accountNo);
  if (account == null) {
    if (kind != null &amp;&amp; kind.equals(<strong>"-"</strong>) {
      accounts.add(new MinusAccount(accountNo, name, balance));
    } else {
      accounts.add(new Account(accountNo, name, balance));
    } 
  }
}
</pre>

<p>
상속을 적용하여 기존 예제를 수정한다.
</p>

<h6 class="src">Account.java</h6>

<pre class="prettyprint">package net.java_school.bank;

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
    
  <strong>static final String KIND = "일반";</strong>//일반 계좌
  static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
  static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
  static final String DEPOSIT = "입금";
  static final String WITHDRAW = "출금";
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
    
  public double getBalance() {
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

  <strong>public String getKind() {</strong>
    <strong>return KIND;</strong>
  <strong>}</strong>
    
  @Override
  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append(accountNo);
    sb.append("|");         
    sb.append(name);
    sb.append("|");
    <strong>sb.append(NUMBER_FORMAT.format(balance));</strong>
    <strong>sb.append("|");</strong>
    <strong>sb.append(getKind());</strong>
                
    return sb.toString();
  }

}
</pre>

<p>
거래내용 클래스는 toString() 메소드의 강조된 부분만 변경한다.
</p>

<pre class="prettyprint">@Override
public String toString() {
  StringBuilder sb = new StringBuilder();
  sb.append(this.transactionDate);
  sb.append("|");
  sb.append(this.transactionTime);
  sb.append("|");
  sb.append(this.kind);
  sb.append("|");
  <strong>sb.append(Account.NUMBER_FORMAT.format(amount));</strong>
  sb.append("|");
  <strong>sb.append(Account.NUMBER_FORMAT.format(balance));</strong>
  
  return sb.toString();
}
</pre>

<p>
다음은 마이너스 계좌 클래스다.
</p>

<pre class="prettyprint">package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class MinusAccount <strong>extends Account</strong> {
  <strong>static final String KIND = "마이너스";</strong>//마이너스 계좌

  public MinusAccount() {}

  public MinusAccount(String accountNo, String name) {
    super(accountNo, name);
  }

  public MinusAccount(String accountNo, String name, double balance) {
    super(accountNo, name, balance);
  }
    
  <strong>@Override</strong>
  <strong>public String getKind() {</strong>
    <strong>return KIND;</strong>
  <strong>}</strong>

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

<p>
다음은 은행 클래스다.
</p>

<pre class="prettyprint">package net.java_school.bank;

import java.util.ArrayList;

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
    int totalAccount = accounts.size();
    for (int i = 0; i &lt; totalAccount; i++) {
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

<p>
테스트 클래스에 강조된 부분을 추가한 후 실행한다.
</p>

<pre class="prettyprint">package net.java_school.bank;

import java.util.List;

public class Test {
  static final String ACCOUNTS_HEADING = "계좌번호|소유자명|잔액<strong>|계좌종류</strong>";
  static final String TRANSACTIONS_HEADING = "거래일|거래시간|입/출금|거래금액|잔액";

  public static void main(String[] args) {

    //테스트 계좌를 추가한다..
    Bank bank = new Bank();
    bank.addAccount("101", "홍길동");
    bank.addAccount("202", "임꺽정");
    bank.addAccount("303", "장길산");
    bank.addAccount("404", "홍길동", <strong>"-"</strong>);
        
    //..생략..

    <strong>System.out.println();</strong>

    <strong>//6. 마이너스 계좌 404에서 5000원을 출금한다.</strong>
    <strong>System.out.println("6. 마이너스 계좌 404에서 5000원을 출금한다.");</strong>
    <strong>Account minus = bank.getAccount("404");</strong>
    <strong>minus.withdraw(5000);</strong>
    <strong>System.out.println(ACCOUNTS_HEADING);</strong>
    <strong>System.out.println(minus);</strong>
  }

}
</pre>

<pre class="console"><strong class="console-result">6. 마이너스 계좌 404에서 5000원을 출금한다.
계좌번호|소유자명|잔액|계좌종류
404|홍길동|-5,000|마이너스</strong></pre>

<p>
다음 예외 클래스를 만들어서 적용해 보자.
</p>

<ul>
  <li>중복된 계좌 - DuplicateAccountException</li>
  <li>잔액부족 - InsufficientBalanceException</li>
</ul>

<span id="refer">참고</span>
<ul id="references">
	<li>New 알기쉬운 자바2(개정판) 저자: 김철회 출판사: 정보문화사</li> 
</ul>

</article>

</body>
</html>
