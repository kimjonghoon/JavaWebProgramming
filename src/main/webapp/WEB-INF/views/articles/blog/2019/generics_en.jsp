<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.1.18</div>

<h1>Generic</h1>

<p>
Java 5 introduced Generic for generic algorithm implementations and rigorous type checking at compile time. The following example defines a box where you can store all kinds of references.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Box&lt;T&gt; {
  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }
}
</pre>

<p>
T is called a type parameter. You can use T anywhere in the class body but must specify the type of T when creating the Box object as follow.
</p>

<pre class="prettyprint no-border">Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();//In &lt;Integer&gt;, Integer is called a type argument.
</pre>

<p>
Due to Java 7 type inference, you can reduce the above statement to:
</p>

<pre class="prettyprint no-border">Box&lt;Integer&gt; intBox = new Box&lt;&gt;();</pre>

<h4>Type Parameter Naming Conventions</h4>

<ul>
    <li>E - Element (used extensively by the Java Collections Framework)</li>
    <li>K - Key</li>
    <li>N - Number</li>
    <li>T - Type</li>
    <li>V - Value</li>
    <li>S,U,V etc. - 2nd, 3rd, 4th types</li>
</ul>

<h3>Raw Types</h3>

<p>
A raw type is the name of a generic class or an interface without any type arguments.
</p>

<p>
To create a parameterized type of Box&lt;T&gt;, you supply an actual type argument for the formal type parameter T:
</p>

<pre class="prettyprint">Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();</pre>

<p>
If you omit the actual type argument, you can create the primitive type of Box<T> as follow.
</p>

<pre class="prettyprint">Box rawBox = new Box();//Box is the raw type of the generic type Box&lt;T&gt;</pre>

<p>
Note that a non-generic class or interface type is not a raw type.
</p>

<p>
Raw types show up in legacy code because many API classes (such as the Collections classes) were not generic before Java 5. When using raw types, you essentially get pre-generics behavior - a Box gives you Objects. For backward compatibility, assigning a parameterized type to its raw type is allowed:
</p>

<pre class="prettyprint">Box&lt;Integer&gt; intBox = new Box&lt;Integer&gt;();
Box rawBox = intBox;//OK
</pre>

<p>
But if you assign a raw type to a parameterized type, you get a warning:
</p>

<pre class="prettyprint">Box rawBox = new Box();
Box&lt;Integer&gt; intBox = rawBox;//warning: unchecked conversions
</pre>

<p>
You also get a warning if you use a raw type to invoke generic methods defined in the corresponding generic type:
</p>

<pre class="prettyprint">Box&lt;St;ring&gt; strBox = new Box&lt;&gt;();
Box rawBox = strBox;
rawBox.set(8);//warning: unchecked invocation to set(T)
</pre>

<p>
The warning shows that raw types bypass generic type checks, deferring the catch of unsafe code to runtime. Therefore, you should avoid using raw types.
</p>

<h3>Generic Methods</h3>

<p>
Generic methods are methods that introduce their type parameters. The type parameter's scope is limited to the method where it is declared. Static and non-static generic methods and generic class constructors are allowed.
</p>

<p>
The syntax for a generic method includes a list of type parameters, inside angle brackets, which appear before the method's return type.
</p>

<p>
The Util class includes a generic method, <strong>compare</strong>, which compares two Pair objects.
</p>

<pre class="prettyprint">package net.java_school.examples;

