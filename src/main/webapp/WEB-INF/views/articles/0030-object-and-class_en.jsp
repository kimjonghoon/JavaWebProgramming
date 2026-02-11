<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="staticUrl" value="/resources"/>

<article>

<h1>Object and Class</h1>

<h3>Object</h3>

<p>
Objects are crucial to understanding OOP.<br />
There are many examples of real-world objects, such as your cup, computer, etc.<br />
Real-world objects have three characteristics.
</p>

<h4>1. property</h4>

<p>
Each object has properties.<br />
You have properties, e.g., name, mobile, waist circumference.
</p>

<h4>2. behavior</h4>

<p>
You have behaviors, e.g., run, walk.
</p>

<h4>3. one</h4>

<p>
Every object is only one.<br />
You are the only one.
</p>

<h3>Software objects</h3>

<p>
Software objects are similar to natural world objects.<br />
<em>Software objects are a combination of data and functions.</em><br />
You can consider the property of the real-world object as data and the behavior of the real-world object as a function.
</p>

<h3>Class</h3>

<p>
A class is a casting mold from which JVM creates individual objects.<br />
To create an object in a Java program, you must first create a class.
</p>

<p>
Let's think that we have to develop a program for student attendance management. We can extract the properties and behaviors of a student as follows.
</p>

<p>
<em>property: name, total number of absence days.</em><br />
<em>behavior: absent</em>
</p>

<p>
Now we can create a student class.
</p>

<h6 class="src">Student.java</h6>
<pre class="prettyprint">
<strong>class</strong> Student {
  String name;
  int totalAbsenceDays;
	
  void absent() {
    totalAbsenceDays = totalAbsenceDays + 1;
  }
}
</pre>

<dl class="note">
<dt>class Student {..}</dt>
<dd>
The class name comes after the class keyword.<br />
Make the file name the same as the class name.
</dd>
<dt>String name;</dt>
<dd>
An object stores its state in fields.<br />
The state is a broader concept than OOP's property.

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 50%;">String</th>
	<th class="table-in-article-th">name</th>
</tr>
<tr>
	<td class="table-in-article-td">field data type</td>
	<td class="table-in-article-td">field name</td>
</tr>
</table>

String class belongs to Java APIs.<br />
You can express a series of characters using the String class.
</dd>

<dt>int totalAbsenceDays;</dt>
<dd>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 50%;">int</th>
	<th class="table-in-article-th">totalAbsenceDays</th>
</tr>
<tr>
	<td class="table-in-article-td">field data type</td>
	<td class="table-in-article-td">field name</td>
</tr>
</table>

An int is a data type for an integer.
</dd>

<dt>void absent() {..}</dt>
<dd>
if absent() does not return a value, you must type void before absent().<br />
if absent() returns a value, you must type the data type before absent().<br />
In Java, absent() is called a method, not a function.
</dd>
</dl>

<p>
Let's make Student executable alone.
Open Student.java and add the following method, as below:
</p>

<h6 class="src">Student.java</h6>
<pre class="prettyprint">
class Student {
  String name;
  int totalAbsenceDays;
	
  void absent() {
    totalAbsenceDays = totalAbsenceDays + 1;
  }
  <strong>
  public static void main(String[] args) {
    Student tom = null;
    Student will = null;

    tom = new Student();
    tom.name = "Thomas Edison";

    will = new Student();
    will.name = "William Blake";

    tom.absent();
    will.absent();
    tom.absent();

    System.out.println(tom.totalAbsenceDays);
    System.out.println(will.totalAbsenceDays);
  }</strong>
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\John&gt;javac Student.java

C:\Users\John&gt;java Studnet
2
1

C:\&gt;
</pre>

<p>
Typing "java Student" drives a new JVM start, and the method named main of Student class start.<br />
Whenever a JVM start, the classloader is responsible for loading Java classes that make up the program, such as Student, String, System, etc.<br />
A classloader already knows the location of classes corresponding to Java APIs, e.g., String, System, etc.<br />
Maybe you have to notify the classloader of the location of the Student class.
</p>

<p>
If you want to run in a directory where is no Student class, you have to notify the location of the Student class to the classloader using the cp option.
</p>

<dl class="note">
<dt>public static void main (String[] args) {..}</dt>
<dd> 
This method is the starting point of a Java pure application.<br />
You have to make the method named main in the starting class.
</dd>
<dt>Student tom = null;</dt>
<dd>
This statement declares the reference variable tom to refer to the Student object and initializes the variable tom to null because it does not yet refer to anything.<br />
A reference variable saves a reference value used to access an object. Note that there are no objects inside the reference variables box.<br />
You assign null to a reference variable to make the variable not refer to anything.<br />
Since null is also a value, the following two statements are entirely different.

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 50%;">Student tom;</th>
	<th class="table-in-article-th">Student tom = null;</th>
</tr>
<tr>
	<td class="table-in-article-td">The variable tom in the first statement has no value. -- We express this as 'not initialized' --</td>
	<td class="table-in-article-td">You can assign null only to reference variables. -- null is a value that indicates that it doesn't refer to any object --</td>
</tr>	
</table>
</dd>
<dt>tom = new Student();</dt>
<dd>
This statement assigns the reference value of a Student object generated to the Student type reference variable named tom.<br />
If 'new Student()' runs, JVM creates a Student object in the heap memory space, generates a reference value pointing to the student, and returns it.
</dd>
<dt>tom.name = "Thomas Edison";</dt>
<dd>
This statement sets the student's name using the reference variable (tom).<br />
You can access an object by typing a reference variable followed by a dot followed by a field or method.<br />
</dd>
<dt>tom.absent();</dt>
<dd>
This statement calls the absent() method of the student, to which variable tom refers.
</dd>
</dl>

<h2>System.out.println()</h2>

<p>
Below are all of the uses for this method.
</p>

<h6 class="src">StandardOutput.java</h6>
<pre class="prettyprint">
class StandardOutput {
  public static void main(String[] args) {
    System.out.println(true);// boolean ouput and line break
    System.out.println('A');// 'A' output and line break
    char[] x = {'A','B','C'};
    System.out.println(x);//char[] value output and line break
    System.out.println(99.9);//double value output line break
    System.out.println();// simply line break
    System.out.println(99.9F);//float value output and line break
    System.out.println(100);//int value output and line break
    System.out.println(40000000L);//long value output and line break
    System.out.println(System.out);//Object's data type@hashcode ouput and line break
    System.out.println("standard output method");//String value output and line break
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\Users\John&gt;javac StandardOutput.java

C:\Users\John&gt;java StandardOutput
true
A
ABC
99.9

99.9
100
40000000
java.io.PrintStream@de6ced
standard output method
</pre>

<p>
The only difference between System.out.print() and System.out.println() is that System.out.print() does not change the line after the output.
</p>

</article>

<article>
<div id="next-prev">
  <ul>
    <li>Next : <a href="${javaUrl}/keyword-identifiers-comment">Keyword, Identifiers, Comment</a></li>
    <li>Prev : <a href="${javaUrl}/object-and-class">Object and Class</a></li>
  </ul>
</div>
</article>
