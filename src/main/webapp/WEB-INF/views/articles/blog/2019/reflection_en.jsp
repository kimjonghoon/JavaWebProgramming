<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article>
<div class="last-modified">Last Modified 2022.1.19</div>

<h1>Reflection</h1>

<p>
Reflection is a feature in the Java programming language. It allows an executing Java program to examine or introspect upon itself and manipulate the internal properties of the program.
</p>

<p class="note">
<strong>Note</strong>: The internal source of Spring Framework obtains class name information from the Spring configuration file and uses the reflection API to create beans.
<p>

<p>
The reflection classes, such as Method, are found in java.lang.reflect. To use these classes, You first need to obtain a java.lang.Class object for the class that you want to manipulate. You can get a Class object in two ways as follows:
</p>

<pre class="prettyprint no-border">Class&lt;?&gt; c = Class.forName("java.lang.String");</pre>

<pre class="prettyprint no-border">Class&lt;?&gt; c = String.class</pre>

<p>
java.lang.Class is used to represent classes and interfaces in a running Java program.
</p>

<dl class="note">
<dt>Class&lt;T&gt;</dt>
<dd>
T: The type of the class modeled by this Class object. For example, the type of String.class is Class&lt;String&gt;. Use <em>Class&lt;?&gt;</em> if the class being modeled is unknown.
</dd>    
</dl>

<p>
Create a bank account class as follows:
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
SWIFT_CODE: The identification code of the financial institution.
accountNo: The account number.
owner: The name of the account holder.
message: The message produced by an account.
</p>

<h3>Simulating the instanceof Operator</h3>

<p>
Once Class information is in hand, the next step is to ask fundamental questions about the Class object. For example, You can use the Class.isInstance method to simulate the instanceof operator:
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

<h3>Finding Out About Methods of a Class</h3>

<p>
One of the most practical and primary uses of reflection is finding out what methods are defined within a class.
</p>

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
If you use getMethods in the program instead of getDeclaredMethods, you can also obtain information for inherited methods.
</dd>
</dl>

<h3>Obtaining Information About Constructors</h3>

<p>
You can use a similar approach to find out about the constructors of a class.
</p>

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

<h3>Finding Out About Class Fields</h3>

<p>
It's also possible to find out which data fields are defined in a class.
</p>

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

<dl class="note">
<dt>getFields</dt>
<dd>
If you use getFields in the program, you can also obtain information about fields defined in super classes.
</dd>
</dl>

<p>
This example is similar to the previous ones. One new feature is the use of Modifier, which is a reflection class that represents the modifiers found on a field member. For example, "private int." The modifiers themselves are represented by an integer, and Modifier.toString is used to return a string representation in the "official" declaration order (such as "static" before "final").
</p>

<h3>Invoking Methods by Name</h3>

<p>
So far, the examples that have been presented all relate to obtaining class information. But it's also possible to use reflection in other ways, for example, to invoke a method of a specified name.
</p>

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

<dl class="note">
<dt>How to obtain Class information on fundamental types</dt>
<dd>
You need to obtain Class information on fundamental types. 
The following approach accesses the predefined TYPE field of the wrapper (such as Integer) for the fundamental type.
<pre class="prettyprint no-border">
Class&lt;?&gt; c = Integer.TYPE;
</pre>
</dd>
</dl>

<h3>Creating New Objects</h3>

<pre class="prettyprint">package net.java_school.examples;

import java.lang.reflect.Constructor;

public class CreatingNewObjects {

  public static void main(String[] args) throws Exception {
    Class&lt;?&gt; c = Class.forName("net.java_school.examples.Account");
    Class&lt;?&gt;[] paramTypes = new Class[3];
    paramTypes[0] = Integer.TYPE;
    paramTypes[1] = String.class;
    paramTypes[2] = Integer.TYPE;
    Constructor&lt;?&gt; constructor = c.getConstructor(paramTypes);//find constructor by parameter array
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

<h3>Changing Values of Fields</h3>

<p>
Another use of reflection is to change the values of data fields in objects. The value of this is again derived from the dynamic nature of reflection, where a field can be looked up by name in an executing program and then have its value changed. The following example illustrates this:
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
    //field = c.getField("balance");//Runtime error! getField only get public field.
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
Final source: <a href="https://github.com/kimjonghoon/reflection">https://github.com/kimjonghoon/reflection</a>
</p>

<h3>How to run</h3>

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

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.oracle.com/technetwork/articles/java/javareflection-1536171.html">https://www.oracle.com/technetwork/articles/java/javareflection-1536171.html</a></li>
</ul>

</article>
