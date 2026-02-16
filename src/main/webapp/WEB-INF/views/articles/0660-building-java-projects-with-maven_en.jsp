<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Building Java Projects with Maven</h1>

<p style="clear: both;font-style: italic;font-weight: bold;padding: 10px 30px;font-size: 14px;">
Original text: <a href="http://spring.io/guides/gs/maven/">http://spring.io/guides/gs/maven/</a>
</p>

<h2 id="Install-Maven">Maven Install</h2>

<ol>
  <li>Download the latest binary file from <a href="http://maven.apache.org/download.cgi">http://maven.apache.org/download.cgi</a>.</li>
  <li>Unzip and move the generated directory to the desired location.</li>
  <li>Add the Maven bin directory to the Path.</li>
  <li>Make sure you have the JAVA_HOME environment variable. Because Maven refers to the JAVA_HOME environment variable, you should create it if it does not exist. (See <a href="<c:url value="/"/>">JDK Install</a>)</li>
</ol>

<p>
Open a command prompt and check the installed maven version with the following command:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\kim&gt; mvn -v
Apache Maven 3.9.9
Maven home: C:\Program Files\apache-maven-3.9.9\bin\..
Java version: 21.0.1, vendor: Oracle Corporation
Java home: C:\Program Files\Java\jdk-21.0.1\jre
..
</pre>

<h2>Set up the project</h2>

<p>
Create the following structure in a project folder of your choosing.
</p>

<pre class="en">
HelloWorld (project root directory)
   └── src
        └── main
             └── java
                  └── hello
</pre>

<p>
The src\main\java is the directory where you put Java source files in Maven projects.<br />
The hello subdirectory is the package name of the Java class we will create.
</p>

<p>
Create a pom.xml at the root directory of the project
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
  &lt;artifactId&gt;gs-maven-initial&lt;/artifactId&gt;
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
  <li>&lt;modelVersion&gt; POM model version (always 4.0.0).</li>
  <li>&lt;groupId&gt; Group or organization that the project belongs. They are mostly inverted domain names.</li>
  <li>&lt;artifactId&gt; Name to be given to the project’s library artifact (for example, the name of its JAR or WAR file).</li>
  <li>&lt;version&gt; Version of the project you are building.</li>
  <li>&lt;packaging&gt; Defaults to jar for JAR file packaging. Use war for WAR file packaging.</li>
</ul>

<p>
Create HelloWorld.java and Greeter.java within the src/main/java/hello directory.
</p>

<h6 class="src">HelloWorld.java</h6>
<pre class="prettyprint">
package hello;

public class HelloWorld {
  public static void main(String[] args) {
    Greeter greeter = new Greeter();
    System.out.println(greeter.sayHello());
  }
}
</pre>

<h6 class="src">Greeter.java</h6>
<pre class="prettyprint">
package hello;

public class Greeter {
  public String sayHello() {
    return "Hello world!";
  }
}
</pre>

<h3>Build Java code</h3>

<p>
Run the following at the project root directory to build the maven project.
</p>

<pre class="cmd">mvn compile</pre>

<p>
This command makes Maven execute the compile goal.<br />
You can find the compiled class files in the target/classes directory.
</p>

