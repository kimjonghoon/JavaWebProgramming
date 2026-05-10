<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Collection</h1>

<p>
The Collection is a Java API for storing several references of the same type. It is easy to understand if you think that similar to an array but much more convenient.
</p>

<p>
The following figure shows the hierarchical relationship of the collection's primary interfaces.
</p>

<p>
<img src="<c:url value="/resources/images/collection-framework.png"/>" alt="Collection Framework" />
</p>

<p>
Consider the following when choosing a collection class.
A collection class is either a Set interface implementation, a List interface implementation, or a Map interface implementation.
</p>

<ul>
	<li><strong>Set</strong> does not allow duplication, and there is no order in it.</li>
	<li><strong>List</strong> does allow duplication, and there is an order in it.</li>
	<li><strong>Map</strong> stores data in the form of keys and values.</li>
</ul>

<p>
Here are the frequently used collection classes:
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th">Interface</th>
	<th class="table-in-article-th">Implementation(after Java 2)</th>
	<th class="table-in-article-th">Implementation(before Java 2)</th>
</tr>
<tr>
	<td class="table-in-article-td" rowspan="2">Set</td>
	<td class="table-in-article-td">HashSet</td>
	<td class="table-in-article-td" rowspan="2"></td>
</tr>
<tr>
	<td class="table-in-article-td">TreeSet</td>
</tr>
<tr>
	<td class="table-in-article-td" rowspan="2">List</td>
	<td class="table-in-article-td">ArrayList</td>
	<td class="table-in-article-td" rowspan="2">Vector</td>
</tr>
<tr>
	<td class="table-in-article-td">LinkedList</td>
</tr>
<tr>
	<td class="table-in-article-td" rowspan="2">Map</td>
	<td class="table-in-article-td">HashMap</td>
	<td class="table-in-article-td" rowspan="2">Properties</td>
</tr>
<tr>
	<td class="table-in-article-td">TreeMap</td>
</tr>
</table>

<h3>Set</h3>

<p>
The following example shows how to use the Set interface.<br />
Create a HashSet and add the name using the add method of the Set interface.<br />
The following example attempts to add "Bill" in duplicate. But you can see from the output that this item did not go into the HashSet.
</p>

