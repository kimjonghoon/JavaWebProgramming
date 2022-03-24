<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>Stream</h1>

<p>
Java 8 introduced Stream.
</p>

<p>
Java 7 couldn't avoid repetitive code when dealing with collections and couldn't use multiple cores. Streams in Java 8 solved both of these problems.
</p>

<ul>
	<li>As for the stream code, the internal code of the Stream library handles all data. --This is called inner iteration--</li>
	<li>The streams can process collection data in a declarative form and can process data in parallel without threads.</li>
</ul>

<h3>Example</h3>

<p>
Create a movies.txt file as follows and copy it to the root directory.
</p>

<pre class="prettyprint">Butch Cassidy And The Sundance Kid,1969,8.1
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

<p>
Create Movie.java and MovieTest.java.
</p>

<pre class="prettyprint">
package net.java_school.examples;

public class Movie {
  private final String title;
  private final int releaseDate;
  private final double userRatings;

  public Movie(String title, int releaseDate, double userRatings) {
    this.title = title;
    this.releaseDate = releaseDate;
    this.userRatings = userRatings;
  }

  public String getTitle() {
    return title;
  }

  public int getReleaseDate() {
    return releaseDate;
  }

  public double getUserRatings() {
    return userRatings;
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(this.getTitle());
    sb.append(",");
    sb.append(this.getReleaseDate());
    sb.append(",");
    sb.append(this.getUserRatings());

    return sb.toString();
  }
}
</pre>

<pre class="prettyprint">package net.java_school.examples;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

<strong>import static java.util.stream.Collectors.toList;</strong>

public class MovieTest {

  public static void main(String[] args) throws Exception {
    String fileName = "movies.txt";
    String str = null;
    List&lt;Movie&gt; movies = new ArrayList&lt;&gt;();
    try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
      while ((str = br.readLine()) != null) {
        String[] arr = str.split(",");
        Movie movie = new Movie(arr[0], Integer.parseInt(arr[1]), Double.parseDouble(arr[2]));
        movies.add(movie);
      }
    }
    <strong>
    List&lt;Movie&gt; threeHighRatingMovieNames =
        movies.stream()
        .filter(m -> m.getUserRatings() &gt;= 8.0)
        .limit(3)
        .collect(toList());
    </strong>
    /*
    for (Movie movie : threeHighRatingMovieNames) {
      System.out.println(movie);
    }
    */
    //new forEach method available to any collection class.
    <strong>threeHighRatingMovieNames.forEach(m -&gt; System.out.println(m));</strong>
  }
}
</pre>

<pre class="console"><strong class="console-result">Butch Cassidy And The Sundance Kid,1969,8.1
Blade Runner 2049,2017,8.1
Twelve Monkeys,1995,8.0</strong></pre>

<p>
Since you have not sorted, you will get three from the top in movies.txt. To get the top three after sorting, add the following highlighted code.
</p>

<pre class="prettyprint no-border">import static java.util.Comparator.comparing;</pre>

<pre class="prettyprint">List&lt;Movie&gt; threeHighRatingMovieNames = movies.stream()
  .filter(m -&gt; m.getUserRatings() &gt;= 8.0)
  <strong>.sorted(comparing(Movie::getUserRatings))</strong>
  .limit(3)
  .collect(toList());
</pre>

<pre class="console"><strong class="console-result">Twelve Monkeys,1995,8.0
The Terminator,1984,8.0
Jaws,1975,8.0</strong></pre>

<p>
The above code sorts the user ratings in ascending order.
</p>

<p>
Add the reversed() default method to the sort statement to sort user ratings in descending order.
</p>

<p>
.sorted(comparing(Movie::getUserRatings)<strong>.reversed()</strong>)
</p>

<pre class="console"><strong class="console-result">The Shawshank Redemption,1994,9.3
The Dark Knight,2008,9.0
The Silence Of The Lambs,1991,8.6</strong></pre>

<p>
You can fetch specific data fields.
</p>

<p>
Add the map() default method to extract only the movie title.
</p>

<pre class="prettyprint">List&lt;<strong>String</strong>&gt; threeHighRatingMovieNames = movies.stream()
  .filter(m -&gt; m.getUserRatings() &gt;= 8.0)
  .sorted(comparing(Movie::getUserRatings).reversed())
  <strong>.map(Movie::getTitle)</strong>
  .limit(3)
  .collect(toList());
</pre>

<pre class="console"><strong class="console-result">The Shawshank Redemption
The Dark Knight
The Silence Of The Lambs</strong></pre>

<p>
Modify movies.<strong>stream()</strong> to movies.<strong>parallelStream()</strong> to use parallel processing.
</p>

<pre class="prettyprint">List&lt;String&gt; threeHighRatingMovieNames = movies<strong>.parallelStream()</strong>
  .filter(m -&gt; m.getUserRatings() &gt;= 8.0)
  .sorted(comparing(Movie::getUserRatings).reversed())
  .map(Movie::getTitle)
  .limit(3)
  .collect(toList());
</pre>

<p>
It is not easy to enter complex lambda expressions into the filter() method. If you want to get the top 3 of the movies released after 2015 among movies with a rating of less than 8.0, it is convenient first to declare the predicate that matches the condition and then write the stream statement.
</p>

<pre class="prettyprint">Predicate&lt;Movie&gt; popularMovies = m -&gt; m.getUserRatings() &gt;= 8.0;
Predicate&lt;Movie&gt; complexCondition = popularMovies.negate().and(m -&gt; m.getReleaseDate() &gt; 2015);

List&lt;Movie&gt; result = movies.parallelStream()
  .filter(complexCondition)
  .sorted(comparing(Movie::getUserRatings).reversed())
  .limit(3)
  .collect(toList());

result.forEach(m -&gt; System.out.println(m));
</pre>

<pre class="console"><strong class="console-result">Tschick,2016,7.0
Small Town Crime,2017,6.6
The Commuter,2018,6.3</strong></pre>

<p>
Java 8 introduced Optional to reduce the harmful effects of null. The result type of the following example is OptionalDouble, not Double.
</p>

<pre class="prettyprint">OptionalDouble averageRating = movies.parallelStream()
  .mapToDouble(m -&gt; m.getUserRatings())
  .average();

System.out.println("Average Rating: " + averageRating.getAsDouble());
</pre>

<pre class="console"><strong class="console-result">Average Rating: 7.456896551724138</strong></pre>

<p>
Final source: <a href="https://github.com/kimjonghoon/stream">https://github.com/kimjonghoon/stream</a>
</p>

<h3>How to run</h3>

<pre class="shell-prompt">
<strong>javac -d out -sourcepath src $(find src -name "*.java")</strong>
<strong>java -cp out net.java_school.examples.MovieTest</strong>
</pre>

<p>
Or
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">md out
cd src/net/java_school/examples
javac -d ..\..\..\..\out *.java
cd ..\..\..\..\
java -cp out net.java_school.examples.MovieTest
</pre>

</article>
