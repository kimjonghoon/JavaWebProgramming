<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>자바은행 - 추상 클래스 적용</h1>

<p>
다음은 이클립스의 코드 어시스트 기능을 활용하여 사용자 정의 예외 클래스를 만드는 방법이다.<br />
그림처럼 작성한다.
</p>

<p>
<img alt="Using Eclipse Code Assistance 1" src="<c:url value="/resources/images/create-exception-with-eclipse.png"/>" style="display: block;">

<p>
메소드 바디에서 마우스 오른쪽 버튼을 클릭하여 컨텍스트 메뉴가 나타나게 한다.<br />
Source 와 Generate Constructors from SuperClass 메뉴를 차례로 선택하면 예외 클래스를 쉽게 만들 수 있다.
</p>

<p>
<img alt="Using Eclipse Code Assistance 2" src="<c:url value="/resources/images/source-generate-constructors-from-superclass.png"/>"  style="display: block;">
</p>

<h6 class="src">InsufficientBalanceException.java</h6>
<pre class="prettyprint">package net.java_school.bank;

public class InsufficientBalanceException extends RuntimeException {

  public InsufficientBalanceException() {
    super();
  }

  public InsufficientBalanceException(String message, Throwable cause) {
    super(message, cause);
  }

  public InsufficientBalanceException(String message) {
    super(message);
  }

  public InsufficientBalanceException(Throwable cause) {
    super(cause);
  }
}
</pre>

<p>
다음은 계좌번호가 중복될 때 사용할 예외 클래스다.
</p>

<h6 class="src">DuplicateAccountException.java</h6>
<pre class="prettyprint">package net.java_school.bank;

public class DuplicateAccountException extends RuntimeException {

  public DuplicateAccountException() {
    super();
  }

  public DuplicateAccountException(String message, Throwable cause) {
    super(message, cause);
  }

  public DuplicateAccountException(String message) {
    super(message);
  }

  public DuplicateAccountException(Throwable cause) {
    super(cause);
  }
}
</pre>

<p>
예제에선 문자열 인자를 가지는 생성자만 사용한다.<br />
따라서 다음처럼 간단히 만들 수 있다.
</p>

<h6 class="src">InsufficientBalanceException.java</h6>
<pre class="prettyprint">package net.java_school.bank;

public class InsufficientBalanceException extends RuntimeException {

  public InsufficientBalanceException(String message) {
    super(message);
  }
}
</pre>

<h6 class="src">DuplicateAccountException.java</h6>
<pre class="prettyprint">package net.java_school.bank;

public class DuplicateAccountException extends RuntimeException {

  public DuplicateAccountException(String message) {
    super(message);
  }
}
</pre>

<h3>과제</h3>

<p>
두 예외 클래스를 은행 예제에 적용시킨다.
</p>

<h3>추상 클래스 적용</h3>

<p>
마이너스 계좌뿐 아니라 성격이 다른 계좌가 프로그램에 추가될 수 있다.<br />
일반 계좌로 사용했던 Account 클래스를 추상 클래스로 수정하고, 일반 계좌와 마이너스 계좌를 Account 추상 계좌 클래스를 상속하도록 변경한다.<br />
새로운 종류의 계좌가 더 필요하다면 Account 추상 계좌 클래스를 상속하여 만든다.<br />
</p>

<p>
계좌(Account) 클래스를 추상 클래스로 변경한다.<br />
출금 메소드 withdraw()를 추상 메소드로 변경한다.
</p>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">public <strong>abstract</strong> class Account {
  private String accountNo;
  private String name;
  protected double balance;
  protected List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();

  static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
  static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
  static final String DEPOSIT = "입금";
  static final String WITHDRAW = "출금";
  static final NumberFormat NUMBER_FORMAT = NumberFormat.getInstance();

  //.. 중간 생략 ..
            
  <strong>public abstract void withdraw(double amount);</strong>

  //.. 중간 생략 ..
    
  <strong>public String getKind():</strong>

  //.. 중간 생략 ..
}
</pre>

<h6 class="src">NormalAccount.java</h6>
<pre class="prettyprint">package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class NormalAccount extends Account {
  <strong>static final String KIND = "일반";</strong>

  public NormalAccount() {}

  public NormalAccount(String accountNo, String name) {
    super(accountNo, name);
  }

  public NormalAccount(String accountNo, String name, double balance) {
    super(accountNo, name, balance);
  }
    
  @Override
  public void withdraw(double amount)  {
    <strong>if (amount &gt; balance) {</strong>
      <strong>throw new InsufficientBalanceException("잔액이 부족합니다.");</strong>
    <strong>}</strong>
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

  <strong>@Override</strong>
  <strong>public String getKind() {</strong>
    <strong>return KIND;</strong>
  <strong>}</strong>
}
</pre>

<h6 class="src">MinusAccount.java</h6>
<pre class="prettyprint">package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class MinusAccount extends Account {
  <strong>static final String KIND = "마이너스";</strong>
    
  public MinusAccount() {}

  public MinusAccount(String accountNo, String name) {
    super(accountNo, name);
  }

  public MinusAccount(String accountNo, String name, double balance) {
    super(accountNo, name, balance);
  }
    
  @Override
  public void withdraw(double amount) {
    <strong>balance = balance - amount;</strong>
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
        
  <strong>@Override</strong>
  <strong>public String getKind() {</strong>
    <strong>return KIND;</strong>
  <strong>}</strong>
}
</pre>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">public class Bank {
 
  //..중간 생략..

  @Override
  public void addAccount(String accountNo, String name) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null ) throw new DuplicateAccountException("중복된 계좌입니다.");</strong>
      accounts.add(new NormalAccount(accountNo, name));
    }

  @Override
  public void addAccount(String accountNo, String name, double balance) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null ) throw new DuplicateAccountException("중복된 계좌입니다.");</strong>
    accounts.add(new NormalAccount(accountNo, name, balance));

  }

  public void addAccount(String accountNo, String name, String kind) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");</strong>
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name));
    } else {
      accounts.add(new NormalAccount(accountNo, name));
    }
  }
    
  public void addAccount(String accountNo, String name, double balance, String kind) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");</strong>
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name, balance));
    } else {
      accounts.add(new NormalAccount(accountNo, name, balance));
    }
  }
  //.. 중간 생략 ..  
}
</pre>

<div id="next-prev">
  <ul>
    <li>다음 : <a href="<c:url value="/java/javabank-interface"/>">자바은행 - 인터페이스 적용</a></li>
    <li>이전 : <a href="<c:url value="/java/javabank-inheritance"/>">자바은행 - 상속 적용</a></li>
  </ul>
</div>
</article>