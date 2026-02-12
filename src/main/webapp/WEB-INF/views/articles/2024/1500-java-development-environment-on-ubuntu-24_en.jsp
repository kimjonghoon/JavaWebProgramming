<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Java Development Environment on Ubutnu 24.04</title>
<meta name="Keywords" content="Ubuntu 24.04,Java Development Environment on Ubuntu 24.04,Oracle 11g XE,MariaDB,Java Install,Maven Install,Git Install,Tomcat Install,Apache Install,Tomcat Connector Install,Eclipse Install" />
<meta name="Description" content="This articles describes how to set up java development environment on ubuntu 24.04" />
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
<div class="last-modified">Last Modified 5.24.2025</div>

<h1>Java Development Environment on Ubutnu 24.04</h1>

<h3>Ubuntu Install</h3>

<p>
Download Ubuntu LTS from <a href="https://ubuntu.com/download/desktop">https://ubuntu.com/download/desktop</a>
</p>

<h4>Make Bootable USB</h4>

<p>
On Window System, See http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows.<br />
On Ubuntu System, Follow the instructions below.<br />
Insert the USB and check the USB device.<br />
</p>

<pre class="shell-prompt">
sudo ls -l /dev/disk/by-id/*usb*
</pre>

<p>
If sdb, sdb1, and sdb2 show together, sdb is a USB device. Navigate to the Ubuntu ISO file folder and execute the following command:
</p>

<pre class="shell-prompt">
sudo dd if=filename.iso of=/dev/sdb bs=4M; sync
</pre>

<p>
Replace filename.iso with the downloaded Ubuntu ISO file name and replace /dev/sdb with your USB device.
</p>

<h4>Change root password</h4>

<pre class="shell-prompt">
sudo passwd root
</pre>

<pre class="shell-prompt">
New password:
Retype new password:
passwd: password updated successfully
</pre>

<p>
Run su and enter the root account password.
</p>

<pre class="shell-prompt">su
Password:
</pre>

<!-- Oracle Install -->
<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu_en :: content}"></div>

<h4>SCOTT Account</h4>

<p>
Log in as an SYS account and run the SCOTT account schema script.
</p>

<pre class="shell-prompt"><strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on Mon Jun 29 12:04:33 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>**********</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt; <strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

<h3>MariaDB Install</h3>

<pre class="shell-prompt">
sudo apt install mariadb-server
</pre>

<pre class="shell-prompt">
sudo mysql_secure_installation
</pre>

<pre class="shell-prompt">
Switch to unix_socket authentication [Y/n] <strong>n</strong>

Change the root password? [Y/n] <strong>n</strong>

Remove anonymous users? [Y/n] <strong>Y</strong>

Disallow root login remotely? [Y/n] <strong>Y</strong>

Remove test database and access to it? [Y/n] <strong>Y</strong>

Reload privilege tables now? [Y/n] <strong>Y</strong>
</pre>

<h3>Java Install</h3>

<pre class="shell-prompt">
sudo apt install openjdk-21-jdk
</pre>

<h3>Maven Install</h3>

<pre class="shell-prompt">
sudo apt install maven
</pre>

<h3>Git Install</h3>

<pre class="shell-prompt">
sudo apt install git
</pre>

<pre class="shell-prompt">
git config --global user.name <b>"John Doe"</b>
git config --global user.email <b>johndoe@gmail.org</b>
</pre>

<pre class="shell-prompt">
git config --global --list
</pre>

<h4>gh install</h4>

<pre class="shell-prompt">
sudo apt install gh
</pre>

<p>
After logging in to the https://github.com, run the following.
</p>

<pre class="shell-prompt">
gh auth login
</pre>

<p>
Select as shown below.
</p>

<pre class="shell-prompt">
? What account do you want to log into? <strong>GitHub.com</strong>
? What is your preferred protocol for Git operations? <strong>HTTPS</strong>
? Authenticate Git with your GitHub credentials? <strong>Yes</strong>
? How would you like to authenticate GitHub CLI? <strong>Login with a web browser</strong>
</pre>

<p>
Once you make your selection, your one-time password will be added to the screen.
</p>

<pre class="shell-prompt">
! First copy your one-time code: <strong>&lt;one-time code&gt;</strong>
- <strong>Press Enter</strong> to open github.com in your browser...
</pre>

<p>
After copying the password and pressing Enter, the web browser will display a page where you can enter the password.<br />
Paste the password copied from the terminal into the page.<br />
</p>

<h3>Vim install</h3>

<pre class="shell-prompt">
sudo apt install vim
</pre>

<h3>Tomcat Install</h3>

<pre class="shell-prompt">
sudo apt install tomcat10 tomcat10-admin
</pre>

<pre class="shell-prompt">
sudo vi /etc/tomcat10/tomcat-users.xml
</pre>

<pre class="prettyprint">
&lt;user username="<i>username</i>" password="<i>password</i>" roles="manager-gui" /&gt;
</pre>

<h4>File upload directory and log directory</h4>

<pre class="shell-prompt">
cd /opt
sudo mkdir logs
sudo mkdir upload
sudo chown -R tomcat:tomcat upload/ logs/
sudo chmod u=rwX,g=rwX,o=rX upload/
sudo vi /etc/systemd/system/multi-user.target.wants/tomcat10.service
</pre>

<pre class="prettyprint">
# Security
User=tomcat
Group=tomcat
PrivateTmp=yes
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true
CacheDirectory=tomcat10
CacheDirectoryMode=750
ProtectSystem=strict
ReadWritePaths=/etc/tomcat10/Catalina/
ReadWritePaths=/var/lib/tomcat10/webapps/
ReadWritePaths=/var/log/tomcat10/
<strong>ReadWritePaths=/opt/logs/</strong>
<strong>ReadWritePaths=/opt/upload/</strong>
</pre>

<pre class="shell-prompt">
sudo systemctl daemon-reload
sudo service tomcat10 restart
</pre>

<h4>Tomcat logs</h4>


<p>
Log in to the root account and run the following command:
</p>

<pre class="shell-prompt">
tail -f /var/lib/tomcat10/logs/localhost.<em>2024-07-05</em>.log
</pre>

<pre class="shell-prompt">
tail -f /var/lib/tomcat10/logs/catalina.<em>2024-07-05</em>.log
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

<pre class="shell-prompt">
cd /usr/share/applications
sudo vi eclipse.desktop
</pre>

<p>
Edit eclipse.desktop file as follows.
</p>

<pre class="prettyprint">
[Desktop Entry]
Name=Eclipse
Type=Application
Exec=/home/javaschool/eclipse/jee-2024-12/eclipse/eclipse
Terminal=false
Icon=/home/javaschool/eclipse/jee-2024-12/eclipse/icon.xpm
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

</article>
</body>
</html>
