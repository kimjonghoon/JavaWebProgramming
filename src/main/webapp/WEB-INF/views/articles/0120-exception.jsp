<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>예외</h1>

<p>
예외(exception)란 일반적이지 않음을 의미한다.<br />
'에스컬레이터가 갑자기 멈추는 예외적인 상황'이라고 할 때 바로 그 예외다.
</p>

<p>
자바 API를 사용하면서 발생할 수 있는 모든 예외 상황에 대응하는 예외 클래스가 자바 API에 있다.<br />
예외 상황이 발생하면 JVM은 해당하는 예외 클래스로부터 객체를 생성하여 예외를 발생시킨 코드에 던진다.<br />
예외 객체를 생성하여 던지는 것까지 JVM이 책임진다.
발생한 예외 객체를 어떻게 핸들링할지는 프로그래머 몫이다.<br />
프로그래머는 생성된 예외 객체를 try, catch와 finally 블록을 사용하여 통제할 수 있다.<br />
프로그램 소스에서 말하는 블록이란 { 와 } 사이의 코드를 말한다.<br />
자바에선 블록 안에서 선언한 변수는 블록 안에서만 유효하다. 즉, 블록 밖에서 사용할 수 없다.
</p>

<p>
예외도 에러라고 할 수 있지만, 자바에선 예외와 에러를 구별한다.<br />
자바 에러는 예외와 달리 코드로 통제할 수 없다.<br />
에러가 발생하면 프로그램은 종료된다.<br />
에러가 발생할 때 프로그래머가 할 수 있는 일은 거의 없다.
</p>

<p>
예외 클래스는 상속으로 계층 구조를 가진다.<br />
Exception 클래스는 모든 예외 클래스의 최상위 클래스다.
</p>

<h2>예외를 잡아서 처리하는 코드</h2>

<pre class="prettyprint">
try {
  //A, B 예외가 발생할 수 있는 코드
  //B는 계층 구조에서 A보다 위에 있다고 가정
} catch (A e) { //e에는 발생한 A 타입 예외 레퍼런스가 할당된다.
  //A 예외가 발생했을 때 실행되는 코드
} catch (B e) {
  //B 예외가 발생했을 때 실행되는 코드
} finally {
  //예외 발생과 상관없이 무조건 실행되는 코드
}
</pre>

<p>
예외를 잡아서 처리하는 코드는 try, catch, finally 블록으로 구성된다.<br />
예외를 잡아서 처리하는 코드에서 finally 블록은 선택사항이다.
</p>

<p>
try 블록은 예외가 발생할 수 있는 코드를 감싸는 블록으로 단독으로 쓸 수 없다.<br />
try 블록은 catch 블록이나 finally 블록과 함께 사용해야 한다.
</p>

<p>
try 블록에서 발생한 예외를 잡으려면 catch 블록을 사용한다.<br />
catch 블록은 여러 개를 겹쳐 사용할 수 있다.<br />
catch 블록을 겹쳐 사용하면 발생한 예외에 따라 섬세한 통제가 가능하다.
</p>

<p>
finally 블록은 예외가 발생하든 발생하지 않든 무조건 실행된다.<br />
finally 블록은 여러 개를 겹쳐 사용할 수 없다.
</p>

<h2>예외가 전달되는 방식</h2>

