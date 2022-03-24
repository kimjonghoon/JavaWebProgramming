<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.3.4</div>

<h1>enum</h1>

<p>
Java 5 introduced a new data type, enum, for declaring a set of constants. Enum declarations are similar to class declarations. The compiler automatically adds some unique methods when it compiles an enum. For example, the static values() method returns an array storing all values in the order declared in the body of the enum type.
</p>

<pre class="prettyprint">package net.java_school.examples;

public enum Day {
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

public class EnumTest {
  Day day;

  public EnumTest(Day day) {
    this.day = day;
  }

  public void tellItLikeItIs() {
    switch (day) {
    case MONDAY:
      System.out.println("Mondays are bad.");
      break;
    case FRIDAY:
      System.out.println("Fridays are better.");
      break;
    case SATURDAY: case SUNDAY:
      System.out.println("Weekends are best.");
      break;
    default:
      System.out.println("Midweek days are so-so.");
      break;
    }
  }

  public static void main(String[] args) {
    EnumTest firstDay = new EnumTest(Day.MONDAY);
    firstDay.tellItLikeItIs();
    EnumTest thirdDay = new EnumTest(Day.WEDNESDAY);
    thirdDay.tellItLikeItIs();
    EnumTest fifthDay = new EnumTest(Day.FRIDAY);
    fifthDay.tellItLikeItIs();
    EnumTest sixthDay = new EnumTest(Day.SATURDAY);
    sixthDay.tellItLikeItIs();
    EnumTest seventhDay = new EnumTest(Day.SUNDAY);
    seventhDay.tellItLikeItIs();

    for (Day day : Day.values()) {
      System.out.println(day);
    }
  }
}
</pre>

<pre class="console"><strong class="console-result">Mondays are bad.
Midweek days are so-so.
Fridays are better.
Weekends are best.
Weekends are best.
SUNDAY
MONDAY
TUESDAY
WEDNESDAY
THURSDAY
FRIDAY
SATURDAY</strong></pre>

<p>
When there are fields and methods, the list of enum constants must end with a semicolon. Enum constructor must be package-private or private access. Enum constructor automatically creates the constants in the order declared of the enum body. --You cannot invoke enum constructor yourself--
</p>

<pre class="prettyprint">package net.java_school.examples;

public enum Day {
  SUNDAY("Sun"),//Pass the value "Sun" to the constructor
  MONDAY("Mon"), 
  TUESDAY("Tue"),
  WEDNESDAY("Wed"), 
  THURSDAY("Thu"), 
  FRIDAY("Fri"),
  SATURDAY("Sat");//Add a semicolon(;) at the end

  private final String value;

  //Add constructor
  private Day(String value) {
    this.value = value;
  }

  //Add method to get value
  public String getValue() {
    return value;
  }
}
</pre>

<pre class="prettyprint">
package net.java_school.examples;

public EnumDayTest {
  public static void main(String[] args) {
    for (Day day : Day.values()) {
      System.out.println(day.getValue());
    }
  }
}	
</pre>

<pre class="console"><strong class="console-result">Sun
Mon
Tue
Wed
Thu
Fri
Sat</strong></pre>

<p>
Final source: <a href="https://github.com/kimjonghoon/enum">https://github.com/kimjonghoon/enum</a>
</p>

<h3>How to run</h3>

<pre class="shell-prompt">~/enum$ <strong>cd src/net/java_school/examples/</strong>
~/enum/src/net/java_school/examples$ <strong>javac -d ../../../../bin *.java</strong>
~/enum/src/net/java_school/examples$ <strong>cd -</strong>
~/enum$ <strong>java -cp ./bin net.java_school.examples.EnumTest</strong>
1.
Mondays are bad.
Midweek days are so-so.
Fridays are better.
Weekends are best.
Weekends are best.

2.
SUNDAY
MONDAY
TUESDAY
WEDNESDAY
THURSDAY
FRIDAY
SATURDAY

3.
Sun
Mon
Tue
Wed
Thu
Fri
Sat
</pre>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html">https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html</a></li>
</ul>

</article>
