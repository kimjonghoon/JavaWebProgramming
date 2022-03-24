<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.2.1</div>

<h1>static import</h1>

<p>
Java 5 introduced a static import statement. You can omit the class name with static import statements when using static members.
</p>

<pre class="prettyprint">package net.java_school.examples;

<strong>import static java.lang.Math.*;</strong>

public class StaticImportTest {
  public static void main(String[] args) {
    System.out.println(<strong>sqrt(4)</strong>);//You can omit Math.
  }
}
</pre>

<pre class="console"><strong class="console-result">2.0</strong></pre>

<p>
<strong>import java.util. *;</strong><br />
In the above import statement, * means all types in the java.util package.<br />
<strong>import static java.lang.Math. *;</strong><br />
In the above import statement, * means all static variables and methods of the Math class. If you only want the sqrt() method of the Math class, modify the import statement as follows:<br />
<strong>import static java.lang.Math.sqrt;</strong>
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html">https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html</a></li>
</ul>

</article>
