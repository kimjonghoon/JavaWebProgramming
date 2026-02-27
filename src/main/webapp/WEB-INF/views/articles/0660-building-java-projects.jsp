<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>스프링으로 순수 자바 개발</h1>

<p style="clear: both;font-style: italic;font-weight: bold;padding: 10px 30px;font-size: 14px;">
아래 글은 <a href="http://spring.io/guides/gs/maven/">http://spring.io/guides/gs/maven/</a>를 번역한 것입니다.
</p>

<h3 id="Install-Maven">메이븐 설치</h3>

<ol>
  <li><a href="http://maven.apache.org/download.cgi">http://maven.apache.org/download.cgi</a>에서 최신 바이너리 파일을 다운로드한다.</li>
  <li>압축을 풀고 생성된 디렉터리를 원하는 곳에 옮긴다.(예, C:\Program Files\apache-maven-3.8.7)</li>
  <li>메이븐 bin 디렉터리를 Path에 추가한다.</li>
  <li>JAVA_HOME 환경 변수가 있는지 확인한다. 메이븐은 JAVA_HOME 환경 변수를 참조하기에 없다면 만들어야 한다. (<a href="<c:url value="/"/>">JDK 설치</a> 문서 참조)</li>
</ol>

<p>
명령 프롬프트에서 다음 명령으로 메이븐 버전을 확인한다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\kim&gt; mvn -v
Apache Maven 3.9.9
Maven home: C:\Program Files\apache-maven-3.9.9\bin\..
Java version: 21.0.1, vendor: Oracle Corporation
Java home: C:\Program Files\Java\jdk-25.0.2\jre
..
</pre>

<h3>메이븐 프로젝트 생성</h3>

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
    &lt;maven.compiler.source&gt;25&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;25&lt;/maven.compiler.target&gt;
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
<img alt="mvn compile" src="<c:url value="/resources/images/maven-compile.png"/>"/>
</p>

<pre class="cmd">mvn package</pre>

<p>
mvn package는, 자바 코드를 컴파일하고, 테스트를 수행하고, 컴파일 결과물을 패키지(jar 또는 war)로 묶어서 target 디렉터리에 저장한다.<br />
pom.xml 내용대로, gs-maven-initial-0.1.0.jar 파일이 target 디렉터리에 생성된다.<br />
<img alt="mvn package" src="<c:url value="/resources/images/maven-package.png"/>"/>
</p>

<pre class="cmd">mvn install</pre>

<p>
mvn install은 패키징된 jar 파일을 로컬 저장소에 저장한다.<br />
<img alt="mvn install" src="<c:url value="/resources/images/maven-install.png"/>"/> 
</p>

<pre class="cmd">mvn clean</pre>

<p>
mvn clean은 빌드를 통해 생성된 모든 산출물을 삭제한다.<br />
<img alt="mvn clean" src="<c:url value="/resources/images/maven-clean.png"/>"/>
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
      <strong>&lt;version&gt;${jodaTimeVer }&lt;/version&gt;</strong>
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
    &lt;maven.compiler.source&gt;<strong>25</strong>&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;<strong>25</strong>&lt;/maven.compiler.target&gt;
    <strong>&lt;spring.version&gt;${springVer }&lt;/spring.version&gt;</strong>
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


<h2>스프링 DI</h2>

<h3>메이븐 아키타입 생성</h3>

<p>
화면에서 ↵는 다른 입력없이 엔터키만 누르라는 표시다.
엔터키만 누르면 디폴트 값이 선택된다.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
<span class="prompt-selection">mvn archetype:generate</span>

Choose a number or apply filter 
    (format: [groupId:]artifactId, case sensitive contains): 2005: ↵

Choose org.apache.maven.archetypes:maven-archetype-quickstart version: 
1: 1.0-alpha-1
2: 1.0-alpha-2
3: 1.0-alpha-3
4: 1.0-alpha-4
5: 1.0
6: 1.1
7: 1.3
8: 1.4
Choose a number: 8: ↵
Define value for property 'groupId': : <span class="prompt-selection">net.java_school</span>
Define value for property 'artifactId': : <span class="prompt-selection">bank</span>
Define value for property 'version':  1.0-SNAPSHOT: : ↵
Define value for property 'package':  net.java_school: : ↵
Confirm properties configuration:
groupId: net.java_school
artifactId: bank
version: 1.0-SNAPSHOT
package: net.java_school
 Y: : ↵
</pre>

