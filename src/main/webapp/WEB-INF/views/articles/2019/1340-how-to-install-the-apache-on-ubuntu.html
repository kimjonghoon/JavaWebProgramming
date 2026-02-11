<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>우분투 시스템에 아파치 설치</title>
<meta name="Keywords" content="Apache2,Ubuntu,Tomcat Connector,server.xml,virtual host,가상 호스트 설정," />
<meta name="Description" content="우분투 시스템에 아파치 설치하기" />
<link rel="stylesheet" href="../../../static/css/korean.css" type="text/css" />
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
<div class="last-modified">Last Modified 2025.6.28</div>

<h1>우분투에 아파치 웹 서버 설치와 가상 호스트 설정하기</h1>

<p>
자바와 톰캣이 설치되어 있다고 가정한다.
</p>

<h3>아파치 설치</h3>

<pre class="shell-prompt">
sudo apt update
sudo apt install apache2 libapache2-mod-jk
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
&lt;VirtualHost *:80&gt;
  # The ServerName directive sets the request scheme, hostname and port that
  # the server uses to identify itself. This is used when creating
  # redirection URLs. In the context of virtual hosts, the ServerName
  # specifies what hostname must appear in the request's Host: header to
  # match this virtual host. For the default virtual host (this file) this
  # value is not decisive as it is used as a last resort host regardless.
  # However, you must set it for any further virtual host explicitly.
  <strong>ServerName java-school.net</strong>
  <strong>ServerAlias www.java-school.net</strong>
  <strong>ServerAdmin admin@java-school.net</strong>
  <strong>DocumentRoot /var/www/java-school/html</strong>

  # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
  # error, crit, alert, emerg.
  # It is also possible to configure the loglevel for particular
  # modules, e.g.
  #LogLevel info ssl:warn

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  # For most configuration files from conf-available/, which are
  # enabled or disabled at a global level, it is possible to
  # include a line for only one particular virtual host. For example the
  # following line enables the CGI configuration for this host only
  # after it has been globally disabled with "a2disconf".
  #Include conf-available/serve-cgi-bin.conf
&lt;/VirtualHost&gt;
</pre>

<p>
새 가상 호스트 활성화
</p>

<pre class="shell-prompt">
sudo a2ensite java-school.net.conf
</pre>

<p>
디폴트 호스트 비활성화
</p>

<pre class="shell-prompt">
sudo a2dissite 000-default.conf
</pre>

<p>
아파치 재가동
</p>

<pre class="shell-prompt">
sudo service apache2 restart
</pre>

<p>
http://localhost를 방문해 index.html 내용을 볼 수 있는지 확인
</p>

<h3>톰캣과 연동하기</h3>

<p>
workers.properties 파일을 열고 workers.tomcat_home과 workers.java_home을 수정한다.
</p>

<p>
톰캣 홈 확인
</p>

<pre class="shell-prompt">
<strong>/usr/share/tomcat10/bin/version.sh</strong>
Using CATALINA_BASE:   /usr/share/tomcat10
Using CATALINA_HOME:   <strong>/usr/share/tomcat10</strong>
Using CATALINA_TMPDIR: /usr/share/tomcat10/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /usr/share/tomcat10/bin/bootstrap.jar:/usr/share/tomcat10/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Server version: Apache Tomcat/10.1.16 (Ubuntu)
Server built:   Dec 3 2023 12:31:22 UTC
Server number:  10.1.16.0
OS Name:        Linux
OS Version:     6.11.0-26-generic
Architecture:   amd64
JVM Version:    21.0.7+6-Ubuntu-0ubuntu124.04
JVM Vendor:     Ubuntu
</pre>

<p>
자바 홈 확인
</p>

<pre class="shell-prompt">
<strong>mvn -v</strong>
Apache Maven 3.8.7
Maven home: /usr/share/maven
Java version: 21.0.7, vendor: Ubuntu, runtime: <strong>/usr/lib/jvm/java-21-openjdk-amd64</strong>
Default locale: ko_KR, platform encoding: UTF-8
OS name: "linux", version: "6.11.0-26-generic", arch: "amd64", family: "unix"
</pre>

<pre class="shell-prompt">
sudo nano /etc/libapache2-mod-jk/workers.properties
</pre>

<pre class="prettyprint">
#
# workers.tomcat_home should point to the location where you
# installed tomcat. This is where you have your conf, webapps and lib
# directories.
#
workers.tomcat_home=<strong>/usr/share/tomcat10</strong>

#
# workers.java_home should point to your Java installation. Normally
# you should have a bin and lib directories beneath it.
#
workers.java_home=<strong>/usr/lib/jvm/java-21-openjdk-amd64</strong>

