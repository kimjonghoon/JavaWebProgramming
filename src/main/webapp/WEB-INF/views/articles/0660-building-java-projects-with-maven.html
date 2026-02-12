<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>메이븐으로 자바 개발</h1>

<p style="clear: both;font-style: italic;font-weight: bold;padding: 10px 30px;font-size: 14px;">
아래 글은 <a href="http://spring.io/guides/gs/maven/">http://spring.io/guides/gs/maven/</a>를 번역한 것입니다.
</p>

<h2 id="Install-Maven">메이븐 설치</h2>

<ol>
  <li><a href="http://maven.apache.org/download.cgi">http://maven.apache.org/download.cgi</a>에서 최신 바이너리 파일을 다운로드한다.</li>
  <li>압축을 풀고 생성된 디렉터리를 원하는 곳에 옮긴다.(예, C:\Program Files\apache-maven-3.8.7)</li>
  <li>메이븐 bin 디렉터리를 Path에 추가한다.</li>
  <li>JAVA_HOME 환경 변수가 있는지 확인한다. 메이븐은 JAVA_HOME 환경 변수를 참조하기에 없다면 만들어야 한다. (<a th:href="@{/java/JDK-Install}">JDK 설치</a> 문서 참조)</li>
</ol>

<p>
명령 프롬프트에서 다음 명령으로 메이븐 버전을 확인한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\kim&gt; mvn -v
Apache Maven 3.9.9
Maven home: C:\Program Files\apache-maven-3.9.9\bin\..
Java version: 21.0.1, vendor: Oracle Corporation
Java home: C:\Program Files\Java\jdk-21.0.1\jre
..
</pre>

<h2>메이븐 프로젝트 생성</h2>

<p>
pom.xml 파일의 내용과 메이븐 프로젝트 디렉터리 구조를 안다면 메이븐 프로젝트를 만들 수 있다.
</p>

<p>
HelloWorld를 프로젝트 루트 디렉터리라면,<br />
HelloWorld 아래에 서브 디렉터리 src\main\java를 만든다.<br />
src\main\java은 메이븐 프로젝트에서 자바 소스 파일을 두는 디렉터리다.<br />
(아래에서 맨 끝단의 hello는 생성할 자바 클래스의 패키지 이름)
</p>

<pre lang="en">
HelloWorld (project root directory)
   └── src
        └── main
             └── java
                  └── hello
</pre>

<p>
프로젝트 루트에 pom.xml 파일을 작성한다.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/maven-v4_0_0.xsd"&gt;
                       
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;org.springframework.gs&lt;/groupId&gt;
  &lt;artifactId&gt;quick-start&lt;/artifactId&gt;
  &lt;version&gt;0.1.0&lt;/version&gt;
  &lt;packaging&gt;jar&lt;/packaging&gt;
  
  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;21&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;21&lt;/maven.compiler.target&gt;
  &lt;/properties&gt;
  
&lt;/project&gt;
</pre>

<ul>
  <li>&lt;modelVersion&gt; - POM model version으로 언제나 4.0.0</li>
  <li>&lt;groupId&gt; - 프로젝트의 소유자인 조직이나 기관으로 패키지 형식의 이름을 가진다.</li>
  <li>&lt;artifactId&gt; - 프로젝트 이름. 생성되는 jar나 war 파일에 이 이름이 붙여진다.</li>
  <li>&lt;version&gt; - 프로젝트 버전</li>
  <li>&lt;packaging&gt; - 프로젝트를 어떻게 패키지 할 것인가를 설정한다. 디폴트는 jar이고 웹 애플리케이션이면 war로 설정한다.</li>
</ul>

<p>
hello 디렉터리에 다음 두 개의 자바 소스 파일을 작성한다.
</p>

<p>
src/main/java/hello/HelloWorld.java
</p>

<h6 class="src">HelloWorld.java</h6>
<pre class="prettyprint">package hello;

public class HelloWorld {
  public static void main(String[] args) {
    Greeter greeter = new Greeter();
    System.out.println(greeter.sayHello());
  }
}
</pre>

