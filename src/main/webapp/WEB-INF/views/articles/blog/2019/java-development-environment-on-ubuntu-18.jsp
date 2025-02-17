<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2020.3.1</div>

<h1>우분투 18.04에 자바 개발 환경 만들기</h1>

<!-- 오라클 설치 -->
<h3>우분투에 오라클 11g XE 설치</h3>

<p>
우분투(Ubuntu)는 오라클이 공식 지원하는 리눅스 배포판이 아니다.
</p>

<!--
<dl class="note">
<dt>오라클이 공식 지원하는 리눅스 배포판</dt>
<dd>
Oracle Enterprise Linux 4 Update 7<br />
Oracle Enterprise Linux 5 Update 2<br />
Red Hat Enterprise Linux 4 Update 7<br />
Red Hat Enterprise Linux 5 Update 2<br />
SUSE Linux Enterprise Server 10 SP2<br />
SUSE Linux Enterprise Server 11<br />
<a href="https://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL103">https://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL103</a>
</dd>
</dl>
-->

<p>
몇 가지 조치를 하면 우분투에 오라클 11g XE를 설치할 수 있다.<br />
원글: <a href="http://meandmyubuntulinux.blogspot.com/2012/05/installing-oracle-11g-r2-express.html">http://meandmyubuntulinux.blogspot.com/2012/05/installing-oracle-11g-r2-express.html</a>
</p>

<p>
<a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a>으로 이동한다.<br />
64-비트 시스템이면 Oracle Database 11gR2 Express Edition for Linux x64를 선택한다.<br />
파일을 내려받기 위해선 로그인이 필요하다. --오라클 웹사이트의 회원이 아니면 회원 가입을 한다--
로그인하면 내려받기가 시작된다.
내려받기가 끝나면 파일이 있는 디렉터리로 이동해 다음 명령을 수행한다.
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
<dt><strong>sudo apt install libaio1</strong> 실행은, 우분투 24.04가 더는 libaio1을 지원하지 않기에, 실패한다.</dt>
<dd>
<strong>libaio-dev</strong>를 대신 설치하고, libaio.so.1 이름으로 심볼릭 링크를 만들면 오라클 11g를 설치할 수 있다.
<pre class="shell-prompt">
sudo apt install libaio-dev
</pre>
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
/sbin/chkconfig 파일을 만든다.
</p>

<pre class="shell-prompt">
sudo nano /sbin/chkconfig
</pre>

<p>
다음을 복사하여 파일에 붙여넣는다.
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
파일을 저장하고 실행 권한을 부여한다.
</p>

<pre class="shell-prompt">
sudo chmod 755 /sbin/chkconfig
</pre>

<p>
커널 파라미터를 설정한다.
</p>

<pre class="shell-prompt">
sudo nano /etc/sysctl.d/60-oracle.conf
</pre>

<p>
다음 내용을 복사하여 파일에 붙인다.
</p>

<pre class="prettyprint">
# Oracle 11g XE kernel parameters  
fs.file-max=6815744  
net.ipv4.ip_local_port_range=9000 65000  
kernel.sem=250 32000 100 128 
kernel.shmmax=536870912
</pre>

<p>
Swap이 4000 이상인지 확인한다.
</p>

<pre class="shell-prompt">
free -m
</pre>

<pre class="shell-prompt">
             total       used       free     shared    buffers     cached
Mem:          3942       3809        133        947         50       1571
-/+ buffers/cache:       2186       1756
Swap:         <b>4083</b>        378       3705
</pre>

<p>
위와 달리, Swap이 4000을 넘지 않는다면 다음을 차례로 실행한다.
</p>

<pre class="shell-prompt">
sudo ln -s /usr/bin/awk /bin/awk
sudo mkdir /var/lock/subsys
sudo touch /var/lock/subsys/listener
</pre>

<p>
커널 파라미터를 검증한다.
</p>

<pre class="shell-prompt">
sudo cat /etc/sysctl.d/60-oracle.conf
</pre>

<p>
새로운 커널 파라미터를 올린다.
</p>

<pre class="shell-prompt">
sudo service procps start
</pre>

<p>
다음 명령으로 검증한다. --위에서 설정한 값과 다르게 나오더라도 설치를 완료할 수 있다--
</p>

<pre class="shell-prompt">
sudo sysctl -q fs.file-max
</pre>

