<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Google Cloud Blobstore Example</title>
<meta name="Keywords" content="java,google app engine,google cloud,blobstore,mvn appengine:run, gcloud components install app-engine-java" />
<meta name="Description" content="Google App Engine Blobstore Example" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 2018.3.26</div>
	
<h1>Google Cloud Blobstore Example</h1>

<p>
Source: <a href="https://github.com/kimjonghoon/gaefile">https://github.com/kimjonghoon/gaefile</a>
</p>


<h3>How to Run</h3>

<p>
You need to install the Google Cloud SDK.<br />
Visit <a href="https://cloud.google.com/sdk/downloads">https://cloud.google.com/sdk/downloads</a> and follow the Interactive installer. After installation, open a command prompt and install java components with the following command:
</p>

<pre class="shell-prompt">
gcloud components install app-engine-java
</pre>

<p>
Go to the root directory, and execute the following command:
</p>

<pre class="shell-prompt">
mvn appengine:run
</pre>

<p>
Visit the http://localhost:8080.
</p>

</article>

</body>
</html>
