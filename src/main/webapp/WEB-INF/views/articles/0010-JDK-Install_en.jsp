<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<article>
<h1>Java Install</h1>
<h2 class="floatstop">Downloading the JDK installer</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads/">https://www.oracle.com/java/technologies/downloads/</a>
</p>

<p>
<img src="https://lh3.googleusercontent.com/NPFI5WCRekGIjG8sYrKP4rIDrsSwCw0ETc9LyjYFJzv_00BrXZ7pYKe-f4kqK9mORF9Si2XBYx81NSPsl19DvazAM87Uqw4OpF2gj9egANGS0MeCZKdZVTeWuJz2gdNlDor3Xvfj3y0L77JU_arerf4jq26o1p1GwtJMLt87-P4_x80bVg6zW2AG90fgDeB7bQZpK_LehwJ0NNGfcUqOX-53UK1ZWIsUlvvZyVFY8CPZ988n4FW4IrExv1H8WfSU7vvI13iVFcGJCpps40d-Cm7ypmPwQe6KM5cSt40ZyRR7iwq9kRtBcPwzTskZkRot3aaue_WLYAAH7YulF4CTpaJjdD5OPK2d28UdlRVhMkPYHbwq7o-FHNxMM9bRzzURC0zMd3YbYY79AtAz9T5u5jclcaZnZ8DTn1T0E8Bb0mhS4_RO1bRl5aygLmjFN7S5zjtCJDHKBF7YmwPVLHJTeKIvZzK_keHg9vAmn_BALWlVtrfmLelMjaR0xDkK9uGs7AwUKaKx-PjnE7n_plyyjFGcpPr2nlOE51cEGgxKccAUlaKRlpO_4RmDTvN6YD_8dhY0gkek5NUuoKLhGJ30K-90OIhhxSMilYnQHof4WxBf-8cGiF4j8cLVsxHiOcjnfuLJQLyuH_Uua2p4Pf4n59zzlQnQ4niiiNzsbCPeKifqNaohXCsmnSgBDyBquNq-p8OyJrWn93LitJrn9Opip7SF=w1194-h889-no?authuser=0" alt="java latest version" />
</p>

<p>
Installation can be completed simply by clicking the "Next" button.<br />
The JDK is installed in "C:\Program Files\Java\jdk-<em>&lt;version&gt;</em>".
</p>

<h3>Environment Variable</h3>

<p>
Click Start, then Control Panel, then System.
</p>

<p>
<img src="https://lh3.googleusercontent.com/-98m_YiFDhwU/V2SxgUU4K7I/AAAAAAAAC64/7KQ8b3Cpdbcuv7OWi746lg9RRkzvxJamACCo/s488/start-My_Computer-Properties.png" alt="System Properties" />
</p>

<p>
Select Advanced tab, then Click Environment Variables button.
</p>

<p>
<img src="https://lh3.googleusercontent.com/-zcZel2n21yk/VYDNqu5CxGI/AAAAAAAACMs/zIwc6Mz6__8optVwJUZnakdVUcAb6ostQCCo/s483/System-Properties_Advanced.png" alt="System Properties Advanced" />
</p>

<p>
Click New button in User Variables.
</p>

<!-- Environment Variables box start -->
<div class="environment-variables">
<div class="environment-variables-header">Environment Variables</div>
<fieldset>
<legend>User variables for John</legend>
<table>
<tr>
	<th style="width: 30%;">Variable</th>
	<th>Value</th>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>
<div class="environment-variables-buttons">
	<input type="button" value="New" style="border: 3px solid red;" />
	<input type="button" value="Edit" />
	<input type="button" value="Delete" />
</div>
</fieldset>

<fieldset>
<legend>System variables</legend>
<table>
<tr>
	<th style="width: 30%;">Variable</th>
	<th>Value</th>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>
<div class="environment-variables-buttons">
	<input type="button" value="New" />
	<input type="button" value="Edit" />
	<input type="button" value="Delete" />
</div>
</fieldset>
<div class="environment-variables-ok-cancel-buttons">
	<input type="button" value="OK" />
	<input type="button" value="Cancel" />
