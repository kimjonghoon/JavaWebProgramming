<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Exception</h1>

<p>
Java API has exception classes for every exception while using Java API. If an exception occurs during execution, JVM creates an object from the corresponding exception class and forces the code that has caused the exception to return that. Programmers can use try, catch, and finally blocks appropriately to control the exception objects that JVM may raise.
</p>

<dl class="note">
<dt>block</dt>
<dd>
A block is a unit of source code that begin with { and ends with }.<br />
In Java, variables declared in a block are valid only within the block.
</dd>
</dl>

<p>
<strong>What are errors in Java?</strong><br />
Exceptions are strictly errors, but Java distinguishes between exceptions and errors. An error in Java is an error that you can not control programmatically. If an error occurs, programs terminate.
</p>

<h3>Control Exceptions</h3>

<p>
Exception classes have a hierarchical structure.<br />
The Exception is the top class of all exception classes.<br />
The following is an example of dealing with exceptions.
</p>

<pre class="prettyprint">
try {
  //Code that can cause exceptions A and B
  //A is hierarchically above B
} catch (B e) { //e is the reference to the B exception object
  //Code executed when the exception B occurs
} catch (A e) {
  //Code executed when the exception A occurs
} finally {
  //The code that must be executed, with or without an exception
}
</pre>

<p>
If the programmer has not taken appropriate precautions, an exception will cause the program to terminate. 
</p>

<p>
Proper precautions include:
</p>

<ul>
	<li>Put the code that can throw an exception within a try block.</li>
	<li>Use the catch block to catch exceptions raised by a try block. --Caught exceptions cannot escape the catch block unless you rethrow the exception using the throw keyword --</li>
	<li>A finally block is optional when there is at least one catch block. Note that JVM always executes the code in this block whether or not an exception happens.</li>
</ul>

<dl class="note">
<dt>try block</dt>
<dd>
It is a block that encloses code that can cause exceptions.<br />
You can not use it alone, and use it with catch blocks and a finally block.
</dd>
<dt>catch block</dt>
<dd>
To handle an exception that may occur in a try block, you must put a catch block after the try block that catches that exception. You can fine-tune exceptions using multiple catch blocks, as in the example above.
</dd>
<dt>finally block</dt>
<dd>
Whether an exception occurs or not, JVM executes code in this block. You cannot use this block multiple times in a row like a catch block.
</dd>
</dl>

<h3>Exception mechanism</h3>

<p>
Assume that method1 calls method2 and method2 calls method3, as shown below.
</p>

<p>
<img src="https://lh3.googleusercontent.com/K3UACunLKTLY7LVG-8at3eGtxnlN40lsoUY2zCQFR6unJVRHyyQCvVrEXsazAZWJFPt6JostjTrZAS_EtdpwFIHcuNNEBlgNj0ky8pK6NE9cV5jnTjFiVQJbnwpx9N9I_MXraOdHCLnHa2tc5gdtY1cyJPGEeBVDd-PpxHU7SzubLrmPlRvrxLOPgUtnwqf3aUfDwFON-WFCkw1gYfxQ7cyZFrn9sEfwZi9cvm1EbT0yy6ruf153sohkL65YPGgGJOyNc_hShiBsYqQ8ZRnpGGMDx1k37HssWwAEomhJlp1D1odAuX1q3p2ocgcxTYSBuG5o63KNyWntjRvhgfXtOfUbHBxmWmEdSpJzL-2xJsiOAVWvkcTXzZEg9nyIJvY4kPmKnAWGQKqItDZdxIH0yFEo6bLSoXpYnMp6eKI8C0DgMSmDr71DPOjhpGtcabfZIei0xquRXu_fzIQCZLl2xxEILZQih7pxxzUSlh0qMzKFzCL8zdDk4TrjXAuJMMDUQtMtSYRGSqITQOINH3qFRSfWAoAgaDxg9eBVd8Pz8hbs4YGHDB5ofMvm4Z86DyBNfPdiaDXv1QE-w-NsXIleTYSqV08TazMF2KSyNCTUXA=w600-h256-no" alt="Exception Mechanism" /><br />
</p>

