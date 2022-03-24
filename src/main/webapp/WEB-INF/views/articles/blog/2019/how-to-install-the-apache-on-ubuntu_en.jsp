<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>How To Install the Apache on Ubuntu</h1>

<p>
You need to have Java and Tomcat installed to follow the steps below.
</p>

<h3>Installing Apache</h3>

<pre class="shell-prompt">sudo apt update
sudo apt install apache2
</pre>

<p>
Access http://localhost to confirm that the software is running properly.
</p>

<h3>Setting Up Virtual Hosts</h3>

<p>
Create the directory for java-school.net, using the -p flag to create any necessary parent directories:
</p>

<pre class="shell-prompt">sudo mkdir -p /var/www/java-school.net/html
</pre>

<p>
Assign ownership of the directory:
</p>

<pre class="shell-prompt">sudo chown -R $USER:$USER /var/www/java-school.net/html
</pre>

<p>
Create a sample index.html.
</p>

<pre class="shell-prompt">sudo nano /var/www/java-school.net/html/index.html
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

<pre class="shell-prompt">sudo nano /etc/apache2/sites-available/java-school.net.conf
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
Enable the file with a2ensite: 
</p>

<pre class="shell-prompt">sudo a2ensite java-school.net.conf
</pre>

<p>
Disable the default site defined in 000-default.conf.
</p>

<pre class="shell-prompt">sudo a2dissite 000-default.conf
</pre>

<p>
Restart Apache to implement your changes.
</p>

<pre class="shell-prompt">sudo service apache2 restart
</pre>

<p>
Access http://127.0.0.1 to confirm that the index.html is running.
</p>

<h3>Installing Tomcat Connector</h3>

<pre class="shell-prompt">sudo apt install libapache2-mod-jk
</pre>

<p>
Open the workers.properties file and modify the workers.tomcat_home and workers.java_home settings.
tomcat_home is /etc/tomcat9 if you install tomcat9 using apt install command.
java_home can be checked using mvn -v or sudo update-alternatives --config java commands.
</p>

<pre class="shell-prompt">sudo nano /etc/libapache2-mod-jk/workers.properties
</pre>

<pre class="prettyprint">#
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
Add the following to the virtual hosts.
</p>

<pre class="shell-prompt">sudo nano /etc/apache2/sites-available/java-school.net.conf
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
Open the server.xml file.
</p>

<pre class="shell-prompt">sudo nano /etc/tomcat9/server.xml 
</pre>

<p>
Uncomment as follows.
</p>

<pre class="prettyprint">&lt;!-- Define an AJP 1.3 Connector on port 8009 --&gt;
&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" /&gt;
</pre>

<p>
Restart Apache to implement your changes.
</p>

<pre class="shell-prompt">sudo service apache2 restart
</pre>

<p>
Restart Tomcat to implement your changes.
</p>

<pre class="shell-prompt">sudo service tomcat9 restart
</pre>

<p>
Visit http://127.0.0.1 to see if Tomcat's root application is responding.
</p>

<h3>Changing the ROOT Application</h3>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/spring-thymeleaf
</pre>

<p>
Edit pom.xml as follows.
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

<pre class="shell-prompt">mvn clean compile war:inplace
</pre>

<pre class="shell-prompt">sudo service tomcat9 stop
</pre>

<pre class="shell-prompt">sudo nano /etc/tomcat9/Catalina/localhost/ROOT.xml
</pre>

<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="/home/kim/spring-thymeleaf/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Go to the /var/www/java-school.net/html directory and create symbolic links to the static elements in the Tomcat root application.
</p>

<pre class="shell-prompt">cd /var/www/java-school.net/html
ln -s /home/kim/spring-thymeleaf/src/main/webapp/favicon.ico favicon.ico
ln -s /home/kim/spring-thymeleaf/src/main/webapp/static static
</pre>

<p>
Modify the virtual host file so that Apache serves the static elements of the Tomcat root application.
</p>

<pre class="shell-prompt">sudo nano /etc/apache2/sites-available/java-school.net.conf
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
Restart Apache.
</p>

<pre class="shell-prompt">sudo service apache2 restart
</pre>

<p>
Restart Tomcat.
</p>

<pre class="shell-prompt">sudo service tomcat9 restart
</pre>

<p>
Revisit http://127.0.0.1.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04-quickstart">How To Install the Apache Web Server on Ubuntu 18.04 [Quickstart]</a></li>
	<li><a href="https://httpd.apache.org/docs/2.4/en/vhosts/examples.html">https://httpd.apache.org/docs/2.4/en/vhosts/examples.html</a></li>
</ul>

</article>