<p>
Choose a number or apply filter 에서 엔터키만 누르면 maven-archetype-quickstart 아키타입이 선택된다.<br />
Choose org.apache.maven.archetypes:maven-archetype-quickstart version: 에서도 엔터키만 눌러 가장 최신 버전을 선택한다.<br />
화면에서 번호나 버전이 다를 수 있지만 상관없다.
</p>

<h3>테이블 생성 및 소스 코드 복사</h3>

<p>
<a href="../jdbc/javabank">자바은행</a> 예제 테이블을 그대로 사용한다.<br />
만약 테이블이 없다면 scott 계정으로 접속한 다음 테이블을 생성한다.
</p>

<pre class="prettyprint">
create table bankaccount (
  accountno varchar2(50),
  owner varchar2(20) not null,
  balance number,
  kind varchar2(10),
  constraint PK_BANKACCOUNT primary key(accountno),
  constraint CK_BANKACCOUNT_NORMAL 
    CHECK (balance &gt;= CASE WHEN kind='NORMAL' THEN 0 END),
  constraint CK_BANKACCOUNT_KIND CHECK (kind in ('NORMAL', 'MINUS'))
);  
create table transaction (
  transactiondate timestamp,
  kind varchar2(10),
  amount number,
  balance number,
  accountno varchar2(50),
  constraint FK_TRANSACTION FOREIGN KEY(accountno)
    REFERENCES bankaccount(accountno)
);
</pre>

<p>
입금이나 출금시 거래 테이블에 데이터를 인서트하는 트리거를 생성한다. 
</p>

<pre class="prettyprint">
create or replace trigger bank_trigger
after insert or update of balance on bankaccount
for each row
begin
  if :new.balance &gt; :old.balance then
    insert into transaction 
    values 
    (
      systimestamp,
      'DEPOSIT',
      :new.balance - :old.balance,
      :new.balance,
      :old.accountno
    );
  end if;
  if :new.balance &lt; :old.balance then
    insert into transaction 
    values 
    (
      systimestamp,
      'WITHDRAW',
      :old.balance - :new.balance,
      :new.balance,
      :old.accountno
    );
  end if;
end;
/
</pre>

<p>
<a href="https://github.com/kimjonghoon/JavaBank">https://github.com/kimjonghoon/JavaBank</a> 자바 소스를 복사하여 프로젝트 루트 디렉터리 아래에 붙여넣는다.
</p>

<pre lang="en">src
└── main
    └── java
        └── net
            └── java_school
                └── bank
                    ├── Account.java
                    ├── Bank.java
                    ├── BankDao.java
                    ├── BankUi.java
                    ├── MyBank.java
                    ├── MyBankDao.java
                    └── Transaction.java
</pre>

<p>
pom.xml 편집
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                        http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;net.java_school&lt;/groupId&gt;
  &lt;artifactId&gt;bank&lt;/artifactId&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;name&gt;bank&lt;/name&gt;
  &lt;url&gt;http://maven.apache.org&lt;/url&gt;

  &lt;properties&gt;
    &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
    &lt;maven.compiler.source&gt;<strong>25</strong>&lt;/maven.compiler.source&gt;
    &lt;maven.compiler.target&gt;<strong>25</strong>&lt;/maven.compiler.target&gt;
    <strong>&lt;spring.version&gt;${springVer }&lt;/spring.version&gt;</strong>
  &lt;/properties&gt;

  &lt;dependencies&gt;
    &lt;dependency&gt;
      &lt;groupId&gt;junit&lt;/groupId&gt;
      &lt;artifactId&gt;junit&lt;/artifactId&gt;
      &lt;version&gt;4.11&lt;/version&gt;
      &lt;scope&gt;test&lt;/scope&gt;
    &lt;/dependency&gt;
    <strong>&lt;!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.slf4j&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;slf4j-api&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${slf4jVer }&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;ch.qos.logback&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;logback-classic&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${logbackVer }&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-context&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc11 --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;ojdbc11&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${ojdbc11Ver }&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  <strong>&lt;/dependencies&gt;</strong>

  &lt;build&gt;
    &lt;finalName&gt;bank&lt;/finalName&gt;
    &lt;pluginManagement&gt;
      &lt;plugins&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-clean-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.1.0&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-resources-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.0.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.8.0&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.22.1&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-war-plugin&lt;/artifactId&gt;
          &lt;version&gt;3.2.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-install-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.5.2&lt;/version&gt;
        &lt;/plugin&gt;
        &lt;plugin&gt;
          &lt;artifactId&gt;maven-deploy-plugin&lt;/artifactId&gt;
          &lt;version&gt;2.8.2&lt;/version&gt;
        &lt;/plugin&gt;
      &lt;/plugins&gt;
    &lt;/pluginManagement&gt;
  &lt;/build&gt;
