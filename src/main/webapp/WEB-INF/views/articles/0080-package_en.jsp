<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Package</h1>

<p>
Java provides a package to manage classes with similar features and similar nature. 
All Java APIs belong to a specific package (usually a package with names beginning with java).
</p>

<p>
Now let's look at creating a class that belongs to a specific package.
</p>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">
<strong>package javabank;</strong>

public class Account {
  private String accountNo;
  private double balance;
	
  public void deposit(double amount) {
    balance = balance + amount;
  }
	
  public void withdraw(double amount) {
    balance = balance - amount;
  }
	
  public long getBalance() {
    return balance;
  }
	
  public static void main(String[] args) {
    System.out.println("Package Test!");
  }
}
</pre>

<p>
<strong>package javabank;</strong><br />
This first code makes the Account class belong to the package named javabank.
</p>

<p>
When compiling the Java source that declares the package, you must specify -d followed by the directory where the compiler will generate the bytecode. If you omit the -d option, the bytecode will not belong to the package.
</p>

<p>
Create the Account.java source file in the C:\javaApp\bank\src\javabank directory.
</p>

<p>
<img src="<c:url value="/resources/images/javabank-src-bin.png"/>" alt="package example directory" style="width: 240px;display: block;"/>
</p>

<p>
The bin directory is where the compiler generates the bytecode, and the src is where you keep Java source files.
</p>

<p>
Create a subdirectory with the package name in src and place a source file there. Most developers manage source files this way.
</p>

<p class="note">
<b>Note:</b> Package names are usually in reverse order of domain names.<br />
The package name preferably includes two or more dots.
</p>

<p>
If you want, the Log class belongs to the package named net.java_school.commons, create subdirectories like below and place source files there.
</p>

<p>
<img src="<c:url value="/resources/images/app-log-java.png"/>" alt="Log.java" style="width: 291px;display: block;"/>
</p>

<p>
Let's get back to Account.java.<br />
Go to C:\javaApp\bank\src\javabank and compile as below.<br />
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp\bank\src\javabank&gt;javac -d C:/javaApp/bank/bin Account.java
</pre>

<p>
The path separator following the -d option can also use the / (slash), even on Windows systems. Of course, you can also use the path separator in the Windows system \ (backslash).
</p>

<p>
After compiling, go to the C:\java App\bank\bin and check whether the Account's bytecode exists.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp\bank\bin&gt;dir
2008-03-07  12:06  PM    &lt;DIR&gt;          javabank
</pre>

<p>
You will not see the Account's bytecode in the bin. Instead, you will see the javabank directory. You can find the Account's bytecode in this javabank subdirectory.
</p>

<p>
Suppose you specify the C:\javaApp\bank\bin directory with the -d option when compiling a java source file. In that case, the compiler will make subdirectories with the package name in the C:\javaApp\bank\bin directory and create Account.'s bytecode there.
</p>

<p>
<img alt="Account.class and Account.java" src="<c:url value="/resources/images/account-class-account-java.png"/>" style="width: 291px;display: block;"/>
</p>

<p>
JVM understands the javabank.Account bytecode is in the C:\javaApp\bank\bin directory.
</p>

<p>
If you make the Account.java that declares the package name javabank and compile it with the -d option, the fully qualified class name (FQCN) of the bytecode is javabank.Account.
</p>

<p>
If you write code that uses the Account bytecode in other Java sources, you should write javabank.Account, which is the FQCN of Account, in your code.
</p>

<p>
The same is true when you run the bytecode. To run the Account bytecode, you need to run it using the Account's FQCN in the C:\javaApp\javabank\bin directory because JVM understands javabank.Account bytecode is in the bin directory.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp\bank\bin&gt;java javabank.Account
Package Test!
</pre>

<p>
To run a bytecode in a directory that is not the bytecode, you need to tell JVM where the bytecode is. The way to tell JVM that the bytecode location is to use the Java interpreter's <strong>classpath</strong> or <strong>cp</strong> options.
</p>

<p>
When running the Java interpreter (java.exe), the class loader finds all bytecodes that make up the Java program and loads them into the memory. If it can not find even one bytecode, it prints an error message that the execution fails and can not find the bytecode.
</p>

<p>
If you do not specify the <strong>classpath</strong> or <strong>cp</strong> option, the class loader looks for your bytecodes only in the current directory.
</p>


<p>
The class loader already knows the path of Java APIs, such as the java.lang.String or the java.lang.System. So you don't need to specify the path of Java API bytecodes using the classpath or cp option.
</p>

