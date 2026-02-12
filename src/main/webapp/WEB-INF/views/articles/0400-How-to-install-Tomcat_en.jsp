<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Tomcat Install</h1>

<p>
On Windows systems, download the Windows zip file from the following address:<br />
<a href="http://tomcat.apache.org/download-11.cgi">http://tomcat.apache.org/download-11.cgi</a><br />
<img src="../../../static/images/tomcat-binary-distributions-windows-zip.png" alt="tomcat binary distributions windows zip" style="width: 465px;" />
</p>

<p>
Unzip the downloaded file and move the created directory to a location of your choice.
</p>

<p>
Run Tomcat.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\apache-tomcat-11.0.6\bin&gt; <strong>.\startup.bat</strong>
</pre>

<p>
Visit http://localhost:8080.
</p>

<p>
<img src="https://lh3.googleusercontent.com/pw/AP1GczMeqNO-yMdoVkMcU0GPoULnlNl9tyh3DMV39n0Jb7juuHJaBLlrYe09OXkHPvUHJHoW5zbo_0My0c0_Yt4r-bA0dzZXJzd2PthazUhnC8Ia_gevZjziYtivhPDFSs7bF-2UrePBDGdEe4HlW-H4x0OExW9biNPjzDEy39WsMRg8rco86G69I7ZtUjWxsXjthN0Aq4ELUyVEGsdpjBD8bD7Hzmg0oUTEeQOXoUGC5rcFYWxF6W-wk0OY10YxNBJ2z8-1FafsrIh7y0zWu6qgy109PpQjUQQIiEN-r6j3mjjUfckOnVlbxGBM1bse0MURkokYq8yn9HRUxD84makkDY0osIXG8SvOmIfZhSO3IAfHEGHmd3AQMHc-f539IhJCot9lW_jzfIn0R8o-rgqEqE6w6d_UJoSMkS3jBzWzlHTaNl63dmNB7uz_Tc8fdj5ZaLqC2JwVcfrIkHJtDwwjQwZcO20SsNc9OpayibSoR_3zrRtJhp6WibNqBwI93xISl6V-1SASo_pPZOzLJn4x373KCYNuZfIoKKCmcda3LGJCCUjK0rP0rTaCBpQNQFp6JqMa-VxpZZy9QyHSzw9-EAybQZqCMFsl_MMhXpyWJr18Scey-AL27MliRX9TM1MonyEcQ9vZsF2A8nutUOze-QaQ7Pp2N9IQuL2uQSLMpkR-EtXH1kjDqtsHF_liuc-A-6DeiEshDxxI1795I2NzE8U5gNsc181NPCh8fviL_ryTP5RmYq2rkW6BQcvNYk8RvwtQeontsqWQYByjW9Ta3tnTqfNkCdiDILeNTWoPiO78-3gnwZEQKAGhsr2uYrN4NpF4ZgRdrc_jZeaWlFBafnlhxmO97czMxxsMy5bu2CoEkZhYluDFtlFjbNdAdsMQdXdVlAiWLYpEtTkRltx2iEhPRsY=w519-h268-s-no?authuser=0" alt="Tomcat default ROOT App" />
</p>

<p>
If you see a cat, installation is a success.
The screen showing the cat is the homepage of Tomcat's ROOT application.
The location of the ROOT application is CATALINA_HOME/webapps/ROOT.
</p>

<p>
Stop Tomcat.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\apache-tomcat-11.0.6\bin&gt; <strong>.\shutdown.bat</strong>
</pre>

<h3>Tomcat administrator</h3>

<p>
To set the Tomcat administrator's name and password,
open the tomcat-users.xml in CATALINA_HOME/conf directory to add the followings.
</p>

<pre class="prettyprint">
&lt;user username="admin" password="must-be-changed" roles="manager-gui" /&gt;
</pre>

<p>
Change <i>must-be-changed</i> to the desired value.<br />
</p>

<p>
CATALINA_HOME represents the root directory of your Tomcat installation.<br />
<strong>C:\apache-tomcat-11.0.6</strong><br />
</p>

<p>
Restart Tomcat.<br />
Visit http://localhost:8080/manager<br />
</p>

<p>
<img alt="login to tomcat web application manager" src="../../../static/images/login-to-tomcat-manager-app.png" th:src="@{/static/images/login-to-tomcat-manager-app.png}" style="width: 321px;" />
</p>

<p>
<img alt="tomcat web application manager" src="../../../static/images/tomcat-manager-application.png" th:src="@{/static/images/tomcat-manager-application.png}" />
</p>

</article>