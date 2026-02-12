<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Packages and Access Modifiers</title>
<meta name="Keywords" content="Packages,Package Naming Rule,-d,FQCN,-classpath,jar,cvf,Access Modifiers,public,package private,protected,private,member,Encapsulation,Eclipse,workspace" />
<meta name="Description" content="This article describes Packages and Access Modifiers" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>Packages and Access Modifiers</h1>

<h2>Packages</h2>

<p>
Java provides a package to manage classes with similar features and similar nature. All Java APIs belong to a specific package (usually a package with names beginning with java).
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
<img src="https://lh3.googleusercontent.com/4_-RQhRJVbX-mfA27Smf9-SVmX-CLh74XRwPg8IAVLHXXZCt1vTt044Hz_s9r8Vw6CHLrJIFc9qcGJRhGE-8fqm6g5LiNAljfaWbmmL_bPUy2Axd7vs2z-Iv_r-mLINKqsfLHNhMDFAglKtS2cW22kSuyCsskuFElwiT8dTVa-WKOFSyN-7plO-GnHPa05iq2z0VKT2LaHIdMTQEkK2hyjN4LRy6ovwQxUU5AQMscqKNOZOLdBdPMDcnBGtKLPHMOROC6TMyvPs_MZnATk_vMcOnv8WA75ZDfV6o_dHiuEiCPr3DctXOvm44sSLugpAmdwwf3L0mCAwtJssFlTop5utU6vrzRGk9-8TNT4WqQgVSLHJGcYotfnwLMR7YmYJqHX_fBxk9TgEHTFfmNpt4DBad_oOYFY8DBpQhHuDIjWm_3xMgSnrZJF4JtVtDeS0cBDGVtPJnKIzZwjFBlvrf8z0oHYTPR0r7IZ4pYWUufM93eYMlWXVKSv9az-P65jUsmAAVMhRXMovLHa78pv1qVX1Ot8YlevPAJWVWRR15Jm8AV8CfVr3-jGiIlr9fliQp0ypjnvP3xyHadi_xnj19cULMfBeSx_ibecqIZfui44RgBTow7xagSMkp=w191-h129-no" alt="package example directory" style="width: 191px;display: block;" />
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
<img src="https://lh3.googleusercontent.com/7IxYec5B9PFcSJVO1G8eUifIy909zozlxz08Ce4H9xpqYsDV2jVF479yxzGipLpcZXuRuAfrOpYET4cTT5tF4ap-bmf99tt8PjwuUl_EI6QwaBqb3zCL2b6n2Cn_S_ZuA6hiIFk_8-rUtCB0LuzcR4RuhL44MvMMK0zzUnWgvx9y_wioOK12oYM9zyH_TFBjY86oO_8fPkV9Mefpj5fylAkHGQgRfPpYpeIs6B7SRJomJ5w2UAsuw2zLZ66nnEe7PyYvrndOl9-qKpuqR5EAz0UuDV_SXrzm3pIiEnTbUvclFwvi_wivpyuNJS6Csi03LTSsxShi2mYWTxSgXjOaQMXaW3andFo-VJaBMSAWwesI0gQ3_cnwf-ba7kAnQ_Ymj5PqC77RctAkyyakg-3FSEyw5zwZbURKHvFQSci0lH2qKQowfYmXW5sesn4RYis-KzTMv7HA91gP9gE7VIQDgtb41c1wWXgtZBcdijdJuexmXTeZ1ljDtNC-59NXpziXgfpuqeG5lNNwu16zg3xa3POQC38Qge7G1Bn_x2LdYMS-_MW0ds05ymhEzBhDfXc8UB3XK_p6fJLsMJLwfoOp-nJPSab00049_tDB3ZErJg=w184-h125-no" alt="javaApp-Log.java" style="width: 184px;display: block;" />
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
<img alt="Account.class and Account.java" src="https://lh3.googleusercontent.com/NpXsGCGj5ogeggXJVFF5zZNKI7Rkv2P4E_W5FVeJxQQJZF5T4R5MyBfARrsy_zLVA0oj8uGvzA_lRF8yJNR0Dfa51qnx80v6aS_ULWEy7BXYfXPcygH2S_Y9ISwBqU1rGpoUZYdtpK2XFO4DOA5kw-vJ6nyCUDaAEiD-D1kJS-bcix4gZYjQnguCfo-4gXb_gN62pUeLAr_nnAWmd1e3g5LsGFR3VsaIoqT2hjkeWtFAhGhkMHTtp6CYJCxFcBEUakSGs8qmp6ytDHx_80suxB05Iiwp66Z_EYwI5rQeF-uDkr1R1tIMI9WR2QZKJgQ0zq_wYyqpYp3ne5cOioX5z6hDHOdu4ETpAJ6yV4ft_DXRHVbEG3YfHVHBHOTD9kQ17GoWWEUvtMYYJjW0qto_ipQh7cZLkVr-Y8cZXCOpkGm5wINT7AS9aB2TASNo5Dv0vFVAPQzigBM9PoJFeqZXoy9EbAtbIAPswfXk-euQfqANIH0b06_PQDqOjjf9PrfQRYp7ecxWXF3lLHAlhRj6eaFWKc91G-rbWJjr_SoLUrWdS5awwg0otIaL0gAlJlbRxK6ltAjqkFU3PsqYNauzLWmyoQx6hI4PRCkPXsUqQA=w206-h151-no" style="width: 206px;display: block;" />
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
<img alt="Log.class and Log.java" src="https://lh3.googleusercontent.com/oEjNKV3440WaNbNmZWjW4cWu23RJXLQREn3srfSuLw-BqVEiXuEGdujYuo0cEZ6eNpKElsnOKrGQeSViazfgCCmCB-ZRBB4X7FDAieiDnq1lfAmYGXjS1bMYb0MGJl5qXRSajBWqN9V79sdv-UpEJigd9xEfRoqO1lDetWRXTNpBeXdqWddY1QiJESGurHsSNZbrfxtzYG5wT2JUIhOtzoj5l8sgeag0qCCQiyxM3Nq9SBy3HteOu7BNuTksCS2WWy5ZksXe0X6h2TVNypkX9dNdHxFiGDdKpl24eKAf6_cSokauzHX_uJCKjx9yNIYV1418PI8U6cn0EXdRPACeLYvyK9r9e0vEoyKIBz39Ba_IZRYAr_n_JN9h4OPUGf61WBz5OLxDaFK_g7M5yVefEfVQkPCZqW18AsanYFSdTyuPLkCPihlZNhGTbaEp44WlspkDJlrZdEAdn3Mzc4H6vAU-OaCeXgAXtfzkUq_riVzXJKU-lkEKM2P7JmgeCkjgHpbhBIT1p3aM4tgO_eJ6vKZG0_IXIOoR5149mnUUpssywElYZo_iG4zhweQI9NeqNc1TpE9dHi1jwMfQpeA5jijFIJce4KhD9z7D1EZ7zw=w223-h226-no" style="width: 223px;display: block;" />
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
<img src="https://lh3.googleusercontent.com/TcK55UcRN3Yw7Hr8dBshFezFW3hMC_lUQ3wcmIqbFHjReVuTDnwDDUnH7mtMT5LprUKupH4o-0fZmiy2B4w1eARwa5HqWWvKOg0WZt0AYc4-Jn2usu6pF8n0GERUsBWMGMvgIjygJt8MNJFuI9TaAJYdc-SVa1GftAcofXbvhhR5nkyN6NZhHulQelFamknan658fGd-R8Dj_46t6MnD3DwmSl7olhv_fkwrYUNkHMLfru65JpESL1R468UWb3mZ0V_0dtNftcGCfkSk8Ixtql17tCiaOwaxcniW4hQynPHbZ6w6WYPpZkLgpGh-YK3MBO0RWtQs7z4ISx85Tf83RQF8XOKpWxz2-48dqEqZ-6F4m6EwLtY3ocXlhHmGzvIa5GOmu58x2pTpVGRUh6AAzRf2YKWOA0rqsSQGjL4xafSksgRMUVFwmL5vyFW2snRe8fx8_ROH4eFxuIfCwmdxtDC2XtijPhREHAymN3hm5D03qdzbDgRTyDzusrxS4Mf_qnX7fixVM-lviHTyZhbI_dFygAKp1ohsXgpZrxsJwUGalSTdGIEwuegyzp64dBcVoawb3gx4Osi1rW9G4WzpZYNRBzdnZwcrO4uZRXIE6B0e9LQ7apHN-duL=w1615-h869-no" alt="public access modifier figure " style="width: 590px;display: block;" />
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
<img src="https://lh3.googleusercontent.com/oJLK2Q9DcK_eTLOSGMXUnYUHYKbomwYicpeVfoqmtNkaf2UmGD5ThO1wrJxdLXofryHdpus0da9tQixu6aEeUyQ14cuU9TclwhkCCRqyYrHmAwSol3ptPZLf5oyHJEYCZDFl5ZEtOpM0i5ctZGXlDCVO8SQglr89udzzaJaqTF_Lj4CrKODgLVceqjx2jo3jNTBQL8Q-6DCjdpZ5qLpqCWPYY3OxOaN_LsJlhflVGg15BU1Z8eQPsu3yhs1IAdRtVgb51oK4YioCDe7Uoc6-Qp0ABwAdzQP0XK3E8WDLHhG7VyueiL_cu0hWM2tFGteQHS3TtXzpC0Ro9bD1g8m_-k7j_3O4E01jRQ_5Wu0p3KMjut5h3ipHQvSYaAeIXswEy75ZmuaH5tm9o78zRHmjPyqGktlsPcIQgrK9tk-CvLOqEVdzJ0faKFw6PITE89jV6P0ErhPClaRFsdkwlDy1gC0sPchdEi7PZWzC64J-RcSFAoL6KhdPOwN8VZQg_p4LgdWgUneHYV5CTzjzEsmO6SuBjb5qPATsK079hQSBngrxqBj-y1Nc61X65hHjb4h9lNjN3d72-oIrBP6r9pbD-Av1A2lNVTyvAIKwzIJIsZXO2gn5ZEAZMFdt=w1615-h886-no" alt="package private diagram" style="width: 590px;display: block;" /><br />
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
<img src="https://lh3.googleusercontent.com/5vvQLh3ZOtQRYdIKPKlVx3yxAbEZp2zaQRttuz92uxNh5QyAmRMxb03KruDpvBPN2_CxojEtYpOzrTQf4WPv9gPfdf1QT5uAl56Fl94LJwUEfxYliMlaFl8X1u22biynmo3qCkk5zqR--ugX7lL1zgZKHyEfQGn6CJ9DFE6cbAf5e8EAzryXlQydlwb9jVmAC8zitbg0JcKc6eUt0feIZO_bxM5H4ZRm2iLTlFdT00L6q-15pSBEvXHAjl9xVcPAfWBAP65aJUedrce__y6KFOJ1zuP6GhQUDEMXycTxpP3aR0idH9YGpD-g23pA_jiQsulvKEe3mixzGIdgaYU9AeEpjwo0dmoHnQDiDUwgrYn_ArA5KU_LNhPoVrb0K_BymbLvEnt11kc_Y_Uj7x-DDP212HBZz4ua3hMgSzp3jTxQ8NuJ348zXuMPCv5H581EvIkTc1ChQ81yoDMzp6U6TLTkpAv9D-4lp2I9VSktzVfIhDaHxoxdo6UAmtCEkIS1hSBTBT4t6pyH6QaXt6oj1zlicFurbAmlDFeRc4S0ElnNDf1HqB_z2SFUprhKNJhk1KLNPe1s41Fwaa2t6-0YSywJ_uloN1rOVr76xPqmm-4LIe6j1hlkZ-Yq=w1203-h729-no" alt="Protected access modifier figure" style="width: 590px;display: block;" />
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