<p>
Below is running javabank.Account in the C:\Program Files directory.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Program Files&gt;java -classpath C:/javaApp/bank/bin javabank.Account
Package Test!
</pre>

<p>
-classpath followed by the path where the bytecode is.<br />
In the above case, the classpath path is absolute.<br />
The classpath path can be either absolute or relative.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Program Files&gt;java -classpath ../javaApp/bank/bin javabank.Account
Package Test!
</pre>

<p>
One dot is the current directory.<br />
Two dots refer to the directory one level above.
</p>

<p>
The Java compiler (javac.exe) also has the classpath or cp options.
You can replace the classpath option of javac.exe or java.exe with the cp option. The Java compiler uses these options to check whether your source uses other bytecodes properly.
</p>

<p>
When compiling, let's walk through an example where you need to use the classpath option.
</p>

<p>
The following is a new class to create.
</p>

<h6 class="src">Log.java<a href="#comments"><sup>3</sup></a></h6>
<pre class="prettyprint">
package net.java_school.commons;

public class Log {
  public static void out(String msg) {
    System.out.println(new java.util.Date() + " : " + msg);
  }	
}
</pre>

<p class="note">
Log's out method is a static method. We cover the static keyword in the 'static' chapter.
</p>

<p>
Compile Log.java.<br />
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\javaApp\commons\src\net\java_school\commons&gt;javac -d ^
C:\javaApp\commons\bin Log.java
</pre>

<p>
<img alt="Log.class and Log.java" src="<c:url value="/resources/images/log-class-log-java.png"/>" style="width: 320px;display: block;" />
</p>

<p>
Next, modify the Account class to use the Log class.<br />
The FQCN of the Log class is net.java_school.commons.Log and should be written to the source as well.
</p>

<pre class="prettyprint">
public void deposit(double amount) {
  balance = balance + amount;
  <strong>net.java_school.commons.Log.out(amount + " dollars have been deposited.");</strong>
  <strong>net.java_school.commons.Log.out("Balance is $ " + this.getBalance());</strong>
}

public void withdraw(double amount) {
  balance = balance - amount;
  <strong>net.java_school.commons.Log.out(amount + " dollars have been withdrawn.");</strong>
  <strong>net.java_school.commons.Log.out("Balance is " + this.getBalance());</strong>
}

public static void main(String[] args) {
  <strong>Account myAccount = new Account();
  myAccount.deposit(10000);
  myAccount.withdraw(500);</strong>
}
</pre>

<p>
Recompile Account.java.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\javaApp\bank\src\javabank&gt;javac -d C:\javaApp\bank\bin ^
-classpath C:\javaApp\commons\bin Account.java
</pre>

<p>
Run the javabank.Account.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\javaApp\bank\bin&gt;java -classpath .;C:\javaApp\commons\bin ^
javabank.Account
</pre>

<p>
Our Java programs consist of two bytecode except for Java APIs. (<strong>javabank.Account</strong> and <strong>net.java_school.commons.Log</strong>)<br />
Because these two bytecodes aren't the same directory, you need to specify the location of the two bytecode with the classpath option both at compile and run times.
</p>

<p>
Notice that a comma (.) is added to the classpath at runtime, unlike compile time. The class loader looks for bytecodes only in the classpath. So, you need to add the current directory with the Account bytecode to the classpath.
</p>

<h3>How to add external Java libraries to your Java program</h3>

<p>
Most external Java classes are jar-compressed files.<br />
Let's create the log bytecode into a jar file using jar.exe.
</p>

<p>
Execute the following command in the directory where the Log bytecode is.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\javaApp\commons\bin&gt;jar cvf java-school-commons.jar .
</pre>

<p>
Move the java-school-commons.jar file to the C:\devLibs directory.
</p>

<p>
To add the bytecode in the jar file to the classpath, you need to add the full path of the jar file to the classpath. It is impossible to add only specific bytecodes in the jar file to the classpath.
</p>

<p>
Run the javabank.Account.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\javaApp\bank\bin&gt;java -classpath ^
.;C:\devLibs\java-school-commons.jar javabank.Account
</pre> 

<h2>Access Modifiers</h2>

<p>
The access modifiers decide whether it is accessible from the outside. The access modifiers provide a two-step access control.
</p>

<p>
Level 1 access control is when class declarations use access modifiers.
</p>

<h3>The public access modifier in the class declaration of the Account</h3>

