<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Introduction</h1>

<p>
JavaScript is a scripting language that runs in web browsers. Web browsers have a JavaScript engine. But because engines are not the same, you should test your JavaScript code in various web browsers. <a href="http://www.ecma-international.org">Ecma International</a> is in charge of standardizing JavaScript.
</p>

<h3>JavaScript Usages</h3>
<ul>
	<li>Validation</li>
	<li>Event handler</li> 
	<li>Dynamic menus</li>
	<li>Changing CSS properties</li>
	<li>Adding content</li>
</ul>

<h3>Validation</h3>

<p>
signUp.html is the subscription form page.
This page should check that values entered by the user are are valid before sending the parameters to the server.
</p>

<h6 class="src">signUp.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Example&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function check() {
  var form = document.getElementById("signUpForm");
  var id = form.id.value;
  id = trim(id);
  if (id.length == 0) {
    alert("Invalid ID");
    return false;
  }
  var pass = form.passwd.value;
  pass = trim(pass);
  if (pass.length == 0) {
    alert("Invalid Password");
    return false;
  }
  var name = form.name.value;
  name = trim(name);
  if (name.length == 0) {
    alert("Invalid Name");
    return false;
  }
  var email = form.email.value;
  var chk = emailCheck(email);
  if (chk == false) {
    alert("Invalid Email");
    return false;
  }
  var mobile = form.mobile.value;
  mobile = trim(mobile);
  if (mobile.length == 0) {
    alert("Invalid Mobile");
    return false;
  }
  chk = beAllowStr(mobile,"0123456789-");
  if (chk == false) {
    alert("Invalid Mobile");
    return false;
  }
	
  return true;
}

function <strong>trim(str)</strong> {
  for (var i = str.length - 1; i &gt;= 0; i--) {
    if (str[i] == " ") {
      str = str.substring(0, i);
    } else {
      break;
    }
  }
  for (var i = 0; i &lt; str.length; i++) {
    if (str[i] == " ") {
      str = str.substring(i+1, str.length);
    }	
  }
  return str;
}

function beAllowStr(str, allowStr) {
  for (var i = 0;i &lt; str.length; i++) {
    var ch = str.charAt(i);
    if (allowStr.indexOf(ch) &lt; 0) {
      return false;
    }
  }
  return true;
}