<p>
<img alt="mvn compile" src="https://lh3.googleusercontent.com/I0cHa55BW_YfT3-tpyHPs2BAVoCfNol7rE9Y0MIaMuyboJRkZFLYqGcptyHpDyH_DKN-eaXX__FfFgHrcPZkrg9YODDFspA_n0vDo7LfI-N-dcYIqa6LpWF5ZGM4x35JcMzQlkoNQHVjt_dHSe9Yr5mA-OS4at2KLkZNCOP-WJVr18lgJfjfUeQ-sx02-qze5sKR7kkxiuYgnfUjoZijZpElq7DeR7CTQQtHfCwSv8maY3OPCsCbvp2FBsxr6DoMcKwiN9mQewkU2mcPaDdvKZUoei686EUxkOrw8o-REwY3DLSalDRe8FH4o_gq5QLtiVmmlVhMwxlltUOMbePLcQ3HhMNdA8pn12_XHguvgRXki08INIy5pOX1JkMpxZW2l2gquM14TpvdbYLUrLT_-Cqnt0UKYfF-UPA1h-vPMt7OgSey0iRPdEcaEJwKD5PPWeRFeYQtrrRWCpAjCTmypu5lSzYAFgGLX-Vl0Tlr23ytuOVwGIPjsJ0C_qSPkvHJ9rr_dDBVVZXMZsmpffUTRWm34TFMfuEuMfMWE5slUGo8UjR-PVnE7s8q1bhCenMb5fpzDwQe-ybdG3QFPzxWMEWgN38V4eBkeRunOeQ=w589-h122-no" />
</p>

<p>
The package goal will compile your Java code, test it, bundle it in a package (jar or war), and save itin the target directory.
</p>

<pre class="cmd">mvn package</pre>

<p>
This command makes Maven creates a file named gs-maven-inital-0.1.0.jar based on the artifactId and version values of the project.
</p>

<p>
<img alt="mvn package" src="https://lh3.googleusercontent.com/zmCB7h7_J2KLUKuiOktX73I2FCHZ2h5KGD9qJQzAHMHqKij6ahG7SunHBIJeQrnsxXDddqeJK6zNHDBDwjN0PlBAyThlIsp66BPS9bprauQFNYPSxd5_nVvTElShlim8NuXpSF-Uykx73KholpcD6Ij7r-AmwntgbsoCQHPJEkh8RXq3IcDHCwofDEh_HP-DoIFmTG3T7UILu_eAAsPfsSsw4kvTjCnEMW3BJk5aO2n-qleSQHYqIPZpUzBoaemkgP-7qwlqCfen-Zv6KmNnKu5Ifo6NLYh06ExIadQ5d8XBcFgVD11tQpmAgyseKVi0yOwN9w95zPDpXBhNpRXGIw7cH206qRlywGE47rI73Qbz9Sq9hb60iG5DxJber2E7Hngw6PcoVYWSAowF1mzXl7Oc_eX7kXUypcR7k5kNhOID_9kMio2KlySWIhjR73e69L-KteqXqt4BElZSipPCmNf0uyeGMGtn2R_bLRIaybWrIZSdAQK6sTmcvfD4-yCt0AcS1AGXHVqZfEQzy2PqX-ENAHovqHvuM2HV8PuvqU6NdMzfNpnqfcIN_FNqOGDMiGpeDrACNlfPT8jtT9hpSyeudU285feBRB0dcio=w583-h159-no" />
</p>

<p>
To execute the JAR file, run:<br />
<em>java -jar target/gs-maven-initial-0.1.0.jar</em>
</p>

<p>
Maven also maintains a repository of dependencies on your local machine (usually in a .m2/repository directory in your home directory) for quick access to project dependencies. If you’d like to install your project’s JAR file to that local repository, then you have to invoke the install goal:
</p>

<pre class="cmd">mvn install</pre>

<p>
The install goal will compile, test, and package your project's code and then copy it into the local dependency repository, ready for another project to reference it as a dependency.
</p>