<p>
method1는 method2를 호출하고 method2는 method3를 호출한다고 가정한다.<br />
<img src="https://lh3.googleusercontent.com/K3UACunLKTLY7LVG-8at3eGtxnlN40lsoUY2zCQFR6unJVRHyyQCvVrEXsazAZWJFPt6JostjTrZAS_EtdpwFIHcuNNEBlgNj0ky8pK6NE9cV5jnTjFiVQJbnwpx9N9I_MXraOdHCLnHa2tc5gdtY1cyJPGEeBVDd-PpxHU7SzubLrmPlRvrxLOPgUtnwqf3aUfDwFON-WFCkw1gYfxQ7cyZFrn9sEfwZi9cvm1EbT0yy6ruf153sohkL65YPGgGJOyNc_hShiBsYqQ8ZRnpGGMDx1k37HssWwAEomhJlp1D1odAuX1q3p2ocgcxTYSBuG5o63KNyWntjRvhgfXtOfUbHBxmWmEdSpJzL-2xJsiOAVWvkcTXzZEg9nyIJvY4kPmKnAWGQKqItDZdxIH0yFEo6bLSoXpYnMp6eKI8C0DgMSmDr71DPOjhpGtcabfZIei0xquRXu_fzIQCZLl2xxEILZQih7pxxzUSlh0qMzKFzCL8zdDk4TrjXAuJMMDUQtMtSYRGSqITQOINH3qFRSfWAoAgaDxg9eBVd8Pz8hbs4YGHDB5ofMvm4Z86DyBNfPdiaDXv1QE-w-NsXIleTYSqV08TazMF2KSyNCTUXA=w600-h256-no" alt="예외 매커니즘" /><br />
method3에서 예외가 발생했고 method3에서 catch 블록으로 예외를 잡지 않는다면 예외 객체는 method3를 호출한 method2로 전달된다.<br />
method2에서도 해당 예외 객체를 잡는 catch 블록이 없다면 method2를 호출한 method1로 예외 객체가 전달된다.<br />
이런 식으로 예외 객체가 JVM까지 전달되면 프로그램은 종료된다.<br />
catch 블록에 잡힌 예외 객체는 다른 곳으로 전달되지 않는다.<br />
굳이 이 예외 객체를 전달하려면, 프로그래머가 catch 블록에 예외를 던지는 코드를 추가해야 한다.
</p>


<h3>예외 클래스 계층 구조</h3>

<p>
아래 그림은 예외 클래스 계층의 일부분을 보여준다.<br />
<img src="https://lh3.googleusercontent.com/HxTwf_0OFEqI2B4LioJ7KjbK62ZvI0mvx0hLYD3bXci_m96ndspOwWfakVdQda37udd0efrC0hM7uW-kUMng1czT7OLGPNypLtk8ca__F6g3MQ7ar6mBNJJxaxRrhquT4or1ySOSzXusufwujhBXLR_yRy07qfepRNEf_r1D8UxhcMy9GvoMCKZEnH1CFY-bKKFWpFVxTL1vgHZDnv1PRza7udnRrDWLiZxhjwFswPaox-gMzJcMfwn5zLEPAsq5ru1Y1Kr1rsWJMtUr5wkgyICMbStXtiNzmL_jwoF8hftuGAVCJ_o3LNT7VyQKb57PGnSComNIDD5qMLBR277f14AtMNTLHDEwWiwTKpy4CXjnS7RqNRbnjvLLNkKPeRkI2iqI2uk4VulyUhooTR6Fsw6wuzMUJW-8gJxbh6qn4eTtT5DxYQ2vOzGRvUHVu7phWVCDpHGycXAJVX0ZHa9MeqzPG552pQHM0T7gJzJIIxK_45O6J9QlX1YeRaEiSIEX4eY01WMFzmhzHZQgQ99giaeoglCan7BsKbFcTFuxvDdiR2Slv62sw_ElrW6NU2MhVojYBKdIHNqIrjnws78T1MRHKU6VPGRmuKn8gmS9NEhSR6QWykjSer0L=w390-h141-no" alt="Exception API" style="width: 100%;" /><br />
</p>

<h3>자주 발생하는 예외</h3>

<p>
런타임(Runtime) 예외는 자주 발생한다.<br />
다음 표는 런타임 예외가 발생하는 코드를 보여준다.<br />
</p>

<table>
<tr>
  <th style="width: 22em;">런타임 예외가 발생하는 코드</th>
  <th>런타임 예외 타입</th>
</tr>

<tr>
  <td>int a = 12/0;</td>
  <td>ArithmeticException</td>
</tr>

<tr>
  <td>
  Date d = null;<br />
  String date = d.toString();
  </td>
  <td>NullPointerException</td>
</tr>

<tr>
  <td>int arr = new int[-1];</td>
  <td>NegativeArraySizeException</td>
</tr>

<tr>
  <td>
  int[] arr = new int[2];<br />
  arr[2] = 1;
  </td>
  <td>ArrayIndexOutOfBoundException</td>
</tr>
</table>

<h3>throws 키워드</h3>
<p>
throws 키워드는 메소드를 선언할 때 사용한다.
</p>

<pre class="prettyprint">public void someMethod() <strong>throws IOException</strong> {
  //구현
}
</pre>

