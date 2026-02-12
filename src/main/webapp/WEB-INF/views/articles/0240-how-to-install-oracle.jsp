<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>오라클 설치</h1>

<p>
JDBC를 배우려면 데이터베이스를 선택해 설치해야 한다.
우리나라 산업 현장에서 가장 많이 사용되는 데이터베이스는 오라클이다.
프로그램 테스트가 목적이라면 무료로 사용할 수 있는 Oracle Database 11gR2 Express Edition 설치를 추천한다.
--Express Edition을 XE라고 줄여 쓴다--
</p>

<h3>윈도에 오라클 11g XE 설치</h3>

<p>
<a href="https://www.oracle.com/database/technologies/xe-prior-release-downloads.html">https://www.oracle.com/database/technologies/xe-prior-release-downloads.html</a><br />
위 사이트를 방문해, 자신의 윈도 시스템에 맞는 Oracle Database 11gR2 Express Edition을 내려받는다.
오라클 웹사이트의 회원이 아니면 회원 가입을 하고 로그인해야 내려받을 수 있다.
</p>

<p>
윈도는 오라클이 지원하는 운영체제이니 오라클이 쉽게 설치된다.
압축을 풀고 Disk1 디렉터리에서 setup.exe를 실행한 후, 다음 버튼을 계속 눌러 설치할 수 있다.
설치 과정에서 관리자 계정의 비밀번호는 기억해야 한다.
</p>

<p>
윈도의 경우 오라클 설치 과정에서 오라클 XDB의 디폴트 포트 8080을 변경할 수 없다.
설치 후 XDB의 8080 포트를 9090으로 바꾸는 방법은 다음과 같다.
</p> 

<pre class="prettyprint">
C:\Users&gt; sqlplus
Enter user-name: system
Enter password:
Connected.

SQL&gt; Exec DBMS_XDB.SETHTTPPORT(9090);

PL/SQL procedure successfully completed.

SQL&gt;
</pre>

<div th:replace="~{articles/commons/oracle-11g-xe-install-on-ubuntu :: content}"></div>

</article>