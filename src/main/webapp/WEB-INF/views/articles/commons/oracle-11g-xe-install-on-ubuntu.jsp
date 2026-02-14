<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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

<pre class="prettyprint" th:inline="none">
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


