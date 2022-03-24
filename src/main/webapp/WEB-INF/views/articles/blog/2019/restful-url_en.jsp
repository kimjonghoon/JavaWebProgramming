<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.8</div>

<h1>RESTful URL</h1>

<p>
REST does not store user sessions in an https environment.
</p>

<p>
You should make the request URL for REST programming --it is called RESTful URL-- to mean the location of the resource.
</p>

<h3>RESTful URL Example: Address Book</h3>

<p>
The RESTful URL for the Address Book application is:
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
List:			GET /address
Address with ID 1:	GET /address/1 
Registration:		POST /address
Modify:			PUT /address/1
Modify specific field:	PATCH /address/1
Delete:			DELETE /address/1
</pre>

<p>
Even if it's not a REST program, making the request URL a RESTful URL makes it a better program.
</p>

<p>
This article explains how to convert the request URL of the SpringBbs bulletin board program to RESTful URLs.
</p>

<p>
The following is the request URL of the current bulletin board.
Assume you didn't search.
</p>

<pre style="border: 1px solid grey;padding: 0.3em;">
List:		GET /list?boardCd=chat&amp;page=1&amp;searchWord=
Detailed View:	GET /view?boardCd=chat&amp;page=1&amp;searchWord=
New Form:	GET /write?boardCd=chat&amp;page=1&amp;searchWord=
New:		POST /write?boardCd=chat&amp;page=1
Modify Form:	GET /modify?boardCd=chat&amp;page=1&amp;searchWord=
Modify:		POST /modify?boardCd=chat&amp;page=1&amp;searchWord=
Delete:		POST /del?boardCd=chat&amp;page=1&amp;searchWord=
</pre>

<p>
The following is converting bulletin board request URLs to RESTful URLs.
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
List:		GET /chat?page=1&amp;searchWord=
Detailed View:	GET /chat/54?page=1&amp;searchWord=
New Form:	GET /chat/new?page=1&amp;searchWord=
New:		POST /chat?page=1
Modify Form:	GET /chat/54/edit?page=1&amp;searchWord=
Modify:		PUT /chat/54?page=1&amp;searchWord=
Delete:		DELETE /chat/54?page=1&amp;searchWord=
</pre>

<p>
In /chat?page=1&amp;searchWord=, chat is the board code. Do you think '/chat/1?searchWord=' is better? The answer is no. There are two reasons for this. First, according to Clean URL, 1 in '/chat/1?searchWord=' means the first post of the chat bulletin board, not the page number. --Clean URL is similar in concept to RESFful URL-- Second, if you don't search, you can use '/chat?page=1' instead of '/chat?page=1&amp;searchWord='. That means seachWord is an optional parameter. You better not add optional parameters to the URL. A page value changes depending on a searchWord value. You better not add the parameter that is affected by the value of the optional parameter to the URL.
</p>

<h3>List</h3>

<p>
Modify the list method declaration of board controller to handle the changed request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}", method = RequestMethod.GET)
public String list(..., @PathVariable String boardCd, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}")
public String list(..., @PathVariable String boardCd, ...)
</pre>

<p>
In @RequestMapping(value = "{boardCd}", method = RequestMethod.GET) and @GetMapping("{boardCd}"), {boardCd} does not literally mean. If the list method has a parameter declared as @PathVariable String boardCd, in a '/chat?page=1&amp;searchWord=' request, 'chat' is assigned to the boardCd parameter.
</p>

<h3>Detailed View</h3>

<p>
In '/chat/54?page=1&amp;searchWord=', 54 is the unique number of the post. Modify the view method declaration of the board controller to handle the changed request as follows:
</p>

<pre class="prettyprint no-border">@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.GET)
public String view (..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/{articleNo}")
public String view (..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
When '/chat/54?page=1&amp;searchWord=' request comes in, 'chat' is assigned to the parameter boardCd and '54' is assigned to the parameter articleNo.
</p>

<h3>New Form</h3>

<p>
'/chat?page=1&amp;searchWord=' is a RESTful URL for New Form. But you must add a form for adding a post on the list page to use this URL. This change makes bean validation difficult.
</p>

<p>
It doesn't fit a RESTful URL, but let's use the new form request URL as follows:
</p>

<p>
/chat/new?page=1&amp;searchWord=
</p>

<p>
Modify the writeForm method declaration of the board controller to handle the new form request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/new", method = RequestMethod.GET)
public String writeForm(@PathVariable String boardCd, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/new")
public String writeForm(@PathVariable String boardCd, ...)
</pre>

<h3>New</h3>

<p>
'POST /chat?page=1' is a RESTful URL for the adding new post request. Modify the write method declaration of the board controller to handle the adding the new post request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}", method = RequestMethod.POST)
public String write(..., @PathVariable String boardCd, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@PostMapping("{boardCd}")
public String write(..., @PathVariable String boardCd, ...)
</pre>

<h3>Modify Form</h3>

<p>
'/chat/54?page=1&amp;searchWord=' is a RESTful URL for the modify form. But you must add the form for modifying the post to the detailed view page to use the above URL. This change makes bean validation difficult.
</p>

<p>
It doesn't fit a RESTful URL, but let's use the Modify Form request URL as follows:
</p>

<p>
/chat/54/<strong>edit</strong>?page=1&amp;searchWord=
</p>

<p>
Modify the modifyForm method declaration of the board controller to handle the Modify Form request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}/edit", method = RequestMethod.GET)
public String modifyForm(..., @PathVariable String boardCd, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@GetMapping("{boardCd}/{articleNo}/edit")
public String modifyForm(..., @PathVariable String boardCd, ...)
</pre>

<h3>Modify</h3>

<p>
'PUT /chat/54?page=1&amp;searchWord=' is a RESTful URL for the modifying post URL. Modify the modify method declaration of the board controller to handle this request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.PUT)
public String modify(..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
@PutMapping("{boardCd}/{articleNo}")
public String modify(..., @PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<h3>Delete</h3>

<p>
'DELETE /chat/54?page=1&amp;searchWord=' is a RESTful URL for the deleting a post URL. Modify the deleteArticle method declaration of the board controller to handle this request as follows:
</p>

<pre class="prettyprint no-border">
@RequestMapping(value = "{boardCd}/{articleNo}", method = RequestMethod.DELETE)
public String deleteArticle(@PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<p>
A recent Spring can shorten this annotation simply to:
</p>

<pre class="prettyprint no-border">
<strong>@DeleteMapping</strong>("{boardCd}/{articleNo}")
public String deleteArticle(@PathVariable String boardCd, @PathVariable Integer articleNo, ...)
</pre>

<h3>Modify JSPs</h3>

<p>
Modify JSPs by referring to the followings:
</p>

<ul>
	<li>Confirm method values in form elements in JSPs.</li>
	<li>Confirm the lines to build request string in JSPs.</li>
	<li>Remove the boardCd and articleNo in JSPs because these are no longer request parameters.</li>
</ul>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/restful-url">1 RESTful URL</a></li>
	<li><a href="/blog/2019/how-to-make-epub-with-eclipse">2 How to make EPUB ebook with Eclipse</a></li>
</ul>

</article>