<p>
<strong>throws IOException</strong>는 메소드 밖으로 IOException 예외 객체가 나올 수 있게 한다.<br />
이를 'IOExcption 예외 객체를 외부로 던질 수 있다'고 표현한다.<br />
이 메소드를 호출하는 코드는, 컴파일 에러를 피하려면, 자신에게 올 수 있는 IOException 예외 객체를 핸들링하는 코드를 갖추어야 한다.<br />
위의 someMethod()를 호출하는 메소드에 필요한 예외 핸들링 코드는 두 가지 방식이 있다.
</p>

<ol>
        <li>IOException 예외를 던지는 메소드를 호출하는 메소드 역시, IOException이거나 또는 IOException의 슈퍼 타입 예외를 던지도록 선언한다.<br />
        이 방법은 전달받은 예외를 다시 자신을 호출한 메소드에 전달하는, 일종의 책임 전가다.</li>
        <li>IOException 예외를 던지는 메소드를 호출하는 메소드내에서 try ~ catch 구문을 사용해 전달받은 예외 객체를 잡아서 처리한다.</li>
</ol>

<p>
IOException을 던지는 메소드를 호출하는 메소드는, 컴파일 에러를 피하려면 예외를 핸들링하는 방법을 선택해 코드에 반영해야 한다.
</p>

<p>
예외가 메소드 밖으로 나오게 하려면 <strong>throws 예외_클래스</strong>로 메소드를 선언해야 한다.<br />
메소드 밖으로 나올 수 있는 예외 객체가 여러 개라면 throws 다음에 콤마를 사용해서 메소드 밖으로 나올 수 있는 예외 클래스 모두를 열거해야 한다.<br />
</p>

<pre class="prettyprint no-border">throws 예외_클래스1,예외_클래스2,...
</pre>

<p>
예외_클래스1과 예외_클래스2의 슈퍼 클래스가 같다면 슈퍼 클래스를 사용해 메소드를 선언할 수 있다.<br />
최상위 예외 클래스가 Exception이므로 위 문장은 아래처럼 줄일 수 있다.
</p>

<pre class="prettyprint no-border">throws Exception
</pre>

<p>
메소드에서 발생하는 예외가 런타임 예외밖에 없다면 throws 문장을 생략할 수 있다.<br />
런타임 예외 객체는 throws 문장과 상관없이 메소드 밖으로 나올 수 있다.<br />
런타임 예외를 반환할 수 있는 메소드를 호출하는 메소드는 예외 핸들링 코드가 없어도 컴파일된다.
</p>

<dl class="note">
<dt>unchecked 와 checked</dt>
<dd>
컴파일러가 예외 핸들링 코드가 있는지 없는지 검사하느냐에 따라, RuntimeException과 그 서브 클래스를 unchecked, 그 외 예외 클래스를 checked 예외라 구분한다.
</dd>
</dl>

<h3>예제</h3>

<p>
<strong>unchecked 예외</strong> 예제부터 보자.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
        
  public static void method2() {
    method3();
  }

  public static void method3() {
    <strong>int a = 12 / 0;</strong>
    System.out.println(a);
  }
        
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
예제는 에러 없이 컴파일된다.
method3()에서 발생하는 예외는 unchecked 예외로, 컴파일러는 예외 핸드링 코드가 있는지 검사하지 않는다.
실행하면 int a = 12 / 0; 라인에서 생성된 ArithmeticException 예외 객체가 JVM까지 도달한다.
(컴파일러가 예외 핸들링 코드가 있는지 검사하지 않는다고 하더라도 예외 핸들링 코드가 필요 없는 게 아니다)
JVM은 아래처럼 예외가 발생한 스택을 위에서부터 차례로 출력하고 프로그램을 강제 종료한다.
예제는 정상 종료되지 않았다.
정상 종료를 확인하기 위해서 메인 메소드 마지막 라인에 "정상 종료"를 출력하는 코드를 두었다. 
</p>
    
<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ArithmeticException: / by zero
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)</strong></pre>

<dl class="note">
<dt>Stack</dt>
<dd>
스택이란 나중에 넣을수록 먼저 꺼닐 수 있는 자료구조다.
밑이 막히고 위가 열린 상자에 생각하면 이해하기 쉽다.
메소드가 호출되면 메소드를 실행하기 위한 메모리 공간이 만들어지고 스택에 쌓인다.
스택은 지역 변수가 저당되는 공간이다.
지역 변수<sup>Local Variables</sup>란 메소드 바디에서 선언한 변수를 말한다.
메소드가 종료되면 스택에서 메소드가 차지하는 공간은 반환된다. 이때 메소드의 지역 변수 역시 사라진다.
</dd>
</dl>