<p>
src/main/java/hello/Greeter.java
</p>

<h6 class="src">Greeter.java</h6>
<pre class="prettyprint">package hello;

public class Greeter {
  public String sayHello() {
    return "Hello world!";
  }
}
</pre>

<h4>메이븐 명령어</h4>

<p>
다음 명령어를 pom.xml 파일이 있는 위치(프로젝트 루트 디렉터리)에서 실행한다.
</p>

<pre class="cmd">mvn compile</pre>

<p>
mvn compile은 컴파일을 실행한다.<br />
컴파일 결과물이 target/classes 폴더에 생성된다.<br />
target/classes 폴더는 컴파일이 수행되면서 만들어진다.<br />
<img alt="mvn compile" src="https://lh3.googleusercontent.com/1x82DkXPiOrW_fJSNV19zo47lTOeCNSv5Bmj_pCefvAg_k3HA5HVLii6CGLfB87LH3eFBMQOhkxX1DWDCCjRslJwGEEGWINPH5EeMIixo5TjgJbV9LmErzjcoo6wsSinwcwqy3W4dv7QiUra_3yYQQAUvykoLR0OTDAYsxKI4zwXBSUNDzdvi73koycw_tPTk7Dd_pRgCCiVskFLX_iuJCG2NntS4tPai_0teNqGN-4xEPIKIghN2ipRygTS8R5J8Z3zJZd_KU51jVhpDz0Tk8XIp1AHRl0urayqVEZY1TsIUB0T1VNyJL3XzKBN020qlfo2dtFjHMLzFukYOm9l3cWwniosgHkau84LKcCt9-EKLQ0vfDzAFuZnf_3zpqAJOlWKKHM5AHLnfsR0lYf1UR7n4VljjN25YcIBnG3nmtFN92aoCw4CQ8eMLyS29ZVD0a7V55GcaKm2FEbztngzay4T3YZEu7RqrW6W7HtDhgd3PBToUr2M3Fo6DzHqO-LHfEmtN_im4uBwrKf09c5Qb6Yc1t-H6bMIWHbNEOTJ0sKsGnT_da3YKjMqkkEgY2jAPjaydtN1t5E_jNgAgPygUoGe2JZJptsaqUdWPEp63kgaRdcNwh3l=w523-h121-no" style="display: block;" />
</p>

<pre class="cmd">mvn package</pre>

<p>
mvn package는, 자바 코드를 컴파일하고, 테스트를 수행하고, 컴파일 결과물을 패키지(jar 또는 war)로 묶어서 target 디렉터리에 저장한다.<br />
pom.xml 내용대로, gs-maven-initial-0.1.0.jar 파일이 target 디렉터리에 생성된다.<br />
<img alt="mvn package" src="https://lh3.googleusercontent.com/838OsscY8Fm6fv8YiK-KfDH7RewhJYJwSPj7EyqYnKHErDnEy2pSKfCCgBWQV_LSNXRrmZG4WnQb95ExDU9r6S5BIkh9DeCo4Ib_qKLyNoniWopdh6CvtMABtiSgNMH8zEZreHPAZ0lgx8-WfnEi_cd3gF-USpEroTJjcpn2sLAIIVA2SlBcAFRub7km5hkFa0njZy2iDopOGfqtspX9J7b-YkTYbrk0EQnFmMjxaytZEP1-dZlvchLV2K92_oYmwyRb_iUe1at7eATuiTXD6y_yBOnNHlz615-L9EIls-dQ1A192UpcmVZwgOGugjkQ1arzqVh5prwnykxrKBcKHhnVA-aTdnznvbVgv_VaNuByF_Xs1C9_KFODl0mL8iThxe-IoupCK8QWva_JRW3GHmBam-MQsS74P6TTZkHhGpRy45lwl_MluVXbwW1ukw72CgxsD6tn5Zy0gphWWpWBnWTi-CU0hQKM4DPZgV4Dl8BAVukEbXXLT8IVfLnasT-eslPH6BJMH1KrleqpuuX36BunEBe50Sz9J2zk-UZ10LfzbU6D3oZiwN_bxplg6IQF4tLNNne7n1yynS-nx4k-shDwtlbbm88UYEwhtD72ZzGMN1jYMpW8=w540-h175-no" style="display: block;" />
</p>