&lt;/project&gt;
</pre>

<p>
빌드
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
실행
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span></pre>

<h3>자바은행 예제를 스프링 예제로 변경</h3>

<p>
자바 소스에서 다음 부분을 수정한다.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
public void setDao(BankDao dao);//추가
</pre>

<h6 class="src">ShinahanBank.java</h6>
<pre class="prettyprint">
//private BankDao dao = new MyBankDao();

private BankDao dao;//추가

public void setDao(BankDao dao) {
  this.dao = dao;
}
</pre>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//..중간 생략..

import java.io.PrintStream;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//..중간 생략..

//private Bank bank = new MyBank();
private Bank bank;

public void setBank(Bank bank) {
  this.bank = bank;
}

private PrintStream stream;

public void setStream(PrintStream stream) {
  this.stream = stream;
}

/* 
코드에서 System.out.println()을 stream.println(),
System.out.println()을 stream.println()으로 수정한다.
*/

//..중간 생략..

public static void main(String[] args) {
  ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}

</pre>

<p>
src/main/resources 폴더를 만들고, <a href="../java/logging">로깅</a>의 logback.xml 파일을 복사해 resource 폴더에 붙여넣는다.<br /> 
다음 applicationContext.xml 파일도 resource 폴더에 생성한다.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd"&gt;

    &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
        &lt;property name="stream" value="\#{T(System).out}" /&gt;
        &lt;property name="bank" ref="myBank" /&gt;
    &lt;/bean&gt;
    
    &lt;bean id="myBank" class="net.java_school.bank.MyBank"&gt;
        &lt;property name="dao" ref="myBankDao" /&gt;
    &lt;/bean&gt;

    &lt;bean id="myBankDao" class="net.java_school.bank.MyBankDao"&gt;
    &lt;/bean&gt;
&lt;/beans&gt;
</pre>

<pre lang="en">src
└── main
    └── resources
        ├── logback.xml
        └── applicationContext.xml
</pre>

<p>
컴파일
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
실행
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span>
</pre>

<h3>이클립스 작업환경 구축</h3>

<p>
이클립스를 시작한다.(워크스페이스는 어디든 상관없다)<br />
Project Explorer 뷰에서 마우스 오른쪽 버튼을 사용하여 컨텍스트 메뉴를 보이게 한다.<br />
Import 메뉴를 사용해 자바은행 예제를 이클립스로 임포트한다.<br />
<img alt="컨텍스트 메뉴에서 Import" src="<c:url value="/resources/images/maven-project-import.png"/>">
<img alt="이클립스에서 메이븐 프로젝트 Import" src="<c:url value="/resources/images/eclipse-with-maven.png"/>">
이클립스와 pom.xml을 동기화한다.<br />
Package Explorer에서 프로젝트를 선택한 상태에서 마우스 오른쪽 버튼으로 컨텍스트 메뉴를 연다.<br />
Maven, Update Project Configuration을 차례로 선택한다.<br />
<br />
이후 진행하면서 pom.xml이 바뀌면 같은 방법으로 이클립스와 동기화한다.
</p>

<h3>Java Config</h3>

<p>
스프링이 발전하면서 빈 설정을 XML 파일이 아닌 자바 클래스로도 할 수 있게 되었다.<br />
빈 설정 클래스는 @Configuration과 @Bean 어노테이션을 사용해 작성한다.<br />
빈 설정 클래스에서 @Bean 어노테이션이 붙은 메소드 이름이 빈 객체가 된다.
</p>

<p>
applicationContext.xml 파일과 같은 내용의 빈 설정 클래스를 작성한다.
</p>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BankConfig {
	
  @Bean
  public BankDao myBankDao() {
    return new MyBankDao();
  }
	
  @Bean
  public Bank myBank() {
    Bank bank = new MyBank();
    bank.setDao(myBankDao());
    return bank;
  }
	
  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(myBank());
    ui.setStream(System.out);
    return ui;
  }
}
</pre>

<p>
BankUi 클래스의 메인 메소드를 다음과 같이 수정한다.
</p>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//import문 추가
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

//..중간 생략..

