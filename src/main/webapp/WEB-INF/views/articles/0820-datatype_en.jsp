<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Data Type</h1>

<p>
The primary data types of JavaScript are letters, numbers, and boolean. When declaring a variable, prefix the variable name with var.
</p>

<pre class="prettyprint script-result-display">
var city = "New York";//or 'New York'
var result = 1200 / 1000;
var onGlass = true;
alert('city: ' + city);
alert('result: ' + result);
alert('onGlass: ' + onGlass);
</pre>

<h3>Local variables and global variables</h3>

<p>
A local variable is a variable declared within a function, and you can only use it within the function. A global variable is a variable declared outside of functions, and you can use it anywhere. Variables declared without the var keyword are global, regardless of whether they are inside or outside a function. However, it is a good practice always to add var keywords when declaring variables.
</p>

<h3>Constant</h3>

<p>
Live variables, there are global constants and local constants. To declare a constant, prefix the constant name with const. It is better to use only uppercase letters and underscores (_) in constant names.
</p>

<pre class="prettyprint script-result-display">
const PI = 3.14;
alert('PI: ' + PI);
</pre>

<h3>Comment</h3>

<p>
// is a one-line comment. /* ~ */ is a multiline comment.
</p>

<h3>Identifier</h3>

<p>
You can combine letters, numbers, _, and $ to create an identifier, which must not have the same name as any keyword. JavaScript identifies the case of identifiers.
</p>

<h3>undefined</h3>

<p>
The undefined means 'no value assigned.' You get this when you refer to an uninitialized variable.
</p>

<pre class="prettyprint script-result-display">
var i;
alert('i: ' + i);
</pre>

<p>
Returns false if condition is 0, "", NaN, undefined.
</p>

<pre class="prettyprint script-result-display">
var i;
if (i) {
  alert('i: ' + "true");
} else {
  alert('i: ' + "false");
}
</pre>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/javascript/objects"/>">Objects</a></li>
		<li>Prev : <a href="<c:url value="/javascript/intro"/>">Introduction</a></li>
	</ul>
</div>

</article>