<pre class="cmd">mvn install</pre>

<p>
mvn install은 패키징된 jar 파일을 로컬 저장소에 저장한다.<br />
<img alt="mvn install" src="https://lh3.googleusercontent.com/0XDB0SuXO3F2L3VZDPgjI3oENZawp8pXcd1Ahngbqsm-NCKs7hdhPL5wWEa7hsrQ-CtqsI8PQMd615nwc8Ap6hdjoQCzD1RK4ajRW_T4i9aLR6SYsmFb91feV4zH7cZYyTJykoMmtQAORycTcDrCw-xJtEVYcg_v1sfnA6C-Bgs9eJ8pgEgmqKp3_TtMP_GZuGFGLArmoKaBBPI-qB5ZJke3KCLY6A_6MgiGaT4Ccl2-p4UXRpeXwhEj5WEvYobSRuoLEj9eDo0QnZ1k4uV1M3z2XsZYPDqPyjxurY-5KrgPzs1eidE-ajetkNl_ZQ0J6PEYx2MHm2m-5gq6kJrwSxzZ_VNm31pgGfFxwYRs9IC3Pme5Jw36bmcAJrJXMhlwM2vU0aeMBf3i_eH1CToxWolHDE91tQ7XmaX89BDv_mkvE0PWLmQkwOrh75iKG_0_xWr-XWlJIz_lu0hinZP4n0Vz452U2y8hNTzHu909wff2FQ2VZianRJ-YB4N1qkDZYvcvqbsg1QKewhQViv7SfO4kryeLjk1XSI5siC5xafrBlKEOXXgl1RFzM4JcF18oCvKpAvVan_9RNS75Fvw-7lTZNnkU8Qm40abfa_oIXH6pVmGzEsVK=w677-h149-no" style="display: block;" /> 
</p>

<pre class="cmd">mvn clean</pre>

<p>
mvn clean은 빌드를 통해 생성된 모든 산출물을 삭제한다.<br />
<img alt="mvn clean" src="https://lh3.googleusercontent.com/Uo3NNCIhcjg2RDAPY85kBCMnQ9LIbyziEOeYRD7XJK1wky0JKySTNXlh5KjJV8s6lYGJb5KrujLbk9gS-lywzpFtJ5NDrS2mM9K0InClY52UwFzoVuPrPB941X0GrBuar5tMX8iUoU-zjSVFwAt1XIDSeVvZ5GDcLNyimqKYrQFy-wEP2g7zPv3k_G-ttM1rslg_GrIuVaeVtX_vmFfe_TLEcGKxlbdKSs38gZxW4LFlFm1XuYkj1cjt0dkwcKOx02tRoFcHm2Jq1U7Qm3l7EnKITzrjVM6veBwB6iMpO9wcs1oe6SHDdur8318xxYP-USEh5XNADR1dhiCHtYFKz-zfkObm1zlmMctZpWeXKOClUcANHEKjiqEURg1JJZXVVm7qVkMCtRs5_jhFGtCku5gbKw5eAt9PWqzoRLWkHFfxdlaFNiuj1fCq3JxhvReOfx6Y40zzvKhNIE--_1iXIl87J43PGScI-bp4WpC8kcKOxiyNM2F0sINUz1Et1JgoEcfLvgeAF1dZNkkLuylIAjyz2oPitBU-LapA0gI8kL_yMe5dK9U1EfUQmpl-hqX5tMdq7E3a7bYJ_dpR32QFIhpIijXvoeBZIrWutzShYSrDkfGXw5tS=w542-h144-no" style="display: block;" />
</p>

<p>
compile, package, install, clean을 goal이란 하는데, goal을 중복해서 수행할 수 있다.
</p>

<pre class="cmd">mvn clean compile</pre>

<p>
다음은 HelloWorld 메이븐 프로그램을 실행하는 명령이다. 
</p>

