<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>우분투에 MariaDB 설치</title>
<meta name="Keywords" content="Ubuntu 22.04,MariaDB,sudo apt install mariadb-server,sudo mysql_secure_installation,sudo mysql,use mysql" />
<meta name="Description" content="우분투 시스템에 MariaDB 설치하는 방법을 설명합니다." />
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
<div class="last-modified">Last Modified 2025.5.24</div>

<h1>우분투에 MariaDB 설치</h1>

<pre class="shell-prompt">
sudo apt install mariadb-server
</pre>

<p>
설치 후, 보안 스크립트 실행
</p>

<pre class="shell-prompt">
sudo mysql_secure_installation
</pre>

<p>
아래처럼 설정
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
사용법:
</p>

<pre class="shell-prompt">
sudo mysql
</pre>

<pre class="shell-prompt">
use mysql
show tables;
</pre>

<p>
참고: mysql --user=root --password mysql 명령으로 접속할 수 없다.
</p>

<p>
MySQL JDBC 드라이버를 그대로 사용할 수 있다.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/com.mysql/mysql-connector-j --&gt;
&lt;dependency&gt;
    &lt;groupId&gt;com.mysql&lt;/groupId&gt;
    &lt;artifactId&gt;mysql-connector-j&lt;/artifactId&gt;
    &lt;version&gt;9.3.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-22-04">How To Install MariaDB on Ubuntu 22.04</a></li>
</ul>

</article>

</body>
</html>
