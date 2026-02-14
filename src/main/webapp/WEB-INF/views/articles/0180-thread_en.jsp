<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>Thread</h1>

<p>
Programs run sequentially from top to bottom, left to right. If you run the code along with a pencil, it will look like a thread. So the program execution flow is called a thread. So far, we have seen only single-threaded programs. In this article, I'll show you how to make a program that has more than two threads. Such a program is called a multi-thread program.
</p>

<p>
You can create a multi-threaded program by extending the Thread class or implementing the Runnable interface.
</p>

<h3>Single-threaded example</h3>

<h6 class="src">SingleThread.java</h6>
<pre class="prettyprint">
package net.java_school.thread.test;

public class SingleThread {
	
  public void doA() {
    char[] alphabet = {'A','B','C','D','E','F','G','H','I','J'};
    int length = alphabet.length;
    for ( int i=0; i &lt; length; i++ ) {
      System.out.print(alphabet[i]);
    }
  }

  public void doB() {
    for (int i = 0; i &lt; 10; i++) {
      System.out.print(i);
    }
  }
	
  public static void main(String[] args) {
    SingleThread st = new SingleThread();
    st.doA();
    st.doB();
  }
}
</pre>

<p>
DoA() and doB() are executed on the same thread. Therefore doB() is executed after doA() ends.
</p>

<h3>Multi-threaded example</h3>

<p>
Let's turn our example into a multi-threaded program.
</p>

<h4>How to create a multi-threaded program by extending the Thread class</h4>

<p>
Create a class that extends the Thread class.<br />
Override the run() method of the Thread class and make doA() and doB() methods in the class's body like below.
</p>

<h6 class="src">MultiThread1.java</h6>
<pre class="prettyprint">
package net.java_school.thread.test;

public class MultiThread1 extends Thread {