public static void main(String[] args) {
  //ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class);
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}
</pre>

<p>
최종 소스: <a href="https://github.com/kimjonghoon/di">https://github.com/kimjonghoon/di</a>
</p>


<h2>스프링 AOP</h2>

<p>
자바 은행에서 로깅을 스프링 AOP로 구현해 보자.
아래 의존성을 pom.xml에 추가한다. 
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-aspects&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.aspectj&lt;/groupId&gt;
  &lt;artifactId&gt;aspectjweaver&lt;/artifactId&gt;
  &lt;version&gt;${aspectjweaverVer }&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
TestLogger.java를 아래와 같이 작성한다.
</p>

<h6 class="src">TestLogger.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class TestLogger {
  Logger logger = LoggerFactory.getLogger(this.getClass());
  
  @AfterReturning("execution(* net.java_school.bank.BankDao.deposit(..))")
  public void depositLog(JoinPoint point) {
    Object[] a = point.getArgs();
    String accountNo = (String) a[0];
    Long amount = (Long) a[1];
    String methodName = point.getSignature().getName();
    logger.debug("{}|{}|{}", methodName, accountNo, amount);
  }
  
  @AfterReturning("execution(* withdraw(..)) &amp;&amp; args(accountNo, amount)")
  public void withdrawLog(String accountNo, double amount) {
    logger.debug("WITHDRAW|{}|{}", accountNo, amount);
  }
  
}
</pre>

<p>
자바 소스에서 로그 관련 코드를 제거한다.
</p>

<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyBankDao implements BankDao {
  static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  static final String USER = "scott";
  static final String PASSWORD = "tiger";
  
  //중간 생략..
  
  @Override
  public void deposit(String accountNo, double amount) {
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String sql = "UPDATE bankaccount " +
        "SET balance = balance + ? " +
        "WHERE accountNo = ?";
    
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, amount);
      pstmt.setString(2, accountNo);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(null, pstmt, con);
    }
    
  }

  @Override
  public void withdraw(String accountNo, double amount) {
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String sql = "UPDATE bankaccount " +
        "SET balance = balance - ? " +
        "WHERE accountNo = ?";
    
    try {
      con = getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setLong(1, amount);
      pstmt.setString(2, accountNo);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(null, pstmt, con);
    }
    
  }
  
  //중간 생략..
  
}  
</pre>

<h3>XML 설정</h3>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  <strong>xmlns:aop="http://www.springframework.org/schema/aop"</strong> 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans 
    http://www.springframework.org/schema/beans/spring-beans.xsd
    <strong>http://www.springframework.org/schema/aop 
    http://www.springframework.org/schema/aop/spring-aop.xsd</strong>"&gt;
  <strong>
  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;
    </strong>
  
  &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
    &lt;property name="stream" value="\#{T(System).out}" /&gt;
    &lt;property name="bank" ref="myBank" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBank" class="net.java_school.bank.MyBank"&gt;
    &lt;property name="dao" ref="myBankDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBankDao" class="net.java_school.bank.MyBankDao"&gt;
  &lt;/bean&gt;
    
&lt;/beans&gt;
</pre>

<p>
테스트하기 전에 BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>


<h3>JavaConfig 설정</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

<strong>import net.java_school.commons.TestLogger;</strong>

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
<strong>import org.springframework.context.annotation.EnableAspectJAutoProxy;</strong>

@Configuration
<strong>@EnableAspectJAutoProxy</strong>
public class BankConfig {
  
  <strong>@Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }</strong>

  @Bean
  public BankDao myBankDao() {
    return new MyBankDao();
  }

  @Bean
  public Bank myBank() {
    Bank bank = new MyBank();
    bank.setDao(myBankDao());
    return bank;
  }

  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(myBank());
    ui.setStream(System.out);
    return ui;
  }
  
}  
</pre>

<p>
테스트하기 전에,
applicationContext.xml 설정을 모두 주석 처리한다.
BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>


<h3>최종 소스</h3>

<p>
<a href="https://github.com/kimjonghoon/aop">https://github.com/kimjonghoon/aop</a>
</p>


<h2>스프링 JDBC</h2>

<p>
자바 은행에서 사용한 JDBC 코드를 스프링 JDBC로 바꾸어 보자.
다음 의존성을 추가한다.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
MyBankDao 클래스가 NamedParameterJdbcDaoSupport 클래스를 상속하도록 선언한다.
생성자와 getConnection(), close(rs,pstmt,con) 메소드는 제거한다.
</p>

