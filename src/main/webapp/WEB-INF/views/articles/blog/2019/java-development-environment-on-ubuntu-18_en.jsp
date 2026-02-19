<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Java Development Environment on Ubutnu 18.04</h1>

<!-- Oracle Install -->
<h3>How to install Oracle 11g XE on Ubuntu</h3>

<p>
Ubuntu is not a Linux distribution officially supported by Oracle.
</p>

<!--
<dl class="note">
<dt>Oracle Database XE Requirements: Operating system</dt>
<dd>
<ul>
	<li>Oracle Enterprise Linux 4 Update 7</li>
	<li>Oracle Enterprise Linux 5 Update 2</li>
	<li>Red Hat Enterprise Linux 4 Update 7</li>
	<li>Red Hat Enterprise Linux 5 Update 2</li>
	<li>SUSE Linux Enterprise Server 10 SP2</li>
	<li>SUSE Linux Enterprise Server 11</li>
</ul>
<a href="https://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL103">https://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL103</a>
</dd>
</dl>
-->

<p>
You can install Oracle 11g XE on Ubuntu with a few tricks.<br />
Origin: <a href="http://meandmyubuntulinux.blogspot.kr/2012/05/installing-oracle-11g-r2-express.html">http://meandmyubuntulinux.blogspot.kr/2012/05/installing-oracle-11g-r2-express.html</a>
</p>

<p>
Visit <a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a>.
For 64-bit systems, choose Oracle Database Express Edition 11g Release 2 for Linux x64.
You need to log in to download the file. --Sign up if you are not a member of the Oracle website-- When you log in to the site, the download begins.
After downloading, go to the directory where the file exists and execute the following command.
</p>

<pre class="shell-prompt">
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip
</pre>

<pre class="shell-prompt">
sudo apt install alien unixodbc
</pre>

<pre class="shell-prompt">
sudo apt install libaio1
</pre>

<dl class="note">
<dt><strong>sudo apt install libaio1</strong> fails in Ubuntu 24.04</dt>
<dd>
Ubuntu 24.04 does not support libaio1.<br />
Install <strong>libaio-dev</strong> instead.
<pre class="shell-prompt">
sudo apt install libaio-dev
</pre>
Oracle 11g XE still expecting libaio.so.1, so create the following symbolic link:
<pre class="shell-prompt">
sudo ln -s /usr/lib/x86_64-linux-gnu/libaio.so.1t64 /usr/lib/x86_64-linux-gnu/libaio.so.1
</pre>
</dd>
</dl>

<pre class="shell-prompt">
cd Disk1
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm
</pre>

<p>
Create a /sbin/chkconfig file.
</p>

<pre class="shell-prompt">sudo nano /sbin/chkconfig
</pre>

<p>
Copy and Paste the following into the file.
</p>

<pre class="prettyprint">
#!/bin/bash
# Oracle 11gR2 XE installer chkconfig hack for Ubuntu
file=/etc/init.d/oracle-xe
if [[ ! `tail -n1 $file | grep INIT` ]]; then
echo &gt;&gt; $file
echo '### BEGIN INIT INFO' &gt;&gt; $file
echo '# Provides: OracleXE' &gt;&gt; $file
echo '# Required-Start: $remote_fs $syslog' &gt;&gt; $file
echo '# Required-Stop: $remote_fs $syslog' &gt;&gt; $file
echo '# Default-Start: 2 3 4 5' &gt;&gt; $file
echo '# Default-Stop: 0 1 6' &gt;&gt; $file
echo '# Short-Description: Oracle 11g Express Edition' &gt;&gt; $file
echo '### END INIT INFO' &gt;&gt; $file
fi
update-rc.d oracle-xe defaults 80 01
</pre>

<p>
Save the above file and provide appropriate execute privilege.
</p>

<pre class="shell-prompt">
sudo chmod 755 /sbin/chkconfig
</pre>

<p>
Set the Kernel parameters.
</p>

