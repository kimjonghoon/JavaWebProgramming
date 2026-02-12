<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Oracle Install</title>
<meta name="Keywords" content="Oracle,Oracle 11g XE,Oracle Express Edition,Ubuntu,Windows" />
<meta name="Description" content="This article describes How to install Oracle" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
	
<h1>Oracle Install</h1>

<p>
To learn JDBC, you need to install a relational database.
Let's install Oracle 11g XE. --XE stands for Express Edition--
</p>

<h3>How to install Oracle 11g XE on Windows</h3>

<p>
Visit <a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a>
and download Oracle Database 11gR2 Express Edition for your Windows. 
If you are not a member of the Oracle website, you must register and log in to download the Oracle 11g XE.
</p>

<p>
Windows is an Oracle-supported operating system, So you can install Oracle easily.
</p>

<p>
Unzip the downloaded file. Run setup.exe in the subdirectory Disk1 to run the installation wizard. Continue clicking the Next button to complete the installation. Be sure to remember the administrator password you entered during the installation process.
</p>

<p>
On Windows, you cannot change the port used by Oracle XDB during the Oracle installation process. After installation, change the port used by XDB as follows:
</p>

<pre class="prettyprint">
C:\Users&gt; sqlplus
Enter user-name: system
Enter password:
Connected.

SQL&gt; Exec DBMS_XDB.SETHTTPPORT(9090);

PL/SQL procedure successfully completed.

SQL&gt;
</pre>

<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu_en :: content}"></div>

</article>

</body>
</html>