<p>
오라클 설치 파일이 있는 Disk1 디렉터리에서 다음 명령으로 설치를 시작한다.
</p>
  
<pre class="shell-prompt">
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb
sudo /etc/init.d/oracle-xe configure
</pre>

<p>
Oracle Application Express의 디폴트 포트 번호인 8080을 바꾸어 주는 게 좋다. --아래는 9090로 설정했다--
</p>

<p>
리슨너 포트는 디폴트 값인 1521을 그대로 사용한다. --엔터 키만 치면 디폴트 값이 선택된다--
</p>

<p>
관리자 계정인 SYS와 SYSTEM의 비밀번호를 지정한다.
</p>

<p>
마지막으로 부팅 시 오라클이 자동으로 시작하도록 설정한다. (엔터)
</p>

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
initial configuration: <strong>&lt;관리자 비밀번호&gt;</strong>
Confirm the password: <strong>&lt;관리자 비밀번호&gt;</strong>

Do you want Oracle Database 11g Express Edition to be started 
on boot (y/n) [y]:

Starting Oracle Net Listener...Done
Configuring database...Done
Starting Oracle Database 11g Express Edition instance...Done
Installation completed successfully.
</pre>

<p>
환경변수를 추가한다.
</p>

<pre class="shell-prompt">
nano ~/.bashrc
</pre>

<p>
아래를 .bashrc 가장 아래에 붙여넣는다.
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
다음 명령으로 환경 변수를 적용한다.
</p>

<pre class="shell-prompt">
source ~/.bashrc
</pre>

<p>
오라클을 시작한다.
</p>

<pre class="shell-prompt">
sudo service oracle-xe start
</pre>

<p>
부팅 시 오라클이 자동으로 시작하므로 재부팅 후 이 명령은 필요 없다.
</p>


<h4>SCOTT 계정 만들기</h4>

<p>
관리자 계정으로 SQL*PLUS에 접속한 후, SCOTT 계정 스키마 스크립트를 실행한다.
</p>

<pre class="shell-prompt"><strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on 월 6월 29 12:04:33 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>**********</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt; <strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

<h3>MariaDB 설치</h3>

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
root 유저가 mysql_native_password 플러그인을 사용하도록 설정한다.
</p>

<pre class="shell-prompt">
sudo mysql

use mysql

update user set plugin='mysql_native_password' where user='root';
flush privileges;
exit
</pre>

<p>
MariaDB를 다시 시작한다.
</p>

<pre class="shell-prompt">sudo service mariadb restart
</pre>

<h3>자바 설치</h3>

<pre class="shell-prompt">
sudo apt install default-jdk
</pre>

<h3>메이븐 설치</h3>

<pre class="shell-prompt">
sudo apt install maven
</pre>

<h4>로컬 저장소에 오라클 JDBC 드라이버 설치</h4>

<p>
오라클 JDBC 드라이버는 메이븐 저장소에서 제공하지 않는다.
ojdbc6.jar 파일이 있는 디렉토리로 이동한 후 다음 명령을 실행하여 ojdbc6.jar를 로컬 저장소에 저장한다.
</p>

<pre class="shell-prompt">
cd /u01/app/oracle/product/11.2.0/xe/jdbc/lib

mvn install:install-file \
-Dfile=ojdbc6.jar \
-DgroupId=com.oracle \
-DartifactId=ojdbc6 \
-Dversion=11.2.0.2.0 \
-Dpackaging=jar
</pre>

<p>
다음은 로컬 저장소에 저장된 정보대로 오라클 JDBC 드라이버를 pom.xml에 추가하는 방법을 보여준다.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
    &lt;groupId&gt;com.oracle&lt;/groupId&gt;
    &lt;artifactId&gt;ojdbc6&lt;/artifactId&gt;
    &lt;version&gt;11.2.0.2.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>Git 설치</h3>

<pre class="shell-prompt">
sudo apt install git
</pre>

<pre class="shell-prompt">
git config --global user.name <b>"Gildong Hong"</b>
git config --global user.email <b>hong@gmail.org</b>
</pre>

<pre class="shell-prompt">
git config --global --list
</pre>

<h3>톰캣 설치</h3>

<pre class="shell-prompt">
sudo apt install tomcat9
</pre>

<h4>톰캣 재가동</h4>

<pre class="shell-prompt">
sudo service tomcat9 restart
</pre>

<h4>톰캣 루트 애플리케이션 변경</h4>