function <strong>emailCheck(email)</strong> {
  var allowStr = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.-_";
  if (beAllowStr(email, allowStr) == false) {
    return false;
  }
  var golbang = 0;
  var dot = 0;
  if (email.length &lt; 5) {
    return false;
  }
  if (email.indexOf("@") == -1) {
    return false;
  }
  if (email.indexOf(".") == -1) {
    return false;
  }
  if (email.indexOf(" ") != -1) {
    return false;
  }
  for (var i = 0;i &lt; email.length; i++) {
    if (email.charAt(i) == "@") {
      golbang++;
    }
    if (email.charAt(i) == ".") {
      dot++;
    }
  }
  if (golbang != 1 || dot &gt; 3) {
    return false;
  }
  if (email.indexOf("@") &gt; email.indexOf(".")) {
    return false;
  }
  if (email.indexOf("@") == 0  || email.indexOf(".") == email.length - 1) {
    return false;
  }
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Sign Up&lt;/h1&gt;
&lt;form id="signUpForm" action="signUp_proc.jsp" method="post" onsubmit="return check();"&gt;
ID: &lt;input type="text" name="id" value="heist" /&gt;&lt;br /&gt;
Password: &lt;input type="password" name="passwd" value="1440" /&gt;&lt;br /&gt;
Name: &lt;input type="text" name="name" value="John Doe" /&gt;&lt;br /&gt;
Email: &lt;input type="text" name="email" /&gt;&lt;br /&gt;
Mobile: &lt;input type="text" name="mobile" /&gt;&lt;br /&gt;
&lt;input type="submit" value="Submit" /&gt;
&lt;input type="reset" value="Reset" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/signUp.html"/>">Run the example</a><br />
The above code is old-fashioned.
It is desirable to use regular expressions to check whether an email is valid.
</p>

<p>
Modify the emailCheck() and trim() functions to use regular expressions.
</p>
 
<pre class="prettyprint" style="white-space: pre-wrap">
function emailCheck(email) { 
  var re = /^(([^&lt;&gt;()[\]\\.,;:\s@\"]+(\.[^&lt;&gt;()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function trim(str) {
  return str.replace(/(^\s*)|(\s*$)/gi, "");
}
</pre>

<p>
Create a function to validate mobile numbers like below.
</p>

<pre class="prettyprint">
function mobileCheck(mobile) {
  var re = /\d+-\d+-\d+/;
  return re.test(mobile);
}
</pre>

<p>
Create signUp2.html using the above three functions to validate user input values.
</p>

<p>
<a href="<c:url value="/examples/signUp2.html"/>">Run the example</a>
</p>

<p>
SignUp.html and signUp2.html differ in mobile validation criteria.
The check() function in signUp.html assess the string consisting of numbers and dashes as a valid mobile number.
The mobileCheck() function in signUp2.html considers the format 'one or more numbers - one or more numbers - one or more numbers' as a valid mobile number.
</p>

<h3>Event handler</h3>

<p>
<input type="button" value="Button" onclick="alert('Click Button!');" />
</p>

<p>
The code for this button is:
</p>

<pre class="prettyprint">
&lt;input type="button" value="Button" <strong>onclick="alert('Click Button!');"</strong> /&gt;
</pre>

<p>
When you click the button, the alert() function runs.
You can place a user-defined function in place of alert().
That user-defined function is called an event handler.
</p>

<p>
Links, submit buttons, and reset buttons have default behavior for events.
In other words, links, submit buttons and reset buttons work without JavaScript.
But the other buttons do nothing without event handlers.
</p>

<p>
In the subscription example, We made the check() function works before performing the basic operation of the submit button by adding the onsubmit attribute to the form element like below:
</p>

<pre class="prettyprint">
&lt;form .. onsubmit="<strong>return check();</strong>"&gt;
</pre>

<p>
The check() function must return a boolean value. Returning true makes the form does the default behavior that sends parameters to the server. Returning false disables the form's default behavior, so nothing happens after the check() function terminates.
</p>

<h3>Dynamic menus</h3>

<p>
The dTree in the link below is an excellent example to understand JavaScript dynamic menus.
</p>

<p>
<a href="http://destroydrop.com/javascripts/tree/default.html">dTree</a>
</p>

<p>
Dynamic means moving in response to users.
</p>

<h3>Changing CSS properties</h3>

<p>
JavaScript allows you to change the CSS properties of an element when an event occurs.
</p>

<p>
Add the following JavaScript function under &lt;script type="text/javascript"&gt; of signUp2.html and create the signUp3.html using Save As menu.
</p>

<pre class="prettyprint">
function testCss() {
  var inputs = document.getElementsByTagName("input");
  for (var i = 0; i &lt; inputs.length; i++) {
    inputs[i].style.background="yellow";
  }
}
</pre>

<p>
Add the onload attribute to the body element. The onload event of the body element occurs when all elements of the document are downloaded and available.
</p>

<pre class="prettyprint">
&lt;body onload="testCss()"&gt;
</pre>

<p>
<a href="<c:url value="/examples/signUp3.html"/>">Run the example</a>
</p>

<h3>Adding content</h3>

<p>
Facebook comments are an excellent example of adding content to a web page using JavaScript.
</p>

<p>
<img src="https://lh3.googleusercontent.com/WZdis9p54_NdJqP8v7BtF9Vh67NGI8lc1kETZduEWogDdZLD5iSpuWnUl3ZCJMHmn0lQZEaBHhl9noyxwpPI13B4oIKS1g5EyakctRc4I5ooyhb7NI_fjvMjMKrj9OKjmhZak_W-dsp2_MwxVpJvsxmPFAILGr09duj1kDaxAnJzCPKPFBNXcyEuzHis-k4_4PfM5fTDmeqXIEJMUxEy1-b8WhdjxfsU4rDztwInQfWA1_y2-5urMUvCHTVMPItWmZHwqpy1CaJHrg3Jtq-FCDtizB1bnchwhX_hQsFxQV60CfEGVh-Fc-mJrAcYxUFrjPP2mBBE6fDikRyfBhpGvdWATuPUpi6c1RgQPV-BYmkJwXFeR6mOY0C21W26fpek8NoGUftneoShdX9Biq4E541VB1nJ6WdueSjISsQfVNyfP_RLWlrSMb-9PHq9L-GQnkbNnwjDbYruoMmMb-5FMTVmBUIXZruccbA01m-77Utw8fiIlbAJvjA_i82kAhn3mJjs59X_AUGwfHkwFPez98Z9PFRBXkPDWb0LBa9WJTGlQJ8uW7w1oVkJnLEAQ6WOz6YNyRz2Y_4ZJiZDTQKBz73yNAksAb1arYBvjm0=w636-h161-no" alt="facebook comments">
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://stackoverflow.com/questions/46155/validate-email-address-in-javascript">http://stackoverflow.com/questions/46155/validate-email-address-in-javascript</a></li>
</ul>

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

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/javascript/datatype"/>">Data Type</a></li>
		<li>Prev : <a href="<c:url value="/spring/bean-validation"/>">Bean Validation</a></li>
	</ul>
</div>
						
</article>