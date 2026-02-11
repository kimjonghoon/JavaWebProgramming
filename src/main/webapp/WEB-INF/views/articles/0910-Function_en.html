<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Function</title>
<meta name="Keywords" content="javascript,Declarative function,Anonymous function,Self-Executing Anonymous Functions,scoping,hoisting,closures,inner function,Shared variable between closures,Object-oriented coding in JavaScript" />
<meta name="Description" content="JavaScript Function Object" />
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

<h1>Function</h1>

<p>
JavaScript divide functions into declarative and anonymous.
</p>
 
<h3>Declarative function</h3>

<p>
JavaScript interprets declarative functions only once when the page is loaded. The interpreted declarative function executes each time users call it. When you create a declarative function, you need to use the function keyword, function name, argument list, and function body as shown below:
</p>

<pre class="prettyprint">
function functionName (arg1, arg2,,,argN) {
  //Execution syntax
}
</pre>

<pre class="prettyprint script-result-display">
function add(a,b) {
  return a + b;
}
alert(add(3,4));
</pre>

<h3>Anonymous function</h3>

<p>
An anonymous function is a function that is created dynamically at runtime.
</p>

<pre class="prettyprint script-result-display">
var multiply = function(a, b) {
  return a * b
};
alert(multiply(3,4));
</pre>

<p>
You can create an anonymous function using the Function's constructor. But this method is not used often.
</p>

<pre class="prettyprint script-result-display">
var minus = new Function('a','b', 'return a - b');
alert(minus(3,4));
</pre>

<h3>Self-Executing Anonymous Functions</h3>

<p>
If you put a function in parenthesis and lay another parenthesis right next to the closing parenthesis, the function inside the parenthesis runs immediately.
</p>

<pre class="prettyprint script-result-display">
(function() {
  alert("Hello World!");
})();
</pre>

<pre class="prettyprint script-result-display">
(function(whom) {
  alert("Hello " + whom);
})('John Doe');
</pre>

<pre class="prettyprint script-result-display">
(function(a, b) {
  alert(a + b);
})(2,5);
</pre>

<h3>Scoping and Hoisting</h3>

<p>
Scoping is a rule that determines the effective area of a variable.
</p>

<p>
Understanding scoping requires an understanding of hoisting. But, hoisting is not an official term in JavaScript.
</p>

<p>
Hoisting refers to the action of a JavaScript interpreter to 'raise a declared variable or function to the top of the current execution area.' The assignment statement is not subject to hoisting because the engine runs it at runtime.
</p>

<p>
In Java, variables declared in a block are valid only within a block. In JavaScript, however, you can only create such variables within a function. In other words, you can not create variables that are valid only in the {} and if statement blocks.
</p>

<p>
Predict the results of the following code.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
  if (true) {
    var x = 10;
  }
  alert(x);
}
fn();
</pre>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
  x = 10;
  return;
}
fn();
alert(x);
</pre>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
  x = 10;
  return;
  function x() {}
}
fn();
alert(x);
</pre>

<p>
The identifier x of the fn() function is valid only within the fn() function. The JavaScript engine interprets the above source as follows.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
  function x() {}
  x = 10;
  return;
}
fn();
alert(x);
</pre>

<p>
Predict the results of the following code.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
function fn() {
  function x() {}
  x = 10;
  return x;
}
var retVal = fn();
alert(retVal);
alert(x);
</pre>

<p>
In JavaScript, you can not create variables that are valid only in the {} and if statement blocks.
</p>

<pre class="prettyprint script-result-display">
var x = 1;
alert(x);
if (true) {
  var x = 2;
  alert(x);
  x++;
}
alert(x);
</pre>

<pre class="prettyprint script-result-display">
function foo() {
  var x = 1;
  if (x) {
    (<strong>function () {
      var x = 2;</strong>
      alert(x);
    <strong>}</strong>());
  }
  alert(x);
}
foo();
</pre>

