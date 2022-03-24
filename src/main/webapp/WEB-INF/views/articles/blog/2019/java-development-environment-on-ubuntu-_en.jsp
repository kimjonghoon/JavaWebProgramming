<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Java Development Environment on Ubutnu 18.04</h1>

<!-- Oracle Install -->
<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu_en :: content}"></div>

<h4>SCOTT Account</h4>

<p>
Log in as an SYS account and run the SCOTT account schema script.
</p>

<pre class="shell-prompt"><strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on 월 6월 29 12:04:33 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>**********</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt; <strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

<h3>MariaDB Install</h3>

<pre class="shell-prompt">sudo apt update
sudo apt install mariadb-server
</pre>

<p>
If the installation is completed without errors, run the following command to set the root password. (Press the Enter key for the current password)
</p>

<pre class="shell-prompt">sudo mysql_secure_installation
</pre>

<p>
Set the root user to use the <b>mysql_native_password</b> plugin.
</p>

<pre class="shell-prompt">sudo mysql

use mysql

update user set plugin='mysql_native_password' where user='root';
flush privileges;
exit
</pre>

<p>
Restart MariaDB.
</p>

<pre class="shell-prompt">sudo service mariadb restart
</pre>

<h3>Java Install</h3>

<pre class="shell-prompt">sudo apt install default-jdk
</pre>

<h3>Maven Install</h3>

<pre class="shell-prompt">sudo apt install maven
</pre>

<h4>Installing the Oracle JDBC driver in local repository</h4>

<p>
The Maven repository does not provide the Oracle JDBC driver. Therefore, you need to install the Oracle JDBC driver in your local repository and set the dependency on pom.xml.
</p>

<p>
Run the following.
</p>

<pre class="shell-prompt">cd /u01/app/oracle/product/11.2.0/xe/jdbc/lib

mvn install:install-file \
-Dfile=ojdbc6.jar \
-DgroupId=com.oracle \
-DartifactId=ojdbc6 \
-Dversion=11.2.0.2.0 \
-Dpackaging=jar
</pre>

<p>
The following shows how to add Oracle JDBC driver to pom.xml according to the information stored in the local repository.
</p>

<pre class="prettyprint">&lt;dependency&gt;
  &lt;groupId&gt;com.oracle&lt;/groupId&gt;
  &lt;artifactId&gt;ojdbc6&lt;/artifactId&gt;
  &lt;version&gt;11.2.0.2.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>Git Install</h3>

<pre class="shell-prompt">sudo apt install git
</pre>

<pre class="shell-prompt">git config --global user.name <b>"John Doe"</b>
git config --global user.email <b>johndoe@gmail.org</b>
</pre>

<pre class="shell-prompt">git config --global --list
</pre>

<h3>Tomcat Install</h3>

<pre class="shell-prompt">sudo apt install tomcat9
</pre>

<h4>Tomcat Restart</h4>

<pre class="shell-prompt">sudo service tomcat9 restart
</pre>

<h4>Changing the Tomcat Root Application</h4>

<p>
Log in to the root account and run the following.
</p>

<pre class="shell-prompt">sudo nano /etc/tomcat9/Catalina/localhost/ROOT.xml
</pre>

<p>
If your project is a maven project and /home/kim/javaschool is the root directory, edit ROOT.xml as shown below.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="/home/kim/javaschool/src/main/webapp"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
After installing Ubuntu 18.04, specify the root account password with the following command.
</p>

<pre class="shell-prompt">sudo passwd
</pre>

<p>
Run su and enter the root account password.
</p>

<pre class="shell-prompt">su
Password:
</pre>

<h4>Tomcat logs</h4>

<p>
Log in to the root account and run the following command:
</p>

<pre class="shell-prompt">tail -f /var/lib/tomcat9/logs/localhost.<em>2019-10-05</em>.log
</pre>

<pre class="shell-prompt">tail -f /var/lib/tomcat9/logs/catalina.<em>2019-10-05</em>.log
</pre>

<h3>Eclipse Install</h3>

<p>
Download the installer from <a href="https://www.eclipse.org/downloads/">https://www.eclipse.org/downloads/</a> and run the following commands in sequence.
</p>

<pre class="shell-prompt">cd Downloads
tar -xvf eclipse-inst-linux64.tar.gz
cd eclipse-installer/
./eclipse-inst
</pre>

<p>
In the installation selection screen, select <em>Eclipse IDE for Enterprise Java Developers</em>.
</p>

<p>
<img src="https://lh3.googleusercontent.com/9Qdf0fBOZ07mgOWZtL0Wuhc6fEo2TVCb3IwHcV1q-SX8TSIjmwXKLVvFgwbch4qnk0ttijqnOzq_zOLDklfZ3MTXyqUOy6pz0FW4RRxBmCsrwwZoINUmpQbCjexYIQ5fpc3O_Uh-kDqKd84TKmtXP2saxGB55Spwwxykf-7DQM_5TBjXL17gIsO0QcrpHWza0Fg1eKP2zEG_-sge-oPVj9AwPlcP-NnRdTOQtAQ86ykBXK_Wauorb7p2rx3g9ULkJmMJUfJR4JW_9xknS89faZG_AdEV8bgmkm1vI6wk2qObRXSsHxcB6hr8sRuhbqAzysT5Y6rO3cagMNMOhXTAGbSelGgp7V8AbHavpuweEat5PpCjV0CHsS-BKWoh234ECpcJ1l96Oig17Ox6Jev0jcuhFh0YVb6hgLC8w1oYyn-UmGfZIXLtrf5cq1jdJrHgn1nBxyHD6tVPOkA2qj7etLNzJmgWPksfUL78aNUxDQW7fwZtS6gZOdfovyQJxhPJ1de2eT81SWQFEseEOqj8gQMsfj6rFuzX3Exx9lb53Ce2tiEsrMFlb_EG5dOGZHgE1qXc86fFWo6RYdSfGR7aRU-PsEKtYZ3KCVs6RVhOEb7Uy0UKa6uBWJ6d5Un2jxhc-DSg0T6HyURD228qYDGrldYqbI5gXEEQfC39xQyi6YtoS9GLI1skssk=w846-h869-no" alt="Eclipse IDE for Enterprise Java Developers" />
</p>

<h4>Create eclipse.desktop</h4>

<pre class="shell-prompt">cd /usr/share/applications
sudo nano eclipse.desktop
</pre>

<p>
Edit eclipse.desktop file as follows.
</p>

<pre class="prettyprint">[Desktop Entry]
Name=Eclipse
Type=Application
Exec=/home/kim/eclipse/jee-2019-12/eclipse/eclipse
Terminal=false
Icon=/home/kim/eclipse/jee-2019-12/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=eclipse.desktop
</pre>

<p>
Customize the paths for Exec and Icon.
</p>

<p>
Search for eclipse, run it, and pin it to the launcher.
</p>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2017/Setting-development-environment-in-Ubuntu">Development in Ubuntu</a></li>
	<li><a href="/blog/2019/java-development-environment-on-ubuntu-18">Java Development Environment on Ubutnu 18.04</a></li>
</ul>
 
</article>