</div>
</div>
<!-- Environment Variables box end -->
<p>
Creates a new environment variable named JAVA_HOME in User Variables.<br /> 
The value of JAVA_HOME is the installation directory of the JDK.<br />
To obtain the correct value, use the Windows Explorer.<br />
</p>

<!-- New User Variable JAVA_HOME start -->
<div class="new-user-variable">
<div class="new-user-variable-header">New User Variable</div>
<table>
<tr>
	<td style="width: 30%;">Variable name:</td>
	<td><input type="text" name="user-variable-name" value="JAVA_HOME" style="width: 90%;" /></td>
</tr>
<tr>
	<td>Variable value:</td>
	<td><input type="text" name="user-variable-value" value="C:\Program Files\Java\jdk-17.0.2" style="width: 90%;" /></td> </tr>
</table>
<div class="environment-variables-ok-cancel-buttons">
	<input type="button" value="OK" />
	<input type="button" value="Cancel" />
</div>
</div>
<!-- New User Variable end -->

<p>
Click New button in User Variables again.<br />
Creates a new environment variable named Path in User Variables.<br />
The value of Path is <b>%JAVA_HOME%\bin</b>.
</p>

<!-- New User Variable Path start -->
<div class="new-user-variable">
<div class="new-user-variable-header">New User Variable</div>
<table>
<tr>
	<td style="width: 30%;">Variable name:</td>
	<td><input type="text" name="user-variable-name" value="Path" style="width: 90%;" /></td>
</tr>
<tr>
	<td>Variable value:</td>
	<td><input type="text" name="user-variable-value" value="%JAVA_HOME%\bin" style="width: 90%;" /></td>
</tr>
</table>
<div class="environment-variables-ok-cancel-buttons">
	<input type="button" value="OK" />
	<input type="button" value="Cancel" />
</div>
</div>
<!-- New User Variable end -->

<dl class="note">
<dt>Path</dt>
<dd>
The user variable Path value is added to the system variable Path.<br />
Windows OS looks for programs in the system variable Path directories.<br />
if you add the location of the bin folder of the JDK installation for the Path variable,
you are able to conveniently run the executables (javac.exe, java.exe, jar.exe, and so on) from any directory 
Without moving to the directory where the executable program is located, such as:<br />
<b>C:\Users&gt;javac Test.java</b><br />
If you do not set the Path variable, you need to move to the directory where the executable program is located, such as:<br />
<b>C:\Program Files\Java\jdk-17.0.2\bin&gt;javac C:\Users\Test.java</b><br />
To confirm the Path, run <b>echo %Path%</b> in command prompt.<br />
</dd>
<dt>
Semi-colon (;) is used to separate values of the Path environment variable in Windows.<br />
Colon (:) is used to separate values of the PATH environment variable in Unix and Linux.
</dt>
</dl>

<h2>Test</h2>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
public class Test {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
</pre>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
C:\Users\John&gt;javac Test.java

C:\Users\John&gt;java Test
Hello World!
</pre>

<dl class="note">
<dt>Test failure checklist</dt>
<dd>
<p>
javac Test.java -&gt; <strong>'javac' is not recognized as an internal or external command, operable program or batch file.</strong><br />
Check your Path Environment Variable
</p>
<p>
java Test -&gt; <strong>Exception in thread "main" java.lang.NoClassDefFoundError: Test</strong><br />
The above error occurs when Test.class file was not found.<br />
When you run "java Test" in the directory where Test.class file does not exist, you will get this error. If you want to run the class in the directory where the class file does not located, use the -cp option of java.exe, such as:<br />
</p>
<p>
C:\Program Files&gt;java -cp C:\Users\John Test<br /><br />
<span>C:\Users\John</span> is the directory where the class file is located.<br />
<span>Test</span> is a Java class to run.
</p>
</dd>
</dl>

<h2>Editor</h2>

<p>
Until <a href="/java/Package_Modifiers">Package and Modifiers</a>, it is better to use a simple editor such as <a href="https://www.editplus.com/">editPlus</a> and <a href="https://notepad-plus-plus.org">Notepad++</a>. After you finish the Package and Modifiers, use <a href="https://www.eclipse.org">Eclipse</a>.<br />
</p>

</article>