public interface Pair&lt;K,V&gt; {
  public K getKey();
  public V getValue();
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class IdPasswdPair&lt;K,V&gt; implements Pair&lt;K,V&gt; {
  private K key;
  private V value;

  public IdPasswdPair(K key, V value) {
    this.key = key;
    this.value = value;
  }

  @Override
  public K getKey() {
    return key;
  }

  @Override
  public V getValue() {
    return value;
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class Util {

  <strong>//Generic Method
  public static &lt;K,V&gt; boolean compare(Pair&lt;K,V&gt; p1, Pair&lt;K,V&gt; p2) {
    return p1.getKey().equals(p2.getKey()) &amp;&amp; p1.getValue().equals(p2.getValue());
  }</strong>

  public static void main(String[] args) {
    if (args.length == 2) {
      Pair&lt;String, String&gt; inputData = new IdPasswdPair&lt;&gt;(args[0], args[1]);
      Pair&lt;String, String&gt; storedData = new IdPasswdPair&lt;&gt;("xman31", "1987qwertY");
      <strong>boolean isSame = Util.compare(inputData, storedData);</strong>
      if (isSame) {
        System.out.println("Login succeeded.");
      } else {
        System.out.println("Login failed. Please check your ID and password.");
      }
    } else {
      System.out.println("How to run: java net.java_school.examples.Util 'ID' 'Password'");
    }
  }
}
</pre>

<p>
The complete syntax for invoking the compare method would be:
</p>

<pre class="prettyprint no-border">boolean isSame = Util.<strong>&lt;String, String&gt;</strong>compare(inputData, storedData);
</pre>

<p>
The type has been explicitly provided, as shown in bold. Generally, this can be left out and the compiler will infer the type that is needed:
</p>

<pre class="prettyprint no-border">boolean isSame = Util.compare(inputData, storedData);
</pre>

<p>
Generally, the type in bold can be left out, and the compiler will infer the needed type.
</p>

<pre class="prettyprint no-border">boolean isSame = Util.compare(inputData, storedData);</pre>

<p>
This feature, known as type inference, allows you to invoke a generic method as an ordinary method without specifying a type between angle brackets.
</p>

<h3>Bounded Type Parameters</h3>

<p>
A method that operates on numbers may only want to accept Number or its subclasses instances. Bounded type parameters allow you to create such methods. To declare a bounded type parameter, list its name, followed by the extends keyword, followed by its upper bound.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Box<strong>&lt;T extends Number&gt;</strong> {
  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }
}
</pre>

<p>
<strong>&lt;T extends Number&gt;</strong> is called a type parameter section in the Box class declaration. Bounds can be interfaces.
</p>

<pre class="prettyprint no-border">&lt;T extends java.io.Serializable&gt;</pre>

<p>
Even if the bound is an interface, use the <strong>extends</strong> keyword.
</p>

<p>
You can place one or more bounds in the Type Parameters section. If one of the bounds is a class, it must be specified first.
</p>

<pre class="prettyprint no-border">&lt;T extends Aclass &amp; Binterface &amp; Cinterface&gt;</pre>

<h4>Generic Methods and Bounded Type Parameters</h4>

<p>
Bounded type parameters are key to the implementation of generic algorithms. Consider the following method that counts the number of elements in an array T[] that are greater than a specified element elem.
</p>

<pre class="prettyprint">public static &lt;T&gt; int countGreaterThan(T[] anArray, T elem) {
  int count = 0;
  for (T e : anArray)
    if (e &gt; elem)  // compiler error
      ++count;
  return count;
}
</pre>

<p>
The implementation of the method is straightforward, but it does not compile because the greater than operator (&gt;) applies only to primitive types such as short, int, double, long, float, byte, and char. You cannot use the &gt; operator to compare objects. To fix the problem, use a type parameter bounded by the Comparable&lt;T&gt; interface:
</p>

<pre class="prettyprint">public interface Comparable&lt;T&gt; {
  public int compareTo(T o);
}
</pre>

<p>
Java already has the Comparable&lt;T&gt; interface.
</p>

<pre class="prettyprint">package java.lang;

public interface Comparable<T> {
  public int compareTo(T o);
}
</pre>

<p>
The resulting code will be:
</p>

<pre class="prettyprint">public static &lt;T extends Comparable&lt;T&gt;&gt; int countGreaterThan(T[] anArray, T elem) {
  int count = 0;
  for (T e : anArray)
    if (e.compareTo(elem) &gt; 0)
      ++count;
  return count;
}
</pre>

<p>
The compareTo method of the Comparable&lt;T&gt; interface has a promised implementation. Assuming it runs like a.compareTo(b), the compareTo method should return a value like this:
</p>

<pre style="border: 2px dotted #999; padding: 5px;">if a == b, 0.
if a &gt; b, 1.
if a &lt; b, -1.
</pre>

<p>
The Integer class inherits the Number class, and it also implements Comparable<Integer> Interface. Double, Long, Float, Short, and Byte inherit the Number class and implement the Comparable interface.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class GenericMethodsWithBoundedTypeParametersTest {

  public static &lt;T extends Comparable&lt;T&gt;&gt; int countGreaterThan(T[] array, T elem) {
    int count = 0;
    for (T e : array)
      if (e.compareTo(elem) &gt; 0)
        ++count;
    return count;
  }

  public static void main(String[] args) {
    Integer[] arr = {1,2,3,4,5,6,7,8,9,10};
    int count = countGreaterThan(arr,7); //The number of elements in the array arr whose values are greater than 7
    System.out.println(count);
  }
}
</pre>

<pre class="console"><strong class="console-result">3</strong></pre>

<h3>Generics, Inheritance, and Subtypes</h3>

<p>
Now consider the following method:
</p>

<pre class="prettyprint no-border">
public void boxTest(Box&lt;Number&gt; n) { /* ... */ }
</pre>

<p>
As you might expect, are you allowed to pass in Box&lt;Integer&gt; or Box&lt;Double&gt;? The answer is "no" because Box&lt;Integer&gt; and Box&lt;Double&gt; are not subtypes of Box&lt;Number&gt;.
</p>

<p>
<img src="https://lh3.googleusercontent.com/u__lmjkU1jvaw0f6r55mnnIso_z-NCFNQeWxI_MkSurqypsyNr-IiMorp10Tww8JDJn7gxmKH1qyoCviYcZeJbKvytXi4Ia133FgITkW5hQtvEfUvWZxugPK0Jr3cAMZvmcsk9DaUjYFS7CYbMDoQg0NummdQSO5NA1SNwxH2QTPJzVkx6cQLgCpjlnsucjSnnmAJHsdMScCQ9eDe4vReAJiYXFCmZyD_A-SXiPqnpXracCDYMa6cy4z59fcOk-DZrtD-CDGWUwKuWvhVOrRks4FSzM57DBstecbAm0bHjnONIAElbT6qmMU9fNZs29bcOUw55stXRgA06jfOM0I0kAs4MbN60NQy-StsU7FDeQB4qoAkYxl9A_o5wfRaUK9SP85b-af5iYqtH8KknPFzq9DtTbR49tJpyXnUp1g4jpumELo0B7XqXzXOD6TXAtdOm44eXBzyiZaAHyoAgVM8Rrizh0Vzw6QFML-SEL_qS6pBsmZPqaffMfXUeYf73mCgAEYMQ6vEUlcW2cezbo-bNNIUkEUVfADRA9jMZBiWoDKYTIw9YpBjzGiSTcPxV7VxfUpyLdUC26ahR61tT8Xa8F84sUy9KNj1i2vJo_pv48ocFmwN8Ud-BBDM49LHyFmnlcZ5RH9i0ptu6scwRRpyMp-pg65fh5Cca8v5Oveo-KDUTP1f5XeuQgjhhIb=w553-h430-no?authuser=0" alt="Number and Integer" />
</p>

<p style="text-align: center;">
<img src="https://lh3.googleusercontent.com/Wa6ncjpOJRoB1ESsXZys0ZF6tNilJ9EtMLVApiIqSJJ2Q0XOC4n5WmF3DotUYOLYKSyyp_KZJC6qkMwjGLZEqmnITFfcD9aV7iCiUAJ9nuIvImkv8fGb3aBL0rKt-EXDTr8f8tU04Vfao5Rg4tr_wgVnmkNxHfDu33nHUX6TcQSc9e3Yvwja5YDdigVmbgE-zh5QG8cgtfvd3liRo_DhDKiPK4BQj5HGFMlRWwYN6hcce-KZiLtAYd-4N_am7Ki6yjGU6K-W7zVyREczVydrsnGJwq2rocjBxxv323mB9qX9ixezPTN5kIViC21VybBv8pc79-6e2lQYayggrAJ_atGwqWE4L31VI3sxehFFqQg7_yLG4eHis-_VqXaApsPIq6U2ow1Dz1I9fAurW9sHtT2G-s_2R4w_qz-SwveTENzZLGtdY6xAOmfp_mBUmRM7ZEptOStMUOsDOeMR9PxRfPoqH0CGNETFdLK0S3cHZwCUGX6wSqvHDRRsFW2fj772JXyB-rf7Rs15MgWfny_NuZEW5Ne9fRjCjnIaA0zaLi2pFQlv3u-l4_RP9xVN4JA5aroS7YK4vxoLPh4VoXMjAlAUGwyYNe5GVc7nWbHhsAtC_1-X4bZjxDcbiImca7wON1rmlg2tBFSDIcMdd47LpoL14dN3eO0l0WKQqEFqQ1EiRJDhBXB7T3vcCd77=w544-h401-no?authuser=0" alt="Box&lt;Number&gt; and Box&lt;Integer&gt;" />
Box&lt;Integer&gt; is not a subtype of Box&lt;Number&gt; even though Integer is a subtype of Number.
</p>

<p>
<img src="https://lh3.googleusercontent.com/Waxnpa4pYLT12p-WwEUDjHfBwosqRUKJ4nYd2bvObMRl9RI5DVvk2Gncj0iGN7eej2w0kKUB49zMTtMt_CTWbYvuc0HE6x43IHAUXJW_5JBIIeJd1241NtFljoJ6UFJKWNmEly_N-a_-GB2RRiwu05NFhQz9DUj65_IVF5ZZ_tWqfdGDeShW5JppUk-ULejZrfSpKhH61oRcRrgA41RtyHa9e2NYthtloh0V1W_lMZ5Keb3B54Wb-M9pv79677JUgLKwAsbkuyvdv2Er3_kyM52WKFD2k1VM5jKFXiNi5Nim90laXMu0jkWjzu_VFPbgRY2N7DXFEDVAlhxVTGNRPROUCf46iowSHw5OmYyPv3XEgyFa5sWdMhykZgPOLOFnS2sNofpzthuWp7G1q3OwEeXvWY9X5bbhtA28J_A97w4TX9viTkLwg7TkjT0Gq4dtwy-irOzsTKmCvlXgKlrUqQi6BdCebflkuqocI7JAsSgugGGLxdBBE9l9Qfxcue1UrD4DQo5mqn3mDXHpkMbHfP4Kua9F9-ykBwp3sQdC1STSLO4rxfl_4dNUByOuogpQAD1Ty0TAq2xm2A1sRJYCGhaecVmvRIyGYNP1SBVrySBS6fiBFGKA0eketoSHGBzKC6X4NfxqBSHGJafJ7qdM0N8dfcK1fCbtMcPyjEdkuoF_Jd9-P5Ydallyt_tb=w588-h375-no?authuser=0" alt="Object and Box&lt;Number&gt; and Box&lt;Integer&gt;" />
</p>

<p class="note">
<strong>Note</strong>: Given two concrete types A and B (for example, Number and Integer), MyClass&lt;A&gt; has no relationship to MyClass&lt;B&gt;, regardless of whether or not A and B are related.
</p>

<p>
Using the Collections classes as an example, ArrayList&lt;E&gt; implements List&lt;E&gt;, and List&lt;E&gt; extends Collection&lt;E&gt;. So ArrayList&lt;String&gt; is a subtype of List&lt;String&gt;, which is a subtype of Collection&lt;String&gt;. So long as you do not vary the type argument, the subtyping relationship is maintained.
</p>

<p>
<img src="https://lh3.googleusercontent.com/VcqPjlaD4NxIjMuwfh6H9aNDReokvqtSwI0JMzDNS2aZfRgGGPuqWIvpw4-NkBfh8tH8dpGh_b-WcMDKJyHXaWttnlZUzDbO6Clms31w04O6TX598TeEHofr6a6mTCoGDNQms_NzTNqboR1mfzdc4aDfvkEhjfk2eoA4HC3Hcl5RPIvBfcydZhcTnugwlIlju-8RFci1GfLSq5k2YKsyLnTZxIR4qGcg7-mNFTZ0iuAzIcmNk4MTOrsXRlXwW8QOyGRsAaW-cY0guplC3IMAnM9teDlsgQf-fjMO12b20zUd0nQ15hU6PCJEgV96-vxGZWEZEaKbvZ7gD_rckecm24SxHlJ3TkXgOoeF3tm6D-ykETwpVeQ-RbS8w-BmY8rwm92r0Wyp6ua7rd4Hv6GfxtgrRaLjDayXH8JNjcLljERx_tSkmNdPc5G45M4Nv_kDRQGYWSclJWPN9LsAJk9fRGZGN0145HKLx5hMFGMjXUNEk3ZJqzg6uW7NIgDn8perJ0uB7VUgm4NgP8qIdoFDQqgnt56tcT5gHtfgMRkx_CgOXM_ZwwtTleHG0lvKRKsVgVSnOUK9gx2Q93OrcLKMfwyKQg_VMdx0Aot7ErrnFyVE0CsuOgyqw9J0PCp8OjwtC7op0qDVVY_6C1ff9NyoY5JxUEW7g7aAbJgQ-TVJebpIfVXu0mAvjmHoXCYU=w546-h420-no?authuser=0" alt="4" />
</p>

<h3>Type Inference</h3>

<p>
Type inference is the ability of the Java compiler to determine the type arguments by looking at method declarations and calls.
</p>

<p>
The following generic method addBox() defines a type parameter called U.
</p>

<pre style="border: 2px dotted #999; padding: 5px;">
public static &lt;U&gt; void addBox(U u, List&lt;Box&lt;U&gt;&gt; boxes) {...}
</pre>

<p>
To call this generic method, you need to specify the type argument.
</p>

<pre class="prettyprint no-border">BoxDemo.<strong>&lt;Integer&gt;</strong>addBox(Integer.valueOf(10), listOfIntegerBoxes);</pre>

<p>
Due to Type Inference, the user does not need to specify type arguments in most cases. So, you can call the above generic method like a regular method as follows.
</p>

<pre class="prettyprint no-border">BoxDemo.addBox(Integer.valueOf(10), listOfIntegerBoxes);</pre>

<p>
Type Inference allows simple diamond replacement of type arguments required to call the constructor of a generic class.
&lt;&gt; is informally called a diamond.
</p>

<p>
For example, consider the following variable declaration:
</p>

<pre class="prettyprint no-border">Map&lt;String, List&lt;String&gt;&gt; myMap = new HashMap&lt;String, List&lt;String&gt;&gt;();</pre>

<p>
You can substitute the parameterized type of the constructor with an empty set of type parameters (&lt;&gt;):
</p>

<pre class="prettyprint no-border">Map&lt;String, List&lt;String&gt;&gt; myMap = new HashMap<strong>&lt;&gt;</strong>();</pre>

<p>
Constructors can have their own formal type parameters in both generic and non-generic classes.
</p>

<pre class="prettyprint">
class MyClass&lt;X&gt; {
  &lt;T&gt; MyClass(T t) {
    //...
  }
}
</pre>

<p>
The following code creates an instance from MyClass.
</p>

<pre class="prettyprint no-border">MyClass&lt;Integer&gt; myObject = new MyClass&lt;&gt;("");</pre>

<p>
The compiler infers the type Integer for the formal parameter X of the generic class MyClass&lt;X&gt; and the type String for the formal parameter T of the constructor of this generic class. Before Java 7. You had to specify the type arguments as follows.
</p>

<pre class="prettyprint no-border">MyClass&lt;Integer&gt; myObject = new MyClass<strong>&lt;Integer&gt;</strong>("");</pre>

<p>
The inference algorithm makes inferences using invocation arguments and target types.
</p>

<dl class="note">
<dt>Target Types</dt>
<dd>
<pre class="prettyprint no-border">
Integer i = Integer.parseInt("10");
</pre>
The return type of the parseInt method is int, but the type of variable i    that stores this value is Integer. Therefore, the target type is Integer.
</dd>
</dl>

<p>
The following is the Collections' emptyList method declaration.
</p>

<pre class="prettyprint no-border">static &lt;T&gt; List&lt;T&gt; emptyList();
</pre>

<p>
Due to the Type Inference, You can call the Collections' emptyList method like below.
</p>

<pre class="prettyprint no-border">List&lt;String&gt; listOne = Collections.emptyList();</pre>

<p>
List&lt;String&gt; is the target type. Since the emptyList method returns a List&lt;T&gt; type, the compiler infers T is a String. Before Java 7, you have to specify the type of T as follows.
</p>

<pre class="prettyprint no-border">List&lt;String&gt; listOne = Collections.<strong>&lt;String&gt;</strong>emptyList();</pre>

<p>
Let's look at another situation.
</p>

<pre class="prettyprint">void processStringList(List&lt;String&gt; stringList) {
  //process
}
</pre>

<p>
In Java 7,  the following statement does not compile:
</p>

<pre class="prettyprint no-border">processStringList(Collections.emptyList());</pre>

<p>
Java 7 compiler generates the following error message:
</p>

<pre>List&lt;Object&gt; cannot be converted to List&lt;String&gt;</pre>

<p>
Since the compiler needs a value of type T, it starts with the value Object. Therefore, when Collections.emptyList is called, a value of type List&lt;Object&gt; is returned, which is not compatible with the method processStringList. Thus, in Java 7, you must specify the value of the type argument as follows.
</p>

<pre class="prettyprint no-border">processStringList(Collections.<strong>&lt;String&gt;</strong>emptyList());</pre>

<p>
Java 8 extended the notion of a target type to include method arguments. The Java 8 compiler infers the type parameter T as String because the processStringList method needs the List<String> type argument. Thus, in Java 8, the following statement compiles:
</p>

<pre class="prettyprint no-border">processStringList(Collections.emptyList());</pre>

<h3>Wildcards</h3>

<p>
The question mark (?), called the wildcard, represents an unknown type in generic code. You cannot use the wildcard as a type argument for a generic method invocation, a generic class instance creation.
</p>

<h4>Upper Bounded Wildcards</h4>

<p>
To write the method that works on lists of Number and the subtypes of Number, such as Integer, Double, and Float, you would specify List&lt;? extends Number&gt;. The term List&lt;Number&gt; is more restrictive than List&lt;? extends Number&gt; because the former matches a list of type Number only, whereas the latter matches a list of type Number or any of its subclasses.
</p>

<pre class="prettyprint">package net.java_school.examples;

import java.util.Arrays;
import java.util.List;

public class WildCardTest {

  public static double sumOfList(List&lt;? extends Number&gt; list) {
    double s = 0.0;
    for (Number n : list) {
      s += n.doubleValue();
    }
    return s;
  }

  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3);
    System.out.println("sum = " + sumOfList(li));
  }
}
</pre>

