<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2020.3.1</div>

<h1>우분투 18.04에 자바 개발 환경 만들기</h1>

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
	<li><a href="/blog/2017/Setting-development-environment-in-Ubuntu">우분투 개발환경</a></li>
	<li><a href="/blog/2019/java-development-environment-on-ubuntu-18">우분투 18.04에 자바 개발 환경 만들기</a></li>
</ul>
 
</article>
