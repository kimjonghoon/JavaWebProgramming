<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Objects</h1>

<h2>Number</h2>

<p>
If you work in Eclipse, you can get the code assist as shown below.
</p>

<p>
<img src="<c:url value="/resources/imagesjavascript-plugin.png"/>" alt="eclipse code assist" />
</p>

<pre class="prettyprint script-result-display">
var num = new Number(2194.123456);
alert("A. "+num<strong>.toExponential(3)</strong>); //Exponential representation of the part beyond three decimal places
alert("B. "+num<strong>.toPrecision(3)</strong>); //3 significant digits
alert("C. "+num<strong>.toFixed(8)</strong>); //8 decimal places
alert("D. "+num<strong>.toLocaleString()</strong>); //Locale digits
alert("E. "+num<strong>.toString()</strong>); //Return as a string
alert("F. "+<strong>Number.MAX_VALUE</strong>); //max value
alert("G. "+<strong>Number.MIN_VALUE</strong>); //minimum value
alert("H. "+<strong>Number.NEGATIVE_INFINITY</strong>); 
alert("I. "+<strong>Number.POSITIVE_INFINITY</strong>); 
alert("J. "+<strong>Number.NaN</strong>); //Not a Number
alert("K. "+(<strong>num.valueOf()</strong> + 1)); //Returns the value of the Number object as a primitive value
//The isNaN() intrinsic is related to the number and is introduced here.
if (<strong>isNaN</strong>("two thousand eighteen") == true) {
  alert("L. Not a Number");
}
</pre>

<h2>String</h2>

<pre class="prettyprint script-result-display">
<strong>var name = new String("Jack Black");
//or var name = "Jack Black";</strong>
alert("A. Name: " + name);

//Same as length() in Java
alert("B. Name's Length: " + name<strong>.length</strong>);

//Returns the character at index 1,Same as Java
alert("C. " + name<strong>.charAt(1)</strong>);

//Return the character code of the index, Same as codePointAt() in Java
alert("D. " + name<strong>.charCodeAt(1)</strong>);

alert("E. " + name<strong>.concat(",Anne Bonny")</strong>);//Same as Java

//Returns the index of "Black",Same as Java
alert("F. " + name<strong>.indexOf("Black")</strong>);

//Search from index 0 to the left,Same as Java
alert("G. " + name<strong>.lastIndexOf("Black",0)</strong>);

//Returns a string that matches the regular expression
alert("H. " + name<strong>.match(/Black/)</strong>);

//Similar to Java's replaceAll()
alert("I. " + name<strong>.replace("Black","White")</strong>);

//Returns the index of the string that matches the regular expression
alert("J. " + name<strong>.search(/Black/g)</strong>);
alert("K. " + name<strong>.slice(1,2)</strong>);//Java's substring(int, int)
alert("L. " + name<strong>.slice(1)</strong>);//Java's substring(int)

//The array of JavaScript is separated by commas.
//Similar to Java's split()
alert("M. " + name<strong>.split(" ")</strong>);

alert("N. " + name<strong>.substring(1,2)</strong>);//Same as Java
alert("O. " + name<strong>.toUpperCase()</strong>);//Same as Java
alert("P. " + name<strong>.toLowerCase()</strong>);//Same as Java
</pre>

<h2>RegExp</h2>

<p>
The literal for a regular expression object is / ~ /. (Not both "/ ~ /" and "/ ~ /") Regular expression objects have test() and exec() methods. The test() returns a boolean value by determining whether the string passed as an argument matches the regular expression. The exec() finds and returns strings that match the regular expression in its argument.
</p>

<pre class="prettyprint script-result-display">
var regExp = /Java/;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h3>Flag</h3>

<p>
The string after the / at the end of the regular expression object is a flag.
</p>

<h4>i</h4>

<p>
Flag i means not case sensitive.
</p>

<pre class="prettyprint script-result-display">
var regExp = /Java/i;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h4>g</h4>

<p>
Flag g remembers the last matching location to make the next exec() find the following matching location from the previous matching location.
</p>

<pre class="prettyprint script-result-display">
var regExp = new RegExp('Java', 'gi'); // /Java/gi
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>

<h3>The character between / and /</h3>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">Number of times</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">*</th>
	<td class="table-in-article-td">0 times or more</td>
</tr>
<tr>
	<th class="table-in-article-th">+</th>
	<td class="table-in-article-td">More than once</td>
</tr>
<tr>
	<th class="table-in-article-th">?</th>
	<td class="table-in-article-td">0 or 1 time</td>
</tr>
<tr>
	<th class="table-in-article-th">.</th>
	<td class="table-in-article-td">Exactly once</td>
</tr>
<tr>
	<th class="table-in-article-th">{}</th>
	<td class="table-in-article-td">
