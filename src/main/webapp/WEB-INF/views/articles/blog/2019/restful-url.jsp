<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.10.22</div>

<h1>RESTful URL</h1>

<p>
REST는 https 환경에서 사용자 세션을 저장하지 않는다.<br />
REST 프로그래밍의 요청 URL은 자원의 위치를 의미하도록 만들어야 한다.<br />
REST 프로그램이 아니더라도, RESTful URL을 따르면 더 좋은 프로그램이 된다.<br />
이 글은 SpringBbs 게시판 프로그램의 요청 URL을 RESTful URL로 바꾸는 방법에 관해 설명한다.
</p>

<h3>RESTful URL 예: 주소록</h3>

<p>
주소록 애플리케이션의 RESTful URL은 다음과 같다.
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
목록:		GET /address
ID가 1인 주소:	GET /address/1 
등록:		POST /address
수정:		PUT /address/1
특정 필드 수정:	PATCH /address/1
삭제:		DELETE /address/1
</pre>

<p>
다음은 현재 게시판의 요청 URL이다.
--검색하지 않았다고 가정한다--
</p>

<pre style="border: 1px solid grey;padding: 0.3em;">
목록:		GET /list?boardCd=chat&amp;page=1&amp;searchWord=
내용보기:		GET /view?boardCd=chat&amp;page=1&amp;searchWord=
새글양식:		GET /write?boardCd=chat&amp;page=1&amp;searchWord=
새글:		POST /write?boardCd=chat&amp;page=1
수정양식:		GET /modify?boardCd=chat&amp;page=1&amp;searchWord=
수정:		POST /modify?boardCd=chat&amp;page=1&amp;searchWord=
삭제:		POST /del?boardCd=chat&amp;page=1&amp;searchWord=
</pre>

<p>
다음은 게시판 요청 URL을 RESTful URL에 부합하도록 수정한 결과다.
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
목록:		GET /chat?page=1&amp;searchWord=
내용보기:		GET /chat/54?page=1&amp;searchWord=
새글양식:		GET /chat/new?page=1&amp;searchWord=
새글:		POST /chat?page=1
수정양식:		GET /chat/54/edit?page=1&amp;searchWord=
수정:		PUT /chat/54?page=1&amp;searchWord=
삭제:		DELETE /chat/54?page=1&amp;searchWord=
</pre>

<p>
새글양식과 수정양식 요청 URL은 RESTful URL이 아니다.<br />
기존 게시판 프로그램 수정을 최소화하기 위해 이런 타협을 했다.
</p>

<h3>목록</h3>

<p>
'/chat?page=1&amp;searchWord='에서 'chat'은 게시판 코드다.<br />
페이지 번호도 URL에 포함해 '/chat/1?searchWord=' 도 된다고 생각할 수 있다.<br />
하지만 페이지 번호를 URL에 포함하지 않아야 한다.<br />
이유는 다음 두 가지다.
</p>

<p>
첫째, '/chat/1?searchWord=' 에서 1은, 
<a href="https://en.wikipedia.org/wiki/Clean_URL">클린 URL</a> 관점에서 보면, 
페이지 번호가 아니라 chat 게시판의 첫 번째 글이다.
--클린 URL은 RESFful URL과 비슷한 개념이다--
</p>

<p>
둘째, 검색어가 없다면 '/chat?page=1&amp;searchWord=' 대신 '/chat?page=1'로 요청할 수 있다.<br />
seachWord는 선택적 파라미터다. 선택적 파라미터는 URL에 포함하지 않는다.<br />
page는 searchWord에 따라 값이 바뀐다. 선택적 파라미터에 영향을 받는 파라미터도 URL에 포함하지 않는다.
</p>

<p>
변경된 요청 URL을 핸들링하도록 게시판 컨트롤러의 목록 메소드 선언을 아래를 참고해 수정한다.
--아래 언급된 컨트롤러 메서드의 대부분이 메소드 바디에 수정이 필요하다. 수정이 어렵지 않기에 이에 관한 내용은 생략한다--
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}", method = RequestMethod.GET)
public String list(..., @PathVariable String boardCd, ...)
</pre>

<p>
최근 스프링에선 어노테이션을 아래처럼 간단히 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}")
public String list(..., @PathVariable String boardCd, ...)
</pre>

