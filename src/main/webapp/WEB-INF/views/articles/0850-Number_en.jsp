<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Number</title>
<meta name="Keywords" content="javascript,toExponential,toPrecision,toFixed,toLocalString,toString,MAX_VALUE,MIN_VALUE,NEGATIVE_INFINITY,POSITIVE_INFINITY,NaN,valueOf,isNaN" />
<meta name="Description" content="JavaScript Number Object" />
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

<h1>Number</h1>

<p>
If you work in Eclipse, you can get the code assist as shown below.
</p>

<p>
<img src="https://lh3.googleusercontent.com/-lsFSrTUjwYA/UotVMybUr4I/AAAAAAAABdQ/gtTrUc0F6YA/s507/javascript-plugin.png" alt="eclipse code assist" />
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

</article>

</body>
</html>
