<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article>
<div class="last-modified">Last Modified 2020.1.30</div>

<h1>리플렉션</h1>

<p>
리플렉션은 자바 프로그래밍 언어의 특징이다.
리플렉션은 실행 중인 프로그램이 자기 자신을 검사하고 프로그램의 내부 속성을 조작할 수 있게 한다.
프로그램이 자기 자신을 검사하고 속성을 조작하는 기능은 다른 프로그래밍 언어에서는 없다.
파스칼, C 또는 C++에는 프로그램에 정의된 기능 정보를 얻는 방법이 없다.
</p>

<p>
리플렉션은 실행 중인 프로그램이 스태틱 영역에 로드된 클래스 정보를 알아내기 위한 API다.
클래스 이름을 안다면 동적으로 클래스에 대한 정보를 리플렉션을 통해 알아낼 수 있다.
리플렉션 API는 java.lang.reflect 패키지에 있다.
</p>

<p>
스프링과 RMI의 내부 소스에 리플렉션이 사용된다.
스프링 프레임워크는 스프링 설정 파일로부터 클래스 이름 정보를 얻고 자바 리플렉션 API를 사용해 빈을 생성한다.
자바 RMI는 원격 서비스 객체와 커넥션을 만들기 위해 리플렉션을 사용한다.
</p>

<p>
리플렉션을 사용하려면, 다루려는 클래스에 대한 java.lang.Class 객체를 얻어야 한다.
아래 두 가지 방법으로 java.lang.Class 객체를 얻을 수 있다.
</p>


<pre class="prettyprint no-border">Class&lt;?&gt; c = Class.forName("java.lang.String");
</pre>

<pre class="prettyprint no-border">Class&lt;?&gt; c = String.class
</pre>

<dl class="note">
<dt>Class&lt;T&gt;</dt>
<dd>
타입 파라미터 T는 Class 객체가 본떠 만든 클래스의 타입을 의미한다.
예를 들어, Class 객체가 String 클래스를 본떠 만들었다면 T는 String이다.
본떠 만들 클래스를 모른다면 제약 없는 와일드카드(?)를 사용한다.
리플렉션 코드에선 대부분 Class&lt;?&gt;를 사용한다.
</dd>    
</dl>

<p>
다음은 예제에 공통으로 사용할 은행 계좌 클래스다. 
</p>

<pre class="prettyprint">package net.java_school.examples;

import java.util.Date;

public class Account {
  public static final String SWIFT_CODE = "SCBLKRSE";
  private int accountNo;
  private String owner;
  private int balance;
  public String message;

  public Account() {
    message = "Created at " + new Date();
  }

  public Account(int accountNo, String owner) {
    this();
    this.accountNo = accountNo;
    this.owner = owner;
  }

  public Account(int accountNo, String owner, int balance) throws RuntimeException {
    this(accountNo, owner);
    if (balance &lt; 0) throw new RuntimeException("Negative balance not allowed");
    this.balance = balance;
  }

  public int deposit(int amount) {
    balance += amount;
    return balance;
  }

  public int withdraw(int amount) throws RuntimeException {
    if (balance - amount &lt; 0) throw new RuntimeException("Nagative balance not allowed");
    balance -= amount;
    return balance;
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("Account No:");
    sb.append(this.getAccountNo());
    sb.append("|Owner:");
    sb.append(this.getOwner());
    sb.append("|Balance:");
    sb.append(this.getBalance());
    sb.append("|Message:");
    sb.append(this.message);

    return sb.toString();
  }

  public int getAccountNo() {
    return accountNo;
  }

  public void setAccountNo(int accountNo) {
    this.accountNo = accountNo;
  }

  public String getOwner() {
    return owner;
  }

  public void setOwner(String owner) {
    this.owner = owner;
  }

  public int getBalance() {
    return balance;
  }

  public void setBalance(int balance) {
    this.balance = balance;
  }

}
</pre>

<p>
SWIFT_CODE는 금융기관의 식별 코드,
accountNo는 계좌 번호, 
owner는 계좌 소유자명, 
balance는 잔액,
message는 계좌가 생산하는 메시지를 나타낸다.
</p>

<h3>instanceof 연산자 흉내 내기</h3>

<p>
Class.isInstance 메소드는 instanceof 연산자를 흉내 낼 수 있다.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class SimulatingTheInstanceofOperator {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    boolean chk = c.isInstance(Integer.valueOf(10));
    System.out.println(chk);
    chk = c.isInstance(new Account());
    System.out.println(chk);
  }
  
}
</pre>

<pre class="console"><strong class="console-result">false
true</strong></pre>

<h3>클래스의 메소드 찾기</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Method;

public class FindingMethods {