<p>
<img alt="mvn install" src="https://lh3.googleusercontent.com/HQtqeMKwn3IgBxm5zSPgylzp9yIo97u0Ihl5hIgLpXNSSVICWCQUq1qdzMP52hP9ovKZuwF0QiR5xejkSxUQJ6gi9XkxoykmOiJthRuLlHWkmBhoSohYjog8MdXHj_QP7bPoNoLSANcxjhi_KZ1sP-p8dhcTDng15a9Ck-PpvdyRDl8KDmsQAhw9LbzmrV5RR9if2zzfTHDZlILoYv9Wr8nYy7j3ZO_SySbYDPY88IywwgumGFRwvWWi7X5Hf1R9KMKbRcxLZ7HEnaV3CGTXIsP6dGx3kJjOoRl5wZsx8SJOOP4-86qfnSV1GIIz6NBAEQ86Y-xUxcLO5uC-6CSrmyyRdhcs1zSqpdu6WO61tX7dTtxRjK7pdqZG_itR8A4OmoYzxVKacCuo5O8N5D_dyhzzqCYJ92h47W2ABPuqeNFcX1VeWPTiz6dk3Tdde1e26G813hotESwYUKWHd4TC2XbJky3RxEwqNW5lFU1p-JThKlnEuHjIOUCI0w9NoumHE7wPdDN1HbkJpjhEsH_ZRHvpPwyZC6LUtFjV0GX7uA_JaxC--q_sC9Fh5KdPVUp89bk2B5nHhflNkXh7_EmvHSNnddxjWLcRW_nHObU=w747-h141-no" /> 
</p>

<p>
The following goal will delete all artifacts generated by the build.
</p>

<pre class="cmd">mvn clean</pre>

<p>
<img alt="mvn clean" src="https://lh3.googleusercontent.com/km18kJG5aisUESbv_PAB6doN5yesdPPEG15KFbEhs4FleeS_kPI7srtmB6jGOqyG-HzHjVaBBtnzRMURMr8eRBpF0c96fJxy8mKyDyzX6o5Sv9pMpRnilMWTSS_8nQS5U4ChDaMgcRl6BykuA0rNXAsOa0-4xnAqWBduNE2yhyNDDs7ekhcl43bR2JSIVURxEflOp9N6E8opHOAbI6ixkfaqJd2br2x51qcKErPslInd5Ca2PA2ptkjzfDhtXX1D732WjW2ufjfICFRw9Cn99XiSow8QiGFlbUmOJlfA8gQBo__JCzg9WaCFscFp3VLGsMn8eUY7Qy5OP3KfLzTdaw3XwVWqBXdTDqp7NYH4M0DTgL-6bQDXlOL7IY0U_Yuk3p_lzbBEpz11vQNGNrXeF6j2jNUr_1-4ifQ68F88jaGBg-UM-iAzF--tko2N4bgvhKDv0dFZ0TrG429tH_6QsApzmsU1qKtVxOFq66Dj_OCeD51NeZI8rxB9_ow8PS98kA71CYnOamsAGrmjjZyh_hKUIjBLhAIFlboUxjg--JudVlvsMEna7pNbuuuUgRF-Kj_lHLF5ofYOvKwuyTeWytYPhy4TSaxVQnFGYCM=w584-h138-no" style="display: block;" />
</p>

<p>
You can invoke multiple goals as follows:
</p>

<pre class="cmd">mvn clean compile</pre>

<p>
To execute HelloWorld with Maven, run:
</p>

<pre class="cmd">mvn exec:java -Dexec.mainClass=hello.HelloWorld</pre>


<h3>Declare Dependencies</h3>

<p>
Most applications depend on external libraries.
</p>

<p>
Modify HelloWorld.java as follows.
</p>

<h6 class="src">HelloWorld.java</h6>
<pre class="prettyprint">package hello;

import org.joda.time.LocalTime;

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
Here, HelloWorld uses Joda Time’s LocalTime class to get and print the current time. If you were to run <em>mvn compile</em> to build the project now, the build would fail because you’ve not declared Joda Time as a compile dependency in the build. You can fix that like below.
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
  &lt;artifactId&gt;gs-maven-initial&lt;/artifactId&gt;
  &lt;version&gt;0.1.0&lt;/version&gt;
  &lt;packaging&gt;jar&lt;/packaging&gt;
  
  &lt;dependencies&gt;
  <strong>&lt;!-- https://mvnrepository.com/artifact/joda-time/joda-time --&gt;</strong>
    <strong>&lt;dependency&gt;</strong>
      <strong>&lt;groupId&gt;joda-time&lt;/groupId&gt;</strong>
      <strong>&lt;artifactId&gt;joda-time&lt;/artifactId&gt;</strong>
      <strong>&lt;version&gt;2.12.2&lt;/version&gt;</strong>
    <strong>&lt;/dependency&gt;</strong>
  &lt;/dependencies&gt;
  