<p>
root 계정에 로그인해서 다음을 실행한다.
</p>

<pre class="shell-prompt">
sudo nano /etc/tomcat9/Catalina/localhost/ROOT.xml
</pre>

<p>
메이븐 프로젝트이고 /home/kim/javaschool가 루트 디렉터리라면 아래처럼 ROOT.xml를 작성한다.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="/home/kim/javaschool/src/main/webapp"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<dl class="note">
<dt>
root 계정에 로그인하려면
</dt>
<dd>
우분투를 설치한 후 다음 명령으로 root 계정 비밀번호를 지정한다.
<pre class="shell-prompt">
sudo passwd
</pre>
su를 실행하고 root 계정 비밀번호를 입력한다.
<pre class="shell-prompt">
su
암호:
</pre>
</dd>
</dl>

<h4>톰캣 로그</h4>

<p>
su를 실행해 root 계정에 로그인한 후 다음 명령을 실행한다.
</p>

<pre class="shell-prompt">
tail -f /var/lib/tomcat9/logs/localhost.<em>2019-10-05</em>.log
</pre>

<pre class="shell-prompt">
tail -f /var/lib/tomcat9/logs/catalina.<em>2019-10-05</em>.log
</pre>

<h3>이클립스 설치</h3>

<p>
<a href="https://www.eclipse.org/downloads/">https://www.eclipse.org/downloads/</a>
에서 인스톨러를 내려받은 후 다음 명령을 차례로 실행한다.
</p>

<pre class="shell-prompt">
cd 다운로드
tar -xvf eclipse-inst-linux64.tar.gz
cd eclipse-installer/
./eclipse-inst
</pre>

<p>
설치 선택 화면에서 Eclipse IDE for Enterprise Java Developers를 선택한다.<br />
<img src="https://lh3.googleusercontent.com/9Qdf0fBOZ07mgOWZtL0Wuhc6fEo2TVCb3IwHcV1q-SX8TSIjmwXKLVvFgwbch4qnk0ttijqnOzq_zOLDklfZ3MTXyqUOy6pz0FW4RRxBmCsrwwZoINUmpQbCjexYIQ5fpc3O_Uh-kDqKd84TKmtXP2saxGB55Spwwxykf-7DQM_5TBjXL17gIsO0QcrpHWza0Fg1eKP2zEG_-sge-oPVj9AwPlcP-NnRdTOQtAQ86ykBXK_Wauorb7p2rx3g9ULkJmMJUfJR4JW_9xknS89faZG_AdEV8bgmkm1vI6wk2qObRXSsHxcB6hr8sRuhbqAzysT5Y6rO3cagMNMOhXTAGbSelGgp7V8AbHavpuweEat5PpCjV0CHsS-BKWoh234ECpcJ1l96Oig17Ox6Jev0jcuhFh0YVb6hgLC8w1oYyn-UmGfZIXLtrf5cq1jdJrHgn1nBxyHD6tVPOkA2qj7etLNzJmgWPksfUL78aNUxDQW7fwZtS6gZOdfovyQJxhPJ1de2eT81SWQFEseEOqj8gQMsfj6rFuzX3Exx9lb53Ce2tiEsrMFlb_EG5dOGZHgE1qXc86fFWo6RYdSfGR7aRU-PsEKtYZ3KCVs6RVhOEb7Uy0UKa6uBWJ6d5Un2jxhc-DSg0T6HyURD228qYDGrldYqbI5gXEEQfC39xQyi6YtoS9GLI1skssk=w846-h869-no" alt="Eclipse IDE for Enterprise Java Developers" />
</p>

<h4>eclipse.desktop 파일 생성</h4>

<pre class="shell-prompt">
cd /usr/share/applications
sudo nano eclipse.desktop
</pre>

<p>
eclipse.desktop 파일을 아래처럼 작성한다.
--Exec와 Icon의 경로는 자신에 맞게 수정한다--
</p>

<pre class="prettyprint">
[Desktop Entry]
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
eclipse를 검색하여 실행하고 런처에 고정시킨다.
</p>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="${ctx}/blog/2017/Setting-development-environment-in-Ubuntu">우분투 개발환경</a></li>
	<li><a href="${ctx}/blog/2019/java-development-environment-on-ubuntu-18">우분투 18.04에 자바 개발 환경 만들기</a></li>
</ul>
 
</article>
