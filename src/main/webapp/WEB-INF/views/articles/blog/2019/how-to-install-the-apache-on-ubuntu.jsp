<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.7.21</div>

<h1>우분투 18.04에 아파치 웹 서버 설치와 가상 호스트 설정</h1>

<p>
아래 글을 따라하려면 자바와 톰캣이 설치되어 있어야 한다.
</p>

<h3>아파치 설치</h3>

<pre class="shell-prompt">
sudo apt update
</pre>

<pre class="shell-prompt">
sudo apt install apache2
</pre>

<p>
http://localhost를 방문해 아파치가 동작하는지 확인한다.
</p>

<h3>가상 호스트 설정</h3>

<p>
java-school.net를 위한 디렉터리를 생성한다.
</p>

<pre class="shell-prompt">
sudo mkdir -p /var/www/java-school.net/html
</pre>

<p>
생성한 디렉터리의 소유권을 지정한다.
</p>

<pre class="shell-prompt">
sudo chown -R $USER:$USER /var/www/java-school.net/html
</pre>

<p>
테스트를 위한 index.html 파일을 생성한다.
</p>

<pre class="shell-prompt">
sudo nano /var/www/java-school.net/html/index.html
</pre>

<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
Welcome to java-school.net
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
새 가상 호스트 파일을 생성한다.
</p>

<pre class="shell-prompt">
sudo nano /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
&lt;VirtualHost 127.0.0.1&gt;
	ServerAdmin javaschool@gmail.org
	ServerName java-school.net
	ServerAlias www.java-school.net
	DocumentRoot /var/www/java-school.net/html
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
&lt;/VirtualHost&gt;
</pre>

<p>
a2ensite로 파일을 활성화한다. 
</p>

<pre class="shell-prompt">
sudo a2ensite java-school.net.conf
</pre>

<p>
디폴트 사이트를 비활성화시킨다.
</p>

<pre class="shell-prompt">
sudo a2dissite 000-default.conf
</pre>

<p>
아파치를 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service apache2 restart
</pre>

<p>
http://127.0.0.1을 방문해 index.html 파일 내용을 볼 수 있는지 확인한다.
</p>

<h3>Tomcat Connector 설치</h3>

<pre class="shell-prompt">
sudo apt install libapache2-mod-jk
</pre>

<p>
workers.properties 파일을 열고 workers.tomcat_home과 workers.java_home을 수정한다.
tomcat_home은 tomcat9을 apt install로 설치하면 /etc/tomcat9다.
java_home은 mvn -v 이나 sudo update-alternatives --config java 명령으로 확인할 수 있다.
</p>

<pre class="shell-prompt">
sudo nano /etc/libapache2-mod-jk/workers.properties
</pre>

<pre class="prettyprint">
#
# workers.tomcat_home should point to the location where you
# installed tomcat. This is where you have your conf, webapps and lib
# directories.
#
workers.tomcat_home=<strong>/etc/tomcat9</strong>

#
# workers.java_home should point to your Java installation. Normally
# you should have a bin and lib directories beneath it.
#
workers.java_home=<strong>/usr/lib/jvm/java-11-openjdk-amd64</strong>
</pre>

<p>
가상 호스트 파일에 다음을 추가한다.
</p>

