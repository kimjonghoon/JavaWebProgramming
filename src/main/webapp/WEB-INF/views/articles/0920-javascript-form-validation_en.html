<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Form Validation</title>
<meta name="Keywords" content="javascript,getElementsTagName,getElementById,onsumit,disable,onchange,onclick,onfocus,onblur" />
<meta name="Description" content="JavaScript Form Validation" />
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

<h1>Form Validation</h1>

<h3>Accessing forms with JavaScript</h3>

<p>
The following is a way to reference a form object from &lt;form id="<strong>someform</strong>"&gt;.
</p>

<pre class="prettyprint">
var form = document.getElementById("<strong>someform</strong>");
</pre>

<h3>Submit event handler</h3>

<p>
Here's how to specify the handler function to perform when users click the submit button:
</p>

<pre class="prettyprint">
&lt;form id="someform" onsubmit="<strong>return someHandler()</strong>"&gt;
</pre>

<p>
The above <strong>someHandler()</strong> function should return true to pass the form to the server and false to cancel the form submission.
</p>

<h3>How to disable the radio button</h3>

<p>
Here is how to disable the radio button.
</p>

<pre class="prettyprint">
document.someform.radiogroup[i].disabled = true;
</pre>

<p>
Disabled parameters don't go to the server.
</p>

<h6 class="src">send1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function check() {
  var form = document.getElementById("testForm");
  <strong>form.condition[4].disabled = true;</strong>
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a th:href="@{/examples/send1.html}">Run example</a>
</p>

<h3>Event handler that executes when radio button or checkbox is selected</h3>

<h6 class="src">send2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function agree() {
  var form = document.getElementById("testForm");
  var submit = document.getElementById("submit");
  if (form.agree.checked == true) {
    submit.disabled = false;	
  } else {
    submit.disabled = true;
  }
}
function check() {
  var form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  var chk = form.confirm[0].value
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
  I agree to the information provided.
  &lt;input type="radio" name="agree" value="y" onchange="agree()" /&gt;
  &lt;input type="submit" id="submit" value="Submit" disabled="disabled" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a th:href="@{/examples/send2.html}">Run example</a>
</p>

<h3>Things We Need To Know In HTML Form</h3>

<ul>
  <li>You can not dynamically add or delete radio button or checkbox options.</li>
  <li>The type attribute of the input element has three values:text, password, hidden.</li>
  <li>You can type multiple lines in the textarea.</li>
  <li>You can access values entered in input and textarea with their value attribute.</li>
  <li>In addition to click, you can use change, focus, and blur events to perform form validation. How to register each event handler is as follows.
    <ul>
      <li>onchange="someHandler()"</li>
      <li>onfocus="someHandler()"</li>
      <li>onblur="someHandler()"</li>
    </ul>
  </li>
</ul>

<h3>Decoupling JavaScript code and HTML design</h3>

<p>
Registering event handlers using the element's attributes increases coupling with HTML.
</p>

<pre class="prettyprint">
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
</pre>

<p>
You can loosen coupling by modifying send1.html as below.
</p>

<h6 class="src">send1-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
<strong>window.onload = initPage;

function initPage() {
  var form = document.getElementById("testForm");
  form.onsubmit = check;
}

function check() {
  var form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}</strong>
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a th:href="@{/examples/send1-1.html}">Run example</a>
</p>

<p>
The above example registers all handlers when an onload event occurs. The onload event occurs when all elements of the HTML document (including images) are ready.
</p>

<p>
You can also make the JavaScript code into an external file to loosen coupling more. However, some of your co-workers may not like this approach in maintenance.
</p>

<h6 class="src">send1.js</h6>
<pre class="prettyprint">
window.onload = initPage;

function initPage() {
  var form = document.getElementById("testForm");
  form.onsubmit = check;
}

function check() {
  var form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}
</pre>

<h6 class="src">send1-2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
<strong>&lt;script type="text/javascript" src="send1.js"&gt;&lt;/script&gt;</strong>
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a th:href="@{/examples/send1-2.html}">Run example</a>
</p>

<h6 class="src">send2-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
window.onload = initPage;

function initPage() {
  var submit = document.getElementById("submit");
  submit.disabled = true;
  var form = document.getElementById("testForm");
  form.onsubmit = check;
  form.agree.onchange = agree;
}

function agree() {
  var form = document.getElementById("testForm");
  var submit = document.getElementById("submit");
  if (form.agree.checked == true) {
    submit.disabled = false;	
  } else {
    submit.disabled = true;
  }
}
function check() {
  var form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
  I agree to the terms and conditions
  &lt;input type="radio" name="agree" value="y"/&gt;
  &lt;input type="submit" id="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a th:href="@{/examples/send2-1.html}">Run example</a>
</p>

<p>
Let's separate the JavaScript code from the example.
</p>

<p>
<a th:href="@{/examples/send2-2.html}">Run example</a>
</p>

</article>

</body>
</html>
