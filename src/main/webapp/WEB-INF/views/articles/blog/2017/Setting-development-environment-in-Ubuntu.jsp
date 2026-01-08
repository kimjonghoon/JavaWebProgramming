<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<article>
<div class="last-modified">Last Modified 2020.2.27</div>

<h1>우분투 개발환경</h1>

<h3>Ubuntu 설치</h3>

<p>
<a href="https://ubuntu.com/#download">https://ubuntu.com/#download</a>에서 Ubuntu LTS를 내려받는다.
</p>

<h4>설치를 위한 부팅 USB 만들기</h4>

<p>
윈도 시스템을 사용한다면 다음 링크를 참조한다.<br />
<a href="http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows">http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows</a>
</p>

<p>
우분투를 사용할 수 있다면 다음 과정을 따른다.<br />
USB를 꼽고 USB 디바이스를 확인한다.<br />
</p>

<pre class="shell-prompt">
sudo ls -l /dev/disk/by-id/*usb*
</pre>

<p>
만일 sdb, sdb1, sdb2가 함께 보이면, 뒤에 숫자가 없는 sdb가 USB 디바이스를 가리킨다.<br />
우분투 ISO 파일을 내려받은 폴더로 이동한다.<br />
아래 명령을 수행한다. filename.iso 대신 내려받은 우분투 ISO 파일명을, of=다음엔 USB 디바이스를 입력한다.<br />
</p>
 
<pre class="shell-prompt">
sudo dd if=<strong>filename.iso</strong> of=<strong>/dev/sdb</strong> bs=4M; sync
</pre>

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

<h3>SCOTT 계정 만들기</h3>

<p>
관리자 계정으로 SQL*PLUS에 접속한다.
</p>

<pre class="shell-prompt">
<strong>sqlplus sys as sysdba</strong>

SQL*Plus: Release 11.2.0.2.0 Production on 월 6월 29 12:04:33 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: <strong>&lt;관리자 비밀번호&gt;</strong>

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL&gt;<strong>@/u01/app/oracle/product/11.2.0/xe/rdbms/admin/utlsampl.sql</strong>
</pre>

<h3>MySQL 설치</h3>

<pre class="shell-prompt">
sudo apt install mysql-server mysql-client
</pre>

<h3>JDK 설치</h3>

<pre class="shell-prompt">
sudo apt update
sudo apt upgrade
sudo apt install default-jdk
</pre>

<p>
다음 명령으로 자바 버전을 확인한다.
</p>

<pre class="shell-prompt">
java -version
</pre>

<h3>JDBC 테스트</h3>

<p>
다음 GetEmp.java 파일을 만든다.
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
GetEmp.java 파일이 있는 디렉터리에서 다음을 수행한다.
</p>

<pre class="shell-prompt">
javac GetEmp.java
java -cp .:/u01/app/oracle/product/11.2.0/xe/jdbc/lib/ojdbc6.jar GetEmp
</pre>

<h3>메이븐 설치</h3>

<p>
sudo apt 명령어로 설치하지 말자.<br />
<a href="https://maven.apache.org/download.cgi">https://maven.apache.org/download.cgi</a>에서 최신 바이너리 파일을 내려받는다.<br />
내려받은 디렉터리로 이동하여 압축을 풀고 생성된 디렉터리를 /opt/maven으로 옮긴다.
</p>

<pre class="shell-prompt">
cd ~/다운로드/
tar -xvzf apache-maven-3.5.4-bin.tar.gz
sudo mv apache-maven-3.5.4/ /opt/maven
</pre>

<p>
.bashrc 파일을 연다.
</p>

<pre class="shell-prompt">
nano ~/.bashrc &amp; 
</pre>

<p>
.bashrc 파일의 가장 아래에 다음을 추가한다.
</p>

<pre class="prettyprint">
export MAVEN_HOME=/opt/maven
export PATH=$MAVEN_HOME/bin:$PATH
</pre>

<p>
환경 변수 설정을 적용한다.
</p>

<pre class="shell-prompt">
source ~/.bashrc
</pre>

<p>
메이븐 버전을 확인한다.
</p>

<pre class="shell-prompt">
mvn -v
</pre>

<h3>톰캣 설치</h3>

<p>
톰캣을 설치한다.
</p>

<pre class="shell-prompt">
sudo apt update
sudo apt upgrade
sudo apt install tomcat8
</pre>

<p>
http://localhost:8080을 방문한다.<br />
http://localhost:8080에서 CATALINA_HOME과 CATALINA_BASE 디렉터리를 확인한다.<br />
/conf/Catalina/localhost 디렉터리를 확인한다.<br />
(이 디렉터리는 CATALINA_HOME과 CATALINA_BASE 둘 중 하나에 있다)
</p>

<h3>이클립스 설치</h3>

<p>
apt install 명령으로 이클립스를 설치하지 말자.<br />
<a href="https://www.eclipse.org/downloads/packages/">https://www.eclipse.org/downloads/packages/</a>의 오른쪽 <strong>More Downloads</strong> 메뉴에서 
자신의 시스템에 맞는 버전을 선택한다.
시스템 자원이 넉넉하다면 가장 최신 버전을 선택할 수 있으나 메모리 4G 이하의 시스템에선 여러 버전을 테스트하고 선택하자.
Eclipse IDE for Java EE Developers를 내려받는다.
내려받은 파일이 있는 디렉터리로 이동하여 압축을 푼다.
</p>

<pre class="shell-prompt">
tar -xvf eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz
</pre>

<p>
생성된 eclipse 디렉터리를 /opt 디렉터리로 옮긴다.
</p>

<pre class="shell-prompt">
sudo mv eclipse /opt/
</pre>

<h4>eclipse.desktop 파일 생성</h4>

<pre class="shell-prompt">
cd ~/.local/share/applications/
gedit eclipse.desktop
</pre>

<p>
다음을 복사하여 eclipse.desktop 파일에 붙여넣는다.
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
eclipse를 검색하여 실행하고 이클립스를 런처에 고정한다.
</p>

<h3>Git 설치</h3>

<pre class="shell-prompt">
sudo apt install git
</pre>

<p>
git 버전을 확인한다.
</p>

<pre class="shell-prompt">
git --version
</pre>

<p>
사용자 정보를 설정한다.
</p>

<pre class="shell-prompt">
git config --global user.name "<em>Gildong Hong</em>"
git config --global user.email <em>hong@gmail.org</em>
</pre>

<p>
설정을 확인한다.
</p>

<pre class="shell-prompt">
git config --global --list
</pre>

<h3>스프링 게시판 예제 테스트</h3>

<p>
SpringBbs 프로젝트를 설치하려면 다음을 수행한다.
</p>

<pre class="shell-prompt">
git clone https://github.com/kimjonghoon/SpringBbs
</pre>

<p>
ojdbc6.jar 파일이 있는 디렉터리로 이동한 후 다음 명령으로 오라클 JDBC 드라이버를 로컬 레포지토리에 저장한다.
</p>

<pre class="shell-prompt">
cd /u01/app/oracle/product/11.2.0/xe/jdbc/lib
mvn install:install-file -Dfile=ojdbc6.jar \
-DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.2.0 -Dpackaging=jar
</pre>

<p>
이클립스를 열고 SpringBbs를 임포트한다.<br />
<img alt="컨텍스트 메뉴에서 Import" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png"><br />
<img alt="이클립스에서 메이븐 프로젝트 Import" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png"><br />
pom.xml과 이클립스를 동기화한다.<br />
Package Explorer 뷰에서 프로젝트를 선택하고 마우스 오른쪽 버튼으로 컨텍스트 메뉴를 연다.<br />
Maven - Update Project Configuration을 차례로 선택한다.
</p>

<h4>오라클 테이블 생성</h4>

<p>
관리자 계정으로 접속해(sqlplus sys as sysdba) 다음 SQL 문을 실행한다.
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


<h4>MySQL 테이블 생성</h4>

<p>
루트 계정으로 접속한다.<br />
루트 계정의 비밀번호는 ""이니 그냥 엔터를 치면 된다.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql
</pre>

<p>
다음 명령을 실행한다.
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


<h4>1. 톰캣에서 테스트</h4>

<h4>업로드 디렉터리 수정</h4>

<p>
net.java_school.commons 패키지의 WebContants.java 파일을 열고 업로드 디렉터리를 자신의 시스템에 맞게 수정한다.
</p>

<p>
업로드 디렉터리로 이동하여 다음 명령을 실행한다.
</p>

<pre class="shell-prompt">
chmod 777 .
</pre>

<p>
SpringBbs 루트 디렉터리로 이동하여 다음과 같이 빌드한다.
</p>

<pre class="shell-prompt">
mvn clean compile war:inplace
</pre>

<h4>톰캣 루트 애플리케이션 변경</h4>

<p>
/conf/Catalina/localhost에 ROOT.xml 파일을 생성한다.<br />
/home/kim/SpringBbs가 루트 디렉터리라면 다음과 같이 작성한다.
</p>

<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;Context
    docBase="/home/kim/SpringBbs<strong>/src/main/webapp</strong>"
    reloadable="true"&gt;
&lt;/Context&gt;
</pre>

<p>
톰캣을 재실행한다.
</p>

<pre class="shell-prompt">
systemctl restart tomcat8
</pre>

<p>
http://localhost:8080을 방문해 테스트한다.
</p>

<h4>2. Maven Jetty Plugin으로 테스트</h4>

<p>
Maven Jetty Plugin으로 테스트하면 톰캣과 같은 WAS가 따로 필요하지 않고 업로드 디렉터리에 대한 권한 수정도 필요없다.
</p>

<p>
톰캣을 중지시킨다.
</p>

<pre class="shell-prompt">
systemctl stop tomcat8
</pre>

<p>
이전에 빌드로 생성한 모든 산출물을 제거한다.
</p>

<pre class="shell-prompt">
mvn clean
</pre>

<p>
pom.xml 파일에서 &lt;!-- $ mvn jetty:run --&gt; 아래 build 엘리먼트를 감싸는 주석을 제거한다.<br />
&lt;!-- $ mvn compile war:inplace and run tomcat --&gt; 아래 build 엘리먼트를 주석처리한다.
</p>

<p>
SpringBbs의 루트 디렉터리에서 다음 명령을 실행한다.
</p>

<pre class="shell-prompt">
mvn jetty:run
</pre>

<p>
http://localhost:8080을 방문해 테스트한다.
</p>

<h3>Google Cloud SDk 설치</h3>

<p>
원본 <a href="https://cloud.google.com/sdk/docs/downloads-apt-get">https://cloud.google.com/sdk/docs/downloads-apt-get</a>
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

<span id="refer">참고</span>
<ul id="references">
	<c:url var="blogUrl" value="/blog"/>
	<li><a href="${blogUrl}/2017/Setting-development-environment-in-Ubuntu">우분투 개발환경</a></li>
	<li><a href="${blogUrl}/2019/java-development-environment-on-ubuntu-18">우분투 18.04에 자바 개발 환경 만들기</a></li>
	<li><a href="https://cloud.google.com/sdk/docs/downloads-apt-get">https://cloud.google.com/sdk/docs/downloads-apt-get</a></li>
	<li><a href="https://cloud.google.com/compute/docs/regions-zones/">https://cloud.google.com/compute/docs/regions-zones/</a></li>
	<li><a href="https://rogerdudler.github.io/git-guide/index.ko.html">https://rogerdudler.github.io/git-guide/index.ko.html</a></li>
</ul>

</article>