<pre class="console"><strong class="console-result">sum = 6.0</strong></pre>

<dl class="note">
<dt>Arrays.asList</dt>
<dd>
The Arrays.asList method converts the specified array and returns a fixed-size list. Note the fixed size. The following causes a runtime error.
<pre class="prettyprint no-border">
List&lt;Integer&gt; list = Arrays.asList(1,2,3);
list.add(4);//Runtime error
</pre>
</dd>
</dl>

<h4>Unbounded Wildcards</h4>

<p>
A wildcard, such as List&lt;?&gt;, is called Unbounded Wildcards. There are two scenarios where an unbounded wildcard is a helpful approach:
</p>

<ul>
    <li>If you are writing a method that can be implemented using functionality provided in the Object class.</li>
    <li>If you are writing the code using methods in the generic class that don't depend on the type parameter. For example, List.size or List.clear. Class&lt;?&gt; is often used because most Class&lt;T&gt; methods do not depend on T.</li>
</ul>

<p>
Consider the following method, printList:
</p>

<pre class="prettyprint">package net.java_school.examples;

import java.util.Arrays;
import java.util.List;

public class PrintListTest {
  <strong>public static void printList(List&lt;Object&gt; list) {</strong>
    <strong>for (Object elem : list) {</strong>
      <strong>System.out.print(elem + " ");</strong>
    <strong>}</strong>
    <strong>System.out.println();</strong>
  <strong>}</strong>

  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3);
    List&lt;String&gt; ls = Arrays.asList("one","two","three");
    printList(li);//compile-time error
    printList(ls);//compile-time error
  }
}
</pre>