<pre class="shell-prompt">
sudo nano /etc/sysctl.d/60-oracle.conf
</pre>

<p>
Copy the following. Paste it into the file.
</p>

<pre class="prettyprint"># Oracle 11g XE kernel parameters  
fs.file-max=6815744  
net.ipv4.ip_local_port_range=9000 65000  
kernel.sem=250 32000 100 128 
kernel.shmmax=536870912
</pre>

<p>
Check the swap memory.
</p>

<pre class="shell-prompt">
free -m
</pre>

<pre class="shell-prompt">total       used       free     shared    buffers     cached
Mem:          3942       3809        133        947         50       1571
-/+ buffers/cache:       2186       1756
Swap:         <b>4083</b>        378       3705
</pre>

<p>
Unlike the above, if Swap doesn't exceed 4000, do the following.
</p>

<pre class="shell-prompt">
sudo ln -s /usr/bin/awk /bin/awk
sudo mkdir /var/lock/subsys
sudo touch /var/lock/subsys/listener
</pre>

<p>
Verify the kernel parameters.
</p>

<pre class="shell-prompt">
sudo cat /etc/sysctl.d/60-oracle.conf
</pre>

<p>
Load kernel parameters.
</p>

<pre class="shell-prompt">
sudo service procps restart
</pre>

<p>
Verify.<br />
(In my case, it came out differently from the set value, but I was able to complete the installation)
</p>

<pre class="shell-prompt">
sudo sysctl -q fs.file-max
</pre>

<p>
Go to the Disk1 directory and run the following commands:
</p>
  
<pre class="shell-prompt">
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb
sudo /etc/init.d/oracle-xe configure
</pre>

<ul>
	<li>Specify the HTTP port that will be used for Oracle Application Express: Set a value other than 8080, like 9090</li>
	<li>Specify a port the database listener: (just hit Enter)
	<li>Set passwords for administrator accounts SYS and SYSTEM: <b>Password for Oracle administrators, you specified</b></li>
	<li>Do you want Oracle Database 11g Express Edition to be started on boot: (just hit Enter)
</ul>

<pre class="shell-prompt">
Oracle Database 11g Express Edition Configuration
-------------------------------------------------
This will configure on-boot properties of Oracle Database 11g Express 
Edition.  The following questions will determine whether the database 
should be starting upon system boot, the ports it will use, and 
the passwords that will be used for database accounts.  
Press Enter to accept the defaults. 
Ctrl-C will abort.

Specify the HTTP port that will be used 
	for Oracle Application Express [8080]:<strong>9090</strong>

Specify a port that will be used for the database listener [1521]:

Specify a password to be used for database accounts.
Note that the same password will be used for SYS and SYSTEM.
Oracle recommends the use of different passwords 
for each database account.
This can be done after 
initial configuration: <strong>**********</strong>
Confirm the password: <strong>**********</strong>

Do you want Oracle Database 11g Express Edition to be started 
on boot (y/n) [y]:

Starting Oracle Net Listener...Done
Configuring database...Done
Starting Oracle Database 11g Express Edition instance...Done
Installation completed successfully.
</pre>

<p>
Set up the environmental variables.
</p>

<pre class="shell-prompt">
nano ~/.bashrc
</pre>

<p>
Add the following lines to your .bashrc:
</p>

<pre class="prettyprint">
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH
</pre>

<p>
Execute the following command to load the changes:
</p>

<pre class="shell-prompt">
source ~/.bashrc
</pre>

<p>
Start the Oracle.
</p>

<pre class="shell-prompt">
sudo service oracle-xe start
</pre>


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
<img src="<c:url value="/resources/images/choose-eclipse-ide-for-enterprise-java-developers.png"/>" alt="Eclipse IDE for Enterprise Java Developers" />
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
	<c:url var="blogUrl" value="/blog"/>
	<li><a href="${blogUrl}/2019/java-development-environment-on-ubuntu-18">Java Development Environment on Ubutnu 18.04</a></li>
</ul>
 
</article>