Curly braces are used to specify the number of times a character is repeated.(s{2} means ss)
	</td>
</tr>	
</table>

<pre class="prettyprint script-result-display">
var regExp = /Java-*/gi;
var testStr = "www.java-school.net is the best site to learn Java";
var retArr = regExp.exec(testStr);
retArr = regExp.exec(testStr);
alert(retArr[0]);
</pre>


<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">
The combination of \ followed by a regular character acts as a special promised character.
	</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">\w</th>
	<td class="table-in-article-td">It means a word, exactly alphabets, numbers and _.</td>
</tr>
<tr>
	<th class="table-in-article-th">\W</th>
	<td class="table-in-article-td">Opposite \w</td>
</tr>
<tr>
	<th class="table-in-article-th">\d</th>
	<td class="table-in-article-td">Numbers</td>
</tr>
<tr>
	<th class="table-in-article-th">\D</th>
	<td class="table-in-article-td">Opposite \d, \D* means zero or more characters.</td>
</tr>
<tr>
	<th class="table-in-article-th"><em class="path">\s</em></th>
	<td class="table-in-article-td">Space character</td>
</tr>
</table>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">
The combination of \ followed by a special character means a character itself.
	</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">\*</th>
	<td class="table-in-article-td">* is a special character that means many, but \* denotes the asterisk itself.</td>
</tr>
</table>

<pre class="prettyprint script-result-display">
var regExp = /\s\*/g;
var testStr = "www.java-school.net *is *the *best *site *to *learn *JAVA";
var retStr = testStr.replace(regExp,'-');
alert(retStr);
</pre>

<p>
The following is a form tag for membership.
</p>

<pre class="prettyprint">
&lt;form id="signUp" action="signUp" method="post" onsubmit="return check()"&gt;
  Name &lt;input type="text" name="name" /&gt;
	
  &lt;!-- omit --&gt;

&lt;/form&gt;
</pre>

<p>
Let's write JavaScript code to check that the name-value consists only of whitespace characters.
</p>

<pre class="prettyprint">
function check() {
  var regExp = /\s/g;
  var form = document.getElementById("signUp");
  var name = form.name.value;
  name = name.replace(regExp,"");
  if (name.length == 0) {
    alert("Invalid Name");
    return false;
  }
  return true;
}
</pre>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">Start (^) and End ($)</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">^</th>
	<td class="table-in-article-td">
		It means the starting position of the string.<br />
/^JAVA/ finds "JAVA" at the beginning of the line.
	</td>
</tr>
<tr>
	<th class="table-in-article-th">$</th>
	<td class="table-in-article-td">
		It means the ending position of the string.<br />
/school$/ finds "school" at the end of the line.
	</td>
</tr>
</table>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" colspan="2">
If you want to match multiple characters, list them in []
	</th>
</tr>
<tr>
	<th class="table-in-article-th" style="width: 90px;">[a-zA-Z]</th>
	<td class="table-in-article-td">
matches an alphabet letter or alphabet strings
	</td>
</tr>
<tr>
	<th class="table-in-article-th">[0-9]</th>
	<td class="table-in-article-td">
matches a number or numbers
	</td>
</tr>
<tr>
	<th class="table-in-article-th">^ in []</th>
	<td class="table-in-article-td">
		means to exclude something.<br /> 
[^0-9] is the same as \D
	</td>
</tr>
</table>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 90px;">()</th>
	<td class="table-in-article-td">
Characters that match the pattern enclosed in parentheses are put into the array one after the other. You can get the stored string by $1, $2, etc.
	</td>
</tr>
<tr>
	<th class="table-in-article-th">|</th>
	<td class="table-in-article-td">
It means or.<br />
a|b matches a or b<br />
a|b|c matches a or b or c
	</td>
</tr>
</table>

<p>
Several sites provide helpful regular expressions.
One of them is <a href="http://regexlib.com">http://regexlib.com</a>.
Let's create a JavaScript function that checks if the email and date are valid.
</p>

<pre class="prettyprint script-result-display" style="white-space: pre-wrap">
var emailRegExp = /^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
var dateRegExp = /^\d{4}\/\d{2}\/\d{2}/;

var email = "johndoe@gmail.org";
var signUpDate = "2018/4/21";

var check = emailRegExp.test(email);

if (check) {
  alert("Valid email");
} else {
  alert("Invalid email");
}

check = dateRegExp.test(signUpDate);

if (check) {
  alert("Valid registration date");
} else {
  alert("InValid registration date");
}
</pre>


<h2>Date</h2>

<p>
The Date object allows you to create dates and access values such as year, month, day, and second. If you use the default constructor to create a Date object, the object has the system's current date and current time.
</p>

<pre class="prettyprint script-result-display">
var now = new Date();
alert("Now: " + now.toUTCString());