<p>
@RequestMapping(value = "{boardCd}", ....이나 @GetMapping("{boardCd}")에서 {boardCd}는 글자 그대로를 의미하지 않는다.<br />
@PathVariable String boardCd로 선언된 매개변수가 있다면, '/chat?page=1&amp;searchWord=' 요청에서 'chat'은 boardCd 매개변수에 할당된다.
</p>

<h3>내용보기</h3>

<p>
'/chat/54?page=1&amp;searchWord=' 에서 54는 게시글의 고유번호다.
</p>

<p>
변경된 요청 URL을 핸들링하도록 게시판 컨트롤러에서 내용보기 메소드 선언을 아래를 참고해 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.GET)
public String view (..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
최근 스프링에선 어노테이션을 아래처럼 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/{articleNo}")
public String view (..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
'/chat/54?page=1&amp;searchWord=' 요청이 오면, 'chat'은 매개변수 boardCd에 할당되고 54는 매개변수 articleNo에 할당된다.
</p>

<h3>새글양식</h3>

<p>
'/chat?page=1&amp;searchWord=' 처럼 수정하면 RESTful URL이 된다.<br />
이 URL을 사용하려면, 목록 페이지가 새글양식을 포함해야 한다.<br />
목록 페이지가 새글양식을 포함하면, 이미 구현된 빈 검증 코드의 수정이 어려워진다.<br /> 
그래서 새글양식 페이지를 그대로 사용하기로 했다.<br />
RESTful URL이 아니지만, 새글양식 요청 URL을 다음과 같이 정했다.<br />
/chat/new?page=1&amp;searchWord=
</p>

<p>
변경된 URL을 핸들링하도록 게시판 컨트롤러의 writeForm 메소드를 다음과 같이 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/new", method = RequestMethod.GET)
public String writeForm(@PathVariable String boardCd, ...)
</pre>

<p>
최근 스프링에선 어노테이션을 아래처럼 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/new")
public String writeForm(@PathVariable String boardCd, ...)
</pre>

<h3>새글</h3>

<p>
POST /chat?page=1
</p>

<p>
변경된 요청 URL을 핸들링하도록 게시판 컨트롤러의 새글쓰기 메소드를 아래를 참고해 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}", method = RequestMethod.POST)
public String write(..., @PathVariable String boardCd, ...)
</pre>

<p>
최근 스프링에선 어노테이션을 아래처럼 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@PostMapping("{boardCd}")
public String write(..., @PathVariable String boardCd, ...)
</pre>

<h3>수정양식</h3>

<p>
'/chat/54?page=1&amp;searchWord='이 RESTful URL이다.<br />
이 URL을 사용하려면, 내용보기 페이지가 수정양식을 포함해야 한다.<br />
내용보기 화면에 수정양식이 있으면, 이미 구현한 빈 검증 코드 수정이 어려워진다.<br />
그래서 수정양식 페이지를 그대로 사용하기로 했다.<br />
RESTful URL이 아니지만, 수정양식 요청 URL을 아래와 같이 정했다.<br />
/chat/54/edit?page=1&amp;searchWord=
</p>

<p>
변경된 URL을 핸들링하도록 게시판 컨트롤러의 수정양식 메소드를 아래를 참고해 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}/edit", method = RequestMethod.GET)
public String modifyForm(..., @PathVariable String boardCd, ...)
</pre>

<p>
최근 스프링에선 아래처럼 어노테이션을 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/{articleNo}/edit")
public String modifyForm(..., @PathVariable String boardCd, ...)
</pre>

<h3>수정</h3>

<p>
PUT /chat/54?page=1&amp;searchWord=
</p>

<p>
변경된 요청 URL을 핸들링하도록 게시판 컨트롤러의 수정 메소드 선언을 아래를 참고해 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.PUT)
public String modify(..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
최신 스프링에선 아래처럼 어노테이션을 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@PutMapping("{boardCd}/{articleNo}")
public String modify(..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<h3>삭제</h3>

<p>
DELETE /chat/54?page=1&amp;searchWord=
</p>

<p>
변경된 요청 URL을 핸들링하도록 게시판 컨트롤러의 삭제 메소드 선언을 아래를 참고해 수정한다.
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.DELETE)
public String deleteArticle(@PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
최근 스프링에선 아래처럼 어노테이션을 줄일 수 있다.
</p>

<pre class="prettyprint no-border">
@DeleteMapping("{boardCd}/{articleNo}")
public String deleteArticle(@PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<h3>JSP 수정</h3>

<p>
대부분의 JSP에서 수정이 필요하다.<br />
폼 엘리먼트에서 method의 값을 수정한다.<br />
변경된 URL에 맞게 요청 문자열을 만드는 부분을 수정한다.<br />
boardCd와 articleNo가 더는 요청 파라미터로 전달되지 않기에, 이를 고려해 페이지를 수정한다.
</p>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/restful-url">1 RESTful URL</a></li>
	<li><a href="/blog/2019/how-to-make-epub-with-eclipse">2 이클립스를 사용해 EPUB ebook 만들기</a></li>
</ul>

</article>
