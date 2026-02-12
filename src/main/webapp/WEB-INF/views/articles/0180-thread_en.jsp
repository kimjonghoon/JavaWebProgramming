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
<img src="https://lh3.googleusercontent.com/u2lGWJho1Cv2tbO7JP28enAwzAuPunQ7pU_y1hGsVnYroCHdmOSnLDy_fqBIqKnC6EAYbN6kAJPGr8P5o6h5pgX-AYKGTpY-jyXFAnDh0Om_cWBwD5ig1VpwSMAa59B1CGDagCAU8C5Dp2LsZBIUW9RcqQ2vqi9buQOgl6pKYFg4K7iJ-zFrUMiJBYYOcYar2CWWe2rLxtASSOSteok14Uw-KD2TMoczmJqFqfsvOxBNCvuZMjQG2QwPF1vwfDAiQ_Brr38KrMB28ymnWkSqEopAGoR0o0nPWiKnFZ88wIBntPwX1ueFCvD3UXtYxLaFfcNGicEs9x_MQBzS5bZzru-zDzo0vW9x80RK0bs3HIVXPumanqUFiDOsRoPUd-duncwHLoWL_0VEQsjO_sUbTKyOAdTrytuIepezcEeTVr2Vvci80OGAeE4tChtJUdjFsxvvUh6Fh_baY403ayCwBwfYmpXszzFo8kXLgKT5lL75OgDmBjNg8oglrfCxbyZFgu1GIO7h5wKb3gTjR30MfSTgSU4jy1dDCfqNh8ej9CGPqyfsVLIN663W8VOOuNPgWT39KbCH-XS5hUE5PRXlvYPuE5mCjDzug58dXq5buCjsNZrUIyH93W0_aD8hwaFO4sfwLLhJYzQlMplIKwcTT_7ukQRlYa8cLQTIOQ6jv_a2VqrQHfH6Skc=w609-h496-no" alt="This figure shows a case where the second thread enters the logic of comparing the withdrawal amount and the balance before the first thread corrects the balance." />
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
<img src="https://lh3.googleusercontent.com/lRlx2TRC_vZ2LbjvtfjmRIz7UIZyB3OZv2I5uBUp9foDcN4q8avdxEEI8HZvUUlLMAak524woIEy7DyGaFdA2LpwrjoibNDc__tVrHhzxr8Iex5_2oEsaihQbEPbyIVW7yRjLsqCHXuwCd9258fMVZbtgUGaCXU_G9WUgn9kvSIB-4w0GoyEjW7-K-s-jDbDy2skehZvkEPMK27l-cxIWO1wCDgTMRTcEcKmv0cOEbqrumRchy90lhtiIOLEskJ3ER2k1a_Gcoqyytf9Hgrci4RTNFx5KVS5tD6GmnvDPL-cyrHCRWCo2_kFOpvkz15zgwmXxnYJ8bbQOT5mzxxrJZAF1BgKl3HKfKAa1aDoH_KsctbMvawNuPAwG9VXYGb4JznZn7_54ngHMHIDkkdZl-GNjJdqtJguBnCPzLFLJh_NXL8mNP6QmJcEKqrBYYvE5JkrUFOD2QuMWxiV5P7afhl5Wet5CB4E5zQKT6p1wuQDMAyYB1Sci7L_yZyRiepg86S5pH5dogE872PnF2Scb3jF0n3rjmHgNIuYmT9DKozcujdtDSyU-vADTJIt7nnJACeuYQyLcH-tKGPgh4h4ATJoOTa5k5-QksFAwJjq5EZWGry2aZEKLsG8lvpz9_c_susT0qWo96BLLNoqGmUZs_e3hO8TDQmB4_Nb4uV0HaHQeeD2RhJOt9w=w609-h496-no" alt="The figure shows that the first thread has entered the critical area and the second thread is proceeding just before the critical area." />
</p>

