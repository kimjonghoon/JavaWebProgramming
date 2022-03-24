<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Install MariaDB on Ubuntu 18.04</h1>

<pre class="shell-prompt">sudo apt update
sudo apt install mariadb-server
</pre>

<p>
If the installation is completed without errors, run the following command to set the root password. (Press the Enter key for the current password)
</p>

<pre class="shell-prompt">sudo mysql_secure_installation
</pre>

<p>
Even if you set a password, <b>mysql --user = root - password mysql</b> will generate an error.
Let's check the plugin that the root user uses.
</p>

<pre class="shell-prompt">
sudo mysql
use mysql
select user,host,plugin from mysql.user;
</pre>

<p>
Set the root user to use the <b>mysql_native_password</b> plugin.
</p>

<pre class="shell-prompt">update user set plugin='mysql_native_password' where user='root';
flush privileges;
exit
</pre>

<p>
Restart MariaDB.
</p>

<pre class="shell-prompt">sudo service mariadb restart

mysql --user=root --password mysql
</pre>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04">How To Install MySQL on Ubuntu 18.04</a></li>
	<li><a href="https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost">Access denied for user 'root'@'localhost'</a></li>
</ul>

</article>