&lt;/project&gt;
</pre>

<p>
Run <em>mvn compile</em> again, the build should succeed.
</p>

<p>
The scope is also a child of dependency.<br />
This element has a default value so that you can omit it.<br />
The value of scope is either compile, provided, or test.<br />
Among of them, the default is the compile.<br />
For the rest of the values, see below.
</p>

<ul>
  <li>provided: Required at compile time but provided by the container at runtime (e.g., Servlet API)</li>
  <li>test: Required for compilation and testing, but not needed for build or run.</li>
</ul>

<h3>mvn archetype:generate</h3>

<p>
The <em>mvn archetype:generate</em> allows you to create a maven project interactively. (Archetype has a lexical meaning of prototype, which in Java stands for project prototype) This command creates the maven directory structure and pom.xml file. You can build prototypes of various Java projects with it.
</p>

<p>
In the directory of your choice, run:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn archetype:generate
</pre>

<p>
In the screen below, Enter to select maven-archetype-quickstart.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): 2004:
</pre>

<p>
In the screen below, Enter to select the latest version.
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
Type groupId and artifactId values like below. (for version and package, Enter to accept the default)
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">Define value for property 'groupId': : <strong>org.springframework.gs</strong>
Define value for property 'artifactId': : <strong>quick-start</strong>
Define value for property 'version':  1.0-SNAPSHOT: :
Define value for property 'package':  org.springframework.gs: :
</pre>

<p>
On the screen below, press the Enter key.
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
Maven creates a quick-start directory whose name is the same as the artifactId value. And Maven also builds a maven directory structure and pom.xml file in the root directory. (Here, the root directory is C:\foo\quick-start) 
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
To check the latest spring framework release, See <a href="http://projects.spring.io/spring-framework/">http://projects.spring.io/spring-framework/</a>.
</p>

<p>
Spring means various frameworks based on the bean container that contains and manages Java classes.
</p>

<p>
We've added Spring-context dependencies to pom.xml. Here is a brief description of Maven's dependency management features: Suppose the project relies on the A library and A depends on B. Maven will store both A and B in the repository with only the A dependency configuration. Thus, even if you add only the spring-context, Maven would save other libraries dependent on spring-context in the repository.
</p>

<p>
Run Notepad to create the MessageService.java, MessagePrinter.java, and Application.java files in the hello folder at the command prompt, as shown below.
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
<pre class="cmd">C:\..quick-start\src\main\java\hello&gt;notepad Application.java
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
compile
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn compile
</pre>

<p>
run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">mvn exec:java -Dexec.mainClass=hello.Application
</pre>

<p>
We didn't combine MessagePrinter and MessageService in the code. But Spring Framework combines them.
</p>

<p>
Check stored libraries in Maven's local repository.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\Users\kim\.m2\repository\org\springframework&gt;dir /w

[spring-aop]  [spring-beans]  [spring-context]  [spring-core]  

[spring-expression]

</pre>

<p>
You can confirm that Maven also installed the spring-aop, spring-beans, spring-core, and spring-expression dependent on spring-context.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://spring.io/guides/gs/maven/">Building Java Projects with Maven</a></li>
</ul>

<h1>Spring DI</h1>

<h2>Set up the project</h2>

<p>
Execute the following command in your workspace.<br />
(↵ is an indication to press the enter key. Enter chooses the default value)
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
Access the Scott account with SQL * PLUS and Create the following table.
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
Create a trigger that inserts data into a transaction table when depositing or withdrawing. 
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
Copy <a href="https://github.com/kimjonghoon/JavaBank">https://github.com/kimjonghoon/JavaBank</a> sources and paste them to the following locations:
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
Edit pom.xml as shown below.
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
compile
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span>
</pre>