<p>
다음 그림에서 메소드 실행 순서에 따라 스택에 쌓이는 메모리 공간과 JVM이 예외의 원인을 추적하여 출력하는 메시지를 비교하라.<br />
<img src="https://lh3.googleusercontent.com/Zkfzaq1ePEAuyq17cz0KZV71KvUbfgR2YZWdWseLdmihP9D9fRfAujOLkJ0HVIaoysl3H1p0PnKxF2arL_eb3iupvpcMSPJAZnr4z9EeQWAQihUMZ9Ptq3_onymFOiKTdAuRjeTltLzDkNp3L7YpJUepp-fnW4A_yYXykB7o0O8Xha-_L-9ZLD6H1VzcUOaT3W0ZUl6gNir4XlnuUGkWcJ6Rd6myU4CIS645w7mudZKLd5096RXsyzgwFzoXjc-Vi-5HZ0nrF3v33kLG9PmY54ikwTCOay0qd0psl5VwW9hj2AnXPb5BDbNLjhdznevGSwSlFy1Tye-NGrmhsSjGdM8tsx9EybLR7-EENKeRDnS35afy-4LBT_tMG7JSURasgJvrCm2T4JQSQyHxDmw6aIM-xBpUvqifuVYr40ICr7fVLlTPAdJ0TA77kkCy6I3356PI4zD_-enTGhSitObl1rUj7-gL0Jy0l3WPKuKUrU1c_Du86kOsaZRSQztnFSeVKHdKlyefM8Fh-oRqYjuNiMM7J3ghs-DnFvOopjWV65LtrsSpV88FMdIDBeK9yOKJ5-rLr74UYzhqK7L--ufAhEtU7bZpYjnWuQhYeVNnuZkuf-050G-xRp8jr07BlZg7eCLpaQYQGpTUUqM7QbmQc6dJgYQ8Te7ntmDgvzenJGhF68nVSORBBpERpnPo=w1053-h683-no?authuser=0" alt="source stack printStackTrace" /><br />
</p>

<p>
method3()에 try ~ catch 문을 사용하여 예외를 핸들링하는 코드를 추가한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }

  public static void method2() {
    method3();
  }

  public static void method3() {
    <strong>try {</strong>
      int a = 12 / 0;
      System.out.println(a);
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }

  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");	
  }

}
</pre>

<pre class="console"><strong class="console-result">/ by zero
정상 종료
</strong></pre>

<p>
catch 블록의 System.out.println(e.getMessage()); 문이  <strong>/ by zero</strong>를 출력하고  method1()이 끝난다.<br />
그다음 메인 메소드의 마지막 줄이 <strong>정상 종료</strong>를 출력한다.
</p>    

<p>
Ctrl + Z로 코드를 되돌리고 method2()에서 try ~ catch 블록으로 예외 객체를 잡도록 수정한다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }

  public static void method2() {
    <strong>try {</strong>
      method3();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }

  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }

  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
method3()에서 발생한 예외 객체는 method2()에 전달된다.<br />
메소드가 값을 반환하는 동작과 비슷하다.<br />
method2()의 catch 블록이 실행되어 method2()가 종료된다.<br /> 
이어서 메인 메소드의 마지막 줄이 실행된다.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
정상 종료
</strong></pre>

<p>
Ctrl + Z로 코드를 되돌리고 method1()에서 예외를 다루도록 수정한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>try {</strong>
      method2();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
  }

  public static void method2() {
    method3();
  }

  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }

  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
method3()에서 발생한 예외 객체가 method1()까지 전달된다.
method1()에서 예외 객체를 잡았기 때문에 비정상 종료를 피할 수 있다.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
정상 종료
</strong></pre>

<p>
코드를 되돌리고 메인 메소드에서 예외를 핸들링하도록 수정한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    <strong>try {</strong>
      method1();
    <strong>} catch (ArithmeticException e) {
      System.out.println(e.getMessage());
    }</strong>
	
    System.out.println("정상 종료");
  }

}
</pre>

<p>
main()까지 예외 객체가 전달된다.
main()에서 예외 객체를 잡았기 때문에 예제는 정상 종료된다.
</p>

<pre class="console"><strong class="console-result">/ by zero
정상 종료
</strong></pre>