  public void doA() {
    char[] alphabet = {'A','B','C','D','E','F','G','H','I','J'};
    int length = alphabet.length;
    for ( int i = 0; i &lt; length; i++ ) {
      System.out.print(alphabet[i]);
      try {
        //Take 0.01 seconds to allow another thread to take control.
        Thread.sleep(10);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
	
  public void doB() {
    for (int i = 0; i &lt; 10; i++) {
      System.out.print(i);
      try {
        //Take 0.01 seconds to allow another thread to take control.
        Thread.sleep(10);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }

  <strong>@Override
  public void run() {
    doA();
  }</strong>
	
  public static void main(String[] args) {
    MultiThread1 mt1 = new MultiThread1();
    <strong>mt1.start();</strong>
    mt1.doB();
  }
}
</pre>

<p>
If you call the start() method after creating an object from this class, the JVM makes another thread and executes doA() called by the run() method on the thread. This thread is not where the method main is performed.
</p>

<h4>How to create a multi-threaded program by implementing the Runnable interface</h4>

<p>
Create a class that implements the Runnable interface.<br />
Implement the run() method of the Runnable interface and make doA() and doB() methods in the interface's body like below.
</p>

<h6 class="src">MultiThread2.java</h6>
<pre class="prettyprint">
package net.java_school.thread.test;

public class MultiThread2 implements Runnable {

  public void doA() {
    char[] alphabet = {'A','B','C','D','E','F','G','H','I','J'};
    int length = alphabet.length;
    for ( int i = 0; i &lt; length; i++ ) {
      System.out.print(alphabet[i]);
      try {
        //Take 0.01 seconds to allow another thread to take control.
        Thread.sleep(10);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
	
  public void doB() {
    for (int i = 0; i &lt; 10; i++) {
      System.out.print(i);
      try {
        //Take 0.01 seconds to allow another thread to take control.
        Thread.sleep(10);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
	
  <strong>@Override
  public void run() {
    doA();
  }</strong>
	
  public static void main(String[] args) {
    MultiThread2 mt2 = new MultiThread2();
    <strong>Thread t = new Thread(mt2);</strong>
    <strong>t.start();</strong>
    mt2.doB();
  }
}
</pre>

<p>
The highlighted part of the method main does the followings:
</p>

<ol>
	<li>Create an instance of the Runnable interface type</li>
	<li>Pass the runnable interface type instance as an argument to the constructor when creating a thread instance</li>
	<li>Call the Thread's start() method</li>
</ol>

<h3>Critical Section</h3>

<p>
A critical section is a piece of code that accesses a shared resource.<br />
Let's look at an example of the problems if a programmer doesn't handle the critical section properly. In the bank example, change the withdraw() method of NormalAccount as shown below. The change increases the probability that the account's balance becomes negative.
</p>

<pre class="prettyprint">
@Override
public void withdraw(double amount)  {
  <strong>try {
    Thread.sleep(5);
  } catch (InterruptedException e) {
    e.printStackTrace();
  }</strong>
	
  if (amount &lt;= balance) {
    Transaction transaction = new Transaction();
    Calendar cal = Calendar.getInstance();
    Date date = cal.getTime();
    transaction.setTransactionDate(Account.DATE_FORMAT.format(date));
    transaction.setTransactionTime(Account.TIME_FORMAT.format(date));
    transaction.setAmount(amount);
    transaction.setKind(Account.WITHDRAW);
    <strong>balance = balance - amount;</strong>
    transaction.setBalance(this.balance);
    transactions.add(transaction);
  } else {
    throw new InsufficientBalanceException("There is not enough balance.");	
  }
}
</pre>

<p>
Create a test class.
</p>

<pre class="prettyprint">
package net.java_school.bank;

public class ThreadTest extends Thread {
  private Bank bank = new MyBank();
  private Account account;
	
  public ThreadTest() {
    bank.addAccount("101", "Alison", Account.NORMAL);
    account = bank.getAccount("101");
    account.deposit(1000);
  }
	
  public void withdrawTest() {
    int i = 0;
    do {
      i++;
      try {
        account.withdraw(100);
      } catch (InsufficientBalanceException e) {}
      try {
        Thread.sleep(10);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    } while (i &lt; 100);
  }

  @Override
  public void run() {
    withdrawTest();
  }
	
  public static void main(String[] args){
    ThreadTest t = new ThreadTest();
    t.start();
    t.withdrawTest();
    Account account = t.bank.getAccount("101");
    System.out.println(account);
  }
}
</pre>

<p>
When you test several times, there is a case where the account's balance becomes negative.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Bank\bin&gt;java net.java_school.bank.ThreadTest
101|Alison|0|Normal
C:\java\Bank\bin&gt;java net.java_school.bank.ThreadTest
101|Alison|0|Normal
C:\java\Bank\bin&gt;java net.java_school.bank.ThreadTest
101|Alison|0|Normal
C:\java\Bank\bin&gt;java net.java_school.bank.ThreadTest
<span class="prompt-selection">101|Alison|-100|Normal</span>
</pre>

<p>
The cause of this problem is that the thread proceeds, as shown below.
</p>

<p>
<img src="<c:url value="/resources/images/critical-section-problem-en.png"/>" alt="This figure shows a case where the second thread enters the logic of comparing the withdrawal amount and the balance before the first thread corrects the balance." />
</p>

<p>
Add the synchronized keyword to the withdraw() method to solve the problem. Applying synchronized to a method prevents other threads from entering until the preceding thread leaves the method block.
</p>

<pre class="prettyprint">
@Override
public <strong>synchronized</strong> void withdraw(double amount)  {
  //.. Same as existing code ..
}
</pre>

<p>
Test to confirm that there is no longer a negative balance case in the account.<br />
As shown in the figure below, the second thread will not be able to enter the method until the first thread has left the method.
</p>

<p>
<img src="<c:url value="/resources/images/critical-section-sync-1-en.png"/>" alt="The figure shows that the first thread has entered the critical area and the second thread is proceeding just before the critical area." />
</p>

<p>
<img src="<c:url value="/resources/images/critical-section-sync-2-en.png"/>" alt="This figure shows that the first thread is almost passing through the critical area and the second thread is not yet in the critical area." />
</p>

<p>
<img src="<c:url value="/resources/images/critical-section-sync-3-en.png"/>" alt="This figure shows that the first thread has just passed the critical area and the second thread is not yet in the critical area." />
</p>

<p>
When the first thread goes out of the method, the waiting thread enters the method.
</p>

<p>
<img src="<c:url value="/resources/images/critical-section-sync-4-en.png"/>" alt="This figure shows that the first thread has passed the critical area and the second thread has just entered the critical area." />
</p>

<p>
Revert the withdraw() method to what it was before modification, as shown below.
</p>

<pre class="prettyprint">
@Override
public synchronized void withdraw(double amount)  {
  <strong>if (amount &gt; balance) {
    throw new InsufficientBalanceException("There is not enough balance.");	
  }
  balance = balance - amount;</strong>
  Transaction transaction = new Transaction();
  Calendar cal = Calendar.getInstance();
  Date date = cal.getTime();
  transaction.setTransactionDate(Account.DATE_FORMAT.format(date));
  transaction.setTransactionTime(Account.TIME_FORMAT.format(date));
  transaction.setAmount(amount);
  transaction.setKind(Account.WITHDRAW);
  transaction.setBalance(this.balance);
  transactions.add(transaction);
}
</pre>

<p>
Add the synchronized keyword to the deposit() method as well.
</p>

<pre class="prettyprint">
public <strong>synchronized</strong> void deposit(double amount) {
  //.. Same as existing code ..
}
</pre>

<p>
The Vector is thread-safe, but the ArrayList is not. All methods of Vector are synchronized.
</p>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/io"/>">Java I/O</a></li>
    <li>Prev : <a href="<c:url value="/java/javabank-interface"/>">Java bank - Interface</a></li>
  </ul>
</div>
</article>