var milliSecs = new Date(7789110879);
alert("MilliSecs: " + milliSecs.toUTCString());

var soccerDay = new Date("June 14, 2018 16:00:00");
alert("Kick-Off: " + soccerDay.toUTCString());

var birthday = new Date(1981,1,25);
alert("Birthday: " + birthday.toLocaleString());

var newYearsEve = new Date(2018,11,31,23,59,59,59);
alert("New Year's Eve: " + newYearsEve.toUTCString());
</pre>


<h2>Array</h2>

<p>
JavaScript arrays can grow or shrink in size after creation.
</p>

<pre class="prettyprint script-result-display">
var cities = ["Sochi", "New York"];
alert("cities.length=" + cities.length);

var years = new Array(1969, 1970);
years[46] = 2015; //You can add array elements in this way.
alert("years.length=" + years.length);

alert("years=" + years);

for (var idx in years) {
  alert(years[idx]);
}
</pre>

<h3>Methods of Array</h3>

<h4>splice()</h4>

<p>
Cut specific elements from an array and create a new array with that elements. You can add other elements when creating a new array using splice().
</p>

<h4>slice()</h4>

<p>
It returns a new array of parts of the array.
</p>

<h4>concat()</h4>

<p>
Combines two or more arrays to return a copy of the combined array.
</p>

<h4>reverse()</h4>

<p>
It flips the order of the array.
</p>

<p>
The concat() and the slice() methods do not change the original array and return the result as a new array.
</p>

<p>
The JavaScript engine converts the array into a string separated by a comma (,).
</p>

<pre class="prettyprint script-result-display">
var words = new Array('A','B','C','D','E');
var s1 = words.splice(2,2,'c','d');//Remove two elements from index 2 and add 'c' and 'd' at that position 

alert(words);
alert(s1);

var s2 = words.slice(2,4);//Returns a new array from index 2 to index 3 (not including index 4).
alert(s2);
alert(words);
</pre>
 
<h4>for .. in</h4>
<pre class="prettyprint script-result-display">
var lang = ["C", "JAVA", "javascript"];
for (var idx in lang) {
  alert(lang[idx]);
}
</pre>

<h4>Associative arrays</h4>

<p>
Associative arrays can not access an element using an index. When you create an associative array, you typically use Object. Associative arrays also automatically adjust in size whenever you add a new element or remove an element.
</p>

<pre class="prettyprint script-result-display">
var account = new Object();

account["accountNo"] = "1111-2222-3333";
account["name"] = "John Doe";
account["balance"] = 30000;

alert(account["name"]);
alert(account.balance);
</pre>

<p>
The following shows how to access an element in an associative array.
</p>

<pre class="prettyprint">
//Access the getElementsByTagName() element of the associative array document.
document.getElementsByTagName('a');
//Access the element ceil() of the associative array Math.
Math.ceil(175);
</pre>

<p>
The following statement prints all elements of the document object.
</p>

<pre class="prettyprint script-result-display">
for (var property in document) {
  alert(property + ":" + document[property]);
}
</pre>

<p>
The above example has different results for different browsers.
All JavaScript objects are an associative array.
</p>


<h2>Math</h2>

<pre class="prettyprint script-result-display">
var random = Math.random() * 10;
random = random.toPrecision(3);
alert("Random: " + random);

var ceil = Math.ceil(random);
alert("Ceil: " + ceil);

var floor = Math.floor(random);
alert("Floor: " + floor);

var round = Math.round(random);
alert("Round: " + round);
</pre>

<p>
The following JavaScript code generates a lotto number.
</p>

<pre class="prettyprint script-result-display">
var lotto = new Array();
var index = 0;
while(true) {
  var check = true;
  var ball = Math.random() * 45;
  ball = Math.floor(ball) + 1;
  for (var i = 0; i &lt; lotto.length;i++) {
    if (lotto[i] == ball) {
      check = false;
      break;
    }
  }
  if (check) {
    lotto[index++] = ball
  }
  if (index &gt; 5) {
    break;
  }
}

alert("Lotto number: " + lotto.toString());
</pre>


<h2>Function</h2>

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
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_regexp.asp">http://www.w3schools.com/jsref/jsref_obj_regexp.asp</a></li>
  <li><a href="http://regexlib.com">http://regexlib.com</a></li>
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_date.asp">http://www.w3schools.com/jsref/jsref_obj_date.asp</a></li>
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_array.asp">http://www.w3schools.com/jsref/jsref_obj_array.asp</a></li>
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_math.asp">http://www.w3schools.com/jsref/jsref_obj_math.asp</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/javascript/examples"/>">Examples</a></li>
		<li>Prev : <a href="<c:url value="/javascript/datatype"/>">Data Type</a></li>
	</ul>
</div>

</article>