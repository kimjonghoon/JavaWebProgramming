<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Java 설치</h1>

<h2 class="floatstop">JDK 인스톨러 다운로드</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads/">https://www.oracle.com/java/technologies/downloads/</a> 
</p>

<p>
<c:url var="staticUrl" value="/resources"/>
<img src="${staticUrl}/images/java-latest.png" alt="java latest version" />
</p>

<div class="explain">
<b>Note:</b>
자바 9부터 32 비트 윈도 시스템은 지원하지 않는다.<br />
32 비트 시스템은 자바 8 최신 버전을 설치한다.
</div>

<p>
공식 사이트에서 x64 Installer를 내려받는다.
내려받은 파일을 실행하고, Next 버튼을 계속 클릭하면 JDK를 설치한다.
JDK는 C:\Program Files\Java\jdk-xxx (xxx는 버전)에 설치된다.
</p>

<h3>Path 환경변수에 JDK의 bin 디렉터리 추가</h3>

<p>
윈도 10의 경우, 시작 메뉴를 마우스 오른쪽 버튼으로 클릭한 후 '시스템(Y)'을 선택한다.
</p>

<p>
<img src="${staticUrl}/images/windows10-system.png" alt="System" />
</p>

<p>
'고급 시스템 설정' 선택
</p>

<p>
<img src="${staticUrl}/images/system-properties.png" alt="고급 시스템 설정" />
<p>

<p>
'고급' 탭에서 '환경 변수(N)' 클릭 
</p>

<p>
<img src="${staticUrl}/images/advanced-environment-variables.png" alt="환경 변수" />
</p>

<p>
사용자 변수(U)의 '새로 만들기(N)' 버튼 클릭
</p>

<p>
<img src="${staticUrl}/images/user-variables-new-button.png" alt="사용자 변수(U)의 새로 만들기(N) 버튼" />
</p>

<p>
변수 이름(N)에 JAVA_HOME, 변수 값(V)에 '디렉터리 찾아보기(D)'로 자바가 설치된 디렉터리 입력 
</p>

<p>
<img src="${staticUrl}/images/user-variables-new.png" alt="JAVA_HOME" />
</p>

<p>
사용자 변수(U) 목록에서 Path 선택하고 '편집(E)' 버튼 클릭 
</p>

<p>
<img src="${staticUrl}/images/user-variables-path-edit.png" alt="Edit Path" />

</p>

<p>
'새로 만들기(N)' 버튼을 사용해 %JAVA_HOME%\bin 추가
</p>

<p>
<img src="${staticUrl}/images/add-java_home-to-path.png" alt="%JAVA_HOME%\bin" />
</p>

<div class="explain">
<p>
<b>Note:</b>
사용자 변수 Path 값은 시스템 변수 Path에 추가된다. 윈도 운영 체제는 실행 프로그램을 시스템 변수 Path에 추가된 디렉터리에서 찾는다. Path에 JDK의 bin 디렉터리를 추가하면, 어느 디렉터리에서나 JDK의 bin에 있는 윈도 실행 프로그램(javac.exe, java.exe, jar.exe 등)을 실행할 수 있다. Path에 JDK의 bin 디렉터리를 추가하지 않았다면, 컴파일할 때 javac.exe 윈도 실행 프로그램이 있는 경로로 이동하여 실행해야 한다.
</p>
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Program Files\Java\jdk-17.0.2\bin&gt;javac C:\Users\javaschool\Test.java
</pre>
<p>
명령 프롬프트에서 echo %PATH%를 실행하면 설정된 Path를 확인할 수 있다.
</p>
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;echo %PATH%
C:\Program Files\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Users\javaschool\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Java\jdk-17.0.2\bin;
</pre>
<p>
출력된 경로를 보면 세미콜론(;)으로 디렉터리를 구분하고 있음을 알 수 있다. 윈도 시스템에선 세미콜론을 환경 변수 구분자로 사용한다.
</p>
</div>

<h2>테스트</h2>

<p>
명령 프롬프트를 열고 다음을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;notepad Test.java
</pre>

<p>
파일을 저장한 후 다음을 입력한다.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
public class Test {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
</pre>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;javac Test.java

C:\Users\javaschool&gt;java Test
Hello World!
</pre>

<p>
javac Test.java로 컴파일할 때, <em>'javac'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는 배치 파일이 아닙니다.'</em> 라는 에러는 Path 환경 변수에 JDK의 bin 디렉터리를 추가하지 않았거나 잘못 추가했을 때 발생한다.
</p>

<p>
java Test로 실행할 때, <em>'Exception in thread "main" java.lang.NoClassDefFoundError: Test'</em> 에러는 자바가 Test.class 파일을 찾지 못할 때 발생한다.
</p>

<p>
Test.class 파일이 없는 디렉터리에서 java Test를 실행하면 같은 에러를 만난다. 클래스 파일(Test.class)이 없는 디렉터리에서 실행하려면, java 다음에 -classpath 또는 -cp를 입력한 후, 한 칸 띄고 클래스 파일이 있는 경로를 입력하고, 마지막에 실행할 클래스 이름을 입력해야 한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;cd ..

C:\Users&gt;java -cp C:\Users\javaschool Test
Hello World!
</pre>

<h2>에디터 선택</h2>

<p>
<c:url var="javaUrl" value="/java"/>
<a href="${javaUrl}/Package_Modifiers">패키지와 접근자</a>까지 
<a href="http://www.editplus.com/kr/">에디트플러스</a>나 
<a href="https://notepad-plus-plus.org">Notepad++</a>
같은 단순한 에디터를 사용하는 게 좋다.<br />
패키지와 접근자를 학습한 후에 <a href="https://www.eclipse.org">이클립스</a>를 사용한다.
</p>

</article>

<article>
<div id="next-prev">
  <ul>
    <li>다음 : <a href="${javaUrl}/Features">자바의 특징</a></li>
  </ul>
</div>
</article>