<p>
The declared variable x in the inner function of function foo is a new variable with a valid region within the internal function. It has no relation to the declared variable x in the outer function foo.
</p>

<pre class="prettyprint script-result-display">
var x = 10;
function fn() {
  alert(x);
  var x = 20;
  alert(x);
}
fn();
alert(x);
</pre>

<p>
The JavaScript engine hoists the above code as follows.
</p>

<pre class="prettyprint script-result-display">
var x = 10;
function fn() {
  var x;
  alert(x);
  x = 20;
  alert(x);
}
fn();
alert(x);
</pre>

<p>
Comment out the var x declared in the function fn() to see how the result changes.
</p>

<p>
Predict the results of the following code.
</p>

<pre class="prettyprint script-result-display">
sayHo(); //SayHo() comes first in the code.
function sayHo() { 
  alert("Ho");
}
</pre>

<p>
The JavaScript engine hoists the above code as follows.
</p>

<pre class="prettyprint script-result-display">
function sayHo() { 
  alert("Ho");
}
sayHo();
</pre>

<p>
The following code, which looks similar to the above, throws an error.
</p>

<pre class="typeError">
sayHo(); //TypeError: sayHo is not a function
var sayHo = function() {
  alert("Ho");
}
</pre>

<p>
The following is more complicated.
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
  function greet() {
    alert("How You Doin?");
  }
  return greet();
  function greet() {
    alert("What's Up?");
  }
}
bumpInto();
</pre>

<p>
The JavaScript engine hoists the above code as follows.
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
  function greet() {
    alert("How You Doin?");
  }
  function greet() {
    alert("What's Up?");
  }
  return greet();
}
bumpInto();
</pre>

<p>
If the parameter list is different, will it overload as Java?
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
  function greet() {
    alert("How You Doin?");
  }
  function greet(whom) { //Greet function with parameters
    alert("What's Up?");
  }
  return greet();
}
bumpInto();
</pre>

<p>
JavaScript doesn't overload functions as Java does. The greet (whom) declared later is executed.
</p>

<p>
Remember that the assignment statement is not subject to hoisting because the engine runs it at runtime.
</p>

<p>
Predict the results of the following code.
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
  var greet = function () {
    alert("How You Doin?");
  }
  return greet();
  var greet = function (whom) {
    alert("What's Up?");
  }
}
bumpInto();
</pre>

<p>
The engine hoists and interprets the code as shown below.
</p>

<pre class="prettyprint script-result-display">
function bumpInto() {
  var greet;
  var greet;
  greet = function () {
    alert("How You Doin?");
  }
  return greet();
  greet = function (whom) {
    alert("What's Up?");
  }
}
bumpInto();
</pre>

<p>
After the return statement, the greet() function, which prints "What's Up?" has no chance to do it.
</p>

<h3>Closures</h3>

<h4>Inner function</h4>

<p>
JavaScript supports internal functions. An inner function can use variables declared in an outer function, which wraps the inner.
</p>

<pre class="prettyprint script-result-display">
function fn() {
  var balance = 0; //outside variable
  function deposit(money) { //inner function
    balance += money;
    alert(balance);
  }
  deposit(100);
}
fn();
</pre>

<p>
There is no way to call an internal function directly outside the parent function, but there is a way to execute the internal function outside the parent function.
</p>

<p>
A JavaScript function is an object, so you can assign a function to a variable or pass it as an argument to another function.
</p>

<pre class="prettyprint script-result-display">
function fn() {
  var balance = 0; //outside variable
  function deposit(money) { //inner function
    balance += money;
    alert(balance);
  }
  <strong>alert("The fn() function is executed.");</strong>
  <strong>return deposit;</strong>
}
var <strong>retFn</strong> = fn();//If the function fn does not return, retFn is undefined.
retFn(200);
</pre>