<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

public class MyBankDao <strong>extends NamedParameterJdbcDaoSupport</strong> implements BankDao {

  //필드 URL, USER, PASSWORD 삭제
  //생성자와 getConnection(), close(rs,pstmt,con) 메소드 삭제
  
  //..중간 생략..

}
</pre>

<h6 class="src">기존 insertAccount() 메소드</h6>
<pre class="code">
@Override
public void insertAccount(String accountNo, String name, String kind) {
  
  Connection con = null;
  PreparedStatement pstmt = null;
  
  String sql = "INSERT INTO bankaccount VALUES (?, ?, 0, ?)";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    pstmt.setString(2, name);
    pstmt.setString(3, kind);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(null, pstmt, con);
  }
  
}
</pre>

<h6 class="src">수정 후 insertAccount() 메소드</h6>
<pre class="prettyprint">
private static final String INSERT_ACCOUNT = 
    "INSERT INTO " +
    "bankaccount (accountno, owner, balance, kind) " +
    "VALUES (:accountNo, :name, 0, :kind)";
   
@Override
public void insertAccount(String accountNo, String name, String kind) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);
  params.put("name", name);
  params.put("kind", kind);
  
  getNamedParameterJdbcTemplate().update(INSERT_ACCOUNT, params);    
}
</pre>

<h6 class="src">기존 selectOneAccount() 메소드</h6>
<pre class="code">
@Override
public Account selectOneAccount(String accountNo) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "WHERE accountNo = ?";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      
      return account;
      
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }
  return null;
}
</pre>

<h6 class="src">수정 후 selectOneAccount() 메소드</h6>
<pre class="prettyprint">
private static final String SELECT_ONE_ACCOUNT = 
    "SELECT accountno,owner,balance,kind " +
    "FROM bankaccount " +
    "WHERE accountno = :accountNo";

@Override
public Account selectOneAccount(String accountNo) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);
  
  return getNamedParameterJdbcTemplate().queryForObject(
    SELECT_ONE_ACCOUNT,
    params,
    new RowMapper&lt;Account&gt;() {
      public Account mapRow(ResultSet rs,int rowNum) throws SQLException {
        Account account = new Account();
        account.setAccountNo(rs.getString("accountNo"));
        account.setName(rs.getString("owner"));
        account.setBalance(rs.getDouble("balance"));
        account.setKind(rs.getString("kind"));
        
        return account;
      }
    }
  );
}
</pre>

<h6 class="src">기존 selectAccountsByName() 메소드</h6>
<pre class="code">
@Override
public List&lt;Account&gt; selectAccountsByName(String name) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Account&gt; matched = new ArrayList&lt;Account&gt;();
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "WHERE owner = ? " +
      "ORDER By accountNo DESC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, name);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      matched.add(account);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return matched;
}
</pre>

<h6 class="src">수정 후 selectAccountsByName() 메소드</h6>
<pre class="prettyprint">
private static final String SELECT_ACCOUNTS_BY_NAME = 
    "SELECT accountno,owner,balance,kind " +
    "FROM bankaccount " +
    "WHERE owner = :name";

@Override
public List&lt;Account&gt; selectAccountsByName(String name) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("name", name);
  RowMapper&lt;Account&gt; rowMapper = new AccountRowMapper();
  
  return getNamedParameterJdbcTemplate().query(SELECT_ACCOUNTS_BY_NAME,params,rowMapper);
}

protected class AccountRowMapper implements RowMapper&lt;Account&gt; {

  public Account mapRow(ResultSet rs,int rowNum) throws SQLException {

    String accountNo = rs.getString("accountNo");
    String name = rs.getString("owner");
    double balance = rs.getDouble("balance");
    String kind = rs.getString("kind");
    
    Account account = new Account();
    account.setAccountNo(accountNo);
    account.setName(name);
    account.setBalance(balance);
    account.setKind(kind);
    
    return account;
  }
}
</pre>

<h6 class="src">기존 selectAllAccounts() 메소드</h6>
<pre class="code">
@Override
public List&lt;Account&gt; selectAllAccounts() {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Account&gt; all = new ArrayList&lt;Account&gt;();
  Account account = null;
  
  String sql = "SELECT accountNo,owner,balance,kind " +
      "FROM bankaccount " +
      "ORDER By accountNo DESC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      account = new Account();
      account.setAccountNo(rs.getString("accountNo"));
      account.setName(rs.getString("owner"));
      account.setBalance(rs.getDouble("balance"));
      account.setKind(rs.getString("kind"));
      all.add(account);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return all;

}
</pre>

