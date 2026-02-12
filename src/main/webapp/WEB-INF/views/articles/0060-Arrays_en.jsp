<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Arrays</h1>

<p>
An array is a container object that holds values of a same type.<br />
<img src="https://lh3.googleusercontent.com/-iLIT7b27vBo/Vvy0K3Fs5eI/AAAAAAAACto/WJw-WrH8EtENW0RZRVweV-vjoMqqXb4DACCo/s913-Ic42/variable-array.png" alt="variable and array" /><br />
Each item in the array is called an element.<br />
Each element has a numeric index, starting with 0.<br />
To access an element, use an index and square brackets, e.g., arr[4].<br />
Java arrays are also objects.<br />
So, you need to be able to create an array object.<br />
</p>

<h3>Examples</h3>

<pre class="prettyprint">
int[] arr = null; //declares an array of integers.

arr = new int[4];
/*
4 is the size of the array. 
It is stored in the variable length of the array and never changes.
JVM initializes all elements of arr to 0. 
*/

arr[0] = 1;//assign 1 to 1st element
arr[1] = 2;//assign 2 to 2nd element
arr[2] = 3;//assign 3 to 3rd element
arr[3] = 4;//assign 4 to last element
</pre>

<p>
Array literals reduce all the code so far to one line.
</p>

<pre class="prettyprint">
int[] arr2 = {1, 2, 3, 4};
</pre>

<p>
Let's create an array that stores references to elements.
</p>

<pre class="prettyprint">
String[] arr3 = null;//declares an array of Strings.
arr3 = new String[2];//JVM creates the string array and initializes all elements to null.
//You cannot increase or decrease the size of the array.
arr3[0] = "Java";//1st element is assigned "Java" object’s reference.
arr3[1] = "School";//2nd element is assigned "School" object’s reference.
</pre>

<p>
Array literals allow you to shorten all the code of the above string array to one line.
</p>

<pre class="prettyprint">
String[] arr4 = {"Java", "School"};
</pre>

<h2>How to express strings</h2>

<p>
To represent strings in code, you need to create a string object from the String class.<br />
If you need the string "Hello", code it like below: 
</p>

<pre class="prettyprint no-border">
char[] arrayOfHello = {'H','e','l','l','o'};
String greetings = new String(arrayOfHello);
</pre>

<p>
However, most Java programmers use string literals instead of the above code.
</p>

<pre class="prettyprint no-border">
String hello = "Hello";//"Hello" is a String Literal.
</pre>

<p>
When JVM calls method main, it creates and passes an array of strings. 
</p>

<pre class="prettyprint">
class ArrayTest {
  public static void main(String[] args) {
    System.out.println(args.length);
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp&gt;javac ArrayTest.java

C:\javaApp&gt;java ArrayTest
0
</pre>

<p>
Let's make the JVM create an array with size greater than zero.
</p>

<pre class="prettyprint">
class ArrayTest {
  public static void main(String[] args) {
    System.out.println(args[0]);
    System.out.println(args[1]);
    System.out.println(args[2]);
 }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp&gt;javac ArrayTest.java

C:\javaApp&gt;java ArrayTest <strong>Be The One</strong> 
Be
The
One
</pre>

<pre class="prettyprint">
class ArrayTest {
  public static void main(String[] args) {
    int[] arr = null; //declares an array of integers.
    arr = new int[4];

    arr[0] = 1;//assign 1 to 1st element
    arr[1] = 2;//assign 2 to 2nd element
    arr[2] = 3;//assign 3 to 3rd element
    arr[3] = 4;//assign 4 to last element

    int[] arr2 = {1, 2, 3, 4};

    String[] arr3 = null;//declares an array of Strings.
    arr3 = new String[2];

    arr3[0] = "Java";
    arr3[1] = "School";

    String[] arr4 = {"Java", "School"};

    char[] arrayOfHello = {'H','e','l','l','o'};
    String greetings = new String(arrayOfHello);

    String hello = "Hello"; //"Hello" is a String Literal.

    System.out.print("arr's length:");
    System.out.println(arr.length);

    System.out.println("output all elements of arr");
    int arrLength = arr.length;
    for (int i = 0; i &lt; arrLength; i++) {
      System.out.println(arr[i]);
    }

    System.out.print("arr2's length:");
    System.out.println(arr2.length);

    System.out.println("output all elements of arr2");
    int arr2Length = arr2.length;
    for (int i = 0; i &lt; arr2Length; i++) {
      System.out.println(arr2[i]);
    }

    System.out.print("arr3's length:");
    System.out.println(arr3.length);
    System.out.println("output all elements of arr3");
    int arr3Length = arr3.length;
    for (int i = 0; i &lt; arr3Length; i++) {
      System.out.println(arr3[i]);
    }

    System.out.print("arr4's length:");
    System.out.println(arr3.length);

    System.out.println("output all elements of arr4");
    int arr4Length = arr4.length;
    for (int i = 0; i &lt; arr4Length; i++) {
      System.out.println(arr4[i]);
    }

    System.out.print("output variable greetings:");
    System.out.println(greetings);

    System.out.print("output variable hello:");
    System.out.println(hello);

    System.out.print("args's length:");
    int argsLength = args.length;
    System.out.println(argsLength);

    System.out.println("ouput all elements of args");
    if (argsLength &gt; 0) {
      for (int i = 0; i &lt; argsLength; i++) {
        System.out.println(args[i]);
      }
    }

  }

}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\javaApp&gt;javac ArrayTest.java

C:\javaApp&gt;java ArrayTest Self-pity "D.H. Lawrence"
arr's length:4
output all elements of arr
1
2
3
4
arr2's length:4
output all elements of arr2
1
2
3
4
arr3's length:2
output all elements of arr3
Java
School
arr4's length:2
output all elements of arr4
Java
School
output variable greetings:Hello
output variable hello:Hello
args's length:2
output all elements of args
Self-pity
D.H. Lawrence
</pre>

</article>