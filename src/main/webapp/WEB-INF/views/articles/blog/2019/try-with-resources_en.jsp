<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.3.4</div>

<h1>try with resources</h1>

<p>
Java 7 introduced the try-with-resources statement. The parentheses follow the try keyword, and you can create resources within the parentheses. Resources in the parentheses must implement java.lang.AutoCloseable. The try-with-resources statement guarantees that resources are closed when the statement ends.
</p>

<p>
Create a movies.txt file and copy it to the /src directory.
</p>

<pre class="prettyprint">
Butch Cassidy And The Sundance Kid,1969,8.1
Lucy,2014,6.4
Asphalte,2015,7.1
Spy,2015,7.0
Blade Runner 2049,2017,8.1
Small Town Crime,2017,6.6
The Commuter,2018,6.3
Flashdance,1983,6.1
Midnight Run,1988,7.6
Twelve Monkeys,1995,8.0
As Good As It Gets,1997,7.7
Collateral,2004,7.5
Choke,2008,6.5
The Dark Knight,2008,9.0
The Dark Knight Rises,2012,8.4
Infinitely Polar Bear,2014,7.0
Mission Impossible 3,2006,6.9
Mission Impossible 4,2011,7.4
The Terminator,1984,8.0
Terminator 2,1991,8.5
Flight,2012,7.3
Our Brand Is Crisis,2015,6.1
The Rewrite,2014,6.2
The Secret Life of Walter Mitty,2013,7.3
Waterloo Bridge,1940,7.8
Roman Holiday,1953,8.1
Ben Hur,1959,8.1
The Battle of Algiers,1966,8.1
Love Story,1970,6.9
Jaws,1975,8.0
Operation Daybreak,1975,7.1
Blade Runner,1982,8.2
The Silence Of The Lambs,1991,8.6
Thelma and Louise,1991,7.4
Scent of a Woman,1992,8.0
The Shawshank Redemption,1994,9.3
Heat,1995,8.2
Jerry Maguire,1996,7.6
Knockin On Heavens Door,1997,8.0
28 Days,2000,6.0
Unbreakable,2000,7.3
Secondhand Lion,2003,7.6
Eternal Sunshine of the Spotless Mind,2004,8.3
Little Miss Sunshine,2006,7.8
No Country for Old Men,2007,8.1
The Lookout,2007,7.0
Doubt,2008,7.5
The Bank Job,2008,7.3
The Wrestler,2008,7.9
Agora,2009,7.2
Morning Glory,2010,6.5
Foxfire,2012,6.2
Drive,2011,7.8
Walk of Shame,2014,6.0
Truth,2015,6.8
Tschick,2016,7.0
Creed,2015,7.6
Rocky,1976,8.1
</pre>


<pre class="prettyprint">package net.java_school.examples;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TryWithResourcesTest {

  static String readFirstLineFromFile(String path) throws IOException {
    try (BufferedReader br = new BufferedReader(new FileReader(path))) {
      return br.readLine();
    }
  }

  public static void main(String[] args) throws IOException {
    String firstLine = null;
    firstLine = readFirstLineFromFile("./src/movies.txt");
    System.out.println(firstLine);
  }
}
</pre>

<pre class="console"><strong class="console-result">Butch Cassidy And The Sundance Kid,1969,8.1</strong></pre>

<p>
The example uses the BufferedReader instance to read the first line from the file. The BufferedReader is a resource that must be closed at the end of the use. Since Java 7, BufferedReader implements the AutoCloseable interface. Resources that implement AutoCloseable created by a try-with-resources statement are closed regardless of whether the try statement executes typically or abnormally terminated.
</p>

<p>
Before Java 7, to close a resource, you had to use a finally block as follows.
</p>

<pre class="prettyprint">static String readFirstLineFromFileWithFinallyBlock(String path) throws IOException {
  BufferedReader br = new BufferedReader(new FileReader(path));
  try {
    return br.readLine();
  } finally {
    if (br != null) br.close();
  }
}
</pre>

<p>
However, in the finally block, the BufferedReader's close() method might raise an IOException.
</p>

<p>
You can declare more than one resource in the try-with-resources statement. A try-with-resources can have catch blocks and a finally block, which works after closed resources.
</p>

<p>
Final source: <a href="https://github.com/kimjonghoon/try-with-resources">https://github.com/kimjonghoon/try-with-resources</a>
</p>

<h3>How to run</h3>

<pre class="shell-prompt">~/try-with-resources$ <strong>cd src/net/java_school/examples/</strong>
~/try-with-resources/src/net/java_school/examples$ <strong>javac -d ../../../../bin *.java</strong>
~/try-with-resources/src/net/java_school/examples$ <strong>cd -</strong>
~/try-with-resources$ <strong>java -cp ./bin net.java_school.examples.Test</strong>
Butch Cassidy And The Sundance Kid,1969,8.1
</pre>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html">https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html</a></li>
</ul>

</article>