<h6 class="src">수정 후 selectAllAccounts() 메소드</h6>
<pre class="prettyprint">
private static final String SELECT_ALL_ACCOUNTS = 
    "SELECT accountNo,owner,balance,kind " +
    "FROM bankaccount " +
    "ORDER BY accountNo DESC";

@Override
public List&lt;Account&gt; selectAllAccounts() {
  RowMapper&lt;Account&gt; rowMapper = new AccountRowMapper();
  return getJdbcTemplate().query(SELECT_ALL_ACCOUNTS,rowMapper);
}
</pre>

<h6 class="src">기존 deposit() 메소드</h6>
<pre class="code">
@Override
public void deposit(String accountNo, double amount) {
  Connection con = null;
  PreparedStatement pstmt = null;
  
  String sql = "UPDATE bankaccount " +
      "SET balance = balance + ? " +
      "WHERE accountNo = ?";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setLong(1, amount);
    pstmt.setString(2, accountNo);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(null, pstmt, con);
  }
  
}
</pre>

<h6 class="src">수정 후 deposit() 메소드</h6>
<pre class="prettyprint">
private static final String DEPOSIT = 
    "UPDATE bankaccount " +
    "SET balance = balance + :amount " +
    "WHERE accountno = :accountNo";

@Override
public void deposit(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  getNamedParameterJdbcTemplate().update(DEPOSIT, params);
}
</pre>

<h6 class="src">기존 withdraw() 메소드</h6>
<pre class="code">
@Override
public void withdraw(String accountNo, double amount) {
  Connection con = null;
  PreparedStatement pstmt = null;
  
  String sql = "UPDATE bankaccount " +
      "SET balance = balance - ? " +
      "WHERE accountNo = ?";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setLong(1, amount);
    pstmt.setString(2, accountNo);
    pstmt.executeUpdate();
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(null, pstmt, con);
  }
}
</pre>

<h6 class="src">수정 후 withdraw() 메소드</h6>
<pre class="prettyprint">
private static final String WITHDRAW = 
    "UPDATE bankaccount " +
    "SET balance = balance - :amount " +
    "WHERE accountno = :accountNo";

@Override
public void withdraw(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  getNamedParameterJdbcTemplate().update(WITHDRAW, params);    
}
</pre>

<h6 class="src">기존 selectAllTransactions() 메소드</h6>
<pre class="code">
@Override
public List&lt;Transaction&gt; selectAllTransactions(String accountNo) {
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  List&lt;Transaction&gt; all = new ArrayList&lt;Transaction&gt;();
  Transaction transaction = null;
  
  String sql = "SELECT transactionDate,kind,amount,balance " +
      "FROM transaction " +
      "WHERE accountNo = ? " +
      "ORDER By transactionDate ASC";
  
  try {
    con = getConnection();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, accountNo);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
      transaction = new Transaction();
      String date = Account.DATE_FORMAT.format(rs.getTimestamp("transactionDate"));
      String time = Account.TIME_FORMAT.format(rs.getTimestamp("transactionDate"));
      transaction.setTransactionDate(date);
      transaction.setTransactionTime(time);
      transaction.setKind(rs.getString("kind"));
      transaction.setAmount(rs.getDouble("amount"));
      transaction.setBalance(rs.getDouble("balance"));
      all.add(transaction);
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    close(rs, pstmt, con);
  }

  return all;

}
</pre>

<h6 class="src">수정 후 selectAllTransactions() 메소드</h6>
<pre class="prettyprint">
private static final String SELECT_ALL_TRANSACTIONS = 
    "SELECT transactionDate,kind,amount,balance " +
    "FROM transaction " +
    "WHERE accountno = :accountNo " +
    "ORDER By transactionDate ASC";

@Override
public List&lt;Transaction&gt; selectAllTransactions(String accountNo) {
  RowMapper&lt;Transaction&gt; rowMapper = new TransactionRowMapper();
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("accountNo", accountNo);

  return getNamedParameterJdbcTemplate().query(SELECT_ALL_TRANSACTIONS,params,rowMapper);
}

protected class TransactionRowMapper implements RowMapper&lt;Transaction&gt; {