<p>
If an exception occurs in method3 and a catch block catches the exception in method3 body, the program continues without stopping.
</p>

<p>
If there is no catch block or the exception thrown in the body of method3 is not caught, the exception goes to the code of method2 that called method3.
</p>

<p>
Assume that method2 does not have a catch block that catches the exception thrown by method3. This exception goes to the code of method1 that called method2.
</p>

<p>
When an exception reaches JVM, JVM terminates that program. Such termination is an abnormal termination.
</p>

<h3>Exception class hierarchy</h3>

<p>
<img src="https://lh3.googleusercontent.com/HxTwf_0OFEqI2B4LioJ7KjbK62ZvI0mvx0hLYD3bXci_m96ndspOwWfakVdQda37udd0efrC0hM7uW-kUMng1czT7OLGPNypLtk8ca__F6g3MQ7ar6mBNJJxaxRrhquT4or1ySOSzXusufwujhBXLR_yRy07qfepRNEf_r1D8UxhcMy9GvoMCKZEnH1CFY-bKKFWpFVxTL1vgHZDnv1PRza7udnRrDWLiZxhjwFswPaox-gMzJcMfwn5zLEPAsq5ru1Y1Kr1rsWJMtUr5wkgyICMbStXtiNzmL_jwoF8hftuGAVCJ_o3LNT7VyQKb57PGnSComNIDD5qMLBR277f14AtMNTLHDEwWiwTKpy4CXjnS7RqNRbnjvLLNkKPeRkI2iqI2uk4VulyUhooTR6Fsw6wuzMUJW-8gJxbh6qn4eTtT5DxYQ2vOzGRvUHVu7phWVCDpHGycXAJVX0ZHa9MeqzPG552pQHM0T7gJzJIIxK_45O6J9QlX1YeRaEiSIEX4eY01WMFzmhzHZQgQ99giaeoglCan7BsKbFcTFuxvDdiR2Slv62sw_ElrW6NU2MhVojYBKdIHNqIrjnws78T1MRHKU6VPGRmuKn8gmS9NEhSR6QWykjSer0L=w390-h141-no" alt="Exception API" />
</p>

<h3>Frequent Exceptions</h3>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th">Exception</th>
	<th class="table-in-article-th">Example</th>
</tr>
<tr>
	<td class="table-in-article-td">ArithmeticException</td>
	<td class="table-in-article-td">int a = 12/0;</td>
</tr>
<tr>
	<td class="table-in-article-td">NullPointerException</td>
	<td class="table-in-article-td">Integer d = null;<br />
	int val = d.intValue();
	</td>
</tr>
<tr>
	<td class="table-in-article-td">NegativeArraySizeException</td>
	<td class="table-in-article-td">int arr = new int[-1];</td>
</tr>
<tr>
	<td class="table-in-article-td">ArrayIndexOutOfBoundException</td>
	<td class="table-in-article-td">
	int[] arr = new int[2];<br />
	arr[2] = 1;
	</td>
</tr>
</table>

<h3><em>throws SomeException</em> in the method declaration</h3>

<p>
After the throws keyword, you can put an exception class or a comma-separated list of exception classes in the method declaration. A compilation error will occur if the code that calls this method does not have a code snippet that correctly handles exceptions defined after the throws keyword.
</p>

<p>
Suppose you have the following method.
</p>

<pre class="prettyprint">
public void someMethod() throws SomeException {
  //..Omitted.
}
</pre>

<p>
If you need to create a method with code that calls someMethod() on the method body, you must choose one of the two below to avoid compilation errors.
</p>

<h6 class="src">1</h6>
<pre class="prettyprint">
public void myMethod() <strong>throws SomeException</strong> {
  someMethod();
  //..Omitted.
}
</pre>

