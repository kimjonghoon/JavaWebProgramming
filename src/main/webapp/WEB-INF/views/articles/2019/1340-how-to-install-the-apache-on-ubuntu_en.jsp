<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>How to Install the Apache on Ubuntu</title>
<meta name="Keywords" content="Apache2,Ubuntu,Tomcat Connector,server.xml,virtual host setting up," />
<meta name="Description" content="How to Install the Apache on Ubuntu" />
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
<div class="last-modified">Last Modified 6.28.2025</div>

<h1>How To Install the Apache on Ubuntu</h1>

<p>
You need to have Java and Tomcat installed to follow the steps below.
</p>

<h3>Installing Apache</h3>

<pre class="shell-prompt">
sudo apt update
sudo apt install apache2 libapache2-mod-jk
</pre>

<p>
Access http://localhost to confirm that the software is running properly.
</p>

<h3>Setting Up Virtual Hosts</h3>

<p>
Create the directory for java-school.net, using the -p flag to create any necessary parent directories:
</p>

<pre class="shell-prompt">
sudo mkdir -p /var/www/java-school.net/html
</pre>

<p>
Assign ownership of the directory:
</p>

<pre class="shell-prompt">
sudo chown -R $USER:$USER /var/www/java-school.net/html
</pre>

<p>
Create a sample index.html.
</p>

<pre class="shell-prompt">
sudo vi /var/www/java-school.net/html/index.html
</pre>

<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
Welcome to java-school.net
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Make a new virtual host file at /etc/apache2/sites-available/java-school.net.conf. 
</p>

<pre class="shell-prompt">
sudo vi /etc/apache2/sites-available/java-school.net.conf
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
  ServerName java-school.net
  ServerAlias www.java-school.net
  ServerAdmin admin@java-school.net
  DocumentRoot /var/www/java-school/html

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
Enable the file with a2ensite: 
</p>

<pre class="shell-prompt">
sudo a2ensite java-school.net.conf
</pre>

<p>
Disable the default site defined in 000-default.conf.
</p>

<pre class="shell-prompt">
sudo a2dissite 000-default.conf
</pre>

<p>
Restart Apache to implement your changes.
</p>

<pre class="shell-prompt">
sudo service apache2 restart
</pre>

<p>
Access http://localhost to confirm that the index.html is running.
</p>

<h3>Integrating Apache Web Server with Tomcat</h3>

<p>
Open the workers.properties file and modify the workers.tomcat_home and workers.java_home settings.
</p>

<p>
Confirm tomcat_home
</p>

<pre class="shell-prompt">
<strong>/usr/share/tomcat10/bin/version.sh</strong>
Using CATALINA_BASE:   /usr/share/tomcat10
Using CATALINA_HOME:   /usr/share/tomcat10
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
Confirm java_home
</p>

<pre class="shell-prompt">
<strong>mvn -v</strong>
Apache Maven 3.8.7
Maven home: /usr/share/maven
Java version: 21.0.7, vendor: Ubuntu, runtime: /usr/lib/jvm/java-21-openjdk-amd64
Default locale: ko_KR, platform encoding: UTF-8
OS name: "linux", version: "6.11.0-26-generic", arch: "amd64", family: "unix"
</pre>

<pre class="shell-prompt">
sudo vi /etc/libapache2-mod-jk/workers.properties
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
Add the following to the virtual hosts.
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
Open the server.xml file.
</p>

<pre class="shell-prompt">
sudo vi /etc/tomcat10/server.xml 
</pre>

<pre class="prettyprint">&lt;!-- Define an AJP 1.3 Connector on port 8009 --&gt;
&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" /&gt;
      address=<strong>"0.0.0.0"</strong>
      secret=<strong>"testkey"</strong>
      port="8009"
      redirectPort="8443"
      maxParameterCount="1000"
      /&gt;
</pre>

<p>
Add the <strong>jvmRoute="ajp13_worker"</strong> as shown below.
</p>

<pre class="prettyprint">
&lt;Engine name="Catalina" defaultHost="localhost" <strong>jvmRoute="ajp13_worker"</strong>&gt;
</pre>

<p>
Restart apache and tomcat.
</p>

<pre class="shell-prompt">
sudo service apache2 restart
sudo service tomcat10 restart
</pre>

<p>
Visit http://localhost to see if Tomcat's root application is responding.
</p>

<h3>Copy static elements to the /var/www/java-school.net/html</h3>

<pre class="shell-prompt">
sudo cp favicon.ico /var/www/java-school.net/html/
sudo cp -r static/ /var/www/java-school.net/html/
</pre>

<p>
Modify the virtual host file so that Apache serves the static elements of the Tomcat root application.
</p>

<pre class="shell-prompt">
sudo vi /etc/apache2/sites-available/java-school.net.conf
</pre>

<pre class="prettyprint">
ServerAdmin javaschool@gmail.org
ServerName java-school.net
ServerAlias www.java-school.net
DocumentRoot /var/www/java-school.net/html
<strong>JkUnMount /favicon.ico ajp13_worker</strong>
<strong>JkUnMount /static/* ajp13_worker</strong>
JkMount /* ajp13_worker
</pre>

<pre class="shell-prompt">
sudo service apache2 restart
sudo service tomcat10 restart
</pre>

<p>
Revisit http://localhost.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04-quickstart">How To Install the Apache Web Server on Ubuntu 18.04 [Quickstart]</a></li>
	<li><a href="https://httpd.apache.org/docs/2.4/en/vhosts/examples.html">https://httpd.apache.org/docs/2.4/en/vhosts/examples.html</a></li>
</ul>

</article>

</body>
</html>
