<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>톰캣 설치</h1>

<p>
<a href="http://tomcat.apache.org/download-11.cgi">http://tomcat.apache.org/download-11.cgi</a><br />
Windows Service Installer 파일을 내려받는다.<br />
</p>

<p>
<img alt="tomcat windows service installer" src="../../../static/images/tomcat-binary-distributions-windows-service-installer.png" th:src="@{/static/images/tomcat-binary-distributions-windows-service-installer.png}" style="width: 364px;" />
</p>

<p>
내려받은 파일을 실행하고, 다음 버튼을 계속 클릭하여 설치를 완료한다.<br />
</p>

<p>
설치 후 처음 톰캣을 실행하기 위해, Monitor Tomcat을 검색하여 실행하면, 시스템 트레이 메뉴에 Monitor Tomcat 앱이 추가된다.<br />
<img alt="search tomcat" src="../../../static/images/search-tomcat.png" th:src="@{/static/images/search-tomcat.png}" />
</p>

<p>
시스템 트레이에 있는 Monitor Tomcat을 클릭한다.<br />
<img alt="tomcat on system tray menu" src="../../../static/images/tomcat-on-system-tray-menu.png" th:src="@{/static/images/tomcat-on-system-tray-menu.png}" />
</p>

<p>
톰캣 속성 창이 나타나는데, 실행 타입으로 Automatic을 선택한다.
Automatic은 시스템이 실행할 때 톰캣이 함께 실행되게 한다.<br />
<img alt="톰캣 속성 창에서 Automatic 선택" src="../../../static/images/tomcat-properties-startup-type-automatic.png" th:src="@{/static/images/tomcat-properties-startup-type-automatic.png}" />
</p>

<p>
http://localhost:8080을 방문한다.<br />
<img src="https://lh3.googleusercontent.com/pw/AP1GczMeqNO-yMdoVkMcU0GPoULnlNl9tyh3DMV39n0Jb7juuHJaBLlrYe09OXkHPvUHJHoW5zbo_0My0c0_Yt4r-bA0dzZXJzd2PthazUhnC8Ia_gevZjziYtivhPDFSs7bF-2UrePBDGdEe4HlW-H4x0OExW9biNPjzDEy39WsMRg8rco86G69I7ZtUjWxsXjthN0Aq4ELUyVEGsdpjBD8bD7Hzmg0oUTEeQOXoUGC5rcFYWxF6W-wk0OY10YxNBJ2z8-1FafsrIh7y0zWu6qgy109PpQjUQQIiEN-r6j3mjjUfckOnVlbxGBM1bse0MURkokYq8yn9HRUxD84makkDY0osIXG8SvOmIfZhSO3IAfHEGHmd3AQMHc-f539IhJCot9lW_jzfIn0R8o-rgqEqE6w6d_UJoSMkS3jBzWzlHTaNl63dmNB7uz_Tc8fdj5ZaLqC2JwVcfrIkHJtDwwjQwZcO20SsNc9OpayibSoR_3zrRtJhp6WibNqBwI93xISl6V-1SASo_pPZOzLJn4x373KCYNuZfIoKKCmcda3LGJCCUjK0rP0rTaCBpQNQFp6JqMa-VxpZZy9QyHSzw9-EAybQZqCMFsl_MMhXpyWJr18Scey-AL27MliRX9TM1MonyEcQ9vZsF2A8nutUOze-QaQ7Pp2N9IQuL2uQSLMpkR-EtXH1kjDqtsHF_liuc-A-6DeiEshDxxI1795I2NzE8U5gNsc181NPCh8fviL_ryTP5RmYq2rkW6BQcvNYk8RvwtQeontsqWQYByjW9Ta3tnTqfNkCdiDILeNTWoPiO78-3gnwZEQKAGhsr2uYrN4NpF4ZgRdrc_jZeaWlFBafnlhxmO97czMxxsMy5bu2CoEkZhYluDFtlFjbNdAdsMQdXdVlAiWLYpEtTkRltx2iEhPRsY=w519-h268-s-no?authuser=0" alt="Tomcat default ROOT App" />
</p>

<p> 
화면은 톰캣의 ROOT 애플리케이션의 홈페이지다.<br />
ROOT 애플리케이션의 위치는 CATALINA_HOME/webapps/ROOT이다.<br />
CATALINA_HOME은 톰캣이 설치된 다음 디렉터리다.<br />
</p>

<pre><strong>C:\Program Files\Apache Software Foundation\Tomcat 11.0</strong></pre>

<p>
톰캣 관리자 이름과 비밀번호를 설정한다.<br />
CATALINA_HOME/conf 디렉토리에서 tomcat-users.xml 파일에, 아래처럼 user 엘리먼트를 추가하고 이름과 비밀번호를 수정한다.<br />
</p>

<pre class="prettyprint">
&lt;?xml version='1.0' encoding='cp949'?&gt;
&lt;tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0"&gt;
  <strong>&lt;user username="이름" password="비밀번호" roles="manager-gui" /&gt;</strong>
&lt;/tomcat-users&gt;
</pre>

<p>
톰캣 설정을 변경했으니, Monitor Tomcat 앱으로 이용해 톰캣을 다시 실행한다.<br />
</p>

<p>
http://localhost:8080/manager 주소를 방문하면, 관리자 이름과 비밀번호를 묻는 창이 나타난다.<br />
<img alt="톰캣 매니저 앱 로그인 화면" src="../../../static/images/login-to-manager.png" th:src="@{/static/images/login-to-manager.png}" style="width: 323px;" />
</p>

<p>
위에서 지정한 이름과 비밀번호를 입력하면, 톰캣 웹 애플리케이션 화면이 나타난다.<br />
<img alt="톰캣 매니저 앱 화면" src="../../../static/images/tomcat-manager-app.png" th:src="@{/static/images/tomcat-manager-app.png}" />
</p>

<p>
작업 중인 웹 애플리케이션 설정을 변경했다면, 톰캣 웹 애플리케이션 매니저를 통해 해당 애플리케이션을 다시 로드하면 변경된 설정이 적용된다.<br />
</p>

</article>