<p>
try 블록이 나오면 대부분 catch 블록이 뒤따른다.<br />
하지만 try와 catch 블록 조합이 필수는 아니다.<br />
try 블록은 단독으로 사용할 수 없으니, 예제에서 catch 블록을 제거하고 그 자리에 finally 블록을 사용하도록 수정한다.
</p>
   
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } <strong>finally</strong> {
      System.out.println("finally 블록 실행");
    }
		
    System.out.println("정상 종료");
  }

}
</pre>

<p>
예외 객체를 잡으려면 catch 블록을 사용하는 것 외에 다른 방법이 없다.<br />  
finally 블록은 예외가 발생하든 안 하든 실행이 보장된다.<br />
finally 블록이 실행된 후 예외 객체가 JVM에 전달된다.
</p>

<pre class="console"><strong class="console-result">finally 블록 실행
Exception in thread "main" java.lang.ArithmeticException: / by zero
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:20)
</strong></pre>

<p>
최상위 예외 클래스인 Exception 타입을 잡도록 catch 블록을 만들면, try 블록에서 어떤 예외가 발생한든 모두 잡을 수 있다.
</p>    

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (<strong>Exception</strong> e) {
      System.out.println(e.getMessage());
    } finally {
      System.out.println("finally 블록 실행");
    }
		
    System.out.println("정상 종료");
  }

}
</pre>

<p>
예외가 발생했기에 catch 블록이 실행되고 finally 블록이 실행된다.<br />
catch 블록에서 발생한 예외 객체를 잡았기 때문에 예외 객체는 어디에도 전달되지 않는다.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
finally 블록 실행
정상 종료
</strong></pre>

<p>
catch 블록은, 마치 if ~ else if 문처럼 겹겹이 쓸 수 있다.
이때 예외 클래스 계층 구조에 주의해야 한다.
try 블록에서 예외가 발생하면 위에서, 겹겹이 쌓인 catch 블록은 위에서 아래 방향으로 차례대로 실행되면서 해당 예외 객체를 잡으려 한다.
먼저 나오는 catch 블록의 예외 클래스 타입이 나중에 나오는 catch 블록의 예외 클래스 타입보다 계층 구조에서 상위에 있다면, 나중에 나오는 catch 블록은 실행될 수 없다.
컴파일러는 이를 감지하고 컴파일 에러를 발생시킨다. 
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (Exception e) {
      System.out.println(e.getMessage());
    } catch (<strong>ArithmeticException</strong> e) { 
      System.out.println(e.getMessage());
    } finally {
      System.out.println("finally 블록 실행");
    }
		
    System.out.println("정상 종료");
  }

}
</pre>

<pre style="border: 2px dotted grey;padding: 0.5em;">
Test.java:23: error: exception ArithmeticException has already been caught
    } catch (ArithmeticException e) {
      ^
1 error
</pre>

<p>
아래처럼 catch 블록의 순서를 바꾸면 컴파일이 된다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    int a = 12 / 0;
    System.out.println(a);
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (<strong>ArithmeticException</strong> e) {
      System.out.println(e.getMessage());
    } catch (<strong>Exception</strong> e) {
      System.out.println(e.getMessage());
    } finally {
      System.out.println("finally 블록 실행");
    }
		
    System.out.println("정상 종료");
  }

}
</pre>

<p>
실행하면 catch(ArithmeticException e) {.. }블록이 실행되고 이 블록의 e.getMessage()가 표준 출력 메소드를 통해 콘솔에 출력된다.<br />
그다음 finally 블록이 실행한다.<br />
그다음 메인 메소드 마지막 라인이 실행된다.
</p>
    
<pre class="console"><strong class="console-result">/ by zero
finally 블록 실행
정상 종료
</strong></pre>

<p>
지금까지 unchecked 예외를 다루었다.<br />
예제를  checked 예외 예제가 되도록 아래와 같이 수정한다.<br />
강조된 부분에서 Unhandled exception type ClassNotFoundException 컴파일 에러 메시지를 보게 된다.
</p>    

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    <strong>Class.forName("java.lang.Boolean");</strong>
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>
<pre class="prettyprint no-border">Class.forName("<em>문자열</em>");</pre>

