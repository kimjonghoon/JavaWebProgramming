<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.1.27</div>

<h1>Default Method</h1>

<p>
Default methods allow you to define an interface that contains methods with an implementation. The introduction of default methods was an inevitable choice to change the API while maintaining compatibility with legacy code. This new feature makes Java a language that allows multiple inheritances. Default methods have the default keyword before the return type.
</p>

<p>
Assuming C inherits from A and B, A and B have the same method.
</p>

<ul>
	<li>If A is an interface and B is a class, then C inherits B's method.</li>
	<li>If A and B are both interfaces and Java cannot determine the priority of default methods, a compile error occurs. In this case, you must explicitly override the default method you want to call and call it.</li>
</ul>

<h3>If A is an interface and B is a class, then C inherits B's method.</h3>

<pre class="prettyprint">package net.java_school.examples;

public interface A1Interface {
  public default String hello() {
    return "A1 Interface says hello";
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class B1Class {
  public String hello() {
    return "B1 Class says hello";
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class C1Class extends B1Class implements A1Interface {

  public static void main(String[] args) {
    C1Class c1 = new C1Class();
    System.out.println(c1.hello());
  }
}
</pre>

<pre class="console"><strong class="console-result">B1 Class says hello</strong></pre>

<h3>Sometimes, you must explicitly override the default method you want to call and call it.</h3>

<pre class="prettyprint">package net.java_school.examples;

public interface A2Interface {
  public default String hello() {
    return "A2 Interface says hello";
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public interface B2Interface {
  public default String hello() {
    return "B2 Interface says hello";
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class C3Class implements A2Interface,B2Interface {
}
</pre>

<p>
The C2Class class occurs a compile error saying <em>Duplicate default methods named hello</em>. To avoid compile errors, you must explicitly override the method you choose.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class C2Class implements A2Interface,B2Interface {

  @Override
  public String hello() {
    return <strong>B2Interface.super.hello()</strong>;//B2Interface's hello().
  }

  public static void main(String[] args) {
    C2Class c2 = new C2Class();
    System.out.println(c2.hello());
  }
}
</pre>

<pre class="console"><strong class="console-result">B2 Interface says hello</strong></pre>

<p>
Final source: <a href="https://github.com/kimjonghoon/multipleInheritance">https://github.com/kimjonghoon/multipleInheritance</a>
</p>

<h3>How to run</h3>

<pre class="shell-prompt">~/multipleInheritance$ <strong>cd src/net/java_school/examples/</strong>
~/multipleInheritance/src/net/java_school/examples$ <strong>javac -d ../../../../bin *.java</strong>
~/multipleInheritance/src/net/java_school/examples$ <strong>cd -</strong>
~/multipleInheritance$ <strong>java -cp ./bin net.java_school.examples.Test</strong>
B1 Class says hello
B2 Interface says hello
</pre>

</article>