  public Transaction mapRow(ResultSet rs,int rowNum) throws SQLException {

    String date = Account.DATE_FORMAT.format(rs.getTimestamp("transactionDate"));
    String time = Account.TIME_FORMAT.format(rs.getTimestamp("transactionDate"));
    String kind = rs.getString("kind");
    double amount = rs.getDouble("amount");
    double balance = rs.getDouble("balance");

    Transaction transaction = new Transaction();
    transaction.setTransactionDate(date);
    transaction.setTransactionTime(time);
    transaction.setKind(kind);
    transaction.setAmount(amount);
    transaction.setBalance(balance);
    
    return transaction;
  }
}
</pre>

<h3>XML 설정</h3>

<p>
applicationContext.xml에 강조된 부분을 추가한다.
</p>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:aop="http://www.springframework.org/schema/aop" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop 
        http://www.springframework.org/schema/aop/spring-aop.xsd"&gt;

  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;

  &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
    &lt;property name="stream" value="\#{T(System).out}" /&gt;
    &lt;property name="bank" ref="myBank" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBank" class="net.java_school.bank.MyBank"&gt;
    &lt;property name="dao" ref="myBankDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="myBankDao" class="net.java_school.bank.MyBankDao"&gt;
    <strong>&lt;property name="dataSource" ref="dataSource" /&gt;</strong>
  &lt;/bean&gt;
  <strong>
  &lt;bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE" /&gt;
    &lt;property name="username" value="scott" /&gt;
    &lt;property name="password" value="tiger" /&gt;
  &lt;/bean&gt;
  </strong>
&lt;/beans&gt;
</pre>

<h3>테스트</h3>

<p>
테스트하기 전에 BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
101계좌는 존재하나 505계좌는 존재하는 않는다고 가정한다.
101계좌에서 505계좌로 이체 테스트를 한다.
이체 후 101계좌는 이체 금액만큼 잔액이 줄어든다.
(이 문제는 트랜잭션에서 다룬다)
</p>

<h3>Java Config</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import javax.sql.DataSource;

import net.java_school.commons.TestLogger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@EnableAspectJAutoProxy
public class BankConfig {

  @Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }
  <strong>
  @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:XE");
        dataSource.setUsername("scott");
        dataSource.setPassword("tiger");
        return dataSource;
    }
  </strong>
    @Bean
    public BankDao myBankDao() {
        MyBankDao bankDao = new MyBankDao();
        <strong>bankDao.setDataSource(dataSource());</strong>
        return bankDao;
    }

  @Bean
  public Bank myBank() {
    Bank bank = new MyBank();
    bank.setDao(myBankDao());
    return bank;
  }

  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(myBank());
    ui.setStream(System.out);
    return ui;
  }
  
}
</pre>

<p>
테스트하기 전에,
applicationContext.xml 설정을 모두 주석 처리한다.
BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<h3>최종 소스</h3>

<p>
<a href="https://github.com/kimjonghoon/jdbc">https://github.com/kimjonghoon/jdbc</a>
</p>

<h2>스프링 트랜잭션</h2>

<h6 class="src">applicationContext.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:aop="http://www.springframework.org/schema/aop" 
  <strong>xmlns:tx="http://www.springframework.org/schema/tx"</strong>
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/aop 
        http://www.springframework.org/schema/aop/spring-aop.xsd
        <strong>http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx.xsd</strong>"&gt;
  <strong>
  &lt;bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
  &lt;/bean&gt;

  &lt;tx:annotation-driven transaction-manager="transactionManager" /&gt;
  </strong>
  &lt;aop:aspectj-autoproxy /&gt;

  &lt;bean id="testLogger" class="net.java_school.commons.TestLogger" /&gt;

  &lt;bean id="bankUi" class="net.java_school.bank.BankUi"&gt;
    &lt;property name="stream" value="\#{T(System).out}" /&gt;
    &lt;property name="bank" ref="bank" /&gt;
  &lt;/bean&gt;

  &lt;bean id="bank" class="net.java_school.bank.MyBank"&gt;
    &lt;property name="dao" ref="bankDao" /&gt;
  &lt;/bean&gt;

  &lt;bean id="bankDao" class="net.java_school.bank.MyBankDao"&gt;
    &lt;property name="dataSource" ref="dataSource" /&gt;
  &lt;/bean&gt;

  &lt;bean id="dataSource"
    class="org.springframework.jdbc.datasource.DriverManagerDataSource"&gt;
    &lt;property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /&gt;
    &lt;property name="url" value="jdbc:oracle:thin:@127.0.0.1:1521:XE" /&gt;
    &lt;property name="username" value="scott" /&gt;
    &lt;property name="password" value="tiger" /&gt;
  &lt;/bean&gt;