<pre class="prettyprint">
package javabank;

<strong>public</strong> class Account {
  //...
} 
</pre>

<h3>The package-private access modifier in the class declaration of the Account</h3>

<pre class="prettyprint">
package javabank;

class Account {
  //...
} 
</pre>

<h4>public</h4>

<p>
Any class can refer to this class.
</p>

<h4>package private</h4>

<p>
It can be referenced in same package classes.
</p>

<p>
The following is a code example in which example.BankSystem class refers to javabank.Account class.
</p>

<pre class="prettyprint">
<strong>package example;</strong>

public class BankSystem {
  public void deposit(<strong>javabank.Account</strong> account, double amount) {
    account.deposit(amount);
  }
}
</pre>

<p>
Suppose you have created a Bank, Customer with the public access modifier in the javabank package. Any class can reference Bank, Customer, and Account. (+ Stands for public)
</p>

<p>
<img src="<c:url value="/resources/images/public-access-test.png"/>" alt="public access modifier figure "/>
</p>

<p>
As shown in the figure, the BankSystem in the example package can refer to all classes in the javabank package. So, you can declare variables type of javabank.Account in the example.BankSystem source code. You can use the import statement to reduce javabank.Account to Account in the class body.
</p>

<pre class="prettyprint">
<strong>package example;</strong>

<strong>import javabank.Account;</strong>

public class BankSystem {
  public void deposit(<strong>Account account</strong>, double amount) {
    account.deposit(amount);
  }
}
</pre>

<p>
Suppose you have changed the public to the package-private access modifier in Bank, Customer, and Account class declaration.
</p>

<p>
<img src="<c:url value="/resources/images/default-access-test.png"/>" alt="package private diagram" />
</p>

<p>
In this case, BankSystem cannot refer to Bank, Customer, or Account. So, you will get compile errors if you write the code to BankSystem refer to Bank, Customer, and Account.
</p>

<p>
Level 2 Access Control is when field and method declarations use access modifiers.
</p>

<p>
<b>Note:</b> A field is a data structure declared in a class body.<br />
It's easy to understand if you think everything is not a method in a class body.
</p>

<h4>public</h4>

<p>
The field or method is accessible from all packages.
</p>

<h4>protected</h4>

<p>
The field or method is only accessible from the same package.<br />
In addition, subclasses can access protected fields and methods of the superclass even if the subclass belongs to a different package from the superclass. So, the protected access modifier is more accessible than the package-private access modifier. For the protected access modifier, it's a good idea to review the description below after studying inheritance.<br />
In the figure below, # means protected.
</p>

<p>
<img src="<c:url value="/resources/images/protected-access-test.png"/>" alt="Protected access modifier figure"/>
</p>

<h4>package-private</h4>

<p>
The field or method is only accessible from the same package.
</p>

<h4>private</h4>

<p>
The field or method is not accessible from the outside.
<p>

<h3>Encapsulation: Make an object's data accessible only through public methods</h3>

<p>
Encapsulation allows you to see only the essential parts of the object when viewed from the outside.
</p>

<p>
When designing a class, We should keep the following as it is the basis of object-oriented programming.
</p>

<ol>
	<li>Declare variables as private if they store the object's properties.</li>
	<li>Declare public methods for private variables.</li>
</ol>

<p>
Below is encapsulated member class of a website.
</p>

<h6 class="src">User.java</h6>

<pre class="prettyprint">
package net.java_school.user;