<pre class="cmd">mvn exec:java -Dexec.mainClass=hello.HelloWorld</pre>

<h4>의존성 추가</h4>

<p>
대부분의 애플리케이션은 외부 라이브러리에 의존한다.<br />
예제도 외부 라이브러리를 사용하도록, HelloWorld.java를 수정한다.
</p>

<p>
src/main/java/hello/HelloWorld.java
</p>

<h6 class="src">HelloWorld.java</h6>
<pre class="prettyprint">package hello;

<strong>import org.joda.time.LocalTime;</strong>

public class HelloWorld {
  public static void main(String[] args) {
    <strong>LocalTime currentTime = new LocalTime();</strong>
    System.out.println("The current local time is: " + <strong>currentTime</strong>);

    Greeter greeter = new Greeter();
    System.out.println(greeter.sayHello());
  }
}
</pre>

<p>
mvn compile을 실행하면 실패한다.<br />
의존성을 추가하지 않았기 때문이다.<br />
pom.xml 파일을 열고 아래와 같이 의존성을 추가한다.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/maven-v4_0_0.xsd"&gt;

    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
    &lt;groupId&gt;org.springframework.gs&lt;/groupId&gt;
    &lt;artifactId&gt;gs-maven-initial&lt;/artifactId&gt;
    &lt;version&gt;0.1.0&lt;/version&gt;
    &lt;packaging&gt;jar&lt;/packaging&gt;
    
  <strong>&lt;dependencies&gt;</strong>
    &lt;!-- https://mvnrepository.com/artifact/joda-time/joda-time --&gt;
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;joda-time&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;joda-time&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;2.12.2&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  <strong>&lt;/dependencies&gt;</strong>
  
&lt;/project&gt;
</pre>

<p>
dependency의 하위 엘리먼트 scope은 대부분 생략한다.--생략하면 디폴트 값이 적용된다--<br />
scope 엘리먼트는 compile(디폴트), provided 또는 test 중 하나를 값으로 갖는다.
</p>

<ul>
  <li>provided: 컴파일할 때 필요하지만 런타임에는 컨테이너에 의해 제공되는 것.(예, Servlet API)</li>
  <li>test: 컴파일하고 테스트에는 필요하지만 빌드(컴파일과 배포)하거나 실행할 때는 필요 없는 것.</li>
</ul>

<p>
의존성을 추가한 후 mvn compile을 실행하면 성공한다.
</p>

<h3>mvn archetype:generate</h3>

<p>
mvn archetype:generate를 사용하면 대화형으로 다양한 메이븐 프로젝트를 생성할 수 있다.<br />
프로트타입에 따라 메이븐 디렉터리와 pom.xml 파일이 생성된다.<br /> 
원형이라는 사전적 의미를 가지는 아키타입<sup>archetype</sup>은, 자바에선 프로젝트 프로토타입을 뜻한다.<br />
선택한 워크스페이스 디렉터리에서 다음을 실행한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
mvn archetype:generate
</pre>

<p>
아래 화면에서 엔터를 눌러, 우리가 원하는 maven-archetype-quickstart 아키타입을 선택한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): 2005:
</pre>

<p>
아래 화면에서도 엔터를 눌러 아키타입 maven-archetype-quickstart의 최신 버전을 선택한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Choose org.apache.maven.archetypes:maven-archetype-quickstart version:
1: 1.0-alpha-1
2: 1.0-alpha-2
3: 1.0-alpha-3
4: 1.0-alpha-4
5: 1.0
6: 1.1
7: 1.3
8: 1.4
Choose a number: 8:
</pre>

<p>
다음 화면에선, groupId와 artifactId만 값을 지정한다.<br />
version과 package는 엔터를 눌러 디폴트 값을 선택한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Define value for property 'groupId': : <strong>org.springframework.gs</strong>
Define value for property 'artifactId': : <strong>quick-start</strong>
Define value for property 'version':  1.0-SNAPSHOT: :
Define value for property 'package':  org.springframework.gs: :
</pre>