<h6 class="src">2</h6>
<pre class="prettyprint">
public void myMethod() {
  <strong>
  try {
    someMethod();
  } catch (SomeException e) {
    //..Omitted.
  }
  </strong>
}
</pre>

<p>
<strong>1:</strong><br />
This method does not catch the SomeException type exception inside the method but throws it out of the method. If SomeException is a RuntimeException or a subclass of RuntimeException, You can omit "throws SomeException" from the method declaration section.
</p>

<p>
<strong>2:</strong><br />
This method catches and handles the exception that occurred inside the method. If SomeException is a RuntimeException or a subclass of RuntimeException, there is no compilation error even if you omit the try and catch block. In this case, the exception escapes the method.
</p>

<p>
The code that handles the exception is one of the following:
</p>

<ol>
	<li>Let the exception escape</li>
	<li>Catch and handle the exception</li>
</ol>

<h3>Examples</h3>

<p>
The following is an example of an unchecked exception.
<b>Note:</b>
Unchecked exceptions are RuntimeException or subclass of RuntimeException. These exceptions do not cause a compile error even if you do not code that handles them.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
        
  public static void method2() {
    method3();
  }

  public static void method3() {
    <strong>int a = 12 / 0;</strong>
    System.out.println(a);
  }
        
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
When you run the example, the ArithmeticException exception instance reaches JVM. JVM sequentially prints the stack on which the exception occurred, as shown below. The important thing is that it is not a normal Termination. If executed to the last line, the main method will print "Normal Termination."
</p>
    
<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ArithmeticException: / by zero
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)</strong></pre>

<dl class="note">
<dt>Stack</dt>
<dd>
A Stack is a data structure, and the implementation of a stack is also called a LIFO (Last In First Out).
</dd>

<dd>
When a code calls a method, JVM creates memory space for executing it and stacks the room on the stack.
</dd>

<dd>
The stack is a space where local variables are stored. Local variables are variables declared in the method body. When the method ends, the room occupied for executing it on the stack vanishes. At this point, the method's local variables also vanish.
</dd>
</dl>

<p>
The following figure shows memory spaces accumulated on the stack according to methods execution order and messages that JVM traces and outputs the exception cause.
</p>

<p>
<img src="https://lh3.googleusercontent.com/8iA5BeJpk2GpLPnk6FUiNMxWn7HR0B7LOTwqO61iKdVFhrfTCnPqeoSxuKrgbLdbuf21bIJh-r4V4aK7iE3xsPe8u2m2Q-N6tHgybdn4FmmHsq_nEJj1oV2Z69f6G6GJJS8S6d3FQHOvFf2m19cFjV4OlPxxH_ywgts_udnVPfi7Wc3aiGU9IsaigZ-ST2A1CYjFFX742DfSx4x6AWqDl4FCVmiAsIkVtLDCmX5VhEg5v-S1-khEhCU3IyO9Hcwxmoli-XnaLWeWpcFjr4EjTZESVhyukN-9RF4kfQ2YOungmv6VKqpO4EiNihCQsetAKmf7RAM2vMOsI3c6F-rSRGVlb7NSBENxpmYQuSrk6cVuc3dqo0EDNf9tLXxsJWx3J4yKVAPcyyjIItmfYyRwdCk2grl3XtT6pTg5ZdnAclNBQVfn8mNhA70OD3vUd8yIbslHDsYM0Lqm4H9fpU12O5OjjmJkagBdNSpm4MAakH6UVXu200j3LLDW4ZnKQyt6okCyB9Emozwjlk7nMuK5TvtPyWR_GcL3fnMJpR4cZVjEwBIuv9H-J3Yh_tJQ1xKimyv1TND2SMVcEy-mjDI_ACKCTPcOcIo7eUh2XGw3ErxJ1kcbqkNzeNr4JMi4Qk34yWn0PyRnmSqip1hLyXhGG7uzvIflmgB45EPe-II53fn60vMQ6QI4Bvv-Pwxs=w1231-h771-no?authuser=0" alt="source stack printStackTrace output" />
</p>