public class User {
  private String username;
  private String password;
  private String fullName;
  private String email;
	
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getFullName() {
    return FullName;
  }
  public void setFullName(String fullName) {
    FullName = fullName;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
}
</pre>

<h2 id="Install-Eclipse">Eclipse</h2>

<p>
All subsequent chapter examples will use Eclipse.<br />
With Eclipse, you can manage your sources with the directory structure you have practiced before, and you do not have to worry about the classpath when compiling.
</p>

<p>
<a href="http://www.eclipse.org">http://www.eclipse.org</a><br />
Download the Eclipse install file and install <em>Eclipse IDE for Java EE Developers</em>.
</p>

<h3>Run</h3>

<p>
Eclipse asks you where to specify your workspace.
</p>

<p>
<img src="<c:url value="/resources/images/workspace-launcher.png"/>" alt="workspace launcher"/>
</p>

<p>
Workspaces contain and manage one or more projects.
</p>

<p>
Specify your workspace.<br />
Click the OK button.<br /> 
You can see the following welcome message.
</p>

<p>
<img src="<c:url value="/resources/images/welcome.png"/>" alt="welcome"/>
</p>

<p>
For reference, this article summarizes the welcome page tutorial.
</p>

<p>
Close the welcome page.<br />
The following workbench appears.
</p>

<p>
<img src="<c:url value="/resources/images/workbench.png"/>" alt="workbench"/>
</p>

<h3>Eclipse Terminology</h3>

<p>
<strong>Workbench</strong><br />
</p>

<p style="padding-left: 14px;">
It refers to the entire window seen in Eclipse.<br />
The window has four areas, which are called views.
</p>

<strong>Perspective</strong><br />
<p style="padding-left: 14px;">
Including all of the views is called a perspective.<br />
The above is a Java perspective screen.<br />
This perspective consists of the views needed to develop a Java program.<br />
Use the Open Perspective menu bar button in the top right corner to change the perspective.
</p>

<strong>Package Explorer View</strong><br />
<p style="padding-left: 14px;">
It shows the resources (packages, classes, external libraries) belonging to the Java project.
</p>

<strong>Hierarchy View</strong><br />
<p style="padding-left: 14px;">
It shows Java's inheritance structure.
</p>

<strong>Outline View</strong><br />
<p style="padding-left: 14px;">
It shows the structure of the source file in the editor.
</p>

<strong>Editor View</strong><br />
<p style="padding-left: 14px;">
It has the source code editor.
</p>

<strong>Problems View</strong><br />
<p style="padding-left: 14px;">
It shows compilation errors or warnings.
</p>

<strong>Javadoc View</strong><br />
<p style="padding-left: 14px;">
It shows the Java documentation for the selected part in the Package Explorer or Outline View.
</p>

<strong>Declaration View</strong><br />
<p style="padding-left: 14px;">
It shows briefly how the selected part of the editor is declared.
</p>	

<h3>Practice the Java example using Eclipse</h3>

<p>
Make sure it is a Java perspective.<br />
In Eclipse, the Java source must belong to the project.<br />
Select File - New - Java Project from the menu bar or click the leftmost button on the toolbar to create a Java project.
</p>

<p>
<img src="<c:url value="/resources/images/toolbar.png"/>" alt="toolbar" style="width: 73px;" />
</p>

<p>
Name the project HelloWorld.<br />
Other settings do not have to be specified.<br />
Eclipse manages sources in the src directory and bytecodes in the bin directory.<br />
Click Finish, and the HelloWorld project will be created and displayed in the Package Explorer.
</p>

<p>
<img src="<c:url value="/resources/images/project-wizard.png"/>" alt="project wizard" />
</p>

<p>
Click second on the toolbar menu below.
</p>

<p>
<img src="<c:url value="/resources/images/toolbar.png"/>" alt="toolbar" style="width: 73px;" />
</p>

<p>
Type net.java_school.example in the package name and click Finish.<br />
You will see the package in the Package Explorer view.
</p>

<p>
<img src="<c:url value="/resources/images/package-wizard.png"/>" alt="package wizard" />
</p>

<p>
Select the net.java_school.example package with the mouse and click the last button on the right of the toolbar menu below.
</p>

<p>
<img src="<c:url value="/resources/images/toolbar.png"/>" alt="toolbar" style="width: 73px;" />
</p>

<p>
Name a class, HelloWorld.<br />
Check the public static void main (String [] args) checkbox.
</p>

<p>
<img src="<c:url value="/resources/images/class-wizard.png"/>" alt="class wizard" />
</p>

<p>
Click on Finish and implement the main method in the editor, as shown below.
</p>

<h6 class="src">HelloWorld.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class HelloWorld {
  public static void main(String[] args) {
    <strong>System.out.println("Hello World !");</strong>
  }
}
</pre>

<p>
If you have saved the code, you do not have to compile it because Eclipse continues to compile your code in the background. Also, you can see compilation errors right at the Problem View while you write the code.
</p>

<p>
To run the bytecode, right-click the HelloWorld class in the Package Explorer, open the context menu, and select it as shown below.
</p>

<p>
<img src="<c:url value="/resources/images/java-app-run.png"/>" alt="run" />
</p>

<p>
The Console View prints Hello World!.
</p>

<p>
<img src="<c:url value="/resources/images/console-view.png"/>" alt="console view" />
</p>

<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/inheritance"/>">Inheritance</a></li>
    <li>Prev : <a href="<c:url value="/java/operators"/>">Operators</a></li>
  </ul>
</div>

</article>