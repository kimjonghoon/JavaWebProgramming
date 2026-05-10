<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>자바은행 - 인터페이스 적용</h1>

<p>
인터페이스는 컴포넌트 기능을 정의한다고 했다.<br />
Bank 클래스를 은행 컴포넌트 기능을 정의하는 인터페이스로 수정한다.<br />
Bank.java를 열고 File - Save As 메뉴를 선택하여 MyBank.java로 저장하고 컴파일 오류를 수정한다.
Bank.java를 다시 열고 아래와 같이 수정한다.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">package net.java_school.bank;

import java.util.List;

public interface Bank {
        
  //계좌를 생성한다.
  publlic void addAccount(String accountNo, String name);

  //계좌를 생성한다.
  publlic void addAccount(String accountNo, String name, double balance);

  //계좌를 생성한다.
  public void addAccount(String accountNo, String name, String kind);

  //계좌를 생성한다.
  public void addAccount(String accountNo, String name, double balance, String kind);
    
  //계좌번호로 계좌를 찾는다.
  public Account getAccount(String accountNo);
    
  //소유자명으로 계좌를 찾는다.
  public List&lt;Account&gt; findAccountByName(String name);
    
  //모든 계좌를 반환한다.
  public List&lt;Account&gt; getAccounts();
}
</pre>

<p>
MyBank.java 파일을 열고 강조된 부분을 참고하여 수정한다.
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
    if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");
    accounts.add(new NormalAccount(accountNo, name));
  }

  <strong>@Override</strong>
  public void addAccount(String accountNo, String name, double balance) {
    Account account = getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");
    accounts.add(new NormalAccount(accountNo, name, balance));
  }

  <strong>@Override</strong>
  public void addAccount(String accountNo, String name, String kind) {
    Account account = this.getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");
    if (kind != null &amp;&amp; kind.equals("-")) {
      accounts.add(new MinuslAccount(accountNo, name));
    } else {
      accounts.add(new NormalAccount(accountNo, name));
    }
  }

  <strong>@Override</strong>
  public void addAccount(String accountNo, String name, double balance, String kind) {
    Account account = this.getAccount(accountNo);
    if (account != null) throw new DuplicateAccountException("중복된 계좌입니다.");
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
메인 메소드의 다음 부분만 수정하면 테스트할 수 있다. 
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">Bank bank = <strong>new MyBank();</strong>
</pre>

<div id="next-prev">
  <ul>
    <li>다음 : <a href="<c:url value="/java/thread"/>">스레드</a></li>
    <li>이전 : <a href="<c:url value="/java/javabank-abstract-class"/>">자바은행 - 추상 클래스 적용</a></li>
  </ul>
</div>

</article>