<p>	
Modify the method3() to handle exceptions using try ~ catch.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }

  public static void method2() {
    method3();
  }

  public static void method3() {
    <strong>try {</strong>
      int a = 12 / 0;
      System.out.println(a);
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }

  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");	
  }

}
</pre>

<p>
System.out.println(e.getMessage()) code prints / by zero.
</p>    
    
<pre class="console"><strong class="console-result">/ by zero
Normal Termination
</strong></pre>

<p>
Revert the previous code and modify the method2() to handle the exception using try ~ catch.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    <strong>try {</strong>
      method3();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
The exception instance from method3() goes to method2(). You can think of similar to returning a return value.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
Normal Termination
</strong></pre>

<p>
Revert the previous code and modify method1() to handle the exception.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>try {</strong>
      method2();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
The output is the same, but the exception instance goes to method1(), and method1() adequately handles it, thus avoiding abnormal termination.
</p>

<pre class="console"><strong class="console-result">/ by zero
Normal Termination
</strong></pre>

<p>
Revert the previous code and modify the method main to handle the exception.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    <strong>try {</strong>
      method1();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
	
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
The output is the same, but the exception instance goes to the method main. The method main handles the exception instance correctly, so we avoid the program terminating abnormally.
</p>

<pre class="console"><strong class="console-result">/ by zero
Normal Termination
</strong></pre>

<p>
A try block does not necessarily have to be with a catch block. However, if there is no catch block, you can not catch an exception object. The following example removes the catch block. You cannot use a try block alone, so add a finally block instead.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } <strong>finally</strong> {
      System.out.println("Executing a finally block");
    }
		
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Since there is no catch block, the exception instance reaches JVM, and the program terminates abnormally. You can confirm that JVM executed the finally block, and the exception instance went to JVM through the output.
</p>
    
<pre class="console"><strong class="console-result">Executing a finally block
Exception in thread "main" java.lang.ArithmeticException: / by zero
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:20)
</strong></pre>

<p>
Add a catch block to handle exceptions.
Modify the catch block to catch every exception in the try block.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (<strong>Exception</strong> e) {
      System.out.println(e.getMessage());
    } finally {
      System.out.println("Executing a finally block");
    }
		
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Since an exception has occurred, JVM executed the catch block and the finally block. The exception object caught by the catch block is no longer passed anywhere.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
Executing a finally block
Normal Termination
</strong></pre>

<p>
You can write catch blocks consecutively like if ~ else if ~ else if. But you need to pay attention to the hierarchical relationship of exception classes.
</p>

<p>
When an exception occurs in a try block, catch blocks try to catch the exception in order from top to bottom.
</p>

<p>
If the preceding exception class is hierarchically above the exception class that follows, then there is no chance for the code to go down. So the following code causes a compile error.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (Exception e) {
      System.out.println(e.getMessage());
    } catch (<strong>ArithmeticException</strong> e) { 
      System.out.println(e.getMessage());
    } finally {
      System.out.println("Executing a finally block");
    }
	
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
You can compile by changing the order of catch blocks, as shown below.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (<strong>ArithmeticException</strong> e) {
      System.out.println(e.getMessage());
    } catch (<strong>Exception</strong> e) {
      System.out.println(e.getMessage());
    } finally {
      System.out.println("Executing a finally block");
    }
		
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
When the program runs, the catch(ArithmeticException e) {} block catches the exception thrown by the try block. JVM executes e.getMessage() in this block and executes the code of the finally block, followed by the last line of the main.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
Executing a finally block
Normal Termination
</strong></pre>

<p>
Modify the above example to the checked exception example. You will get a compile error in the highlighted section. The compilation error message is <em>Unhandled exception type ClassNotFoundException</em>.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    <strong>Class.forName("java.lang.Boolean");</strong>
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Class.forName ("string"); is not a new Java grammar.
</p>

<p>
The java.lang.Class belongs to Java API, and this class has a forName() static method.
</p>

<p>
The forName() method takes a string as an argument, which is the full name of the Java class (FQCN).
</p>

<p>
The forName() method causes the class loader to load the class corresponding to the argument. If the class loader does not find the class, the JVM creates a ClassNotFoundException exception instance and throws it to the Class.forName ("string") line.
</p>

<p>
In the example, the class corresponding to "java.lang.Boolean" passed as an argument to forName() belongs to Java API, so the class loader looks for this class without the cp or classpath option.
</p>

<p>
There is "throws ClassNotFoundException" in the method declaration of the forName() method. Because ClassNotFoundException is a checked exception that does not inherit RuntimeException, the code calls forName() must handle this exception.
</p>

<p>
Let's modify the code using the code assist feature of Eclipse. If you put your cursor on the code: Class.forName(), Eclipse will give you two solutions. If you choose the second one, the code changes as below, and the compile error disappears.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    <strong>try {
      Class.forName("java.lang.Boolean");
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }</strong>
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Since the Boolean (java.lang.Boolean) exists in Java API, JVM does not execute the catch block.
</p>
    