<h3>Migrating to Spring project</h3>

<p>
Modify the following:
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
public void setDao(BankDao dao);//added
</pre>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
//private BankDao dao = new MyBankDao();

//added
private BankDao dao;

public void setDao(BankDao dao) {
  this.dao = dao;
}
</pre>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//..omit..

import java.io.PrintStream;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//..omit..
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
Modify System.out.println() to stream.println(), System.out.println() to stream.println().
*/

//..omit..

public static void main(String[] args) {
  ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}

</pre>

<p>
Create src/main/resources folder. (This is also the Maven project directory) Copy logback.xml in <a href="../java/Logging">Logging</a> and paste it into resources folder. Create an applicationContext.xml in the resources folder.
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
compile
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn clean compile</span>
</pre>

<p>
run
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd"><span class="prompt-selection">mvn exec:java -Dexec.mainClass=net.java_school.bank.BankUi</span>
</pre>

<h2>Set up the project in Eclipse</h2>

<p>
Start Eclipse. (It does not matter where your workspace is) In the Project Explorer view, use the right mouse button to display the context menu. Import the JavaBank project into Eclipse as shown below.
</p>

<p>
<img alt="Open Import menu in context menu" src="https://lh3.googleusercontent.com/-VjWpQCEiqes/VYYV3b2GPFI/AAAAAAAACh0/-KoRbgI8nn0/s590/maven-project-import.png">
</p>

<p>
<img alt="Import the JavaBank project" src="https://lh3.googleusercontent.com/-uDuAOI41Aj4/VYYV3Pmo4qI/AAAAAAAAChw/m4HA61kOVbE/s610/eclipse-with-maven.png">
</p>

<p>
It would help if you synchronize Eclipse with pom.xml. With the project selected in the Package Explorer, open the context menu with the right mouse button. Select Maven, then Update Project Configuration.  Whenever pom.xml changes afterwards, you should synchronize Eclipse with it again.
</p>

<h2>JavaConfig</h2>

<p>
It is possible to make beans configuration with Java classes instead of XML files nowdays. You can write beans configuration classes using @Configuration and @Bean annotations. In beans configuration classes, the method name annotated with @Bean becomes a bean object.
</p>

<p>
Create a bean configuration class as follows:
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
Modify the main method of the BankUi class as shown below.
</p>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
//the following import statement is added
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

//..omit..

public static void main(String[] args) {
  //ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
  AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class);
  BankUi ui = ctx.getBean(BankUi.class);
  ui.startWork();
  ctx.close();
}
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/di">https://github.com/kimjonghoon/di</a>
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="../jdbc/JavaBank">Java Bank</a></li>
  <li><a href="../java/Logging">Logging</a></li>
</ul>

<h1>Spring AOP</h1>

<p>
AOP stands for Aspect-Oriented Programming, which is programming for cross-sectional concerns. Cross-sectional concerns refer to functions common to multiple modules. For example, logging is a function that both the member module and the bulletin board module have. The following AOP example will show us how to separate cross-sectional concerns.
</p>

<p>
Add the following to pom.xml.
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
  &lt;version&gt;1.9.19&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Create TestLogger.java like below.
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
Remove logging code from all Java sources like below.
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
  
  //..omit..
  
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
  
  //..omit..
  
}  
</pre>

<h3>XML configuration</h3>

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
Modify the main method of BankUi.java.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<h3>JavaConfig configuration</h3>

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
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java as follows.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>  
We confirmed that the limitations of Object-Oriented Programming could be supplemented by applying AOP to the cross-sectional concerns of the system in this section.
</p>

<p>
Final Source: <a href="https://github.com/kimjonghoon/aop">https://github.com/kimjonghoon/aop</a>
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html">http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html</a></li>
</ul>