<p>
The above example shows how to use the inner function outside the parent function. The fact that this code runs without problems makes the Java programmer uncomfortable. In Java, local variables defined in a method disappear when the method terminates. But, the variable balance is still valid even though the fn() function ends.
</p>

<p>
Since the retFn has a closure, the variable balance is still valid. A closure is a peculiar object made up of two. The first is a function, and the second is an environment created by the function. The environment here means variables declared outside the function that is available by the function. The retFn has a closure containing the function deposit and the variable balance.
</p>

<pre class="prettyprint script-result-display">
function fn() {
  var balance = 0;
  function deposit(money) {
    balance += money;
    alert(balance);
  }
  return deposit;
}

var ac1 = fn();
alert("---ac1---");
ac1(50);
ac1(450);

var ac2 = fn();
alert("---ac2---");
ac2(2000);
ac2(500);
</pre>

<p>
JavaScript creates a closure when outside the function references the function's inner functions. You can call internal functions through a reference beyond its scope means that you can still call in the future, so JavaScript must keep this function. If a variable is a local variable of a parent function, the inner function inherits the parent's scope and can reference the variable. Calling deposit() twice with the same reference variable, you can see the accumulated balance. Also, the balance variables increase independently in calls to the deposit() function that use different reference variables (ac1 and ac2).
</p>

<h4>Shared variables between closures</h4>

<pre class="prettyprint script-result-display">
function account(accountNo) {
  var balance = 0;
	
  function getAccountNo() {
    return accountNo;
  }
  function deposit(money) {
    balance += money;
  }
  function withdraw(money) {
    balance -= money;
  }
  function getBalance() {
    return balance;
  }
  return {
    "getAccountNo": getAccountNo,
    "deposit": deposit,
    "withdraw": withdraw,
    "getBalance": getBalance
  };
}

var ac1 = account('111');
<strong>ac1.deposit(1000);</strong>
<strong>ac1.withdraw(500);</strong>
alert(ac1.getAccountNo() + ': ' + ac1.getBalance());

<strong>var ac2 = account('222');</strong>
ac2.deposit(3000);
ac2.withdraw(1000);
alert(ac2.getAccountNo() + ': ' + ac2.getBalance());
</pre>

<p>
<strong>ac1.deposit(1000);</strong><br />
<strong>ac1.withdraw(500);</strong>
</p>

<p>
The four internal functions share the local variables. If the deposit() function increments the balance by 1000, the increased balance will be the new starting value when you call the withdraw() again.
</p>

<h4>var ac2 = account('222');</h4>

<p>
When you call account() again, JavaScript creates a new closure instance with the closed environment.
</p>

<h3>Object-oriented coding in JavaScript</h3>

<p>
The following example is similar to the Account class in Java.
</p>

<p>
There is a 'prototype' property in JavaScript. The prototype property allows you to add a new property or function to an object.
</p>

<pre class="prettyprint script-result-display">
function Account(accountNo,balance) {
  this.accountNo = accountNo.toString();
  this.balance = balance;
}
Account.prototype.getAccountNo = function () {
  return this.accountNo;
};
Account.prototype.getBalance = function () {
  return this.balance;
};
Account.prototype.deposit = function (money) {
  this.balance += money;
};
Account.prototype.withdraw = function (money) {
  this.balance -= money;
};

var ac1 = new Account('111',500);
ac1.deposit(1000);
ac1.withdraw(500);
alert(ac1.getAccountNo() + ': ' + ac1.getBalance());

var ac2 = new Account('222',1000);
ac2.deposit(3000);
ac2.withdraw(1000);
alert(ac2.getAccountNo() + ': ' + ac2.getBalance());
</pre>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html">JavaScript Scoping and Hoisting</a></li>
  <li><a href="http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf">ECMAScript 2017 Language Specification</a></li>
  <li><a href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects">Introducing JavaScript objects</a></li>
</ul>
</article>

</body>
</html>