#
# Defining a worker named ajp13_worker and of type ajp13
# Note that the name and the type do not have to match.
#
worker.ajp13_worker.port=8009
worker.ajp13_worker.host=localhost
worker.ajp13_worker.type=ajp13
#
# Specifies the load balance factor when used with
# a load balancing worker.
# Note:
#  ----&gt; lbfactor must be &gt; 0
#  ----&gt; Low lbfactor means less work done by the worker.
worker.ajp13_worker.lbfactor=1
<strong>worker.ajp13_worker.secret=testkey</strong>

#
# Specify the size of the open connection cache.
#worker.ajp13_worker.cachesize

#
#------ DEFAULT LOAD BALANCER WORKER DEFINITION ----------------------
#---------------------------------------------------------------------
#

#
# The loadbalancer (type lb) workers perform wighted round-robin
# load balancing with sticky sessions.
# Note:
#  ----&gt; If a worker dies, the load balancer will check its state
#        once in a while. Until then all work is redirected to peer
#        workers.
worker.loadbalancer.type=lb
worker.loadbalancer.balance_workers=ajp13_worker
</pre>

<p>
worker.ajp13_worker.secret=testkey는 추가한다.
worker.ajp13.worker.secret 값은 자신이 정한다.
</p>


<p>
가상 호스트 파일에 다음을 추가한다.
</p>

<pre class="shell-prompt">
sudo vi /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
ServerAdmin javaschool@gmail.org
ServerName java-school.net
ServerAlias www.java-school.net
DocumentRoot /var/www/java-school.net/html
<strong>JkMount /* ajp13_worker</strong>	
</pre>

<p>
jk.conf 파일을 열고 JkWorkersFile 앞의 #을 지워 주석을 푼다.
</p>

<pre class="prettyprint">
JkWorkersFile /etc/libapache2-mod-jk/workers.properties
</pre>

<p>
톰캣의 server.xml 파일을 열고 AJP 1.3 커넥터 설정의 주석을 풀고, Connector 엘리먼트에 secret 속성을 추가한다.
</p>

<pre class="shell-prompt">
sudo vi /etc/tomcat10/server.xml 
</pre>

<pre class="prettyprint">
&lt;!-- Define an AJP 1.3 Connector on port 8009 --&gt;
&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" /&gt;
       address=<strong>"0.0.0.0"</strong>
       <strong>secret="testkey"</strong>
       port="8009"
       redirectPort="8443"
       maxParameterCount="1000"
       /&gt;
</pre>

<p>
<strong>jvmRoute="ajp13_worker"</strong>를 아래처럼 추가한다.
</p>

<pre class="prettyprint">
&lt;Engine name="Catalina" defaultHost="localhost" <strong>jvmRoute="ajp13_worker"</strong>&gt;
</pre>

<p>
아파치, 톰캣 다시 시작
</p>

<pre class="shell-prompt">
sudo service apache2 restart
sudo service tomcat10 restart
</pre>

<p>
http://localhost을 방문할 때 톰캣의 루트 애플리케이션이 반응하면 테스트 성공이다.
</p>

<h3>루트 애플리케이션의 정적 요소를 /var/www/java-school.net/html에 복사</h3>

<p>
/var/www/java-school.net/html 디렉터리에, 톰캣 루트 애플리케이션 정적 요소를 복사한다.
</p>

<p>
톰캣 루트 애플리케이션의 도큐먼트 베이스로 이동한다.
정적 요소는 도큐먼트 베이스의 favicon.ico 파일과 static/ 디렉터리에 있다면 다음을 실행한다.
</p>

<pre class="shell-prompt">
sudo cp favicon.ico /var/www/java-school.net/html/
sudo cp -r static/ /var/www/java-school.net/html/
</pre>

<p>
톰캣 루트 애플리케이션의 정적 요소는 아파치가 서비스하도록 가상 호스트 파일을 다음과 같이 수정한다.
</p>

<pre class="shell-prompt">
sudo vi /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
ServerAdmin javaschool@gmail.org
ServerName java-school.net
ServerAlias www.java-school.net
DocumentRoot /var/www/java-school.net/html
<strong>JkUnMount /favicon.ico ajp13_worker
JkUnMount /static/* ajp13_worker</strong>
JkMount /* ajp13_worker
</pre>

<p>
아파치, 톰캣 다시 시작
</p>

<pre class="shell-prompt">
sudo service apache2 restart
sudo service tomcat10 restart
</pre>

<p>
http://localhost 방문
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04-quickstart">How To Install the Apache Web Server on Ubuntu 18.04 [Quickstart]</a></li>
	<li><a href="https://httpd.apache.org/docs/2.4/en/vhosts/examples.html">https://httpd.apache.org/docs/2.4/en/vhosts/examples.html</a></li>
</ul>

</article>
