<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<pre class="prettyprint">
gcloud components install app-engine-java
</pre>

<p>
Go to the root directory, and execute the following command:
</p>

<pre class="prettyprint">
mvn appengine:run
</pre>

<p>
Visit the http://localhost:8080.
</p>

</article>
