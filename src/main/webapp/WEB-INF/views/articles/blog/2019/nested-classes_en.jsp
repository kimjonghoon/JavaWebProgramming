<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.2.1</div>

<h1>Nested Classes</h1>

<p>
The Java programming language allows you to define a class within another class. Such a class is called a nested class.
</p>

<pre class="prettyprint">class OuterClass {

  class NestedClass {
    //...
  }

}
</pre>

<p>
Nested classes are a member of the outer class. As a member of the outer class, nested classes can be declared private, public, protected, or package private. (Recall that outer classes can only be declared public or package private) Nested classes have two categories: static and non-static. Nested classes that are declared static are called static nested classes. Non-static nested classes are called inner classes. Inner classes have access to instance variables or instance methods --even if they are declared private-- of the outer class. Static nested classes do not have access to instance variables or instance methods of the outer class.
</p>

<pre class="prettyprint">class OuterClass {

  static class StaticNestedClass {
    //...
  }

  class InnerClass {
    //...
  }

}
</pre>

<p>
Like static variables or methods, static nested classes cannot refer directly to instance variables or methods defined in outer class.
</p>

<h3>Why Use Nested Classes?</h3>

<ul>
	<li>Increases encapsulation</li>
	<li>More readable and maintainable code: Nesting small classes within top-level classes places the code closer to where it is used.</li> 
</ul>

<p>
The following code snippets from the ArrayList&lt;E&gt; class show an excellent example of Nested classes.
</p>

<pre class="prettyprint">public Iterator&lt;E&gt; iterator() {
  return new Itr();
}

private class Itr implements Iterator&lt;E&gt; {
  //...
}
</pre>

<h3>Anonymous Classes</h3>

<p>
The life cycle of the method and its local variables is the same. The life cycle of inner classes is longer than the one of methods. Therefore, Java restricts anonymous classes defined in a method only to use the final local variables of the method.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html">https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html</a></li>
</ul>

</article>