<p class="note">
<strong>Note</strong>: The following compilation error occurs in printList(li); and printList(ls);.<br />
<em>The method printList(List&lt;Object&gt;) is not applicable for the arguments (List&lt;Integer&gt;)</em><br />
<em>The method printList(List&lt;Object&gt;) is not applicable for the arguments (List&lt;String&gt;)</em>
</p>

<p>
The goal of printList is to print a list of any type, but it fails to achieve that goal — it prints only a list of Object instances; it cannot print List&lt;Integer&gt;, List&lt;String&gt;, List&lt;Double&gt;, and so on, because they are not subtypes of List&lt;Object&gt;.
</p>

<p>
To write a generic printList method, use List&lt;?&gt;. Because for any concrete type A, List&lt;A&gt; is a subtype of List&lt;?&gt;, you can use printList to print a list of any type:
</p>

<pre class="prettyprint">package net.java_school.examples;

import java.util.Arrays;
import java.util.List;

public class PrintListTest {
  public static void printList(<strong>List&lt;?&gt;</strong> list) {
    for (Object elem : list) {
      System.out.print(elem + " ");
    }
    System.out.println();
  }

  public static void main(String[] args) {
    List&lt;Integer&gt; li = Arrays.asList(1,2,3);
    List&lt;String&gt; ls = Arrays.asList("one","two","three");
    printList(li);
    printList(ls);
  }
}
</pre>

