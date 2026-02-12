<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>RegExp</title>
<meta name="Keywords" content="javascript,RegExp,i flag,g flag,exec,test" />
<meta name="Description" content="JavaScript RegExp Object" />
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

<h1>RegExp</h1>

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

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_regexp.asp">http://www.w3schools.com/jsref/jsref_obj_regexp.asp</a></li>
  <li><a href="http://regexlib.com">http://regexlib.com</a></li>
</ul>
</article>

</body>
</html>
