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
  <li>Make sure you have the JAVA_HOME environment variable. Because Maven refers to the JAVA_HOME environment variable, you should create it if it does not exist. (See <a th:href="@{/java/JDK-Install}">JDK Install</a>)</li>
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
</article>