<pre class="shell-prompt">
sudo nano /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
&lt;VirtualHost 127.0.0.1&gt;
	ServerAdmin javaschool@gmail.org
	ServerName java-school.net
	ServerAlias www.java-school.net
	DocumentRoot /var/www/java-school.net/html
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<strong>JkMount /* ajp13_worker</strong>	
&lt;/VirtualHost&gt;
</pre>

<p>
톰캣의 server.xml 파일을 열고 다음 부분의 주석을 푼다.
</p>

<pre class="shell-prompt">
sudo nano /etc/tomcat9/server.xml 
</pre>

<pre class="prettyprint">
&lt;!-- Define an AJP 1.3 Connector on port 8009 --&gt;
&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" /&gt;
</pre>

<p>
아파치를 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service apache2 restart
</pre>

<p>
톰캣을 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service tomcat9 restart
</pre>

<p>
http://127.0.0.1을 방문할 때 톰캣의 루트 애플리케이션이 반응하면 테스트 성공이다.
</p>

<h3>루트 애플리케이션 변경</h3>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/spring-thymeleaf
</pre>

<p>
pom.xml를 다음과 같이 편집한다.
</p>

<pre class="prettyprint">

	&lt;build&gt;
		&lt;finalName&gt;spring-thymeleaf&lt;/finalName&gt;
		&lt;pluginManagement&gt;
			&lt;plugins&gt;
				&lt;plugin&gt;
					&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
					&lt;version&gt;3.8.1&lt;/version&gt;
					&lt;configuration&gt;
						&lt;source&gt;${jdk.version}&lt;/source&gt;
						&lt;target&gt;${jdk.version}&lt;/target&gt;
						&lt;encoding&gt;UTF-8&lt;/encoding&gt;
					&lt;/configuration&gt;
				&lt;/plugin&gt;
				&lt;plugin&gt;
					&lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
					&lt;version&gt;3.1.0&lt;/version&gt;
					&lt;configuration&gt;
						&lt;filesets&gt;
							&lt;fileset&gt;
								&lt;directory&gt;src/main/webapp/WEB-INF/classes&lt;/directory&gt;
							&lt;/fileset&gt;
							&lt;fileset&gt;
								&lt;directory&gt;src/main/webapp/WEB-INF/lib&lt;/directory&gt;
							&lt;/fileset&gt;
						&lt;/filesets&gt;
					&lt;/configuration&gt;
				&lt;/plugin&gt;
			&lt;/plugins&gt;
		&lt;/pluginManagement&gt;
	&lt;/build&gt;
	
&lt;!-- 
	&lt;build&gt;
		&lt;plugins&gt;
			&lt;plugin&gt;
				&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
				&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
				&lt;version&gt;3.8.1&lt;/version&gt;
				&lt;configuration&gt;
					&lt;source&gt;${jdk.version}&lt;/source&gt;
					&lt;target&gt;${jdk.version}&lt;/target&gt;
					&lt;encoding&gt;UTF-8&lt;/encoding&gt;
				&lt;/configuration&gt;
			&lt;/plugin&gt;
			&lt;plugin&gt;
				&lt;groupId&gt;org.eclipse.jetty&lt;/groupId&gt;
				&lt;artifactId&gt;jetty-maven-plugin&lt;/artifactId&gt;
				&lt;version&gt;10.0.0&lt;/version&gt;
			&lt;/plugin&gt;
		&lt;/plugins&gt;
	&lt;/build&gt;
--&gt;

</pre>

<pre class="shell-prompt">
mvn clean compile war:inplace
</pre>

<pre class="shell-prompt">
sudo service tomcat9 stop
</pre>

<pre class="shell-prompt">
sudo nano /etc/tomcat9/Catalina/localhost/ROOT.xml
</pre>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="/home/kim/spring-thymeleaf/src/main/webapp"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
/var/www/java-school.net/html 디렉터리에, 톰캣 루트 애플리케이션 정적 요소의 심볼릭 링크를 생성한다.
</p>

<pre class="shell-prompt">
cd /var/www/java-school.net/html
</pre>

<pre class="shell-prompt">
ln -s /home/kim/spring-thymeleaf/src/main/webapp/favicon.ico favicon.ico
</pre>

<pre class="shell-prompt">
ln -s /home/kim/spring-thymeleaf/src/main/webapp/static static
</pre>

<p>
톰캣 루트 애플리케이션의 정적 요소는 아파치가 서비스하도록 가상 호스트 파일을 다음과 같이 수정한다.
</p>

<pre class="shell-prompt">
sudo nano /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
&lt;VirtualHost 127.0.0.1&gt;
	ServerAdmin javaschool@gmail.org
	ServerName java-school.net
	ServerAlias www.java-school.net
	DocumentRoot /var/www/java-school.net/html
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<strong>JkUnMount /favicon.ico ajp13_worker
	JkUnMount /static/* ajp13_worker</strong>
	JkMount /* ajp13_worker
&lt;/VirtualHost&gt;
</pre>

<p>
아파치를 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service apache2 restart
</pre>

<p>
톰캣을 다시 시작한다.
</p>

<pre class="shell-prompt">
sudo service tomcat9 restart
</pre>

<p>
http://127.0.0.1를 방문한다.
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04-quickstart">How To Install the Apache Web Server on Ubuntu 18.04 [Quickstart]</a></li>
	<li><a href="https://httpd.apache.org/docs/2.4/en/vhosts/examples.html">https://httpd.apache.org/docs/2.4/en/vhosts/examples.html</a></li>
</ul>

</article>