<pre class="console"><strong class="console-result">1 2 3
one two three</strong></pre>

<h4>Lower Bounded Wildcards</h4>

<p>
A lower bounded wildcard is expressed using the wildcard character ('?'), followed by the super keyword, followed by its lower bound: &lt;? super A&gt;.
</p>

<p>
To write the method that works on lists of Integer, the supertypes of Integer, such as Integer, Number, and Object, you would specify List&lt;? super Integer&gt;. The term List&lt;Integer&gt; is more restrictive than List&lt;? super Integer&gt; because the former matches a list of type Integer only, whereas the latter matches a list of any type that is a supertype of Integer.
</p>

<pre class="prettyprint">public static void addNumbers(List&lt;<strong>? super Integer</strong>&gt; list) {
  for (int i = 1; i &lt;= 10;i++) {
    list.add(i);
  }
}
</pre>

<h4>Wildcards and Subtyping</h4>

<p>
Although Integer is a subtype of Number, List&lt;Integer&gt; is not a subtype of List&lt;Number&gt;, and these two types are not related. The common parent of List&lt;Number&gt; and List&lt;Integer&gt; is List&lt;?&gt;.
</p>

<p>
<img src="https://lh3.googleusercontent.com/ZsYjp1PDQQ0PByc1w7T66x98C2zrMvTqi8lW6q7-8lIOwDNU5zYRmNmHfSm_P3T6SZsJ_zZwqg1vsNznRk6PsH3jBgDJX5FV8txRsBxzJ6k3D1xADButb3TgwpqrcR3X0_VDPsYgQ6fcKDr1ulEAZ2hVvXCMvKwm2_CK3X1p9upyIuzOXBSUvGX_Y6Z0QVca2sboUSjjSNs2RllVJEwaGtrFwmnNd2PmNfottAfbdGNKKxEO-9TWgLMU4qekBcxh3IX9C30srAykqcGmkA59irL0LMBaHmbjuGwfNuVd_hJ8n89Hek3oGplXl1w9dFBKnlT8zbUZl7Lxt6e07qzUju_FglqhUTOMVb8fEs9p7WHyreab9sJ2udeuxCY_P1Swhot9Ea5PmGEF4Uk9Hx_GcQZYythjHO8bBPaErtaGrNV5q-uA0xR5aMpjkjN4KubqxT0csPRxDmBO8_xxUz2d5zG4PEOnnmNwOTRZAT8IFuSco6Y0no5aiDi-oj_BgCHGQ-t_X9Uati4-lDNm9ycKuYzft65OPFET2_Oa6830UiWwaRPJY-1uix8384wtlOlhCwjkmpynVFiBUpj2sVnouldGAEeJ-N68pZnVyfupCYtMFHlCRH1-FRfGDM-NUonSoHWVPAalJJccGb3iqZWvq9opOKuqvskQrb9G_VLzs-L8LsptXciJaXcs1HJ5=w570-h191-no?authuser=0" alt="Generic listParent" />
</p>

