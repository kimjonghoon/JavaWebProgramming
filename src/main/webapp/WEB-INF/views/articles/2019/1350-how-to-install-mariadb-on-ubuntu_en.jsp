<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Install MariaDB on Ubuntu 22.04</title>
<meta name="Keywords" content="Ubuntu 22.04,MariaDB,sudo apt install mariadb-server,sudo mysql_secure_installation,sudo mysql,use mysql" />
<meta name="Description" content="This article describes how to install mariadb on ubuntu 22.04" />
<link rel="stylesheet" href="../../../../static/css/english.css" type="text/css" />
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
<div class="last-modified">Last Modified 5.24.2025</div>

<h1>Install MariaDB on Ubuntu</h1>

<pre class="shell-prompt">
sudo apt install mariadb-server
</pre>

<p>
If the installation is completed without errors, run the security script to restrict access to the server. 
</p>

<pre class="shell-prompt">sudo mysql_secure_installation
</pre>

<p>
Refer to the following to complete the security settings.
</p>

<pre class="shell-prompt">
Enter current password for root (enter for none): <strong><em>&lt;just press ENTER&gt;</em></strong>

Switch to unix_socket authentication [Y/n] <strong>n</strong>

Change the root password? [Y/n] <strong>n</strong>

Remove anonymous users? [Y/n] <strong>Y</strong> 

Disallow root login remotely? [Y/n] <strong>Y</strong>

Remove test database and access to it? [Y/n] <strong>Y</strong>

Reload privilege tables now? [Y/n] <strong>Y</strong>
</pre>

<p>
How to connect MariaDB server:
</p>

<pre class="shell-prompt">
sudo mysql
</pre>

<pre class="shell-prompt">
use mysql
show tables;
</pre>

<p>
Note: you cannot connect with <b>mysql --user=root --password mysql</b> command.
</p>

<p>
You can use the MySQL JDBC driver as it is.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/com.mysql/mysql-connector-j --&gt;
&lt;dependency&gt;
    &lt;groupId&gt;com.mysql&lt;/groupId&gt;
    &lt;artifactId&gt;mysql-connector-j&lt;/artifactId&gt;
    &lt;version&gt;9.3.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-22-04">How To Install MariaDB on Ubuntu 22.04</a></li>
</ul>

</article>

</body>
</html>