<h2>Eclipse</h2>

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
<img src="https://lh6.googleusercontent.com/-KuW40dO62II/TjJ6CM4LOrI/AAAAAAAAAX0/yXp6FWCapbM/workspace_launcher.gif" alt="workspace launcher" style="display: block;" />
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
<img src="https://lh5.googleusercontent.com/-Ewvv_Kxiuis/TjJ6B5bj7FI/AAAAAAAAAXs/fulrpOzQ58I/welcome.gif" alt="welcome" style="display: block;" />
</p>

<p>
For reference, this article summarizes the welcome page tutorial.
</p>

<p>
Close the welcome page.<br />
The following workbench appears.
</p>

<p>
<img src="https://lh5.googleusercontent.com/-lHZAcz_vsOU/TjJ6Byjr2BI/AAAAAAAAAXw/6Gk1YbZ1ytk/workbench.gif" alt="workbench" style="display: block;" />
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
<img src="https://lh5.googleusercontent.com/-5W4KIyzc7G8/TjJ6Bg9McGI/AAAAAAAAAXo/p2kJo0YJEv4/toolbar.gif" alt="toolbar" style="width: 73px;" />
</p>

<p>
Name the project HelloWorld.<br />
Other settings do not have to be specified.<br />
Eclipse manages sources in the src directory and bytecodes in the bin directory.<br />
Click Finish, and the HelloWorld project will be created and displayed in the Package Explorer.
</p>

