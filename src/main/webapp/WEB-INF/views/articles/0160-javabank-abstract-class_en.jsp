<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>Java bank - Abstract class</h1>

<p>
Extend RuntimeException to create an exception class.<br />
We will use this when withdrawing more than the balance.
</p>

<p>
<img alt="Custom Exception 1" src="<c:url value="/resources/images/create-exception-with-eclipse.png"/>" />
</p>

<p>
Right-click on a space in the Eclipse editor view to display the context menu.<br />
Select the "Source and Generate Constructors from SuperClass ..." to create constructors.
</p>

<p>
<img alt="Custom Exception 2" src="<c:url value="/resources/images/source-generate-constructors-from-superclass.png"/>" />
</p>

<h6 class="src">InsufficientBalanceException.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

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
Create an exception class to use when registering an account with an existing account number in the same way as above.
</p>

<h6 class="src">DuplicateAccountException.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

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
In the example, we use only constructors with string arguments.
So, you can shorten it like this:
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

<p>
By modifying the Account class to an abstract class, you can create different kinds of account classes by extending this abstract account class.
</p>

<p>
Change the Account class to an abstract class and the withdraw() to an abstract method.
</p>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">public <strong>abstract</strong> class Account {
  private String accountNo;
  private String name;
  protected double balance;
  protected List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();
	
  static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
  static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
  static final String DEPOSIT = "Deposit";
  static final String WITHDRAW = "Withdrawal";
  static final NumberFormat NUMBER_FORMAT = NumberFormat.getInstance();

  //.. Omitted ..
            
  <strong>public abstract void withdraw(double amount);</strong>

  //.. Omitted ..

  <strong>public abstract String getKind();</strong>

  //.. Omitted ..
}
</pre>

<p>
Generate a standard account that does not allow a negative balance.
</p>

<h6 class="src">NormalAccount.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class NormalAccount extends Account {
  <strong>static final String KIND = "Normal";</strong>

  public NormalAccount() {}
	
  public NormalAccount(String accountNo, String name) {
    super(accountNo, name);
  }

  public NormalAccount(String accountNo, String name, double balance) {
    super(accountNo, name, balance);
  }
	
  @Override
  public void withdraw(double amount)  {
    <strong>if (amount &gt; balance) {
      throw new InsufficientBalanceException("There is not enough balance.");
    }</strong>
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

<p>
Modify the minus account class to extend the abstract account class.
</p>

<h6 class="src">MinusAccount.java</h6>
<pre class="prettyprint">package net.java_school.bank;

import java.util.Calendar;
import java.util.Date;

public class MinusAccount extends Account {
  <strong>static final String KIND = "Minus";</strong>

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

<p>
Modify the Bank class as below.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">public class Bank {

  //.. Omitted ..  

  @Override
  public void addAccount(String accountNo, String name) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("Duplicated account.");</strong>
      accounts.add(new NormalAccount(accountNo, name));
    }

  @Override
  public void addAccount(String accountNo, String name, double balance) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("Duplicated account.");</strong>
    accounts.add(new NormalAccount(accountNo, name, balance));

  }

  public void addAccount(String accountNo, String name, String kind) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("Duplicated account.");</strong>
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name));
    } else {
      accounts.add(new NoramlAccount(accountNo, name));
    }
  }
    
  public void addAccount(String accountNo, String name, double balance, String kind) {
    Account account = this.getAccount(accountNo);
    <strong>if (account != null) throw new DuplicateAccountException("Duplicated account.");</strong>
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name, balance));
    } else {
      accounts.add(new NoramlAccount(accountNo, name, balance));
    }
  }
  //.. Omitted ..  
}
</pre>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/javabank-interface"/>">Javabank - Interface</a></li>
    <li>Prev : <a href="<c:url value="/java/javabank-inheritance"/>">Javabank - Inheritance</a></li>
  </ul>
</div>
</article>