&lt;/beans&gt;
</pre>

<p>
지금까지 입금과 출금 메소드는 void를 반환하도록 설계했기에 입금이나 출금이 성공 또는 실패했는지를 알 수 없었다.
입금과 출금시 dao가 정수값을 리턴하도록 자바 클래스를 수정한다.
</p>

<h6 class="src">BankDao.java</h6>
<pre class="prettyprint">
//입금
public <strong>int</strong> deposit(String accountNo, double amount);

//출금
public <strong>int</strong> withdraw(String accountNo, double amount);
</pre>


<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
@Override
public <strong>int</strong> deposit(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  <strong>return</strong> getNamedParameterJdbcTemplate().update(DEPOSIT, params);
}

@Override
public <strong>int</strong> withdraw(String accountNo, double amount) {
  Map&lt;String, Object&gt; params = new HashMap&lt;String, Object&gt;();
  params.put("amount", amount);
  params.put("accountNo", accountNo);
  
  <strong>return</strong> getNamedParameterJdbcTemplate().update(WITHDRAW, params);    
}
</pre>

<p>
다음과 같이 어노테이션을 사용해 트랜잭션을 설정한다.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

<strong>import org.springframework.transaction.annotation.Transactional;</strong>

public class MyBank implements Bank {
  
  //..중간 생략..
  
  @Override
  <strong>@Transactional</strong>
  public void transfer(String from, String to, double amount) {
    <strong>
    try {
      int check = dao.withdraw(from, amount);
      if (check &lt; 1) throw new RuntimeException("출금 실패");
      check = dao.deposit(to, amount);
      if (check &lt; 1) throw new RuntimeException("입금 실패");
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    </strong>
  }

  //..중간 생략..
}
</pre>

<p>
테스트하기 전에 BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
컴파일하고 실행한 후,
101 계좌에서 505 계좌(존재하는 않는 계좌)로 이체를 시도한다.
테스트에 성공했다면(즉, 이체가 취소되었다면), MyBank 클래스에서 transfer() 메소드 위에 있는 @Transactional을 제거하고 다시 이체를 시도한다.
</p>

<h3>JavaConfig 설정</h3>

<h6 class="src">BankConfig.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import javax.sql.DataSource;

import net.java_school.commons.TestLogger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
<strong>import org.springframework.jdbc.datasource.DataSourceTransactionManager;</strong>
import org.springframework.jdbc.datasource.DriverManagerDataSource;
<strong>import org.springframework.transaction.PlatformTransactionManager;</strong>
<strong>import org.springframework.transaction.annotation.EnableTransactionManagement;</strong>

@Configuration
@EnableAspectJAutoProxy
<strong>@EnableTransactionManagement</strong>
public class BankConfig {

  @Bean
  public TestLogger testLogger() {
    return new TestLogger();
  }

  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource dataSource = new DriverManagerDataSource();
    dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    dataSource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:XE");
    dataSource.setUsername("scott");
    dataSource.setPassword("tiger");
    return dataSource;
  }
  <strong>
  @Bean
  public PlatformTransactionManager transactionManager() {
    return new DataSourceTransactionManager(dataSource());
  }
  </strong>
  @Bean
  public BankDao bankDao() {
    MyBankDao bankDao = new MyBankDao();
    bankDao.setDataSource(dataSource());
    return bankDao;
  }

  @Bean
  public Bank bank() {
    Bank bank = new MyBank();
    bank.setDao(bankDao());
    return bank;
  }

  @Bean
  public BankUi bankUi() {
    BankUi ui = new BankUi();
    ui.setBank(bank());
    ui.setStream(System.out);
    return ui;
  }
}
</pre>

<p>
테스트하기 전에, applicationContext.xml 설정을 모두 주석 처리한다.
BankUi.java의 메인 메소드를 아래를 참조해 수정한다.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
최종 소스: <a href="https://github.com/kimjonghoon/transaction">https://github.com/kimjonghoon/transaction</a>
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="<c:url value="/jdbc/javabank"/>">자바은행</a></li>
	<li><a href="<c:url value="/java/logging"/>">로깅</a></li>
	<li><a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html">http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/spring/spring-mvc"/>">스프링 MVC</a></li>
		<li>이전 : <a href="<c:url value="/jsp/migrate-to-model-2"/>">모델 2로 변경</a></li>
	</ul>
</div>

</article>