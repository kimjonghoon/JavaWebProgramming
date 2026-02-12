<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>우분투 24.04에 자바 개발 환경</title>
<meta name="Keywords" content="Ubuntu 24.04,Java Development Environment on Ubuntu 24.04,Oracle 11g XE,MariaDB,Java Install,Maven Install,Git Install,Tomcat Install,Apache Install,Tomcat Connector Install,Eclipse Install" />
<meta name="Description" content="우분투 24.04 시스템에 자바 개발 환경을 구축하는 방법을 설명합니다" />
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
<div class="last-modified">Last Modified 2025.5.24</div>

<h1>우분투 24.04에 자바 개발 환경 만들기</h1>

<h3>우분투 설치</h3>

<p>
<a href="https://ubuntu.com/download/desktop">https://ubuntu.com/download/desktop</a>에서 최신 LTS 버전을 내려받는다.
</p>

<h4>설치를 위한 부팅 USB 만들기</h4>

<p>
우분투를 사용할 수 있다면, USB 드라이브를 꼽고 USB 디바이스를 확인한다.
</p>

<pre class="shell-prompt">
sudo ls -l /dev/disk/by-id/*usb*
</pre>

<p>
sdb, sdb1, sdb2가 함께 보이면, 뒤에 숫자가 없는 sdb가 USB 디바이스를 가리킨다.<br />
우분투 ISO 파일을 내려받은 폴더로 이동한다.<br />
아래 명령을 수행하는데, filename.iso 대신 내려받은 우분투 ISO 파일명을, of=다음엔 USB 디바이스를 입력한다.
</p>

<pre class="shell-prompt">
sudo dd if=<strong>filename.iso</strong> of=<strong>/dev/sdb</strong> bs=4M; sync
</pre>

<h4>root 비밀번호 설정</h4>

<pre class="shell-prompt">
sudo passwd root
</pre>

<pre class="shell-prompt">
New password:
Retype new password:
passwd: password updated successfully
</pre>

<!-- 오라클 설치 -->
<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu :: content}"></div>

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
sudo apt install mariadb-server
</pre>

<p>
에러없이 설치가 완료되었다면, 다음 명령을 실행하여 root 비밀번호를 설정한다.
--현재 비밀번호는 엔터키를 누른다--
</p>

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

<h3>자바 설치</h3>

<pre class="shell-prompt">
sudo apt install openjdk-21-jdk
</pre>

<h3>메이븐 설치</h3>

<pre class="shell-prompt">
sudo apt install maven
</pre>

<h3>Git 설치</h3>

<pre class="shell-prompt">
sudo apt install git
</pre>

<pre class="shell-prompt">
git config --global user.name <b>"Gildong Hong"</b>
git config --global user.email <b>hong@gmail.org</b>
</pre>

<p>
설정이 제대로인지 확인
</p>

<pre class="shell-prompt">
git config --global --list
</pre>

<h4>gh 설치</h4>

<pre class="shell-prompt">
sudo apt install gh
</pre>

<p>
https://github.com 사이트에 가입하고, 로그인 상태에서 다음 실행
</p>

<pre class="shell-prompt">
gh auth login
</pre>

<p>
아래처럼 선택
</p>

<pre class="shell-prompt">
? What account do you want to log into? <strong>GitHub.com</strong>
? What is your preferred protocol for Git operations? <strong>HTTPS</strong>
? Authenticate Git with your GitHub credentials? <strong>Yes</strong>
? How would you like to authenticate GitHub CLI? <strong>Login with a web browser</strong>
</pre>

<p>
선택을 완료하면 원-타임 비밀번호가 출력된다.<br />
</p>

<pre class="shell-prompt">
! First copy your one-time code: <strong>&lt;one-time code&gt;</strong>
- <strong>Press Enter</strong> to open github.com in your browser...
</pre>

<p>
비밀번호를 복사한 후, 엔터를 치면 웹 브라우저가 실행되고 비밀번호를 입력할 수 있는 페이지가 보인다.<br />
터미널에서 복사한 비밀번호를 페이지에 붙여 넣는다.<br />
</p>

<h3>Vim 설치</h3>

<pre class="shell-prompt">
sudo apt install vim
</pre>

<h3>톰캣 설치</h3>

<pre class="shell-prompt">
sudo apt install tomcat10 tomcat10-admin
</pre>

<pre class="shell-prompt">
sudo vi /etc/tomcat10/tomcat-users.xml
</pre>

<pre class="prettyprint">
&lt;user username="<i>사용자 이름</i>" password="<i>비밀번호</i>" roles="manager-gui" /&gt;
</pre>

<h4>파일 업로드 디렉터리와 로그 디렉터리 설정</h4>

<p>
파일 업로드 디렉터리를 /opt/upload,
로그 디렉터리를 /opt/logs로 정했다고 가정
</p>

<pre class="shell-prompt">
cd /opt
sudo mkdir logs
sudo mkdir upload
sudo chown -R tomcat:tomcat upload/ logs/
sudo chmod u=rwX,g=rwX,o=rX upload/
sudo vi /etc/systemd/system/multi-user.target.wants/tomcat10.service
</pre>

<p>
#Security아래 지정 디렉터리를 추가한다.
</p>

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

<h4>톰캣 로그 확인</h4>

<p>
su를 실행해 root 계정에 로그인한 후 다음 명령 실행
</p>

<pre class="shell-prompt">
tail -f /var/lib/tomcat10/logs/localhost.<em>2024-07-05</em>.log
</pre>

<pre class="shell-prompt">
tail -f /var/lib/tomcat10/logs/catalina.<em>2024-07-05</em>.log
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
sudo vi eclipse.desktop
</pre>

<p>
eclipse.desktop 파일을 아래처럼 작성한다.
--Exec와 Icon 경로는 자신에 맞게 수정--
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
eclipse를 검색하여 실행하고 런처에 고정시킨다.
</p>

</article>

</body>
</html>