<h3>Type Erasure</h3>

<p>
For generics, the Java compiler applies type erasure to:
</p>

<ul>
	<li>Replace all type parameters in generic types with their bounds or Object if the type parameters are unbounded. Therefore, the produced bytecode contains only regular classes, interfaces, and methods.</li>
	<li>Insert type casts if necessary to preserve type safety.</li>
	<li>Generate bridge methods to preserve polymorphism in extended generic types.</li>
</ul>

<p>
Consider the following generic class that represents a node in a singly linked list:
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Node&lt;T&gt; {

  private T data;
  private Node&lt;T&gt; next;

  public Node(T data, Node&lt;T&gt; next) {
    this.data = data;
    this.next = next;
  }

  public T getData() {
    return data;
  }
}
</pre>

<p>
Because the type parameter T is unbounded, the Java compiler replaces it with Object:
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Node {

  private Object data;
  private Node next;

  public Node(Object data, Node next) {
    this.data = data;
    this.next = next;
  }

  public Object getData() {
    return data;
  }
}
</pre>

<p>
In the following example, the generic Node class uses a bounded type parameter:
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Node&lt;T extends Comparable&lt;T&gt;&gt; {

  private T data;
  private Node&lt;T&gt; next;

  public Node(T data, Node&lt;T&gt; next) {
    this.data = data;
    this.next = next;
  }

  public T getData() {
    return data;
  }
}
</pre>

<p>
The Java compiler replaces the bounded type parameter T with the first bound class, Comparable:
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Node {

  private Comparable data;
  private Node next;

  public Node(Comparable data, Node next) {
    this.data = data;
    this.next = next;
  }

  public Comparable getData() {
    return data;
  }
}
</pre>

<p>
The Java compiler also erases type parameters in generic method arguments. Consider the following generic method:
</p>

<pre class="prettyprint">//Counts the number of occurrences of elem in anArray.
public static &lt;T&gt; int count(T[] anArray, T elem) {
  int cnt = 0;
  for (T e : anArray) {
    if (e.equals(elem)) {
      ++cnt;
    }
  }
  return cnt;
}
</pre>

<p>
Because T is unbounded, the Java compiler replaces it with Object:
</p>

<pre class="prettyprint">public static int count(Object[] anArray, Object elem) {
  int cnt = 0;
  for (Object e : anArray) {
    if (e.equals(elem)) {
      ++cnt;
    }
  }
  return cnt;
}
</pre>

<p>
Suppose the following classes are defined:
</p>

<pre style="border: 2px dotted #999; padding: 5px;">class Shape { /* ... */ }
class Circle extends Shape { /* ... */ }
class Rectangle extends Shape { /* ... */ }
</pre>

<p>
You can write a generic method to draw different shapes:
</p>

<pre class="prettyprint no-border">public static &lt;T extends Shape&gt; void draw(T shape) { /* ... */ }</pre>

<p>
The Java compiler replaces T with Shape:
</p>

<pre class="prettyprint">public static void draw(Shape shape) { /* ... */ }</pre>

<h4>Effects of Type Erasure and Bridge Methods</h4>