<p>
자바 API에 Class란 클래스의 forName() 정적 메소드를 호출하는 문장이다.<br />
forName()은 아규먼트로 완전한 클래스 이름(FQCN)에 해당하는 문자열을 받는다.<br />
문자열이 나타내는 클래스는 클래스 로더가 찾을 수 있는 곳에 있어야 한다.<br />
forName("<em>문자열</em>") 메소드는 <em>문자열</em>에 해당하는 클래스를 클래스 로더가 로딩하도록 한다.<br />
클래스 로더가 클래스를 찾지 못한다면 JVM은 ClassNotFoundException 예외 객체를 생성하여 Class.forName("<em>문자열</em>"); 에 던진다.<br />
forName() 메소드는 throws ClassNotFoundException로 선언되어 있다.<br />
ClassNotFoundException은 checked 예외 클래스다.<br />
따라서 forName()을 호출할 때 ClassNotFoundException 예외를 핸들링하는 코드를 구현하지 않으면 컴파일 에러가 발생한다.
</p>

<dl class="note">
<dt>Class.forName("문자열')</dt>
<dd>
예제에서 forName()의 아규먼트로 쓰인 "java.lang.Boolean"에 해당하는 클래스는 자바 API에 있다.<br />
컴파일러가 클래스 소스를 컴파일할 때, 소스가 다른 클래스를 사용한다면 그 클래스가 잘 사용되고 있는지 검사한다.<br />
하지만 forName()의 아규먼트로 전달된 문자열이 가리키는 클래스에 대해선 컴파일러가 어떤 검사도 하지 않는다.<br />
따라서 ClassNotFoundException 예외를 핸들링하는 코드가 있다면, forName() 메소드의 아규먼트로 어떤 문자열이 와도 컴파일된다.
</dd>
</dl>

<p>
컴파일 에러가 나지 않도록 수정한다.<br />
Class.forName("문자열"); 에 커서를 올리면 이클립스가 해결책을 제시하는데, 두 번째 방법을 클릭하면 코드는 아래와 같이 바뀌면서 컴파일 에러는 사라진다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    method3();
  }
	
  public static void method3() {
    <strong>try {
      Class.forName("java.lang.Boolean");
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }</strong>
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
실행하면 어떠한 예외도 발생하지 않고 정상 종료된다.<br />
java.lang.Boolean라는 클래스가 자바 API에 존재하기 때문이다.
</p>
    
<pre class="console"><strong class="console-result">정상 종료
</strong></pre>

<p>
코드를 되돌리고 이클립스가 제시하는 첫 번째 방법으로 예외를 핸들링한다.<br />
이제 method2()의 method3(); 에서 컴파일 에러가 발생한다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  public static void method2() {
    <strong>method3();</strong>
  }
	
  public static void method3() <strong>throws ClassNotFoundException</strong> {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
이클립스는 다음 컴파일 에러 메시지를 출력한다.<br />
<em>Unhandled exception type ClassNotFoundException</em><br />
method3()은 throws ClassNotFoundException로 선언되었다.<br />
따라서 method3()을 호출하는 메소드는 ClassNotFoundException을 반드시 핸들링해야 한다.<br />
이번에도 컴파일 에러가 나는 부분에 커서를 두고 이클립스가 제시하는 해결책에서 두 번째 방법을 클릭한다.<br />
소스는 아래처럼 변경되고 컴파일 에러는 사라진다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    method2();
  }
	
  <strong>public static void method2() {
    try {
      method3();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }</strong>
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
코드를 되돌리고 이클립스가 제시하는 첫 번째 방법을 클릭한다.<br />
method1() 메소드의 method2(); 에서 컴파일 에러가 발생한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>method2();</strong>
  }
	
  public static void method2() <strong>throws ClassNotFoundException</strong> {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
커서를 컴파일 에러가 발생하는 곳에 두고 이클립스가 제시하는 해결책 중 두 번째 방법을 클릭한다.<br />
코드는 아래처럼 변경된다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() {
    <strong>try {
      method2();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }</strong>
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
컴파일 에러는 사라진다.<br />
실행하면 어떤 예외도 발생하지 않고 정상 종료된다.
</p>

<pre class="console"><strong class="console-result">정상 종료
</strong></pre>

<p>
코드를 되돌리고 method1()의 method2(); 에 커서를 대고 첫 번째 방법을 클릭한다.<br />
소스가 아래처럼 변경되면서 메인 메소드에 컴파일 에러가 발생한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() <strong>throws ClassNotFoundException</strong> {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) {
    <strong>method1();</strong>
    System.out.println("정상 종료");
  }

}
</pre>

<p>
컴파일 에러가 발생하는 곳에 커서를 두고 첫 번째 방법을 클릭한다.
</p>
    
<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean");
  }
	
  public static void main(String[] args) throws ClassNotFoundException {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
컴파일 에러가 사라진다.<br />
실행하면 어떤 예외도  없이 정상 종료된다.
</p>

<pre class="console"><strong class="console-result">정상 종료
</strong></pre>

<p>
forName() 메소드의 아규먼트를 "java.lang.Boolean2"로 수정한다.<br />
java.lang.Boolean2 클래스는 자바 API에 없다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("<strong>java.lang.Boolean2</strong>");
  }
	
  public static void main(String[] args) throws ClassNotFoundException {
    method1();
    System.out.println("정상 종료");
  }

}
</pre>

