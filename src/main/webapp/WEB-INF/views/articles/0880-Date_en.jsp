<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Date</title>
<meta name="Keywords" content="javascript,Date,toUTCString,toLocalString,new Date" />
<meta name="Description" content="JavaScript Date Object" />
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

<h1>Date</h1>

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

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.w3schools.com/jsref/jsref_obj_date.asp">http://www.w3schools.com/jsref/jsref_obj_date.asp</a></li>
</ul>
</article>

</body>
</html>