<pre class="console"><strong class="console-result">Normal Termination
</strong></pre>

<p>
Revert the previous code and choose the first Eclipse suggests.<br />
The method3() line in method2() causes a compile error.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    <strong>method3();</strong>
  }
	
  public static void method3() <strong>throws ClassNotFoundException</strong> {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
The compilation error is <em>Unhandled exception type ClassNotFoundException</em>. A method that calls method3() must handle a ClassNotFoundException because there is "throws ClassNotFoundException" in method3() method declaration.
</p>

<p>
Place the cursor where the compilation error occurs and choose the second of the solutions Eclipse suggests. Then the source is changed as below, and the compilation error disappears.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  <strong>public static void method2() {
    try {
      method3();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }</strong>
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Revert the previous code and choose the first solution that Eclipse suggests. Then, the source is changed below, and a compilation error occurs on the method2() line in the method1() method.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>method2();</strong>
  }
	
  public static void method2() <strong>throws ClassNotFoundException</strong> {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Place the cursor where the compilation error occurs and choose the second of the solutions Eclipse suggests. Then the source is changed as below.
</p>    

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>try {
      method2();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }</strong>
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
You can see that the program terminates without any exception.
</p>

<pre class="console"><strong class="console-result">Normal Termination
</strong></pre>

<p>
Revert the previous code, place the cursor on the method2() line in the method1(), and choose the first solution Eclipse suggests. A compilation error occurs on the main method.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() <strong>throws ClassNotFoundException</strong> {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    <strong>method1();</strong>
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Place the cursor where the compilation error occurs and choose the first solution that Eclipse suggests. Then the source is changed as follows.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) throws ClassNotFoundException {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
You can see that the program terminates without any exception.
</p>

<pre class="console"><strong class="console-result">Normal Termination
</strong></pre>

<p>
Let's change "java.lang.Boolean" to "java.lang.Boolean2" in the code.<br />
<b>Note:</b>
The java.lang.Boolean2 does not belong to Java API.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("<strong>java.lang.Boolean2</strong>");
  }
	
  public static void main(String[] args) throws ClassNotFoundException {
    method1();
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
When executed, the exception instance reaches the method main, and the method does not catch the exception, so the exception instance finally goes to JVM. As a result, the program ends abnormally.
</p>
    
<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:13)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:18)
</strong></pre>

<p>
Modify the code to catch the exception in the method main.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  <strong>public static void main(String[] args) {
    try {
      method1();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    System.out.println("Normal Termination");
  }</strong>

}
</pre>

<p>
The e.printStackTrace() will print to the console as follows:
</p>
    
<pre class="console"><strong class="console-result">java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)
Normal Termination
</strong></pre>