<p>
컴파일러는 "java.lang.Boolean2"에 해당하는 클래스가 클래스 패스에 있는지 검사하지 않는다.<br />
따라서 위 예제는 컴파일된다.<br />
실행하면 예외 객체가 메인 메소드까지 도달하고 메인 메소드에서도 예외 객체를 잡지 않으므로 결국 JVM까지 전달된다.<br />
그 결과 비정상 종료된다.
</p>
    
<pre class="console"><strong class="console-result">Exception in thread "main" java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:13)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:18)
</strong></pre>

<p>
메인 메소드에서 예외를 잡도록 수정한다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  <strong>public static void main(String[] args) {
    try {
      method1();
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    System.out.println("정상 종료");
  }</strong>

}
</pre>

<p>
실행하면 e.printStackTrace(); 메소드가 콘솔에 다음을 출력한다.<br />
예외 객체가 JVM에 도달할 때 JVM이 출력하는 메시지와 같다고 비정상 종료라고 오해하지 말자.
</p>
    
<pre class="console"><strong class="console-result">java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)
정상 종료
</strong></pre>

<p>
메인에서 다음과 같이 catch 블록을 제거하면 컴파일 에러가 난다.<br />
ClassNotFoundException은 checked 예외 클래스로 예외 객체를 잡는 catch 블록이나 아니면 메소드를 <strong>throws 예외_클래스</strong>로 선언하지 않으면 컴파일 에러가 발생한다.<br />
메소드 밖으로 checked 예외 객체가 나오려면, <strong>throws 예외_클래스</strong>를 사용하여 메소드를 선언한다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  public static void main(String[] args) {
    try {
      <strong>method1();</strong>
    } finally {
      System.out.println("finally 블록 실행");
    }
    System.out.println("정상 종료");
  }

}
</pre>

<p>
코드에 다시 catch 블록을 넣어 컴파일 에러를 피하도록 한다.
</p>

<pre class="prettyprint">
package net.java_school.exception;

public class Test {

  public static void method1() throws ClassNotFoundException {
    method2();
  }
	
  public static void method2() throws ClassNotFoundException {
    method3();
  }
	
  public static void method3() throws ClassNotFoundException {
    Class.forName("java.lang.Boolean2");
  }
	
  public static void main(String[] args) {
    try {
      method1();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } finally {
      System.out.println("finally 블록 실행");
    }

    System.out.println("정상 종료");
  }

}
</pre>

<p>
실행하면 java.lang.Boolean2란 클래스가 없으므로 ClassNotFoundException 예외가 발생한다.<br />
catch 블록에서 e.printStackTrace(); 문이 실행되고 finally 블록이 실행되고 메인의 마지막 라인이 실행된다.
</p>

<pre class="console"><strong class="console-result">java.lang.ClassNotFoundException: java.lang.Boolean2
  at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
  at java.security.AccessController.doPrivileged(Native Method)
  at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:323)
  at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
  at java.lang.ClassLoader.loadClass(ClassLoader.java:268)
  at java.lang.Class.forName0(Native Method)
  at java.lang.Class.forName(Class.java:190)
  at net.java_school.exception.Test.method3(Test.java:14)
  at net.java_school.exception.Test.method2(Test.java:10)
  at net.java_school.exception.Test.method1(Test.java:6)
  at net.java_school.exception.Test.main(Test.java:19)
finally 블록 실행
정상 종료
</strong></pre>

