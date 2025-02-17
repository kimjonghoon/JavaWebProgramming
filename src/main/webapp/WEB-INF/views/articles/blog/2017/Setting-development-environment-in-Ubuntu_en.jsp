<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<article>
<div class="last-modified">Last Modified 2021.12.8</div>

<h1>Development in Ubuntu</h1>

<h3>Ubuntu Install</h3>

<p>
Download Ubuntu LTS from <a href="https://ubuntu.com/#download">https://ubuntu.com/#download</a>.
</p>

<h4>Make Bootable USB</h4>

<p>
On Window System, See <a href="http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows">http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows</a>.<br />
On Ubuntu System, Follow the instructions below.<br />
Insert the USB and check the USB device.
</p>

<pre class="shell-prompt">
sudo ls -l /dev/disk/by-id/*usb*
</pre>

<p>
If sdb, sdb1, and sdb2 show together, sdb is a USB device. Navigate to the Ubuntu ISO file folder and execute the following command:
</p>
 
<pre class="shell-prompt">
sudo dd if=<strong>filename.iso</strong> of=<strong>/dev/sdb</strong> bs=4M; sync
</pre>

<p>
Replace <b>filename.iso</b> with the downloaded Ubuntu ISO file name and replace <b>/dev/sdb</b> with your USB device.
</p>

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


<h3>Create SCOTT account</h3>

<p>
Start SQL*PLUS and login as sys:
</p>

<pre class="shell-prompt">
<strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on Wed May 9 12:12:16 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>**********</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt;<strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

<h3>MySQL Install</h3>

<pre class="shell-prompt">
sudo apt install mysql-server mysql-client
</pre>

<h3>JDK Install</h3>

<pre class="shell-prompt">
sudo apt update
sudo apt upgrade
sudo apt install default-jdk
</pre>

<p>
Confirm java verion.
</p>

<pre class="shell-prompt">
java -version
</pre>

<h3>JDBC Test</h3>

<p>
Create a GetEmp.java as shown below.
</p>

<pre class="prettyprint">
import java.sql.*; 

public class GetEmp {
  public static void main(String[] args) {
    String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    String USER = "scott";
    String PW = "tiger";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String query = "SELECT * FROM emp";
		
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    try {
      conn = DriverManager.getConnection(URL, USER, PW);
      stmt = conn.createStatement();
      rs = stmt.executeQuery(query);

      while (rs.next()) { 
        String empno = rs.getString(1);
        String ename = rs.getString(2);
        String job = rs.getString(3);
        String mgr = rs.getString(4);
        String hiredate = rs.getString(5);
        String sal = rs.getString(6);
        String comm = rs.getString(7);
        String depno = rs.getString(8);
				
        System.out.println(empno + 
          " : " + ename + 
          " : " + job + 
          " : " + mgr	+ 
          " : " + hiredate + 
          " : " + sal + 
          " : " + comm + 
          " : " + depno);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        rs.close();
        stmt.close();
        conn.close();
      } catch (SQLException e) {}
    }
  }
}
</pre>

<p>
Move to directory containing the GetEmp.java file and execute the following commands:
</p>

<pre class="shell-prompt">
javac GetEmp.java
java -cp .:/u01/app/oracle/product/11.2.0/xe/jdbc/lib/ojdbc6.jar GetEmp
</pre>

<h3>Maven Install</h3>

<p>
Download the latest binary file from <a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a>, unzip it, and Move the generated directory to /opt.
</p>

<pre class="shell-prompt">
cd ~/Downloads/
tar -xvzf apache-maven-3.5.4-bin.tar.gz
sudo mv apache-maven-3.5.4/ /opt/maven
</pre>

<p>
Open .bashrc file.
</p>

<pre class="shell-prompt">
nano ~/.bashrc &amp;
</pre>

<p>
Copy the following and paste it into .bashrc file.
</p>

<pre class="prettyprint">
export MAVEN_HOME=/opt/maven
export PATH=$MAVEN_HOME/bin:$PATH
</pre>

<p>
Execute the following command to load the changes:
</p>

<pre class="shell-prompt">
source ~/.bashrc
</pre>

<p>
Check the Maven version.
</p>

<pre class="shell-prompt">
mvn -v
</pre>

<h3>Tomcat Install</h3>

<p>
Install Tomcat.
</p>

<pre class="shell-prompt">
sudo apt update
sudo apt upgrade
sudo apt install tomcat8
</pre>

<p>
Visit http://localhost:8080 and check the CATALINA_HOME and CATALINA_BASE directors at http://localhost:8080. Confirm the /conf/Catalina/localhost directory in your file system. (This directory is in either CATALINA_HOME or CATALINA_BASE)
</p>

<h3>Eclipse Install</h3>

<p>
Download Eclipse IDE for Java EE Developers from <a href="https://www.eclipse.org/downloads/packages/">https://www.eclipse.org/downloads/packages/</a> and Unzip it as follows.
</p>

<pre class="shell-prompt">
tar -xvf eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz
</pre>

<p>
Move the generated eclipse directory to the /opt directory.
</p>

<pre class="shell-prompt">
sudo mv eclipse /opt/
</pre>

<h4>Create an eclipse.desktop file</h4>

<pre class="shell-prompt">
cd ~/.local/share/applications/
nano eclipse.desktop
</pre>

<p>
Copy the following and paste it into eclipse.desktop file.
</p>

<pre class="prettyprint">
[Desktop Entry]
Name=Eclipse
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=eclipse.desktop
</pre>

<p>
Search for eclipse and run it.<br />
Register Eclipse to the launcher.
</p>

<h3>Git Install</h3>

<pre class="shell-prompt">
sudo apt install git
</pre>

<p>
Check the git version.
</p>

<pre class="shell-prompt">
git --version
</pre>

<p>
Set user information.
</p>

<pre class="shell-prompt">
git config --global user.name "<em>John Doe</em>"
git config --global user.email <em>johndoe@gmail.org</em>
</pre>

<p>
Verify.
</p>

<pre class="shell-prompt">
git config --global --list
</pre>

<h3>SpringBoard Example Test</h3>

<p>
To install the SpringBbs project, execute the following command:
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/SpringBbs
</pre>

<p>
Go to the directory containing the ojdbc6.jar file and execute the following command to save the Oracle JDBC driver to your local repository.
</p>

<pre class="shell-prompt">
cd /u01/app/oracle/product/11.2.0/xe/jdbc/lib

mvn install:install-file -Dfile=ojdbc6.jar \
-DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.2.0 -Dpackaging=jar
</pre>

<p>
Start eclipse and Import SpringBbs into Eclipse.<br /> 
<img alt="Import" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png"><br />
<img alt="Import" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png"><br />
Select the project in the Package Explorer view, click the mouse's right button to open the context menu, and select Maven - Update Project Configuration to synchronize pom.xml with Eclipse.
</p>

<h4>Create tables</h4>

<p>
Connect to the system account (sqlplus sys as sysdba) and execute the following SQL statements.
</p>

<pre class="prettyprint">
sqlplus sys as sysdba

Copyright (c) 1982, 2011, Oracle.  All rights reserved.
Enter password: 

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO java IDENTIFIED BY school;

conn java/school
Connected.


create table member (
    email varchar2(60) PRIMARY KEY,
    passwd varchar2(200) NOT NULL,
    name varchar2(20) NOT NULL,
    mobile varchar2(20)
);

create table board (
    boardcd varchar2(20),
    boardnm varchar2(40) NOT NULL,
    boardnm_ko varchar2(40),
    constraint PK_BOARD PRIMARY KEY(boardcd)
);

create table article (
    articleno number,
    boardcd varchar2(20),
    title varchar2(200) NOT NULL,
    content clob NOT NULL,
    email varchar2(60),
    hit number,
    regdate date,
    constraint PK_ARTICLE PRIMARY KEY(articleno),
    constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

create sequence SEQ_ARTICLE
    increment by 1
    start with 1;

create table comments (
    commentno number,
    articleno number,    
    email varchar2(60),    
    memo varchar2(4000) NOT NULL,
    regdate date, 
    constraint PK_COMMENTS PRIMARY KEY(commentno)
);

create sequence SEQ_COMMENTS
    increment by 1
    start with 1;

create table attachfile (
    attachfileno number,
    filename varchar2(50) NOT NULL,
    filetype varchar2(30),
    filesize number,
    articleno number,
    email varchar2(60),
    constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

create sequence SEQ_ATTACHFILE
    increment by 1
    start with 1;

create table authorities (
    email varchar2(60) NOT NULL,
    authority varchar2(20) NOT NULL,
    constraint fk_authorities FOREIGN KEY(email) REFERENCES member(email)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(email, authority); 

create table views (
    no number,
    articleNo number,
    ip varchar(60),
    yearMonthDayHour char(10),
    constraint PK_VIEWS PRIMARY KEY(no),
    constraint UNIQUE_VIEWS UNIQUE(articleNo, ip, yearMonthDayHour)
);

create sequence SEQ_VIEWS
    increment by 1
    start with 1;

-- for test records  
insert into board values ('chat', 'Chat', '자유게시판');
commit;
</pre>


<h4>Create tables (If you use MYSQL)</h4>

<p>
Connect to the root account. After installation, the password for the root account is "" so that you can press Enter and connect.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql
</pre>

<p>
Execute the following commands:
</p>

<pre class="prettyprint">
mysql --user=root --password mysql
	
create user 'java'@'%' identified by 'school';
grant all privileges on *.* to 'java'@'%';

create database javaskool;
exit;

mysql --user=java --password javaskool

create table member (
    email varchar(60) PRIMARY KEY,
    passwd varchar(200) NOT NULL,
    name varchar(20) NOT NULL,
    mobile varchar(20)
);

create table authorities (
    email VARCHAR(60) NOT NULL,
    authority VARCHAR(20) NOT NULL,
    CONSTRAINT fk_authorities FOREIGN KEY(email) REFERENCES member(email)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(email,authority); 

create table board (
    boardcd varchar(20),
    boardnm varchar(40) NOT NULL,
    boardnm_ko varchar(40) NOT NULL,
    constraint PK_BOARD PRIMARY KEY(boardcd)
);

create table article (
    articleno int NOT NULL AUTO_INCREMENT,
    boardcd varchar(20),
    title varchar(200) NOT NULL,
    content text NOT NULL,
    email varchar(60),
    hit bigint,
    regdate datetime,
    constraint PK_ARTICLE PRIMARY KEY(articleno),
    constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

create table comments (
    commentno int NOT NULL AUTO_INCREMENT,
    articleno int,
    email varchar(60),
    memo varchar(4000) NOT NULL,
    regdate datetime,
    constraint PK_COMMENTS PRIMARY KEY(commentno)
);

create table attachfile (
    attachfileno int NOT NULL AUTO_INCREMENT,
    filename varchar(255) NOT NULL,
    filetype varchar(255),
    filesize bigint,
    articleno int,
    email varchar(60),
    filekey varchar(255),
    creation datetime,
    constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

create table views (
  no int primary key AUTO_INCREMENT,
  articleNo int,
  ip varchar(60),
  yearMonthDayHour char(10),
  unique key (articleNo, ip, yearMonthDayHour)
);

insert into board values ('chat','Chat','자유게시판');
commit;

exit;
</pre>


<h4>Test on Tomcat</h4>

<p>
Open the WebContants.java file in the net.java_school.commons package and modify the upload directory to match your system.
</p>

<p>
Go to the upload directory and execute the following command.
</p>

<pre class="shell-prompt">
chmod 777 .
</pre>

<p>
Go to the root directory and compile with the following command:
</p>

<pre class="shell-prompt">
mvn clean compile war:inplace
</pre>

<p>
Create a ROOT.xml file in /conf/Catalina/localhost.<br />
If /home/johndoe/SpringBbs is the root directory, write it like below:
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
  docBase="/home/johndoe/SpringBbs<strong>/src/main/webapp</strong>"
  reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
Restart Tomcat.
</p>

<pre class="shell-prompt">
systemctl restart tomcat8
</pre>

<p>
Visit http://localhost:8080.
</p>

<h4>Test with Maven Jetty Plugin</h4>

<p>
If you test with Maven Jetty Plugin, you do not need a WAS like Tomcat, and you do not need to modify the permissions on the upload directory.
</p>

<p>
Stop Tomcat.
</p>

<pre class="shell-prompt">
systemctl stop tomcat8
</pre>

<p>
Delete all artifacts generated by Maven build.
</p>

<pre class="shell-prompt">
mvn clean
</pre>

<p>
In the pom.xml file, uncomment the build element under &lt;!-- $ mvn jetty:run --&gt;. Comment out the build element under &lt;!-- $ mvn compile war:inplace and run tomcat --&gt;. Go to the root directory and start Jetty with the following command:
</p>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
Go to http://localhost:8080.
</p>

<h3>Install Google Cloud SDk</h3>

<p>
Original: <a href="https://cloud.google.com/sdk/docs/downloads-apt-get">https://cloud.google.com/sdk/docs/downloads-apt-get</a>
</p>

<pre class="shell-prompt">
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
</pre>

<pre class="shell-prompt">
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee \
-a /etc/apt/sources.list.d/google-cloud-sdk.list
</pre>

<pre class="shell-prompt">
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
</pre>

<pre class="shell-prompt">
sudo apt update &amp;&amp; sudo apt install google-cloud-sdk
</pre>

<pre class="shell-prompt">
sudo apt install google-cloud-sdk-app-engine-java
</pre>

<pre class="shell-prompt">
gcloud init
</pre>

<span id="refer">References</span>
<ul id="references">
  <li><a href="${ctx}/blog/2017/Setting-development-environment-in-Ubuntu">Development in Ubuntu</a></li>
  <li><a href="${ctx}/blog/2019/java-development-environment-on-ubuntu-18">Java Development Environment on Ubutnu 18.04</a></li>
  <li><a href="https://cloud.google.com/sdk/docs/downloads-apt-get">https://cloud.google.com/sdk/docs/downloads-apt-get</a></li>
  <li><a href="https://cloud.google.com/compute/docs/regions-zones/">https://cloud.google.com/compute/docs/regions-zones/</a></li>
  <li><a href="https://rogerdudler.github.io/git-guide/index.html">https://rogerdudler.github.io/git-guide/index.html</a></li>
</ul>

</article>