<p>
Sometimes type erasure causes a situation that you may not have anticipated. The following example shows how this can occur.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Box&lt;T&gt; {

  private T t;

  public void set(T t) {
    this.t = t;
  }

  public T get() {
    return t;
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class IntBox extends Box&lt;Integer&gt; {

  @Override
  public void set(Integer t) {
    super.set(t);
  }

  @Override
  public Integer get() {
    return super.get();
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class BoxTest {

  public static void main(String[] args) {
    IntBox ibox = new IntBox();
    Box box = ibox;
    box.set("Hello World!");//runtime error!
  }
}
</pre>

<p>
<b>box.set("Hello World!")</b> throws Runtime exception as follows:
</p>

<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer
	at net.java_school.examples.IntBox.set(IntBox.java:1)
	at net.java_school.examples.BoxTest.main(BoxTest.java:8)</strong></pre>

<p>
<strong>ClassCastException</strong>: The message "java.lang.String can not be cast to java.lang.Integer" is due to the bridge method created by the compiler. Box and IntBox are changed through the type erase process as follows.
</p>

<p>
When compiling a class or interface that extends a parameterized class or implements a parameterized interface, the compiler may need to create a synthetic method called a bridge method as part of the type erasure process. You usually don't need to worry about bridge methods, but you might be puzzled if one appears in a stack trace.
</p>

<p>
After type erasure, the Box and intBox classes become:
</p>

<pre class="prettyprint">package net.java_school.examples;

public class Box {

  public Object t;

  public Object set(Object t) {
    this.t = t;
  }

  public void get(Object t) {
    return t;
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class IntBox extends Box {

  @Override
  public void set(Integer t) {
    super.set(t);
  }

  <strong>//Bridge method generated by the compiler</strong>
  <strong>public void set(Object t) {</strong>
    <strong>setData((Integer) t);</strong>
  <strong>}</strong>

  @Override
  public Integer get(Integer t) {
    return super.get();
  }
}
</pre>

<p>
After type erasure, the method signatures do not match. The Box's set(T) becomes set(Object). As a result, the IntBox set(Integer) method does not override the Box set(Object) method.
</p>

<p>
A Java compiler generates a bridge method to ensure that subtyping works as expected to solve this problem and preserve the polymorphism of generic types after type erasure.
</p>

<p>
For the IntBox class, the compiler generates the following bridge method for the set(Integer).
</p>

<pre class="prettyprint">//Bridge method generated by the compiler
public void set(Object t) {
  set((Integer) t);
}
</pre>

<p>
The bridge method IntBox.set(Object) delegates to the original IntBox.set(Integer) method. As a result, the box.set("Hello World!"); statement calls the method IntBox.set(Object), and a ClassCastException is thrown because "Hello World!" can't be cast to Integer.
</p>

<h4>Non-Reifiable Types</h4>

<p>
A reifiable type is a type whose type information is fully available at runtime. It includes primitives, non-generic types, raw types, and invocations of unbound wildcards.
</p>

<p>
Non-reifiable types are types where information has been removed at compile-time by type erasure — invocations of generic types that are not defined as unbounded wildcards. A non-reifiable type does not have all of its information available at runtime. Examples of non-reifiable types are List&lt;String&gt; and List&lt;Number&gt;; the JVM cannot tell the difference between these types at runtime.
</p>

<h4>Heap Pollution</h4>

<p>
Variable of a parameterized type referring to not parameterized type object occurs heap pollution. This situation occurs if the program performed some operation that gives rise to an unchecked warning at compile-time. An unchecked warning appears if, either at compile-time (within the limits of the compile-time type checking rules) or runtime, you cannot verify the correctness of an operation involving a parameterized type (for example, a cast or method call). For example, heap pollution occurs when mixing raw and parameterized types or performing unchecked casts.
</p>

<p>
In typical situations, when compiling all code simultaneously, the compiler issues an unchecked warning to draw your attention to potential heap pollution. But when you compile sections of your code separately. It is difficult to detect the potential risk of heap pollution. If you ensure that your code compiles without warnings, then no heap pollution can occur.
</p>

<h4>Potential Vulnerabilities of Varargs Methods with Non-Reifiable Formal Parameters</h4>

<p>
Generic methods that include vararg input parameters can cause heap pollution.
</p>

<p class="note">
<strong>Note</strong>: Varargs is a feature introduced in Java 5. It allows a method to take an arbitrary number of values as arguments.
</p>

<pre class="prettyprint">package net.java_school.examples;

public class VarargsTest {

  public static void sum(<strong>int ... a</strong>) {
    int sum = 0;
    for (int i : a) {
      sum += i;
    }
    ystem.out.println(sum);
  }
	
  public static void main(String[] args) {
    sum();
    sum(1);
    sum(1,2,3);
    sum(1,2,3,4);
  }
}
</pre>

<pre class="console"><strong class="console-result">0
1
6
10</strong></pre>

<p>
Consider the following ArrayBuilder class:
</p>

<pre class="prettyprint">public class ArrayBuilder {

  public static &lt;T&gt; void addToList (List&lt;T&gt; listArg, T... elements) {
    for (T x : elements) {
      listArg.add(x);
    }
  }

  public static void faultyMethod(List&lt;String&gt;... l) {
    Object[] objectArray = l;     // Valid
    objectArray[0] = Arrays.asList(42);
    String s = l[0].get(0);       // ClassCastException thrown here
  }

}
</pre>

<p>
The following example, HeapPollutionExample, uses the ArrayBuiler class:
</p>

<pre class="prettyprint">public class HeapPollutionExample {

  public static void main(String[] args) {

    List&lt;String&gt; stringListA = new ArrayList&lt;String&gt;();
    List&lt;String&gt; stringListB = new ArrayList&lt;String&gt;();

    ArrayBuilder.addToList(stringListA, "Seven", "Eight", "Nine");
    ArrayBuilder.addToList(stringListB, "Ten", "Eleven", "Twelve");
    List&lt;List&lt;String&gt;&gt; listOfStringLists =
      new ArrayList&lt;List&lt;String&gt;&gt;();
    ArrayBuilder.addToList(listOfStringLists,
      stringListA, stringListB);

    ArrayBuilder.faultyMethod(Arrays.asList("Hello!"), Arrays.asList("World!"));
  }
}
</pre>

<p>
When compiled, the following warning occurs by the definition of the ArrayBuilder.addToList method:
</p>

<pre class="prettyprint">warning: [varargs] Possible heap pollution from parameterized vararg type T</pre>

<p>
When the compiler encounters a varargs method, it translates the varargs formal parameter into an array. However, the Java programming language does not permit the creation of arrays of parameterized types. In the method ArrayBuilder.addToList, the compiler translates the varargs formal parameter T... elements to the formal parameter T[] elements, an array. However, the compiler converts the varargs formal parameter to Object[] elements because of type erasure. Consequently, there is a possibility of heap pollution.
</p>

<p>
The following statement assigns the varargs formal parameter l to the Object array objectArgs:
</p>

<pre class="prettyprint no-border">Object[] objectArray = l;</pre>

<p>
This statement can potentially introduce heap pollution.
</p>

<h3>Restrictions on Generics</h3>

<p>
To use Java generics effectively, you must consider the following restrictions:
</p>

<ul>
	<li>Cannot Instantiate Generic Types with Primitive Types</li>
	<li>Cannot Create Instances of Type Parameters</li>
	<li>Cannot Declare Static Fields Whose Types are Type Parameters</li>
	<li>Cannot Use Casts or instanceof With Parameterized Types</li>
	<li>Cannot Create Arrays of Parameterized Types</li>
	<li>Cannot Create, Catch, or Throw Objects of Parameterized Types</li>
	<li>Cannot Overload a Method Where the Formal Parameter Types of Each Overload Erase to the Same Raw Type</li>
</ul>

<h4>Cannot Instantiate Generic Types with Primitive Types</h4>

<p>
Consider the following parameterized type:
</p>

<pre class="prettyprint">class Password&lt;T&gt; {
  private T t;

  public Password(T t) {
    this.t = t;
  }
}
</pre>

<p>
When creating a Password object, you cannot substitute a primitive type for the type parameter T:
</p>

<pre class="prettyprint no-border">Password&lt;int&gt; pw = new Password&lt;&gt;(19019);//compile-time error
</pre>

<h4>Cannot Create Instances of Type Parameters</h4>

<p>
You cannot create an instance of a type parameter. For example, the following code causes a compile-time error:
</p>

<pre class="prettyprint">public static <strong>&lt;E&gt;</strong> append(List&lt;E&gt; list) {
  <strong>E elem = new E();</strong>//compile-time error
  list.add(elem);
}
</pre>

<h4>Cannot Declare Static Fields Whose Types are Type Parameters</h4>

<p>
A class's static field is a class-level variable shared by all non-static objects of the class. Hence, static fields of type parameters are not allowed. Consider the following class:
</p>

<pre class="prettyprint">public class MobileDevice&lt;T&gt; {
  private static T os;

  // ...
}
</pre>

<p>
If static fields of type parameters were allowed, then the following code would be confused:
</p>

<pre class="prettyprint">MobileDevice&lt;Smartphone&gt; phone = new MobileDevice&lt;&gt;();
MobileDevice&lt;Pager&gt; pager = new MobileDevice&lt;&gt;();
MobileDevice&lt;TabletPC&gt; pc = new MobileDevice&lt;&gt;();
</pre>

<p>
Because the static field os is shared by phone, pager, and pc, what is the actual type of os? It cannot be Smartphone, Pager, and TabletPC at the same time. You cannot, therefore, create static fields of type parameters.
</p>

<h4>Cannot Use Casts or instanceof With Parameterized Types</h4>

<p>
Because the Java compiler erases all type parameters in generic code, you cannot verify which parameterized type for a generic type is being used at runtime:
</p>

<pre class="prettyprint">public static &lt;E&gt; void rtti(List&lt;E&gt; list) {
  if (list instanceof ArrayList&lt;Integer&gt;) { //compile-time error
    //..
  }
}
</pre>

<p>
The runtime does not distinguish between ArrayList<Integer> and ArrayList<String>. The most you can do is to use an unbounded wildcard to verify that the list is an ArrayList:
</p>

<pre class="prettyprint">public static void rtti(List&lt;?&gt; list) {
  if (list instanceof ArrayList&lt;?&gt;) { //OK; instanceof requires a reifiable type
    //..
  }
}
</pre>

<h4>Cannot Create Arrays of Parameterized Types</h4>

<p>
You cannot create arrays of parameterized types. For example, the following code does not compile:
</p>

<pre class="prettyprint no-border">List&lt;Integer&gt;[] arrayOfLists = new ArrayList&lt;Integer&gt;[2];//compile-time error
</pre>

<p>
The following code illustrates what happens when you insert different types into an array:
</p>

<pre class="prettyprint">Object[] strings = new String[2];
strings[0] = "Hello"; //OK
strings[1] = 2019;//An ArrayStoreException is thrown.
</pre>

<p>
If you try the same thing with a generic list, there would be a problem:
</p>

<pre class="prettyprint">Object[] stringLists = new List&lt;String&gt;[]; //compiler error, but pretend it's allowed
stringLists[0] = new ArrayList&lt;String&gt;();// OK
stringLists[1] = new ArrayList&lt;Integer&gt;();// An ArrayStoreException should be thrown, but the runtime can't detect it.
</pre>                                            

<p>
If arrays of parameterized lists were allowed, the previous code would fail to throw the desired ArrayStoreException.
</p>

<h4>Cannot Create, Catch, or Throw Objects of Parameterized Types</h4>

<p>
A generic class cannot extend the Throwable class directly or indirectly. For example, the following classes will not compile:
</p>

<pre class="prettyprint">// Extends Throwable indirectly
class MathException&lt;T&gt; extends Exception { .. } //compile-time error
</pre>

<pre class="prettyprint">// Extends Throwable directly
class QueneFullException&lt;T&gt; extends Throwable { .. } //compile-time error
</pre>

<p>
A method cannot catch an instance of a type parameter.
</p>

<pre class="prettyprint">public static &lt;T extends Exception&gt; void execute(List&lt;T&gt; jobs) {
  try {
    for (T job : jobs) {
      //..
    }
  } catch (T e) {//compile-time error: Cannot use the type parameter T in a catch block
    //..
  }
}
</pre>

<p>
You can, however, use a type parameter in a throws clause:
</p>

<pre class="prettyprint">class Parser&lt;T extends Exception&gt; {
  public void parse(File file) throws T { //OK
    //..
  }
}
</pre>

<h4>Cannot Overload a Method Where the Formal Parameter Types of Each Overload Erase to the Same Raw Type</h4>

<p>
A class cannot have two overloaded methods that will have the same signature after type erasure.
</p>

<pre class="prettyprint">public class Example {
  public void print(Set&lt;String&gt; strSet) { .. }
  public void print(Set&lt;Integer&gt; intSet) { .. }
}
</pre>

<p>
The above code will generate a compile-time error.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://docs.oracle.com/javase/tutorial/java/generics/types.html">https://docs.oracle.com/javase/tutorial/java/generics/types.html</a></li>
</ul>

</article>