<p>
자바를 프로그래밍하다 보면 e.printStackTrace(); 문이 출력하는 메시지를 자주 보게 된다.<br />
printStackTrace()는 Throwable 클래스의 메소드로, Throwable은 Error 클래스와 Exception 클래스의 부모 클래스다.<br />
printStackTrace()는 이름 그대로 스택을 역추적하여 에러나 예외의 원인이 되는 라인을 모두 출력한다.<br />
printStackTrace()가 출력하는 메시지로 에러나 예외의 원인을 찾아야 한다.<br />
자바 문법 지식으로 안 되면 구글 검색이 최선이다.<br />
예외 객체를 전달받는 JVM은 프로그램 종료 전에 이 메소드를 호출한다.<br />
</p>

<h3>사용자 정의 예외</h3>

<p>
예외가 발생할 상황이 되면 JVM은 자바 API의 예외 클래스로부터 예외 객체를 생성하고 예외가 발생한 코드에 던진다고 했다.<br />
그런데 예외 클래스를 프로그래머가 필요에 따라 만들 수도 있다.<br />
이를 '사용자 정의 예외'라 부른다.<br />
다음 예외 클래스는 은행 프로그램에서 잔액이 부족한 예외 상황에 사용하려고 만들었다.
</p>

<pre class="prettyprint">
package net.java_school.bank;

public class InsufficientBalanceException extends Exception {

  public InsufficientBalanceException() {
    super();
  }
	
  public InsufficientBalanceException(String message, Throwable cause,
    boolean enableSuppression, boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }
	
  public InsufficientBalanceException(String message, Throwable cause) {
    super(message, cause);
  }
	
  public InsufficientBalanceException(String message) {
    super(message);
  }
	
  public InsufficientBalanceException(Throwable cause) {
    super(cause);
  }

}
</pre>

<dl class="note">
<dt>Generate constructor from superclass</dt>
<dd>
InsufficientBalanceException 사용자 정의 예외 클래스를 작성할 때 이클립스의 코드 도움 기능을 이용하면 쉽게 작성할 수 있다.
클래스 몸체에 커서를 둔 상태에서 오른쪽 마우스를 클릭한다.
나타난 컨텍스트 메뉴에서 Source - Generate constructor from superclass...를 차례로 선택한다.
</dd>
</dl>

<h3>throw 키워드</h3>

<p>
사용자 정의 예외는 JVM이 객체를 만들고 던지지 않는다.<br />
따라서 코드로 사용자 정의 예외 객체를 생성하고 던져야 한다.<br />`
사용자 정의 예외 클래스로부터 예외 객체를 만들어 던지는 코드는 다음과 같다.
</p>

<pre class="prettyprint">
throw new InsufficientBalanceException("잔액이 부족합니다.");
</pre>

<h3>과제</h3>

<p>
아래 예제에서 잔액이 부족하여 출금할 수 없는 상황에 InsufficientBalanceException을 생성하고 던지도록 코드를 수정하시오.
</p>

<pre class="prettyprint">
package net.java_school.bank;

public class Test {

  private static void displayHowToUse() {
    System.out.println("사용법 1000원 입금: java net.java_school.bank.Test d 1000");
    System.out.println("사용법 1000원 출금: java net.java_school.bank.Test w 1000");
  }

  public static void main(String[] args) {
    int MAX_BALANCE = 3000; //최대 잔액
    int balance = 1000; //잔액
    int amount = 0; //입금액 또는 출금액

    if (args.length &lt; 2) {
      displayHowToUse();
      return;
    }

    amount = Integer.parseInt(args[1]);

    if (args[0].equals("d")) {
      if (balance + amount &gt; MAX_BALANCE) {
        System.out.println("최대 잔액을 넘게 입금할 수 없습니다.");
      } else {
        balance = balance + amount;
        System.out.println(amount + "원이 입금되었습니다.");
      }
    } else if (args[0].equals("w")) {
      if (balance - amount &lt; 0) {
        System.out.println("잔액이 부족하여 출금할 수 없습니다.");
      } else {
        balance = balance - amount;
        System.out.println(amount + "원이 출금되었습니다.");
      }
    } else {
      displayHowToUse();
      return;
    }

    System.out.println("잔액 " + balance);

  } //main method end

}
</pre>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://java.sun.com/docs/books/tutorial/essential/exceptions/definition.html">http://java.sun.com/docs/books/tutorial/essential/exceptions/definition.html</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>다음 : <a href="<c:url value="/java/javabank-requirements-analysis"/>">자바은행 - 요구사항 분석</a></li>
    <li>이전 : <a href="<c:url value="/java/collection"/>">컬렉션</a></li>
  </ul>
</div>
</article>