<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Difference between JavaScript and Java</title>
<meta name="Keywords" content="javascript,var,switch,associative array" />
<meta name="Description" content="Difference between JavaScript and Java" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify-and-javascript-results.js"></script>
</head>

<body>

<article>

<h1>Difference between JavaScript and Java</h1>

<ul>
	<li>When declaring a variable, prefix the variable name with var.</li>
	<li>Numbers of primitive data types are floating-point.</li>
	<li>How to create an array</li>
	<li>for in statement</li>
	<li>JavaScript can pass a function to another function as an argument. (Since Java 8, Java can also give a lambda expression as an argument)</li>
</ul>

<p>
We have already confirmed 1 and 2.
</p>

<h3>How to create an array</h3>

<h4>[]</h4>

<p>
Arrays created using [] provide indexes.
</p>

<pre class="prettyprint script-result-display">
var arr = [1, 2, 3, 4, 5];
var sum = 0;
for (var i = 0; i &lt; arr.length; i++) {
  sum = sum + arr[i];
}
alert('SUM:' + sum);
</pre>

<h4>Array object</h4>

<p>
Arrays created using Array object provide indexes.
</p>

<pre class="prettyprint script-result-display">
var arr = new Array(1, 2, 3, 4, 5);
var sum = 0;
for (var i = 0; i &lt; arr.length; i++) {
  sum = sum + arr[i];
}
alert('SUM:' + sum);
</pre>

<h4>Associative array</h4>

<p>
Associative arrays have the form {key:value} and do not provide indexes. Java has no Associative arrays.
</p>

<pre class="prettyprint script-result-display">
var person = {"name":"El Draque", "job":"pirate"};
alert(person.name);
alert(person["name"]);
alert(person.job);
alert(person["job"]);
</pre>

<h3>for in statement</h3>

<p>
You can access all elements of associative arrays with the for-in statement.
</p>

<pre class="prettyprint script-result-display">
var person = {"name":"Barbadosed", "job":"pirate"};
var result = "";
for(var property in person) {
  result += person[property];
}
alert(result);
</pre>

<h3>JavaScript can pass functions an arguments to other functions</h3>

<pre class="prettyprint script-result-display">
function x(a, y) {
  var ret = y(a);
  alert(ret);
}
function z(a) {
  return a * a
}
x(2, z);
</pre>

</article>

</body>
</html>