<p>
<img src="https://lh4.googleusercontent.com/-8Tx99HODIdg/TjJ6A_ribLI/AAAAAAAAAXc/5xSvGBauvwc/s576/project_wizard.gif" alt="project wizard" />
</p>

<p>
Click second on the toolbar menu below.
</p>

<p>
<img src="https://lh5.googleusercontent.com/-5W4KIyzc7G8/TjJ6Bg9McGI/AAAAAAAAAXo/p2kJo0YJEv4/toolbar.gif" alt="toolbar" style="width: 73px;" />
</p>

<p>
Type net.java_school.example in the package name and click Finish.<br />
You will see the package in the Package Explorer view.
</p>

<p>
<img src="https://lh4.googleusercontent.com/-B5K99iKod5g/TjJ6AgcfJsI/AAAAAAAAAXY/yJU3KnGQQIU/package_wizard.gif" alt="package wizard" />
</p>

<p>
Select the net.java_school.example package with the mouse and click the last button on the right of the toolbar menu below.
</p>

<p>
<img src="https://lh5.googleusercontent.com/-5W4KIyzc7G8/TjJ6Bg9McGI/AAAAAAAAAXo/p2kJo0YJEv4/toolbar.gif" alt="toolbar" style="width: 73px;" />
</p>

<p>
Name a class, HelloWorld.<br />
Check the public static void main (String [] args) checkbox.
</p>

<p>
<img src="https://lh5.googleusercontent.com/-zy_swhmGj48/TjJ6AklwKJI/AAAAAAAAAXQ/-GWHhhwRugA/class_wizard.gif" alt="class wizard" />
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
<img src="https://lh4.googleusercontent.com/-GQgOXNx6En4/TjJ6BuiXmTI/AAAAAAAAAXk/k3fGHc_rrYs/run.gif" alt="run" />
</p>

<p>
The Console View prints Hello World!.
</p>

<p>
<img src="https://lh5.googleusercontent.com/-xC4-RE1ObLk/TjJ6Atp4agI/AAAAAAAAAXU/9fcwiLYVlH4/console_view.gif" alt="console view" />
</p>

</article>

</body>
</html>