<h1>Spring JDBC</h1>

<p>
This section explains how to replace the JDBC code used by Java Bank with Spring JDBC.
</p>

<p>
Add the following to pom.xml.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;org.springframework&lt;/groupId&gt;
  &lt;artifactId&gt;spring-jdbc&lt;/artifactId&gt;
  &lt;version&gt;${spring.version}&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Modify MyBankDao to inherit NamedParameterJdbcDaoSupport and remove constructors, getConnection(), and close(rs, pstmt, con) methods of MyBankDao.
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

  //Remove URL, USER, PASSWORD fields.
  //Remove constructors, getConnection(), close(rs,pstmt,con) methods.
  
  //..omit..

}
</pre>

<p>
Modify MyBankDao's methods by referring to [before] and [after] below.
</p>

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[Atter]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h6 class="src">[Before]</h6>
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

<h6 class="src">[After]</h6>
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

<h3>XML configuration</h3>

<p>
Modify applicationContext.xml like below.
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

<p>
Modify the main method of BankUi.java.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Let's try to transfer from account 101 to account 505 in a situation where account 101 exist, but account 505 does not exist. You will see that the balance of account 101 decreases by the amount of the transfer. The <a href="<c:url value="/spring/transaction"/>">Spring Transaction</a> section will cover this issue.
</p>

<h3>JavaConfig configuration</h3>

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
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java like below.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/jdbc">https://github.com/kimjonghoon/jdbc</a>
</p>

<h1>Spring Transaction</h1>

<p>
This section describes how to troubleshoot the transfer example in the <a th:href="@{/spring/jdbc}">Spring JDBC</a> section.
</p>

<p>
Modify applicationContext.xml like below.
</p>

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
  &lt;bean id="transactionManager" 
      class="org.springframework.jdbc.datasource.DataSourceTransactionManager"&gt;
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
Since we made deposit and withdrawal methods to return nothing, so we don't know whether the deposit or withdrawal was successful or not.
</p>

<p>
Modify deposit and withdrawal methods to return an integer value.
</p>

<h6 class="src">BankDao.java</h6>
<pre class="prettyprint">
public <strong>int</strong> deposit(String accountNo, double amount);

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
Set the transaction using annotations like below.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

<strong>import org.springframework.transaction.annotation.Transactional;</strong>

public class MyBank implements Bank {
  
  //..omit..
  
  @Override
  <strong>@Transactional</strong>
  public void transfer(String from, String to, double amount) {
  <strong>
    try {
      int check = dao.withdraw(from, amount);
      if (check &lt; 1) throw new RuntimeException("Withdrawal Failed!");
      check = dao.deposit(to, amount);
      if (check &lt; 1) throw new RuntimeException("Deposit Failed!");
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  </strong>
  }
  //..omit..
}
</pre>

<p>
Modify the main method of BankUi.java like below.
</p>

<pre class="prettyprint">
ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
//AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Try to transfer some money from account 101 to account 505 that do not exist. You can see that the transaction manager cancels the transfer, leaving the balance in account 101 intact.
</p>

<p>
Remove the @Transactional(propagation = Propagation.REQUIRED) above the transfer() method in the MyBank.java and try transfer again to see the difference. 
</p>

<h3>JavaConfig</h3>

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
First, comment out all contents of the beans element in applicationContext.xml and modify the main method of BankUi.java as shown below.
</p>

<pre class="prettyprint">
//ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); //XML
AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(BankConfig.class); //JavaConfig
</pre>

<p>
Final Source: <a href="https://github.com/kimjonghoon/transaction">https://github.com/kimjonghoon/transaction</a>
</p>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/spring/spring-mvc"/>">Spring MVC</a></li>
		<li>Prev : <a href="<c:url value="/jsp/migrate-to-model-2"/>">Migrate to Model 2</a></li>
	</ul>
</div>

</article>