  public static void main(String[] args) throws Exception {
    Class &lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Method[] ms = c.getDeclaredMethods();
    for (Method method : ms) {
      System.out.println("name = " + method.getName());
      System.out.println("decl class = " + method.getDeclaringClass());
      Class&lt;?&gt;[] ptypes = method.getParameterTypes();
      for (int i = 0; i &lt; ptypes.length; i++) {
        System.out.println("param #" + i + " " + ptypes[i]);
      }
      Class&lt;?&gt;[] etypes = method.getExceptionTypes();
      for (int i = 0; i &lt; etypes.length; i++) {
        System.out.println("exception #" + i + " " + etypes[i]);
      }
      System.out.println("return type = " + method.getReturnType());
      System.out.println("------------------------------------------");
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">name = getAccountNo
decl class = class net.java_school.examples.Account
return type = int
------------------------------------------
name = setBalance
decl class = class net.java_school.examples.Account
param #0 int
return type = void
------------------------------------------
name = getBalance
decl class = class net.java_school.examples.Account
return type = int
------------------------------------------
name = setAccountNo
decl class = class net.java_school.examples.Account
param #0 int
return type = void
------------------------------------------
name = toString
decl class = class net.java_school.examples.Account
return type = class java.lang.String
------------------------------------------
name = getOwner
decl class = class net.java_school.examples.Account
return type = class java.lang.String
------------------------------------------
name = setOwner
decl class = class net.java_school.examples.Account
param #0 class java.lang.String
return type = void
------------------------------------------
name = deposit
decl class = class net.java_school.examples.Account
param #0 int
return type = int
------------------------------------------
name = withdraw
decl class = class net.java_school.examples.Account
param #0 int
exception #0 class java.lang.RuntimeException
return type = int
------------------------------------------</strong></pre>

<dl class="note">
<dt>getMethods</dt>
<dd>
상속된 메소드에 대한 정보는 getMethods 메소드로 얻을 수 있다.
</dd>
</dl>

<p>
Method 객체 목록을 얻으면, 각 메소드의 파라미터 타입과 익셉션 타입, 리턴 타입을 얻을 수 있다.
이들 타입은 기본 타입이든 클래스 타입이든 모두 Class 클래스에 의해 표현되어야 한다.
</p>

<h3>생성자 정보 얻기</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Constructor;

public class ObtainingInformationAboutConstructors {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Constructor&lt;?&gt;[] constructors = c.getDeclaredConstructors();
    for (int i = 0; i &lt; constructors.length; i++) {
      Constructor&lt;?&gt; constructor = constructors[i];
      System.out.println("name = " + constructor.getName());
      System.out.println("decl class = " + constructor.getDeclaringClass());
      Class&lt;?&gt;[] params = constructor.getParameterTypes();
      for (int j = 0; j &lt; params.length; j++) {
        System.out.println("param #" + j + " " + params[j]);
      }
      Class&lt;?&gt;[] exceptions = constructor.getExceptionTypes();
      for (int j = 0; j &lt; exceptions.length; j++) {
        System.out.println("exception #" + j + " " + exceptions[j]);
      }
      System.out.println("--------------------------------------");
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
param #0 int
param #1 class java.lang.String
param #2 int
exception #0 class java.lang.RuntimeException
--------------------------------------
name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
param #0 int
param #1 class java.lang.String
--------------------------------------
name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
--------------------------------------</strong></pre>

<h3>클래스 필드 찾기</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

public class FindingFields {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Field[] fields = c.getDeclaredFields();
    for (int i = 0; i &lt; fields.length; i++) {
      Field field = fields[i];
      System.out.println("name = " + field.getName());
      System.out.println("decl class = " + field.getDeclaringClass());
      System.out.println("type = " + field.getType());
      int mod = field.getModifiers();
      System.out.println("modifiers = " + Modifier.toString(mod));
      System.out.println("-------------------------------------");
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">name = SWIFT_CODE
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = public static final
-------------------------------------
name = accountNo
decl class = class net.java_school.examples.Account
type = int
modifiers = private
-------------------------------------
name = owner
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = private
-------------------------------------
name = balance
decl class = class net.java_school.examples.Account
type = int
modifiers = private
-------------------------------------
name = message
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = public
-------------------------------------</strong></pre>

<p>
새로운 건 java.lang.reflect.Modifier의 사용법이다.
이것은 필드 멤버에서 발견되는 접근 수정자를 대표한다.
접근자는 정수로 표현된다.
Modifier.toString 메소드는 문자열 표현을 위해 사용된다.
</p>

<dl class="note">
<dt>getFields</dt>
<dd>
슈퍼 클래스에 정의된 필드 정보는 getFields를 통해 얻는다.
</dd>
</dl>

<h3>이름으로 메소드 호출하기</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Method;

public class InvokingMethodsByName {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Class&lt;?&gt;[] paramTypes = new Class&lt;?&gt;[1];
    paramTypes[0] = Integer.TYPE;
    Method method = c.getMethod("deposit", paramTypes);
    Account account = new Account(1111, "John Doe", 100);
    Object[] arguments = new Object[1];
    arguments[0] = Integer.valueOf(100);
    Object retobj = method.invoke(account, arguments);
    Integer retval = (Integer) retobj;
    System.out.println(retval.intValue());
  }
}
</pre>

<pre class="console"><strong class="console-result">200</strong></pre>

<p>
리플렉션 API를 사용하는 환경에서는 기본 타입에 대해서도 Class 정보를 얻어 사용해야 한다.
int 타입에 대한 Class 정보를 얻는 방법은 다음과 같다.
</p>

<pre class="prettyprint no-border">
Class&lt;?&gt; c = Integer.TYPE;
</pre>


<h3>생성자 정보 얻기</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Constructor;

public class CreatingNewObjects {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Class&lt;?&gt;[] paramTypes = new Class[3];
    paramTypes[0] = Integer.TYPE;
    paramTypes[1] = String.class;
    paramTypes[2] = Integer.TYPE;
    Constructor&lt;?&gt; constructor = c.getConstructor(paramTypes);//파라미터 배열로 생성자를 찾는다
    Object[] arguments = new Object[3];
    arguments[0] = Integer.valueOf(2222);//Account No
    arguments[1] = "Jane Doe";//Owner
    arguments[2] = Integer.valueOf(1000);//initial Balance
    Object retobj = constructor.newInstance(arguments);
    System.out.println(retobj);
  }
}
</pre>

<pre class="console"><strong class="console-result">Account No:2222|Owner:Jane Doe|Balance:1000|Message:Created at Mon Jan 14 21:16:16 KST 2019</strong></pre>

<h3>필드 값 수정</h3>

<p>
리플렉션은 프로그램 실행 중에 이름으로 필드를 찾을 수 있고 필드에 저장된 값을 수정할 수 있다.
</p>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Field;

public class ChangingValuesOfFields {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Account account = new Account(3333, "Alice", 500);
    Field field = c.getField("message");
    System.out.println(account);
    field.set(account, "Message changed with Reflection API");
    System.out.println(account);
    //field = c.getField("balance");//런타임 에러. getField는 public 필드만 가능하다.
    field = c.<b>getDeclaredField</b>("balance");
    field.<b>setAccessible(true)</b>;
    field.setInt(account, 1000000);
    System.out.println(account);
  }
}
</pre>

<pre class="console"><strong class="console-result">Account No:3333|Owner:Alice|Balance:500|Message:Created at Thu Jan 30 18:30:13 KST 2020
Account No:3333|Owner:Alice|Balance:500|Message:Message changed with Reflection API
Account No:3333|Owner:Alice|Balance:1000000|Message:Message changed with Reflection API</strong></pre>

<p>
최종 소스 <a href="https://github.com/kimjonghoon/reflection">https://github.com/kimjonghoon/reflection</a>
</p>

<h3>실행 방법</h3>

<pre class="shell-prompt">~/reflection$ <strong>cd src/net/java_school/examples/</strong>
~/reflection/src/net/java_school/examples$ <strong>javac -d ../../../../bin *.java</strong>
~/reflection/src/net/java_school/examples$ <strong>cd -</strong>
~/reflection$ <strong>java -cp ./bin net.java_school.examples.Test</strong>
1.
false
true

2.
name = setOwner
decl class = class net.java_school.examples.Account
param #0 class java.lang.String
return type = void
------------------------------------------
name = withdraw
decl class = class net.java_school.examples.Account
param #0 int
exception #0 class java.lang.RuntimeException
return type = int
------------------------------------------
name = getAccountNo
decl class = class net.java_school.examples.Account
return type = int
------------------------------------------
name = setAccountNo
decl class = class net.java_school.examples.Account
param #0 int
return type = void
------------------------------------------
name = getBalance
decl class = class net.java_school.examples.Account
return type = int
------------------------------------------
name = setBalance
decl class = class net.java_school.examples.Account
param #0 int
return type = void
------------------------------------------
name = deposit
decl class = class net.java_school.examples.Account
param #0 int
return type = int
------------------------------------------
name = toString
decl class = class net.java_school.examples.Account
return type = class java.lang.String
------------------------------------------
name = getOwner
decl class = class net.java_school.examples.Account
return type = class java.lang.String
------------------------------------------

3.
name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
param #0 int
param #1 class java.lang.String
--------------------------------------
name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
--------------------------------------
name = net.java_school.examples.Account
decl class = class net.java_school.examples.Account
param #0 int
param #1 class java.lang.String
param #2 int
exception #0 class java.lang.RuntimeException
--------------------------------------

4.
name = SWIFT_CODE
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = public static final
-------------------------------------
name = accountNo
decl class = class net.java_school.examples.Account
type = int
modifiers = private
-------------------------------------
name = owner
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = private
-------------------------------------
name = balance
decl class = class net.java_school.examples.Account
type = int
modifiers = private
-------------------------------------
name = message
decl class = class net.java_school.examples.Account
type = class java.lang.String
modifiers = public
-------------------------------------

5.
200

6.
Account No:2222|Owner:Jane Doe|Balance:1000|Message:Created at Thu Jan 30 18:44:28 KST 2020

7.
Account No:3333|Owner:Alice|Balance:500|Message:Created at Thu Jan 30 18:44:28 KST 2020
Account No:3333|Owner:Alice|Balance:500|Message:Message changed with Reflection API
Account No:3333|Owner:Alice|Balance:1000000|Message:Message changed with Reflection API
</pre>	
	
<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.oracle.com/technetwork/articles/java/javareflection-1536171.html">https://www.oracle.com/technetwork/articles/java/javareflection-1536171.html</a></li>
</ul>

</article>
