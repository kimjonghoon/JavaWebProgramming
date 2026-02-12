<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Java bank - Interface</title>
<meta name="Keywords" content="java bank,interface" />
<meta name="Description" content="This article describes how to use the interface" />
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
	
<h1>Java bank - Interface</h1>

<p>
The interface defines the functionality of the component.<br />
Modify the current bank class into an interface that defines the functionality of the bank component and create a class called MyBank as an implementation that implements the Bank interface.
</p>

<p>
Open Bank.java and select the "File - Save As ..." menu to save it as MyBank.java and fix the compilation error.<br />
Reopen Bank.java and modify it as shown below.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

public interface Bank {
	
  //Create an account.
  public void addAccount(String accountNo, String name);

  //Create an account.
  public void addAccount(String accountNo, String name, double balance);

  //Create an account.
  public void addAccount(String accountNo, String name, String kind);

  //Create an account.
  public void addAccount(String accountNo, String name, double balance, String kind);

  //Find the account by account number.
  public Account getAccount(String accountNo);

  //Find the account by owner name.
  public List&lt;Account&gt; findAccountByName(String name);

  //Return all accounts.
  public List&lt;Account&gt; getAccounts();
}
</pre>

<p>
Modify the MyBank class.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">package net.java_school.bank;

import java.util.ArrayList;
import java.util.List;

public class MyBank <strong>implements Bank</strong> {
  private List&lt;Account&gt; accounts = new ArrayList&lt;Account&gt;();

  <strong>@Override</strong>    
  public void addAccount(String accountNo, String name) {
    Account account = getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("Duplicated account.");
    accounts.add(new NormalAccount(accountNo, name));
  }

  <strong>@Override</strong>    
  public void addAccount(String accountNo, String name, double balance) {
    Account account = getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("Duplicated account.");
    accounts.add(new NormalAccount(accountNo, name, balance));
  }

  <strong>@Override</strong>    
  public void addAccount(String accountNo, String name, String kind) {
    Account account = getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("Duplicated account.");
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name));
    } else {
      accounts.add(new NormalAccount(accountNo, name));
    }
  }
    
  <strong>@Override</strong>    
  public void addAccount(String accountNo, String name, double balance, String kind) {
    Account account = getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("Duplicated account.");
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinusAccount(accountNo, name, balance));
    } else {
      accounts.add(new NormalAccount(accountNo, name, balance));
    }
            
  }

  <strong>@Override</strong>    
  public Account getAccount(String accountNo) {
    int totalAccount = accounts.size();
    for (int i = 0; i &lt; totalAccount; i++) {
      if (accountNo.equals(accounts.get(i).getAccountNo())) {
        return accounts.get(i);
      }
    }

    return null;
  }

  <strong>@Override</strong>    
  public List&lt;Account&gt; findAccountByName(String name) {
    List&lt;Account&gt; matched = new ArrayList&lt;Account&gt;();
    int totalAccount = accounts.size();
    for (int i = 0; i &lt; totalAccount; i++) {
      if (name.equals(accounts.get(i).getName())) {
        matched.add(accounts.get(i));
      }
    }
        
    return matched;
  }

  <strong>@Override</strong>    
  public List&lt;Account&gt; getAccounts() {
    return accounts;
  }
}
</pre>

<p> 
Modify the main() of the test class.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint no-border">Bank bank = <strong>new MyBank();</strong>
</pre>

</article>

</body>
</html>
