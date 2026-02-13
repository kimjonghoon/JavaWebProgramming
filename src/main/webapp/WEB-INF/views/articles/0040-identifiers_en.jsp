<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
			
<h1>Keywords, Identifiers, Comments</h1>

<h3>Keywords</h3>

<p>
In a computer language, keywords are reserved words for particular uses.
</p>

<h2>Identifiers</h2>

<p>
The names of classes, variables, and methods are collectively called identifiers.
</p>

<p>
Java identifiers must adhere to the following rules:
</p>

<ol>
	<li>Begin with an alphabet character</li>
	<li>White space is not permitted</li>
	<li>Special characters are not allowed except the $ and the _</li>
	<li>Java keyword is not permitted</li>
</ol>

<p>
There are naming conventions that most Java programmers follow.
</p>

<ol>
	<li>Class names should be nouns that start with an uppercase letter, mixed with the first letter of each internal word capitalized. (ex, <b>A</b>ccount, <b>B</b>ank<b>A</b>ccount)</li>
	<li>Method names should be verbs that start with a lowercase letter, mixed with capitalized by the first letter of each internal word. (ex, <b>d</b>eposit(), <b>g</b>et<b>A</b>ccount<b>N</b>o())</li>
	<li>Variable names should be nouns that start with a lowercase letter, mixed with capitalized by the first letter of each internal word. (ex, <b>b</b>alance, <b>a</b>ccount<b>N</b>o, <b>b</b>ank<b>A</b>ccount<b>N</b>o)</li>
	<li>Constant names should be all uppercase with words separated by underscore _. (ex, <b>SWIFT</b>_<b>CODE</b>)</li>
</ol>

<p>
We haven't covered Java constants yet. How to create constants in Java will be explained later.
</p>

<p>
Bank accounts are not objects in the real world because they are invisible. But in the software world, it can be objects.
</p>

<p>
Follow the naming conventions and create a bank account class.
</p>

<pre class="prettyprint">
class <strong>Account</strong> {
  String <strong>accountNo</strong>; 
  int <strong>balance</strong>;
	
  String <strong>getAccountNo</strong>() { 
    return accountNo;
  }
	
  void <strong>setAccountNo</strong>(String <strong>account</strong>) { 
    accountNo = account;
  }

  int <strong>getBalance</strong>() { 
    return balance;
  }
  void deposit(int <strong>amount</strong>) {
    balance = balance + amount;
  }

  void withdraw(int <strong>amount</strong>) {
    balance = balance - amount;
  }
}
</pre>

<h3>Comments</h3>

<p>
Keywords and identifiers are essential elements of the code. Although not required, comments are also a component of the code. Comments are text added to make the source code easier to understand by programmers. Compilers ignore comments.
</p>

<p>
The Java language supports three kinds of comments.
</p>

<pre>
//text
</pre>

<p>
The compiler ignores everything from // to the end of the line.
</p>

<pre>
/*
 text
*/
</pre>

<p>
The compiler ignores everything between /* and */.
</p>

<pre>
/**
 text
*/
</pre>

<p>
The compiler ignores everything between /** and */.<br />
You can generate Java documentation using the JDK's Javadoc with these comments.
</p>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/datatype"/>">Data Type</a></li>
    <li>Prev : <a href="<c:url value="/java/object-and-class"/>">Object and Class</a></li>
  </ul>
</div>
</article>