<h6 class="src">SetExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class SetExample {
  public static void main(String args[]) {
	  
    Set<strong>&lt;String&gt;</strong> set = new HashSet<strong>&lt;String&gt;</strong>();
    set.add("Bill");
    set.add("Elsa");
    set.add("Debbie");
    set.add("Alison");
    set.add("Carol");
    set.add("Bill");
		    
    System.out.println(set);//you can not add something in duplicate to a Set.
		    
    Set<strong>&lt;String&gt;</strong> sortedSet = new TreeSet<strong>&lt;String&gt;</strong>(set);
    System.out.println(sortedSet);//the list is sorted.
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">C:\java\Collection\bin&gt;java net.java_school.collection.SetExample
[Elsa, Alison, Carol, Bill, Debbie]
[Alison, Bill, Carol, Debbie, Elsa]
</pre>

<p>
If you look in the Java documentation for the collection class covered in the example, you can see the &lt;E&gt;, &lt;T&gt;, &lt;K, V&gt; in the class declaration. These interfaces, abstract classes, and classes are called generic. -- Java 5 introduced Generics -- E means Element, T means Type, K means Key, and V means Value. You can use these symbols to declare unspecified data types. These data types are determined at runtime, not compile time.
</p>

<p>
The following example creates a generic account number for the account class.
</p>

<pre class="prettyprint">
package net.java_school.collection;

public class Account<strong>&lt;T&gt;</strong> {
	
  private <strong>T</strong> accountNo;//AccountNo can be any type.
	
  public <strong>T</strong> getAccountNo() {
    return accountNo;
  }

  public void setAccountNo(<strong>T</strong> accountNo) {
    this.accountNo = accountNo;
  }

  public static void main(String[] args) {
    Account<strong>&lt;String&gt;</strong> ac1 = null;
    ac1 = new Account<strong>&lt;String&gt;</strong>();// The account number data type is determined by String.
    ac1.setAccountNo("111-222-333");
		
    Account<strong>&lt;Integer&gt;</strong> ac2 = null;
    ac2 = new Account<strong>&lt;Integer&gt;</strong>();// The account number data type is determined by Integer.
    ac2.setAccountNo(111222333);// See below for the wrapper class
  }
}
</pre>

<h3>List</h3>

<p>
The List inherits the Collection interface, has an order and allows duplicates, and has an index address starting from 0 like an array.
</p>

<p>
The ArrayList is the most popular class in the List family.<br />
The following example shows the usage of ArrayList.
</p>

<h6 class="src">ArrayListExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.ArrayList;

public class ArrayListExample {

  public static void main(String[] args) {
    ArrayList<strong>&lt;String&gt;</strong> a = new ArrayList<strong>&lt;String&gt;</strong>();
		
    a.add("Tom");
    a.add("Jerry");
		
    String hong = <strong>a.get(1);</strong>
    System.out.println(hong);
		
    //Enhanced For-Loops
    for (<strong>String</strong> name : a) {
      System.out.print(name +"\t");
    }
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.ArrayListExample
Jerry
Tom		Jerry
</pre>

<p>
The following example compares the usage of ArrayList and LinkedList.
</p>

<h6 class="src">ListExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class ListExample {
  public static void main(String args[]) {
    List<strong>&lt;String&gt;</strong> list = new ArrayList<strong>&lt;String&gt;</strong>();
		    
    list.add("A");
    list.add("B");
    list.add("C");
    list.add("D");
    list.add("E");
		
    System.out.println(list);
    System.out.println("2: " + list.get(2));
    System.out.println("0: " + list.get(0));
		
    LinkedList<strong>&lt;String&gt;</strong> linkedList = new LinkedList<strong>&lt;String&gt;</strong>();
		
    linkedList.addFirst("A");
    linkedList.addFirst("B");
    linkedList.addFirst("C");
    linkedList.addFirst("D");
    linkedList.addFirst("E");
		    
    System.out.println(linkedList);
    linkedList.removeLast();
    linkedList.removeLast();
		    
    System.out.println(linkedList);
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.ListExample
[A, B, C, D, E]
2: C
0: A
[E, D, C, B, A]
[E, D, C]
</pre>

<h3>Map</h3>

<p>
Map stores data in pairs of keys and values.<br />
The following example uses a HashMap and later changes the HashMap to a TreeMap which sorts data by key value.
</p>

<h6 class="src">MapExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class MapExample {
  public static void main(String args[]) {
	
    Map<strong>&lt;String,String&gt;</strong> map = new HashMap<strong>&lt;String,String&gt;</strong>();
		
    map.put("1", "Bill");
    map.put("2", "Elsa");
    map.put("3", "Debbie");
    map.put("4", "Alison");
    map.put("5", "Carol");
		
    System.out.println(map);
    System.out.println(map.get("4"));
		
    Map<strong>&lt;String,String&gt;</strong> sortedMap = new TreeMap<strong>&lt;String,String&gt;</strong>(map);
    System.out.println(sortedMap);
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.MapExample
{3=Debbie, 2=Elsa, 1=Bill, 5=Carol, 4=Alison}
Alison
{1=Bill, 2=Elsa, 3=Debbie, 4=Alison, 5=Carol}
</pre>

<p>
Let's modify the above example using Wrapper classes. The Integer is a Wrapper class corresponding to an int data type. Even if you use Integer type key values, the HashMap sorts data.
</p>

<h6 class="src">MapExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class MapExample {
  public static void main(String args[]) {
	
    Map<strong>&lt;Integer</strong>,String&gt; map = new HashMap<strong>&lt;Integer</strong>,String&gt;();
		
    map.put(1, "Bill");
    map.put(2, "Elsa");
    map.put(3, "Debbie");
    map.put(4, "Alison");
    map.put(5, "Carol");
		
    System.out.println(map);
    System.out.println(map.get(4));
		
    Map<strong>&lt;Integer</strong>,String&gt; sortedMap = new TreeMap<strong>&lt;Integer</strong>,String&gt;(map);
    System.out.println(sortedMap);
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.MapExample
{1=Bill, 2=Elsa, 3=Debbie, 4=Alison, 5=Carol}
Alison
{1=Bill, 2=Elsa, 3=Debbie, 4=Alison, 5=Carol}
</pre>


<h3>Vector</h3>

<p>
Vector and ArrayList are a big difference.<br />
Vector is thread-safe, whereas ArrayList is not thread-safe.<br />
There are a lot of performance differences between thread-safe and non-thread-safe, so you need a good reason for choosing thread-safe ones.<br />
<b>Note: </b>The JDBC connection pooling code covered in JDBC uses a thread-safe Vector.<br />
The following example shows the usage of Vector.
</p>

<h6 class="src">VectorExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class VectorExample {
  public static void main(String[] args) {
	
    Vector<strong>&lt;String&gt;</strong> v = new Vector<strong>&lt;String&gt;</strong>();
	
    for (int i = 0; i &lt; 10; i++) {
      v.addElement(String.valueOf(Math.random() * 100));
    }
		
    for (int i = 0; i &lt; 10; i++) {
      System.out.println(v.elementAt(i));
    }
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.VectorExample
64.93767837163008
1.7024404924644077
56.445592597123806
23.41304656773643
92.55620070095163
41.6525553754475
47.39373268828609
83.84855063525016
67.34657837510855
41.04715452201211
</pre>

<h3>Properties</h3>

<p>
Properties is a popular class for reading values from configuration files in Java. Properties stores data in pairs of keys and values.
</p>

<h4>PropertiesStore.java</h4>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;
import java.io.*;

public class PropertiesStore {
  public static void main(String[] args) {
	
    Properties prop = new Properties();
    prop.<strong>put</strong>("title", "Back in Black");
    prop.<strong>put</strong>("singer", "AC/DC");
		
    try {
      prop.<strong>store</strong>(new FileOutputStream("test.properties"),"My Favorite Song");
    } catch (IOException e) {
      System.out.println(e.getMessage());
    }
  }
}
</pre>

<h6 class="src">PropertiesLoad.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;
import java.io.*;

public class PropertiesLoad {
  public static void main(String[] args) {
	
    Properties prop = new Properties();
    try {
      prop.<strong>load</strong>(new FileInputStream("test.properties"));
    } catch (IOException e) {
      System.out.println(e.getMessage());
    }
    System.out.println(prop.<strong>getProperty</strong>("title"));
    System.out.println(prop.<strong>getProperty</strong>("singer"));
  }
}
</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.PropertiesStore

C:\java\Collection\bin&gt;java net.java_school.collection.PropertiesLoad
Back in Black
AC/DC
</pre>

<p>
Running the PropertiesStore will create a test.properties file on the file system.
</p>

<p>
The file's location is different when you run it in Eclipse or when you run it from the command prompt. Eclipse creates the file in the project directory. If you think it is ambiguous, you can pass the full path of the file system to the constructor of FileOutputStream and FileInputStream in the above code as follows.
</p>

<p>
new FileOutputStream("C:/java/Collection/test.properties"), new FileInputStream("C:/java/Collection/test.properties")
</p>

<p>
The file contents are as follows:
</p>

<h6 class="src">test.properties</h6>
<pre class="prettyprint">
#My Favorite Song
#Thu Apr 10 13:07:41 KST 2014
singer=AC/DC
title=Back in Black
</pre>

<h3>Enumeration</h3>

<p>
It is an interface with the necessary methods for retrieving objects stored in enumerated form from beginning to end.<br />
It has two methods:
</p>

<ul>
	<li>hasMoreElements()</li>
	<li>nextElement()</li>
</ul>

<p>
Vector implements the Enumeration interface.<br />
The following code outputs all elements of the Vector.
</p>

<pre class="prettyprint">
for (Enumeration&lt;E&gt; e = v.elements(); e.hasMoreElements();) {
  System.out.println(e.nextElement());
}
</pre>

<p>
Let's modify the previous Vector example to use Enumeration.<br />
Performance is lower than in the previous example.
</p>

<h6 class="src">VectorExample.java Using Generic, Enumeration</h6>
<pre class="prettyprint">
package net.java_school.collection;

import java.util.*;

public class VectorExample {
  public static void main(String[] args) {
	
    Vector<strong>&lt;String&gt;</strong> v = new Vector<strong>&lt;String&gt;</strong>();
	
    for (int i = 0; i &lt; 10; i++) {
      v.addElement(String.valueOf(Math.random() * 100));
    }
		
    for (Enumeration<strong>&lt;String&gt;</strong> e = v.<strong>elements()</strong>; e.<strong>hasMoreElements()</strong>;) {
      System.out.println(e.<strong>nextElement()</strong>);
    }
  }
}
</pre>

<h3>Iterator</h3>

<p>
Iterator is similar to the Enumeration interface, created later than the Enumeration. Method names are simpler than Enumeration. Unlike Enumeration, Iterator has a method to delete values.
</p>

<p>
The Collection interface has the iterator() method. Every class that implements the Set or List interface must have an iterator() method because the Set and List interfaces inherit the Collection interface.
</p>

<p>
The iterator() method returns the Iterator interface type. Of course, because the Iterator is an interface, the actual return is an object created from the implementation class that implements Iterator. But we do not have to worry about what the implementation class is. It is sufficient that the implementation class implements the Iterator interface.
</p>

<ul>
	<li>hasNext()</li>
	<li>next()</li>
	<li>remove()</li>
</ul>

<h2>Wrapper</h2>

<p>
Unlike arrays, Collection can contain only reference values. You can not store a primitive data type value in Collection. The answer is to use the wrapper class to store primitive type values in Collection. There are corresponding wrapper classes for all primitive types. A wrapper instance consists of a primitive data type value and methods that manipulate that value.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th">Primitive Data Type</th>
	<th class="table-in-article-th">Wrapper Class</th>
</tr>
<tr>
	<td class="table-in-article-td">boolean</td>
	<td class="table-in-article-td">Boolean</td>
</tr>
<tr>
	<td class="table-in-article-td">byte</td>
	<td class="table-in-article-td">Byte</td>
</tr>
<tr>
	<td class="table-in-article-td">char</td>
	<td class="table-in-article-td">Character</td>
</tr>
<tr>
	<td class="table-in-article-td">short</td>
	<td class="table-in-article-td">Short</td>
</tr>
<tr>
	<td class="table-in-article-td">int</td>
	<td class="table-in-article-td">Integer</td>
</tr>
<tr>
	<td class="table-in-article-td">long</td>
	<td class="table-in-article-td">Long</td>
</tr>
<tr>
	<td class="table-in-article-td">float</td>
	<td class="table-in-article-td">Float</td>
</tr>
<tr>
	<td class="table-in-article-td">double</td>
	<td class="table-in-article-td">Double</td>
</tr>
</table>

<h6 class="src">IntegerExample.java</h6>
<pre class="prettyprint">
package net.java_school.collection;

public class IntegerExample {

  public static void main(String[] args) {
    <strong>Integer a = new Integer(2000000000);</strong>
    int intValue = a.<strong>intValue();</strong>
    System.out.println(intValue);

    byte byteValue = a.<strong>byteValue();</strong>
    System.out.println(byteValue);
		
    short shortValue = a.<strong>shortValue();</strong>
    System.out.println(shortValue);
		
    long longValue = a.<strong>longValue();</strong>
    System.out.println(longValue);
		
    float floatValue = a.<strong>floatValue();</strong>
    System.out.println(floatValue);
		
    double doubleValue = a.<strong>doubleValue();</strong>
    System.out.println(doubleValue);
		
    String strValue = a.<strong>toString();</strong>
    System.out.println(strValue);

    System.out.println(<strong>Integer.MAX_VALUE</strong>);
    System.out.println(<strong>Integer.MIN_VALUE</strong>);
    System.out.println(<strong>Integer.parseInt("1004")</strong>);

    /* 
    * The following code is changed by the compiler to Integer b = new Integer(200000000); 
    * This is called AutoBoxing.
    * AutoBoxing is not a casting.
    * There is no casting that converts a primitive datatype to a reference datatype.		  
    */
    Integer b = 2000000000;
	
    /* 
     * == always asks if the values are the same. 
     * If it is a reference value, it is judged whether it is the same object or not.
    */
    if (a == b) {
      System.out.println("a == b true");
    } else {
      System.out.println("a == b false");
    }
		
    /* 
     * To determine if a and b have the same int value, use the equals() method of Integer.
     * The equals() method of Integer overrides Object's equals method to determine if int values are equal.
     <em>if (obj instanceof Integer) {
       return value == ((Integer)obj).intValue();
     }
     return false;</em>  
    */
    if (a.equals(b)) {
      System.out.println("a.equals(b) true");
    } else {
      System.out.println("a.equals(b) false");
    }
		
    /*
     * Use the compareTo() method of Integer to determine the values of a and b in various ways. 
    */
    int check = a.<strong>compareTo(b);</strong>
    System.out.println(check);
    if (check == 0) {
      System.out.println("a(int) == b(int)");
    } else if (check &lt; 0) {
      System.out.println("a(int) &lt; b(int)");
    } else {
      System.out.println("a(int) &gt; b(int)");
    }
		
    int c = 2000000000;
    if (a.<strong>equals(c)</strong>) { // The compiler changes c to a reference to new Integer(c).
      System.out.println("a.equals(c) true");
    } else {
      System.out.println("a.equals(c) false");
    }
		
    /*
     * It appears that a copy of the int value in the Integer object 
     * referenced by a is assigned to the variable d of the primitive type outside the object.
     * This is called AutoUnboxing.
    */
    int d = a; //The compiler changes this code to int d = a.intValue();
    System.out.println(d);
		
    /*
    * obj is assigned a reference to an Integer object containing a 1.
    * The fact is that the compiler modifies this code to Object obj = new Integer(1);
    */
    Object obj = 1;
    System.out.println(obj);
		
    /*
    * You can not call an Integer's original method using a reference of type Object.
    * Casting is necessary.
    System.out.println((<strong>(Integer)obj</strong>).intValue());
  }
}

</pre>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
C:\java\Collection\bin&gt;java net.java_school.collection.IntegerExample
2000000000
0
-27648
2000000000
2.0E9
2.0E9
2000000000
2147483647
-2147483648
1004
a == b false
a.equals(b) true
0
a(int) == b(int)
a.equals(c) true
2000000000
1
1
</pre>

<p>
Java provides AutoBoxing and Auto Unboxing for ease of development. You may have seen a magic trick: Inserting and withdrawing coins in a glass box without a lid. AutoBoxing puts a coin in a box, and Auto Unboxing takes a coin out of a box.
</p>

<span id="refer">References</span>
<ul id="references">
		<li><a href="https://docs.oracle.com/javase/tutorial/collections/intro/index.html">https://docs.oracle.com/javase/tutorial/collections/intro/index.html</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/exception"/>">Exception</a></li>
    <li>Prev : <a href="<c:url value="/java/static"/>">static keyword</a></li>
  </ul>
</div>
</article>