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

<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu_en :: content}"></div>

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

<div th:replace="~{articles/commons/database-design :: content}"></div>

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

<div th:replace="~{articles/commons/database-design-mysql :: content}"></div>

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
  <li><a href="/blog/2017/Setting-development-environment-in-Ubuntu">Development in Ubuntu</a></li>
  <li><a href="/blog/2019/java-development-environment-on-ubuntu-18">Java Development Environment on Ubutnu 18.04</a></li>
  <li><a href="https://cloud.google.com/sdk/docs/downloads-apt-get">https://cloud.google.com/sdk/docs/downloads-apt-get</a></li>
  <li><a href="https://cloud.google.com/compute/docs/regions-zones/">https://cloud.google.com/compute/docs/regions-zones/</a></li>
  <li><a href="https://rogerdudler.github.io/git-guide/index.html">https://rogerdudler.github.io/git-guide/index.html</a></li>
</ul>

</article>