<p>
<img src="https://lh3.googleusercontent.com/ADS46RpdDYKobkT3GyfBzu4pSP2XIVVmw-nfVHOnJxrCDus7ht7ruD5Chc4Gk0hD09HtnZkeQrUHa0qxo6zPSXtlw3aVgK4cmbqPqK3VTovTCl7qBNwM2SDFsikGG4Z7rgwBz9538vRCRW-WCtN0yzOcNYFzgvVz51hAYVMOOlScFMoVO4Z5mrEmSMtVbOXBaqUjILxq9_f-sG6yyMVL4yf8yjYH64xi7qAVOsgUh-e-F6jtybbhDgJAHlJuC5WixN5ent5COogH5OZW_RGakwXaJD4DBa_rnNAoQ6VBXv49MvwYKkm6021XEMaMEYpa46HMck34EeouT-TAdFcHkst-LpyyQiXWHSNuzIDykt6P2IjFbfV0VheMeDdfmHSmaVYLit6ig2BLTCzNSurwnxFa4-AmCFfWrR4UbTo32JwzjlN6jMNmpxEVflI6QHaEEc1uXGdk37rA7fZtVW3LAF2-Qoly2r52W4luWv9XRz2uijU4g8i0pjDuVx4oAy4RXqOee5OwRdCIT8iV5JnGWqfg4OztHbFIAVIuCLJdScMXc-diYwmV5l1GUmwZMnuVAXDS8Lm2hhliC-d22MowSp2jF2N_3oHiVsUcX-sShLzT0R0jK6nQP7ncJaDhOVY2AEpDc0TnlQs5yDTmEDLrXGm0MSApKdjU2rL5qf2unMpAQxtx8q1uzyk=w609-h496-no" alt="This figure shows that the first thread is almost passing through the critical area and the second thread is not yet in the critical area." />
</p>

<p>
<img src="https://lh3.googleusercontent.com/9OFqWE8e7_vRD9r76qcgYA_3Vnroeal-o95j8nZqm_2xZxw54Ew8afPsWxfwt-dO4UxNEVTJYAFu4itJrFj77HpTaXStsECJxzKOunKlIAcKWZxZ5SFTaKWWVJEnbNgsbDcX81XadlotK310O4CJoTRj3sST9jlB9LgPeCc6N7qcCMcEwL0woFTwjTU9DKafsgkiZDXzBYumOg9j7nM7rXpr1YBKlevDbo2IiFZWcf1owG5ITb2SEv9NL9gUN3pIlesgfby7bnXH9Y7yhsm0jCscoLQJPr2n-ilxzhmDavBzdpoGSIYb0YMxE7nKah85e00kHUNaU_lG4vNVonq6Ad6-pJwqQQ6kMCW-8LTSMlWDj1zBbI8h7WzvbwWY5zLxfehvLz3oa2z_QkESy4xQhPz2jnkMdkObZsCDPtJhz9zr1ZecNbJXQNmNvSssh5VkT0BHx2COjix5JkU_130-cZJ-PTHCsgBXLR4iAqyWqOzL3mbUN2LPlBcDcGWsl_DNsvxcQwD5iOVM8XT7swEuPynMSSsdGOEsItkDRvXOj0ozKSHbYsz_66ukuAEJC9hJel_iSjAyzxfI9AhyrMfgJhqrtqdg6706GWnTBy4rL2BzmzRPd1-4WC9noRZyzjg3AcTH57mPmuQDpaU9ClPZplBzMCkbd1YAgN23RuSTAmURthj3dOZ6IbU=w609-h496-no" alt="This figure shows that the first thread has just passed the critical area and the second thread is not yet in the critical area." />
</p>

<p>
When the first thread goes out of the method, the waiting thread enters the method.
</p>

<p>
<img src="https://lh3.googleusercontent.com/WFUvgcsy3IOcHiEi1iQpgy1qW0tS-EGgfj80oK25Mhu00cEB1KvXH1gXEWXXtXFt1ofTK92yaQAHi_tmjV1Xy1WLitm7eF8fyuLJXd9a620QY1oRQqdtiLXFtn70GT9xUdegBUjny4WyTBTEUYTzkQ3PUzGCpuppWP5kSqDFdB1f_kHzdLJ9PnnN-MdF4vhj4wssG7uMKmGcnP4CxXSeYiWq0pz8YzhMvuETav_ev9A8_brV2ZuH8_HEkgt8nYguixd0Huh4o_fA_oCBFv0ILmEunPy85GWBCLywfrQXLN10NM07pMDpmtS7iTu9VRfDL2VnA2jRQ_mnEKkBhVL_ResGC2p7Xqg_wnUxfAxq8Fg4SWwuoMFeQ0RLOrwE5SoXBz275j9mNj1JAr-OUWuyHW57x9MDorpgv0J6tBHNy4VoyHkd9OYpDFyGWtkPfx1RPUcE-aCyEwn_zv8N1FAW2XL4jzcm-0rmN1MRb1WqHk4ukj78j0X9rZD5wt5e5XZhbuVSrD-Dk07NC83kM5M5f_UHSzXanqcQ1iApFBidy5kSq1L_AeC2z60-VUaPPRFsanbSdmqoQG_KyfwmE5Gax9D42svm2TXPEyymo9QoLSPYCyumXCK9mZHQ2SW1pH0DT4CHit-aSHU5wM0W1wJfNB9VIvOV_oM3iw-aHu7TejT2T5MrHEAdHws=w609-h496-no" alt="This figure shows that the first thread has passed the critical area and the second thread has just entered the critical area." />
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

</article>