<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>스프링 DI</h1>

<h2>메이븐 아키타입 생성</h2>

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

<h2>테이블 생성 및 소스 코드 복사</h2>

<p>
<a href="../jdbc/JavaBank">자바은행</a> 예제 테이블을 그대로 사용한다.<br />
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
    <strong>&lt;!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.slf4j&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;slf4j-api&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;2.0.6&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;ch.qos.logback&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;logback-classic&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;1.4.5&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;org.springframework&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;spring-context&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;${spring.version}&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
    <strong>&lt;!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc6 --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;com.oracle.database.jdbc&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;ojdbc6&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;11.2.0.4&lt;/version&gt;</strong>
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
src/main/resources 폴더를 만들고, <a href="../java/Logging">로깅</a>의 logback.xml 파일을 복사해 resource 폴더에 붙여넣는다.<br /> 
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
        &lt;property name="stream" value="#{T(System).out}" /&gt;
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

<h2>이클립스 작업환경 구축</h2>

<p>
이클립스를 시작한다.(워크스페이스는 어디든 상관없다)<br />
Project Explorer 뷰에서 마우스 오른쪽 버튼을 사용하여 컨텍스트 메뉴를 보이게 한다.<br />
Import 메뉴를 사용해 자바은행 예제를 이클립스로 임포트한다.<br />
<img alt="컨텍스트 메뉴에서 Import" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png"><br />
<img alt="이클립스에서 메이븐 프로젝트 Import" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png"><br />
이클립스와 pom.xml을 동기화한다.<br />
Package Explorer에서 프로젝트를 선택한 상태에서 마우스 오른쪽 버튼으로 컨텍스트 메뉴를 연다.<br />
Maven, Update Project Configuration을 차례로 선택한다.<br />
<br />
이후 진행하면서 pom.xml이 바뀌면 같은 방법으로 이클립스와 동기화한다.
</p>

<h2>JavaConfig</h2>

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

<span id="refer">참고</span>
<ul id="references">
	<li><a href="../jdbc/JavaBank">자바은행</a></li>
	<li><a href="../java/Logging">로깅</a></li>
</ul>

</article>