<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.7.27</div>

<h1>우분투 18.04에 MariaDB 설치</h1>

<pre class="shell-prompt">
sudo apt update
sudo apt install mariadb-server
</pre>

<p>
에러없이 설치가 완료되었다면, 다음 명령을 실행하여 root의 비밀번호를 설정한다.
현재 비밀번호에는 그냥 엔터키를 누른다.
</p>

<pre class="shell-prompt">
sudo mysql_secure_installation
</pre>

<p>
비밀번호를 설정해도, <b>mysql --user=root --password mysql</b> 은 에러를 발생시킨다.
root 유저가 사용하는 플러그인을 확인해보자.
</p>

<pre class="shell-prompt">
sudo mysql
</pre>

<pre class="shell-prompt">
use mysql
select user,host,plugin from mysql.user;
</pre>

<p>
root 유저가 unix_socket 이나 auth_socket 플러그인을 사용하고 있다면, mysql --user=root -password mysql 로 접속을 시도할 때
mysql_secure_installation 통해 설정한 비밀번호를 맞게 입력한다 하더라도 접속에 실패하게 된다.
</p>

<p>
root 유저가 mysql_native_password 플러그인을 사용하도록 설정하면 접속 문제를 해결할 수 있다.
</p>

<pre class="shell-prompt">
update user set plugin='mysql_native_password' where user='root';
flush privileges;
exit
</pre>

<p>
MariaDB를 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service mariadb restart
</pre>

<p>
다시 접속을 시도한다.
</p>

<pre class="shell-prompt">
mysql --user=root --password mysql
</pre>

<p>
MySQL JDBC 드라이버를 그대로 사용할 수 있다.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java --&gt;
&lt;dependency&gt;
    &lt;groupId&gt;mysql&lt;/groupId&gt;
    &lt;artifactId&gt;mysql-connector-java&lt;/artifactId&gt;
    &lt;version&gt;5.1.48&lt;/version&gt;
&lt;/dependency&gt;
</pre>
<!--/*
<h3>재설치</h3>

<p>
설치 과정에서 에러가 발생한다면, 관련 파일을 깨끗하게 지우고 재부팅 후 설치해야 한다.
</p>

<pre class="shell-prompt">
sudo apt purge mariadb-*
sudo apt autoremove
</pre>

<p>
위 명령으로도 제거되지 않은 mysql 패키지 파일은 다음 명령으로 일일히 확인하고, sudo apt purge '패키지 파일 이름' 과 sudo apt autoremove 명령으로 하나 하나씩 제거한다.
</p>

<pre class="shell-prompt">
dpkg -l | grep mysql
</pre>

<p>
모두 삭제했다면, 시스템을 재부팅한 후 다시 설치한다.
</p>
*/-->

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04">How To Install MySQL on Ubuntu 18.04</a></li>
	<li><a href="https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost">Access denied for user 'root'@'localhost'</a></li>
	<!--/* <li><a href="http://magic.wickedmiso.com/105">[Ubuntu] MariaDB 삭제하기</a></li> */-->
</ul>

</article>
