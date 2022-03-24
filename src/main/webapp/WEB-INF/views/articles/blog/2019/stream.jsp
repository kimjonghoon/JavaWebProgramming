<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.4.1</div>

<h1>스트림</h1>

<p>
스트림은 자바 8에 도입되었다.<br />
스트림에서는 라이브러리 내부에서 모든 데이터가 처리된다. --내부 반복이라 한다--<br />
자바 7까지 컬렉션은 반복적인 코드를 피하지 못했고, 멀티코어를 활용하지 못했다.<br />
스트림은 이 두 문제를 해결했다.<br />
스트림은 선언형으로 컬렉션 데이터를 처리하며, 스레드 없이 멀티코어를 사용해 데이터를 병렬로 처리할 수 있다.
</p>

<p>
아래 내용으로 movies.txt 파일을 만들고 루트 디렉터리에 복사한다.
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

<p>
영화 클래스인 Movie.java와 테스트를 위한 MovieTest.java를 아래와 같이 생성한다.
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
				.filter(m -&gt; m.getUserRatings() &gt;= 8.0)
				.limit(3)
				.collect(toList());
		</strong>
		/*
		for (Movie movie : threeHighRatingMovieNames) {
			System.out.println(movie);
		}
		*/
		//자바 8 이후 모든 컬렉션에서 forEach 메소드를 사용할 수 있다.
		<strong>threeHighRatingMovieNames.forEach(m -&gt; System.out.println(m));</strong>
	}

}
</pre>

<pre class="console"><strong class="console-result">Butch Cassidy And The Sundance Kid,1969,8.1
Blade Runner 2049,2017,8.1
Twelve Monkeys,1995,8.0</strong></pre>

<p>
정렬하지 않았으므로 movies.txt에서 위부터 세 개가 출력된다.<br />
정렬한 후  위에서 세 개를 추출하려면, 아래 강조한 부분을 코드에 추가한다.<br />
import static java.util.Comparator.comparing; 임포트 문 추가가 필요하다.
</p>

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
결과는 사용자 평점을 오름차순으로 정렬되어 있다.<br />
사용자 평점을 내림차순으로 정렬하려면, 정렬 구문에 reversed() 디폴트 메소드를 아래처럼 추가한다.
</p>

<p>
.sorted(comparing(Movie::getUserRatings)<strong>.reversed()</strong>)
</p>

<pre class="console"><strong class="console-result">The Shawshank Redemption,1994,9.3
The Dark Knight,2008,9.0
The Silence Of The Lambs,1991,8.6</strong></pre>

<p>
특정 데이터를 선택하는 작업을 할 수 있다.<br />
영화 제목만을 추출하려면 아래처럼 map() 디폴트 메소드를 추가한다.
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
병렬처리를 하려면 movies.stream()을 movies.parallelStream()으로 수정한다.
</p>

<pre class="prettyprint">List&lt;String&gt; threeHighRatingMovieNames = movies<strong>.parallelStream()</strong>
	.filter(m -&gt; m.getUserRatings() &gt;= 8.0)
	.sorted(comparing(Movie::getUserRatings).reversed())
	.map(Movie::getTitle)
	.limit(3)
	.collect(toList());
</pre>

<pre class="console"><strong class="console-result">The Shawshank Redemption
The Dark Knight
The Silence Of The Lambs</strong></pre>

<p>
filter() 메소드에 복잡한 람다식을 입력하기 쉽지 않다.<br />
평점이 8.0 미만의 영화 중에 2015년 이후에 출시된 영화 중 평점 탑 3을 구하려면, 먼저 조건에 맞는 Predicate를 선언한 후 stream 문을 작성하는 게 편하다.
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
map() 메소드와 함께 연산할 수 있다.<br />
다음 예제의 연산 결과는 Double로 반환되지 않고 OptionalDouble 타입으로 반환되는데, Optional은 null의 폐해를 줄이기 위해 자바 8에 도입되었다.
</p>

<pre class="prettyprint">OptionalDouble averageRating = movies.parallelStream()
	.mapToDouble(m -&gt; m.getUserRatings())
	.average();

System.out.println("Average Rating: " + averageRating.getAsDouble());
</pre>

<pre class="console"><strong class="console-result">Average Rating: 7.456896551724138</strong></pre>


<p>
최종 소스 : <a href="https://github.com/kimjonghoon/stream">https://github.com/kimjonghoon/stream</a>
</p>

<h3>실행 방법</h3>

<pre class="shell-prompt">
<strong>javac -d out -sourcepath src $(find src -name "*.java")</strong>
<strong>java -cp out net.java_school.examples.MovieTest</strong>
</pre>

<p>
또는
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">md out
cd src/net/java_school/examples
javac -d ..\..\..\..\out *.java
cd ..\..\..\..\
java -cp out net.java_school.examples.MovieTest
</pre>

</article>
