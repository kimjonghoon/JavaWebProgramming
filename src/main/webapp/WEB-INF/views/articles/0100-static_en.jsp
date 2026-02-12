<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>static keyword</h1>

<p>
The static keyword creates class-level variables and methods.<br />
Static means that the memory space determined when the class is loaded does not change.<br />
You can use static variables and methods without creating an object like this:
</p>

<ul>
    <li>ClassName.staticVariable</li>
    <li>ClassName.staticMethod()</li>
</ul>

<p>
The main method is the static method.
</p>

<p>
The class loader must first load bytecodes into memory to run a Java program. JVM allocates memory space for static variables when the class loader a bytecode into memory. The memory space to which a static variable does not change until the end of the program.
</p>

<p class="note">
<b>Note:</b>
This memory space is not an area of heap memory to which JVM allocates objects. -- Every time the new keyword runs, JVM allocates the object's instance variables to the heap memory area --
</p>

<p>
You can not use instance variables in static methods. It does not make sense to refer to the properties of an object that it can not create. You will get a compile error if you add the following to the main method of the student class.
</p>

<pre class="prettyprint">
public static void main(String[] args) {
  absentNum++;
}
</pre>

<p>
Conversely, using static variables or methods in instance methods is no problem.
</p>

<p>
Suppose students must pay a fine if they are absent or late or leave early.
The fine is $ 3 for absences and $ 1 for late or leaving early.
</p>

<p>
Students must put a fine in the penalty box. The penalty box is only one, and all students share. It is not a property that distinguishes students from students.
How implement the penalty box in the code?
An approach is to make the box a static variable that all student objects share.
</p>

<pre class="prettyprint">
public class Student {
  <strong>static</strong> int penaltyBox;

  public void absent() {
    this.absent++;
    <strong>Student.penaltyBox</strong> += 3;
  }
  //..Omit
}    
</pre>


<p>
The following is an example of a static variable that stores the total number of users.
</p>

<pre class="prettyprint">
package net.java_school.user;

public class User {

  public <strong>static</strong> int totalUser;
  private String id;
    
  public User(String id) {
    this.id = id;
    total++;
  }

  public static void main(String[] args) {
    User user1 = new User("hong1440");
    User user2 = new User("im1562");
    User user3 = new User("jang1692");
        
    System.out.println("Total Users : " + <strong>User.totalUser</strong>);
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\John&gt;java net.java_school.user.User
Total Users : 3
</pre>

<h3>Singleton pattern</h3>

<p>
The singleton pattern is the design pattern to use when you need to create only one object.
</p>

<p>
Suppose there should be only one dinner table at home.
</p>

<pre class="prettyprint">
package net.java_school.home;

public class DinnerTable {

  private <strong>static DinnerTable</strong> instance = new DinnerTable();
    
  public static DinnerTable getInstance() {
    return instance;
  }
    
  <strong>private</strong> DinnerTable() {}
    
  //..Omit
}
</pre>

<ol>
	<li>Let JVM creates an object in the heap memory and assigns its reference to the private static variable.</li>
	<li>Declare only a private constructor to prevent the constructor from being called from outside.</li>
	<li>Create one public method to expose the reference to the outside.</li>
</ol>

<p>
If implemented as above, an instance is maintained as one until the program ends.
</p>

<h3>Initialization Order</h3>

<p>
JVM initializes variables when it allocates them to memory space.<br />
If the code does not have an initial value, the Boolean type is false, the numeric type is 0, and the reference type is null.
</p>

<p>
JVM initializes instance variables when it allocates them in the heap memory.
</p>

<p>
The initialization order is static variables, instance variables, and constructors.
</p>

<p>
Static variables and static blocks are at the same level.<br />
So the previous one in the code is initialized first.
</p>

<p>
For instance blocks, the compiler adds the implementation of the instance block to every constructor. Thus, instance blocks precede constructors.
</p>

<h6 class="src">A.java</h6>
<pre class="prettyprint">
package net.java_school.classvar;

public class A {

  public A() {
    System.out.println("A() has executed.");//4,9,14
  }
}
</pre>

<h6 class="src">B.java</h6>
<pre class="prettyprint">
package net.java_school.classvar;

public class B {
  private A a = new A();//3,8,13
    
  {
    System.out.println("B instance block has executed.");//5,10,15
  }
    
  static {
    System.out.println("B static block has executed.");//1
  }
    
  private static B b = new B();//2

  private B() {
    System.out.println("B() has executed.");//6,11
  }
    
  public B(int a) {
    System.out.println("B(int) has executed.");//16
  }

  public static void main(String[] args) {
    new B();//7
    new B(1);//12
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\John&gt;java net.java_school.classvar.B
B static block has executed.
A() has executed.
B instance block has executed.
B() has executed.
A() has executed.
B instance block has executed.
B() has executed.
A() has executed.
B instance block has executed.
B(int) has executed.
</pre>

<span id="refer">References</span>
<ul id="references">
    <li><a href="http://docs.oracle.com/javase/tutorial/java/javaOO/classvars.html">http://docs.oracle.com/javase/tutorial/java/javaOO/classvars.html</a></li>
    <li><a href="http://www.guru99.com/java-stack-heap.html">http://www.guru99.com/java-stack-heap.html</a></li>
</ul>

</article>