<p>
다음 화면에서 엔터를 눌러 빌드를 시작한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Confirm properties configuration:
groupId: org.springframework.gs
artifactId: quick-start
version: 1.0-SNAPSHOT
package: org.springframework.gs
 Y: :
</pre>

<p>
artifactId 값대로 quick-start 디렉터리가 생성된다.<br />
quick-start 디렉터리에 pom.xml 파일과 메이븐 디렉터리 구조가 만들어 진다.
</p>

<p>
pom.xml 의존성에 spring-context를 추가한다.<br />
스프링 최신 릴리스 버전 참고: hhttps://spring.io/projects/spring-framework
</p>
 
<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;org.springframework.gs&lt;/groupId&gt;
  &lt;artifactId&gt;quick-start&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;name&gt;quick-start&lt;/name&gt;
  &lt;url&gt;http://www.example.com&lt;/url&gt;

  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;<strong>21</strong>&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;<strong>21</strong>&lt;/maven.compiler.target&gt;
    <strong>&lt;spring.version&gt;6.2.8&lt;/spring.version&gt;</strong>
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;junit&lt;/groupId&gt;
      &lt;artifactId&gt;junit&lt;/artifactId&gt;
      &lt;version&gt;4.11&lt;/version&gt;
      &lt;scope&gt;test&lt;/scope&gt;
    &lt;/dependency&gt;
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-context&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  &lt;/dependencies&gt;
  
  &lt;!-- omit -- &gt;
</pre>

<p>
프로젝트가 A 라이브러리에 의존하는데 A는 B 라이브러리에 의존한다면,
의존성에 A만 추가하더라도 A뿐 아니라 B도 저장소에 저장하는 것이 메이븐 의존성 관리 기능이다.
</p>

<p>
spring-context만 추가하더라도 spring-context가 의존하는 다른 라이브러리 역시 저장소에 저장된다.
</p>

<p>
MessageService.java, MessagePrinter.java, Application.java 파일을 /hello 폴더에 생성한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\..quick-start\src\main\java\hello&gt; notepad MessageService.java
</pre>

<h6 class="src">MessageService.java</h6>
<pre class="prettyprint">package hello;

public interface MessageService {
  String getMessage();
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\..quick-start\src\main\java\hello&gt; notepad MessagePrinter.java
</pre>


<h6 class="src">MessagePrinter.java</h6>
<pre class="prettyprint">package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MessagePrinter {

  @Autowired
  private MessageService service;

  public void printMessage() {
    System.out.println(this.service.getMessage());
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\..quick-start\src\main\java\hello&gt; notepad Application.java
</pre>

<h6 class="src">Application.java</h6>
<pre class="prettyprint">package hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;

@Configuration
@ComponentScan
public class Application {

  @Bean
  MessageService mockMessageService() {
    return new MessageService() {
      public String getMessage() {
        return "Hello World!";
      }
    };
  }

  public static void main(String[] args) {
    ApplicationContext context = 
      new AnnotationConfigApplicationContext(Application.class);
    MessagePrinter printer = context.getBean(MessagePrinter.class);
    printer.printMessage();
  }
}
</pre>

<p>
빌드
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn compile</pre>

<p>
실행
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn exec:java -Dexec.mainClass=hello.Application</pre>

<p>
코드상으로는 MessagePrinter는 MessageService는 서로 결합되어 있지 않지만, 스프링 프레임워크가 이들을 묶어준다.
</p>

<p>
테스트 실행 후, 메이븐의 로컬 저장소에 저장된 어떤 라이브러리가 저장되었는지 확인한다.<br />
--메이븐 로컬 저장소는 사용자 폴더 안의 .m2 폴더다--
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\kim\.m2\repository\org\springframework&gt;dir /w

[spring-aop]  [spring-beans]  [spring-context]  [spring-core]  

[spring-expression]

</pre>

<p>
spring-context가 의존하는 spring-aop, spring-beans, spring-core, spring-expression도 함께 설치된다.
</p>

<span id="refer">참고</span>
<ul id="references">
  <li><a href="http://spring.io/guides/gs/maven/">Building Java Projects with Maven</a></li>
</ul>
</article>