<p>
The above looks like the output message when the exception instance reaches the JVM, but it is not an abnormal termination.
</p>

<p>
If you remove the catch block from the method main, you will get a compile error. ClassNotFoundException is a checked exception, and if you do not control the exception at the caller, you will get a compilation error.
</p>

<p>
A checked exception object cannot escape from a method that does not have a declaration that throws the exception in the class declaration.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  public static void main(String[] args) {
    try {
      <strong>method1();</strong>
    } finally {
      System.out.println("Executing a finally block");
    }
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
Add the catch block back to avoid a compilation error.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } finally {
      System.out.println("Executing a finally block");
    }
    System.out.println("Normal Termination");
  }

}
</pre>

<p>
The class java.lang.Boolean2 is not in Java API, and we didn't create it, so a ClassNotFoundException occurs. JVM executes the e.printStackTrace() statement of the catch block, followed by the finally block's code, followed by the last line of the method main.
</p>

<pre class="console"><strong class="console-result">java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)
Executing a finally block
Normal Termination
</strong></pre>

<p>
You will often see this message printed by the e.printStackTrace() statement. You may solve most errors by guessing the basic Java syntax, but Googling may be the solution if you can't.
</p>
    
<h3>Custom Exceptions</h3>

<p>
When an exception occurs, JVM generates an exception instance from exception classes of Java API and throws the exception to the code.
</p>

<p>
Programmers can create exception classes to suit their needs. These are called <b>Custom Exceptions</b>.
</p>

<p>
Here is an exception class to use when the bank account's balance is insufficient.
</p>

<pre class="prettyprint">
package net.java_school.bank;

public class InsufficientBalanceException extends Exception {

  public InsufficientBalanceException() {
    super();
  }
	
  public InsufficientBalanceException(String message, Throwable cause,
    boolean enableSuppression, boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
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
JVM does not generate this exception instance when the bank account's balance is insufficient. Therefore, we must explicitly create our custom exception instance in code.
</p>

<p>
Here is the code to create an exception instance from our custom exception class:
</p>

<pre class="prettyprint">
throw new InsufficientBalanceException("There is not enough balance.");
</pre>

<h3>Test</h3>

<p>
Write a class that executes as shown below.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Exception\bin&gt;java net.java_school.bank.Test
$ 1 Deposit: java net.java_school.bank.Test d 1
$ 1 Withdrawal: java net.java_school.bank.Test w 1

C:\java\Exception\bin&gt;java net.java_school.bank.Test d 3
You can not deposit more than the maximum balance.
The balance is $ 1.

C:\&gt;java net.java_school.bank.Test w 2
There is not enough balance.
The balance is $ 1.
</pre>

<p>
Complete the method main.
</p>

<pre class="prettyprint">
package net.java_school.bank;

public class Test {
  public static void main(String[] args) {
    int MAX_BALANCE = 3; //Maximum balance amount
    int balance = 1; //Initial balance
    int amount = 0; //Deposit amount or amount of withdrawal
		
    if (args.length &lt; 2) {
      System.out.println("Deposit $ 1: java net.java_school.bank.Test d 1");
      System.out.println("Withdrawal $ 1: java net.java_school.bank.Test w 1");
      return;
    }
    //TODO
  }
}        
</pre>

<p>
Create and apply the appropriate custom exception class on the above code.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://java.sun.com/docs/books/tutorial/essential/exceptions/definition.html">http://java.sun.com/docs/books/tutorial/essential/exceptions/definition.html</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/javabank-requirements-analysis"/>">Javabank - Requirements Analysis</a></li>
    <li>Prev : <a href="<c:url value="/java/collection"/>">Collection</a></li>
  </ul>
</div>
</article>