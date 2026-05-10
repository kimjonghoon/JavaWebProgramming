<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Examples</h1>

<h2>1 Handling select items</h2>

<h3>Adding item</h3>

<pre class="prettyprint">
opts[46] = new Option("Option text", "Option value");
</pre>

<p>
Unlike Java, JavaScript arrays automatically expand.
</p>


<h3>Removing item</h3>

<pre class="prettyprint">
opts[46] = null;
</pre>

<p>
Unlike Java, JavaScript arrays automatically shrink.
</p>

<h3>Removing all items</h3>

<pre class="prettyprint">
opts.length = 0;
</pre>

<p>
The following is an example of dynamically creating submenus in the second selection box when selecting a main menu in the first selection box.
</p>

<h6 class="src">sel.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;Handling select items&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function chooseLang() {
  const form = document.getElementById("testForm");
  const lang = form.programLanguage.value;

  switch (lang) {
  case "java":
    form.step.options[0] = new Option("Java Introduction","javaIntro");
    form.step.options[1] = new Option("Class and Object","ClassObject");
    form.step.options[2] = new Option("Java DataType","JavadataType");
    break;
  case "javascript":
    form.step.options[0] = new Option("JavaScript Introduction","javascriptIntro");
    form.step.options[1] = new Option("JavaScript DataType","JavascriptDataType");
    form.step.options[2] = new Option("JavaScript Objects","JavascriptObjects");
    break;
  default:
    form.step.options.length = 0;
  }
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" action="sel.html"&gt;
  &lt;select name="programLanguage" onchange="chooseLang()"&gt;
    &lt;option value=""&gt;--Select Language&lt;/option&gt;
    &lt;option value="java"&gt;Java&lt;/option&gt;
    &lt;option value="javascript"&gt;JavaScript&lt;/option&gt;
  &lt;/select&gt;
  &lt;select name="step"&gt;
  &lt;/select&gt;
  &lt;input type="submit" value="Test" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Selecting the top level in the language selection initializes the second selection box.
</p>

<p>
<a href="<c:url value="/examples/sel.html"/>">Run example</a>
</p>

<h2>2 Form Validation</h2>

<h3>Accessing forms with JavaScript</h3>

<p>
The following is a way to reference a form object from &lt;form id="<strong>someform</strong>"&gt;.
</p>

<pre class="prettyprint">
const form = document.getElementById("<strong>someform</strong>");
</pre>

<h3>Submit event handler</h3>

<p>
Here's how to specify the handler function to perform when users click the submit button:
</p>

<pre class="prettyprint">
&lt;form id="someform" onsubmit="<strong>return someHandler()</strong>"&gt;
</pre>

<p>
The above <strong>someHandler()</strong> function should return true to pass the form to the server and false to cancel the form submission.
</p>

<h3>How to disable the radio button</h3>

<p>
Here is how to disable the radio button.
</p>

<pre class="prettyprint">
document.someform.radiogroup[i].disabled = true;
</pre>

<p>
Disabled parameters don't go to the server.
</p>

<h6 class="src">send1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function check() {
  const form = document.getElementById("testForm");
  <strong>form.condition[4].disabled = true;</strong>
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1.html"/>">Run example</a>
</p>

<h3>Event handler that executes when radio button or checkbox is selected</h3>

<h6 class="src">send2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function agree() {
  const form = document.getElementById("testForm");
  const submit = document.getElementById("submit");
  if (form.agree.checked == true) {
    submit.disabled = false;	
  } else {
    submit.disabled = true;
  }
}
function check() {
  const form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  const chk = form.confirm[0].value
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
  I agree to the information provided.
  &lt;input type="radio" name="agree" value="y" onchange="agree()" /&gt;
  &lt;input type="submit" id="submit" value="Submit" disabled="disabled" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send2.html"/>">Run example</a>
</p>

<h3>Things We Need To Know In HTML Form</h3>

<ul>
  <li>You can not dynamically add or delete radio button or checkbox options.</li>
  <li>The type attribute of the input element has three values:text, password, hidden.</li>
  <li>You can type multiple lines in the textarea.</li>
  <li>You can access values entered in input and textarea with their value attribute.</li>
  <li>In addition to click, you can use change, focus, and blur events to perform form validation. How to register each event handler is as follows.
    <ul>
      <li>onchange="someHandler()"</li>
      <li>onfocus="someHandler()"</li>
      <li>onblur="someHandler()"</li>
    </ul>
  </li>
</ul>

<h3>Decoupling JavaScript code and HTML design</h3>

<p>
Registering event handlers using the element's attributes increases coupling with HTML.
</p>

<pre class="prettyprint">
&lt;form id="testForm" method="get" onsubmit="return check()"&gt;
</pre>

<p>
You can loosen coupling by modifying send1.html as below.
</p>

<h6 class="src">send1-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
<strong>window.onload = initPage;

function initPage() {
  const form = document.getElementById("testForm");
  form.onsubmit = check;
}

function check() {
  const form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}</strong>
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1-1.html"/>">Run example</a>
</p>

<p>
The above example registers all handlers when an onload event occurs. The onload event occurs when all elements of the HTML document (including images) are ready.
</p>

<p>
You can also make the JavaScript code into an external file to loosen coupling more. However, some of your co-workers may not like this approach in maintenance.
</p>

<h6 class="src">send1.js</h6>
<pre class="prettyprint">
window.onload = initPage;

function initPage() {
  const form = document.getElementById("testForm");
  form.onsubmit = check;
}

function check() {
  const form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}
</pre>

<h6 class="src">send1-2.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
<strong>&lt;script type="text/javascript" src="send1.js"&gt;&lt;/script&gt;</strong>
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send1-2.html"/>">Run example</a>
</p>

<h6 class="src">send2-1.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Test&lt;/title&gt;
&lt;script type="text/javascript"&gt;
window.onload = initPage;

function initPage() {
  const submit = document.getElementById("submit");
  submit.disabled = true;
  const form = document.getElementById("testForm");
  form.onsubmit = check;
  form.agree.onchange = agree;
}

function agree() {
  const form = document.getElementById("testForm");
  const submit = document.getElementById("submit");
  if (form.agree.checked == true) {
    submit.disabled = false;	
  } else {
    submit.disabled = true;
  }
}
function check() {
  const form = document.getElementById("testForm");
  form.condition[4].disabled = true;
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form id="testForm" method="get"&gt;
  Name &lt;input type="text" name="name" /&gt;&lt;br /&gt;
  B&lt;input type="radio" name="condition" value="best" /&gt;
  G&lt;input type="radio" name="condition" value="good" /&gt;
  N&lt;input type="radio" name="condition" value="normal" /&gt;
  B&lt;input type="radio" name="condition" value="bad" /&gt;
  W&lt;input type="radio" name="condition" value="worst" /&gt;&lt;br /&gt;
  I agree to the terms and conditions
  &lt;input type="radio" name="agree" value="y"/&gt;
  &lt;input type="submit" id="submit" value="Submit" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
<a href="<c:url value="/examples/send2-1.html"/>">Run example</a>
</p>

<p>
Let's separate the JavaScript code from the example.
</p>

<p>
<a href="<c:url value="/examples/send2-2.html"/>">Run example</a>
</p>

<h2>3 Handling Cookies</h2>

<p>
The code below gets all cookies that the current document object can access. 
</p>

<pre class="prettyprint no-border">
const allCookies = document.cookie
</pre>

<p>
The code below adds a new cookie.<br />
Do not use it like <em>document.cookie += newCookie;</em>.
</p>

<pre class="prettyprint no-border">
document.cookie = newCookie;
</pre>

<h3>Makingfunctions for handling cookies</h3>

<p>
The createCookie(), readCookie(), and deleteCookie() functions below each add a new cookie, read the cookie, and delete the cookie. The createCookie() function uses string of "Cookie name=Cookie value;Destruction Date" form to add a new cookie. If there is no domain, path, or security information in the string used to add a new cookie, they all have default values.
</p>

<pre class="prettyprint">function createCookie(name, value, days) {
  let newCookie = name + "=" + escape(value);
  if (days) {
    const expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    newCookie += "; expires=" + expires.toGMTString();
  }
  document.cookie = newCookie;
}
function readCookie(name) {
  const allCookies = document.cookie;
  let beginIndex = allCookies.indexOf(" " + name + "=");
  if (beginIndex === -1) {
    beginIndex = allCookies.indexOf(name + "=");
  }
  if (beginIndex === -1) {
    return null;
  } else {
    beginIndex = allCookies.indexOf("=", beginIndex) + 1;
    const endIndex = allCookies.indexOf(";", beginIndex);
    if (endIndex === -1) {
      endIndex = allCookies.length;
    }
    return unescape(allCookies.substring(beginIndex, endIndex));
  }
}
function deleteCookie(name) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
</pre>

<p>
The following example allows the user to store the "number of records per page" in a cookie. Chrome does not store locally generated cookies, so use other browsers for local testing.
</p>

<div class="filename">Test.html</div>
<pre class="prettyprint">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;JavaScript Cookie Test&lt;/title&gt;
&lt;script&gt;
window.onload = initPage;

function initPage() {
  const selectBox = document.getElementById("numPerPage");
  selectBox.onchange = setNumPerPage;
  const delNumPerPageBtn = document.getElementById("del-numPerPage-btn");
  delNumPerPageBtn.onclick = delNumPerPageCookie;
}
function setNumPerPage() {
  const selectBox = document.getElementById("numPerPage");
  const numPerPage = selectBox.value;
  createCookie('numPerPage', numPerPage, '100');
  showCookie();
}
function showCookie() {
  const numPerPage = readCookie("numPerPage");
  const div = document.getElementById('show-npp-div');
  if(numPerPage) {
    div.innerHTML = numPerPage;
  } else {
    div.innerHTML = 'No Cookies!';
  }
}
function delNumPerPageCookie() {
  deleteCookie("numPerPage");
  showCookie();
}
function createCookie(name, value, days) {
  let newCookie = name + "=" + escape(value);
  if (days) {
    const expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    newCookie += "; expires=" + expires.toGMTString();
  }
  document.cookie = newCookie;
}
function readCookie(name) {
  const allCookies = document.cookie;
  if (!allCookies) {
    return null;
  }
  let beginIndex = allCookies.indexOf(" " + name + "=");
  if (beginIndex === -1) {
    beginIndex = allCookies.indexOf(name + "=");
  }
  if (beginIndex === -1) {
    return null;
  } else {
    beginIndex = allCookies.indexOf("=", beginIndex) + 1;
    const endIndex = allCookies.indexOf(";", beginIndex);
    if (endIndex === -1) {
      endIndex = allCookies.length;
    }
    return unescape(allCookies.substring(beginIndex, endIndex));
  }
}
function deleteCookie(name) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div&gt;
  &lt;select id="numPerPage"&gt;
    &lt;option value="10"&gt;10&lt;/option&gt;
    &lt;option value="25"&gt;25&lt;/option&gt;
    &lt;option value="50"&gt;50&lt;/option&gt;
    &lt;option value="100"&gt;100&lt;/option&gt;
  &lt;/select&gt;
  &lt;input type="button" id="del-numPerPage-btn" value="Del numPerPage Cookie" /&gt;
&lt;/div&gt;
&lt;div id="show-npp-div"&gt;&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
The setNumPerPage() function creates the numPerPage cookie, which is maintained for 100 days.
</p>

<p>
The following shows how to get the numPerPage cookie on the server-side code.
</p>

<pre class="prettyprint">int numPerPage = 10;//default record numbers per page
Cookie[] cookies = req.getCookies();
if (cookies != null) {
  for (int i = 0; i &lt; cookies.length; i++) {
    String name = cookies[i].getName();
    if (name.equals("numPerPage")) {
      numPerPage = Integer.parseInt(cookies[i].getValue());
      break;
    }
  }
}
</pre>


<h2>4 Decoupling HTML and JavaScript</h2>

<p>
Using the DOM model to specify event handlers reduces the degree of coupling between HTML and JavaScript.
</p>

<p>
Adding the id attribute to an element makes it easier to specify an event handler:
</p>

<pre class="prettyprint no-border">&lt;input type="button" <strong>id="some-button"</strong> value="Button" /&gt;</pre>

<pre class="prettyprint no-border">
window.onload = function() {
  const btn = document.getElementById("<strong>some-button</strong>");
  btn.onclick = function() {
    //TODO
  };
};
</pre>

<p>
The onload event occurs when all elements of the document (including images) are ready. There is also a disadvantage to specifying event handlers using the window's onload event.
</p>

<ul>
	<li>You may need to add global attributes (id, class, title) that you didn't need until now.</li>
	<li>Many images in the document may slow down the handler registration. (You can use JQuery to improve this)</li>
</ul>

<p>
This section describes how to remove the handler specified in the HTML attribute and use DOM to specify handlers. We will practice with the view.jsp of the bulletin board.
</p>

<h3>Attachment link and Attachment delete link</h3>

<p>
<img src="<c:url value="/resources/images/attachment.png"/>" alt="Attachment link and Attachment delete link" /><br />
</p>

<p>
Modify the download link and the delete link as follows.
</p>

<pre class="prettyprint">&lt;div id="detail"&gt;
  &lt;div id="date-writer-hit"&gt;
    edited &lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="\${regdate }" /&gt; by \${name } hit {hit }
  &lt;/div&gt;
  &lt;div id="article-content"&gt;\${content }&lt;/div&gt;
  &lt;div id="file-list" style="text-align: right;"&gt;
    &lt;c:forEach var="file" items="\${attachFileList }" varStatus="status"&gt;
      &lt;div class="attach-file"&gt;
        &lt;a href="#" <strong>title="\${file.filename }" class="download"</strong>&gt;\${file.filename }&lt;/a&gt;
        &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
          <strong>&lt;a href="#" title="\${file.attachFileNo }"&gt;Del&lt;/a&gt;</strong>
        &lt;/security:authorize&gt;
      &lt;/div&gt;
    &lt;/c:forEach&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
Add the following between &lt;script&gt; and &lt;/script&gt;.
</p>

<pre class="prettyprint">window.onload = initPage;

function initPage() {
  //Download link and the delete link
  const file_list = document.getElementById("file-list");
  const fileLinks = file_list.getElementsByTagName("a");
  
  for (let i = 0; i &lt; fileLinks.length; i++) {
    let fileLink = fileLinks[i];
    if (fileLink.className == "download") {
      fileLink.onclick = function() {
        let attachFileNo = this.title;
        const form = document.getElementById("downForm");
        form.attachFileNo.value = attachFileNo;
        form.submit();
        return false;
      };
    } else {
      fileLink.onclick = function() {
        const attachFileNo = this.title;
        const chk = confirm("Are you sure you want to delete it?");
        if (chk === true) {
          const form = document.getElementById("deleteAttachFileForm");
          form.attachFileNo.value = attachFileNo;
          form.submit();
          return false;
        }
      };
    }
  }
  //TODO: Add code here
  
}//initPage function end
</pre>


<h3>Comment</h3>

<p>
<img alt="Comments" src="<c:url value="/resources/images/edit-comment_en.png"/>" />
</p>

<p>
Modify as follows.
</p>

<pre class="prettyprint"><strong>&lt;div id="all-comments"&gt;</strong>
  &lt;c:forEach var="comment" items="\${commentList }" varStatus="status"&gt;
  &lt;div class="comments"&gt;
    &lt;span class="writer"&gt;\${comment.name }&lt;/span&gt;
    &lt;span class="date"&gt;\${comment.regdate }&lt;/span&gt;
    &lt;security:authorize access="#comment.email == principal.username or hasRole('ROLE_ADMIN')"&gt;
    &lt;span class="modify-del"&gt;
      <strong>&lt;a href="#"&gt;Modify&lt;/a&gt;</strong> | <strong>&lt;a href="#" title="\${comment.commentNo }"&gt;Del&lt;/a&gt;</strong>
    &lt;/span&gt;
    &lt;/security:authorize&gt;
    <strong>&lt;div class="comment-memo"&gt;\${comment.memo }&lt;/div&gt;</strong>
    <strong>&lt;form class="comment-form" action="updateComment" method="post" style="display: none"&gt;</strong>
      &lt;input type="hidden" name="commentNo" value="\${comment.commentNo }" /&gt;
      &lt;input type="hidden" name="boardCd" value="\${param.boardCd }" /&gt;
      &lt;input type="hidden" name="articleNo" value="\${param.articleNo }" /&gt;
      &lt;input type="hidden" name="page" value="\${param.page }" /&gt;
      &lt;input type="hidden" name="searchWord" value="\${param.searchWord }" /&gt;
      &lt;div style="text-align: right;"&gt;
        <strong>&lt;a href="#"&gt;Submit&lt;/a&gt;</strong> | <strong>&lt;a href="#"&gt;Cancel&lt;/a&gt;</strong>
      &lt;/div&gt;
      &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;\${comment.memo }&lt;/textarea&gt;
      &lt;/div&gt;
    &lt;/form&gt;
  &lt;/div&gt;
  &lt;/c:forEach&gt;
<strong>&lt;/div&gt;</strong>
</pre>

<p>
Add the following outside the initPage() function:
</p>

<pre class="prettyprint">function commentUpdate(e) {
  const me = getActivatedObject(e);
  let form = me.parentNode;
  while (form.className != "comment-form") {
    form = form.parentNode;
  }
  form.submit();
  return false;
}
function modifyCommentToggle(e) {
  const me = getActivatedObject(e);
  let comments = me.parentNode;
  while (comments.className != "comments") {
    comments = comments.parentNode;
  }
  const div = comments.getElementsByTagName("div")[0];//Comment p
  const form = comments.getElementsByTagName("form")[0];//Comment form
  if (div.style.display) {
    div.style.display = '';
    form.style.display = 'none';
  } else {
    div.style.display = 'none';
    form.style.display = '';
  }
  return false; 
}
/*
 Head First Ajax 
*/
function getActivatedObject(e) {
  let obj;
  if (!e) {
    //IE Old version
    obj = window.event.srcElement;
  } else if (e.srcElement) {
    //IE 7
    obj = e.srcElement;
  } else {
    //DOM Level 2
    obj = e.target;
  }
  return obj;
}
</pre>

<p>
Add the following to initPage().
</p>

<pre class="prettyprint">
const allComments = document.getElementById("all-comments");
const divs = allComments.getElementsByTagName("div");

for (let i = 0; i &lt; divs.length; i++) {
	if (divs[i].className == "comments") {
		const comments = divs[i];
		const spans = comments.getElementsByTagName("span");
		
		for (let j = 0; j &lt; spans.length; j++) {
			if (spans[j].className === "modify-del") {
				const md = spans[j];
				const commentModifyLink = md.getElementsByTagName("a")[0];//Modify link
				commentModifyLink.onclick = modifyCommentToggle;
				const commentDelLink = md.getElementsByTagName("a")[1];//Delete link
				commentDelLink.onclick = function() {
					const commentNo = this.title;
					const chk = confirm("Are you sure you want to delete it?");
					if (chk === true) {
						const form = document.getElementById("deleteCommentForm");
					   form.commentNo.value = commentNo;
					   form.submit();
					   return false;
					}
				};
			}
			//Modify link in form
			const form = comments.getElementsByTagName("form")[0];
			const div = form.getElementsByTagName("div")[0];
			commentModifyLink = div.getElementsByTagName("a")[0];
			commentModifyLink.onclick = commentUpdate;
			//Cancel link in form
			const cancelLink = div.getElementsByTagName("a")[1];
			cancelLink.onclick = modifyCommentToggle;
		}
	}  
}
</pre>


<h3>Next article link and Prev article link</h3>

<p>
<img alt="Next article link and Prev article link" src="<c:url value="/resources/images/next-prev_en.png"/>" />
</p>

<p>
Modify as follows.
</p>

<pre class="prettyprint">&lt;div id="next-prev"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;p&gt;Next Article : &lt;a href="#" <strong>title="\${nextArticle.articleNo }"</strong>&gt;\${nextArticle.title } &lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;p&gt;Prev Article : &lt;a href="#" <strong>title="\${prevArticle.articleNo }"</strong>&gt;\${prevArticle.article.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
</pre>

<p>
Add the following to initPage().
</p>

<pre class="prettyprint">
//Next Article link, Prev Article link
const nextPrev = document.getElementById("next-prev");
let links = nextPrev.getElementsByTagName("a");
for (i = 0; i &lt; links.length; i++) {
	links[i].onclick = function() {
		const form = document.getElementById("viewForm");
		form.articleNo.value = this.title;
		form.submit();
		return false;
	};
}
</pre>


<h3>Modify/Del/Next Article/Prev Article/List/New Article Button</h3>

<p>
<img alt="Modify/Del/Next Article/Prev Article/List/New Article Button" src="<c:url value="/resources/images/buttons_en.png"/>" />
</p>

<p>
There are two <strong>view-menu</strong> classes surrounding buttons, so we need to modify both.
</p>

<pre class="prettyprint">&lt;div class="view-menu" ..&gt;
  &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" <strong>class="goModify"</strong> /&gt;
    &lt;input type="button" value="Del" <strong>class="goDelete"</strong> /&gt;
  &lt;/div&gt;
  &lt;/security:authorize&gt;
  &lt;div class="fr"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;input type="button" value="Next Article" title="\${nextArticle.articleNo }" <strong>class="next-article"</strong> /&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;input type="button" value="Prev Article" title="\${prevArticle.articleNo }" <strong>class="prev-article"</strong> /&gt;
  &lt;/c:if&gt;
    &lt;input type="button" value="List" <strong>class="goList"</strong> /&gt;
    &lt;input type="button" value="New Article" <strong>class="goWrite"</strong> /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
Add the following to initPage().
</p>

<pre class="prettyprint">
//Modify Button
const modifyBtns = document.getElementsByClassName("goModify");
i = modifyBtns.length;
while (i--) {
	modifyBtns[i].onclick = function() {
		const form = document.getElementById("modifyForm");
		form.submit();
	};
}
//Del Button
const deleteBtns = document.getElementsByClassName("goDelete");
i = deleteBtns.length;
while (i--) {
	deleteBtns[i].onclick = function() {
		const chk = confirm('Are you sure you want to delete it?');
		if (chk === true) {
			const form = document.getElementById("delForm");
			form.submit();
		}
	};
}
//Next Article Button
const nextArticleBtns = document.getElementsByClassName("next-article");
i = nextArticleBtns.length;
while (i--) {
	nextArticleBtns[i].onclick = function() {
		const form = document.getElementById("viewForm");
		form.articleNo.value = this.title;
		form.submit();
	};
}
//Prev Article Button
const prevArticleBtns = document.getElementsByClassName("prev-article");
i = prevArticleBtns.length;
while (i--) {
	prevArticleBtns[i].onclick = function() {
		const form = document.getElementById("viewForm");
		form.articleNo.value = this.title;
		form.submit();
	};
}
//List Button
const listBtns = document.getElementsByClassName("goList");
i = listBtns.length
while (i--) {
	listBtns[i].onclick = function() {
		const form = document.getElementById("listForm");
		form.submit();
	};
}  
//New Article Button
const writeBtns = document.getElementById("goWrite");
i = writeBtns.length;
while(i--) {
	writeBtns[i].onclick = function() {
		const form = document.getElementById("writeForm");
		form.submit();
	};
}
</pre>

<h3>Title link, Page move link, New Article Button</h3>

<p>
<img alt="Title link, Page move link, New Article Button" src="<c:url value="/resources/images/list_en.png"/>" />
</p>

<p>
Modify as follows.
</p>

<pre class="prettyprint">&lt;table <strong>id="list-table"</strong> class="bbs-table"&gt;
&lt;tr&gt;
  &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
  &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  List items start --&gt;
&lt;c:forEach var="article" items="\${list }" varStatus="status"&gt;
&lt;tr&gt;
  &lt;td style="text-align: center;"&gt;
  &lt;c:choose&gt;
    &lt;c:when test="\${param.articleNo == article.articleNo }"&gt;
      &lt;img src="/resources/images/arrow.gif" alt="You are reading this" /&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt; 
      \${listItemNo - status.index }
    &lt;/c:otherwise&gt;
  &lt;/c:choose&gt; 
  &lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;a href="#" title="\${article.articleNo }"&gt;\${article.title }&lt;/a&gt;</strong>
    &lt;c:if test="&#36;{article.attachFileNum &gt; 0 }"&gt;
      &lt;img src="/resources/images/attach.png" alt="Attach File" style="vertical-align: middle;" /&gt;
    &lt;/c:if&gt;
    &lt;c:if test="&#36;{article.commentNum &gt; 0 }"&gt;
      &lt;span class="bbs-strong"&gt;[\${article.commentNum }]&lt;/span&gt;
    &lt;/c:if&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;
    &lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;\${article.hit }&lt;/td&gt;
&lt;/tr&gt;
&lt;/c:forEach&gt;
&lt;!--  List items end --&gt;
&lt;/table&gt;
    
&lt;div id="paging"&gt;
  &lt;c:if test="&#36;{prevPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${prevPage }"&gt;[Prev]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
  &lt;c:forEach var="i" begin="\${firstPage }" end="\${lastPage }"&gt;
    &lt;c:choose&gt;
      &lt;c:when test="\${param.page == i }"&gt;
        &lt;span class="bbs-strong"&gt;\${i }&lt;/span&gt;
      &lt;/c:when&gt;
      &lt;c:otherwise&gt;   
        <strong>&lt;a href="#" title="\${i }"&gt;\${i }&lt;/a&gt;</strong>
        &lt;/c:otherwise&gt;
    &lt;/c:choose&gt;   
  &lt;/c:forEach&gt;
  &lt;c:if test="&#36;{nextPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${nextPage }"&gt;[Next]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
&lt;/div&gt;
&lt;div id="list-menu"&gt;
  <strong>&lt;input type="button" value="New" /&gt;</strong>
&lt;/div&gt;
</pre>

<p>
Add the following to initPage().
</p>

<pre class="prettyprint">
//Title links in detail view
const listTable = document.getElementById("list-table");
links = listTable.getElementsByTagName("a");
for (let i = 0; i &lt; links.length; i++) {
	links[i].onclick = function() {
		const form = document.getElementById("viewForm");
		form.articleNo.value = this.title;
		form.submit();
		return false;
	};
}
//Paging
const paging = document.getElementById("paging");
links = paging.getElementsByTagName("a");
for (let i = 0; i &lt; links.length; i++) {
	links[i].onclick = function() {
		const form = document.getElementById("listForm");
		form.page.value = this.title;
		form.submit();
		return false;
	};
}
//New Article button
const listMenu = document.getElementById("list-menu");
const writeBtn = listMenu.getElementsByTagName("input")[0];
writeBtn.onclick = function() {
	const form = document.getElementById("writeForm");
	form.submit();
};
</pre>

<h3>Attachment link and Attachment delete link (jQuery)</h3>

<p>
Let's change the JavaScript DOM example to use jQuery.
</p>

<p>
Download the latest version of jQuery from https://jquery.com/ and put the jQuery file in the /js folder. Add the following between &lt;head&gt; and &lt;/head&gt; of view.jsp.
</p>

<pre class="prettyprint no-border"><strong>&lt;script src="/resources/js/jquery.js"&gt;&lt;/script&gt;</strong></pre>

<p>
<img alt="Attachment link and Attachment delete link" src="<c:url value="/resources/images/attachment_en.png"/>" />
</p>

<p>
The HTML code has nothing to change.
</p>

<pre class="prettyprint">&lt;div id="detail"&gt;
  &lt;div id="date-writer-hit"&gt;
    edited &lt;fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="\${regdate }" /&gt; by \${name } hit {hit }
  &lt;/div&gt;
  &lt;div id="article-content"&gt;\${content }&lt;/div&gt;
  &lt;div id="file-list" style="text-align: right;"&gt;
    &lt;c:forEach var="file" items="\${attachFileList }" varStatus="status"&gt;
      &lt;div class="attach-file"&gt;
        &lt;a href="#" <strong>title="\${file.filename }" class="download"</strong>&gt;\${file.filename }&lt;/a&gt;
        &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
          <strong>&lt;a href="#" title="\${file.attachFileNo }"&gt;Del&lt;/a&gt;</strong>
        &lt;/security:authorize&gt;
      &lt;/div&gt;
    &lt;/c:forEach&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
Comment out all the existing contents of the JavaScript, add the following code.
</p>

<pre class="prettyprint">
$(document).ready(function() {
	$('#file-list a.download').click(function(e) {
		e.preventDefault();
		const filename = this.title;
		$('#downForm input[name*=filename]').val(filename);
		$('#downForm').submit();
	});
	$('#file-list a:not(.download)').click(function(e) {
		e.preventDefault();
		const chk = confirm("Are you sure you want to delete it?");
		if (chk === true) {
			const attachFileNo = this.title;
			$('#deleteAttachFileForm input[name*=attachFileNo]').val(attachFileNo);
			$('#deleteAttachFileForm').submit();
		}
	});
});
</pre>

<h3>Comment(jQuery)</h3>

<p>
<img alt="Comments" src="<c:url value="/resources/images/edit-comment_en.png"/>" />
</p>

<p>
Modify as follows.
</p>

<pre class="prettyprint">&lt;div id="all-comments"&gt;
  &lt;c:forEach var="comment" items="\${commentList }"&gt;
  &lt;div class="comments"&gt;
    &lt;span class="writer"&gt;\${comment.username }&lt;/span&gt;
    &lt;span class="date"&gt;\${comment.regdate }&lt;/span&gt;
    &lt;c:if test="\${user.username == comment.username }" &gt;
    &lt;span class="modify-del"&gt;
      &lt;a href="#" <strong>class="comment-modify-link"</strong>&gt;Modify&lt;/a&gt; | 
      &lt;a href="#" <strong>class="comment-delete-link"</strong> title="\${comment.commentNo }"&gt;Del&lt;/a&gt;
    &lt;/span&gt;
    &lt;/c:if&gt;
    &lt;div class="comment-memo"&gt;\${comment.memo }&lt;/div&gt;
    &lt;form class="comment-form" action="updateComment" method="post" style="display: none"&gt;
      &lt;input type="hidden" name="commentNo" value="\${comment.commentNo }" /&gt;
      &lt;input type="hidden" name="boardCd" value="\${param.boardCd }" /&gt;
      &lt;input type="hidden" name="articleNo" value="\${param.articleNo }" /&gt;
      &lt;input type="hidden" name="page" value="\${param.page }" /&gt;
      &lt;input type="hidden" name="searchWord" value="\${param.searchWord }" /&gt;
      &lt;div style="text-align: right;"&gt;
        &lt;a href="#" <strong>class="comment-modify-submit-link"</strong>&gt;Submit&lt;/a&gt; | &lt;a href="#" <strong>class="comment-modify-cancel-link"</strong>&gt;Cancel&lt;/a&gt;
      &lt;/div&gt;
      &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;\${comment.memo }&lt;/textarea&gt;
      &lt;/div&gt;
    &lt;/form&gt;
  &lt;/div&gt;
  &lt;/c:forEach&gt;
&lt;/div&gt;
</pre>

<p>
Add the following to $(document).ready(function() {} function.
</p>

<pre class="prettyprint">//Comments
$('.comments').click(function(e) {
	e.preventDefault();
	if ($(e.target).is('.comment-modify-link')) {
		const $form = $(e.target).parent().parent().find('.comment-form');
		const $div = $(e.target).parent().parent().find('.comment-memo');
		if ($form.is(':hidden') === true) {
			$form.show();
			$div.hide();
		} else {
			$form.hide();
			$div.show();
		}
	} else if ($(e.target).is('.comment-modify-cancel-link')) {
		const $form = $(e.target).parent().parent().parent().find('.comment-form');
		const $div = $(e.target).parent().parent().parent().find('.comment-memo');
		if ($form.is(':hidden') === true) {
			$form.show();
			$div.hide();
		} else {
			$form.hide();
			$div.show();
		}
	} else if ($(e.target).is('.comment-modify-submit-link')) {
		const $form = $(e.target).parent().parent().parent().find('.comment-form');
		$form.submit();
	} else if ($(e.target).is('.comment-delete-link')) {
		const chk = confirm('Are you sure you want to delete it?');
		if (chk === false) {
			return;
		}
		const $commentNo = $(e.target).attr('title');
		$('#deleteCommentForm input[name*=commentNo]').val($commentNo);
		$('#deleteCommentForm').submit();
	}
});  
</pre>


<h3>Prev Article link and Next Article link (jQuery)</h3>

<p>
<img alt="Next Article link and Prev Article link" src="<c:url value="/resources/images/next-prev_en.png"/>" />
</p>

<p>
The HTML code has nothing to change.
</p>

<pre class="prettyprint">&lt;div id="next-prev"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;
    &lt;p&gt;Next Article : &lt;a href="#" <strong>title="\${nextArticle.articleNo }"</strong>&gt;\${nextArticle.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;
    &lt;p&gt;Prev Article : &lt;a href="#" <strong>title="\${prevArticle.articleNo }"</strong>&gt;\${prevArticle.title }&lt;/a&gt;&lt;/p&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
</pre>

<p>
Add the following to $(document).ready(function() {} function.
</p>

<pre class="prettyprint">$('#next-prev a').click(function(e) {
	e.preventDefault();
	const articleNo = this.title;
	$('#viewForm input[name*=articleNo]').val(articleNo);
	$('#viewForm').submit();
});
</pre>

<h3>Modify/Del/Next Article/Prev Article/List/New Article Button (jQuery)</h3>

<p>
<img alt="Modify/Del/Next Article/Prev Article/List/New Article Button" src="<c:url value="/resources/images/buttons_en.png"/>" />
</p>

<p>
The HTML code has nothing to change.
</p>

<pre class="prettyprint">&lt;div class="view-menu" .. &gt;
  &lt;security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" <strong>class="goModify"</strong> /&gt;
    &lt;input type="button" value="Del" <strong>class="goDelete"</strong> /&gt;
  &lt;/div&gt;
  &lt;/security:authorize&gt;    
  &lt;div class="fr"&gt;
  &lt;c:if test="\${nextArticle != null }"&gt;      
    &lt;input type="button" value="Next Article" title="\${nextArticle.articleNo }" <strong>class="next-article"</strong> /&gt;
  &lt;/c:if&gt;
  &lt;c:if test="\${prevArticle != null }"&gt;          
    &lt;input type="button" value="Prev Article" title="\${prevArticle.articleNo }" <strong>class="prev-article"</strong> /&gt;
  &lt;/c:if&gt;
    &lt;input type="button" value="List" <strong>class="goList"</strong> /&gt;
    &lt;input type="button" value="New Article" <strong>class="goWrite"</strong> /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
Add the following to $(document).ready(function() {} function.
</p>

<pre class="prettyprint">//Modify Button
$('.goModify').click(function() {
	$('#modifyForm').submit();
});
//Del Button
$('.goDelete').click(function() {
	const chk = confirm('Are you sure you want to delete it?');
	if (chk === true) {
		$('#delForm').submit();
	}
});
//Next Article Button
$('.next-article').click(function() {
	const articleNo = this.title;
	$('#viewForm input[name*articleNo]').val(articleNo);
	$('#viewForm').submit();
});
//Prev Article Button
$('.prev-article').click(function() {
	const articleNo = this.title;
	$('#viewForm input[name*articleNo]').val(articleNo);
	$('#viewForm').submit();
});
//List Button
$('.goList').click(function() {
	$('#listForm').submit();
});
//New Article Button
$('.goWrite').click(function() {
	$('#writeForm').submit();
});
</pre>

<h3>Title link, Page move links, New Article Button (jQuery)</h3>

<p>
<img alt="Title link, Page move links, New Article Button" src="<c:url value="/resources/images/list_en.png"/>" />
</p>

<p>
The relevant code is the same as before.
</p>

<pre class="prettyprint">&lt;table <strong>id="list-table"</strong> class="bbs-table"&gt;
&lt;tr&gt;
  &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
  &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  List items start --&gt;
&lt;c:forEach var="article" items="\${list }" varStatus="status"&gt;
&lt;tr&gt;
  &lt;td style="text-align: center;"&gt;
  &lt;c:choose&gt;
    &lt;c:when test="\${param.articleNo == article.articleNo }"&gt;
      &lt;img src="/resources/images/arrow.gif" alt="You are reading this" /&gt;
    &lt;/c:when&gt;
    &lt;c:otherwise&gt; 
      \${listItemNo - status.index }
    &lt;/c:otherwise&gt;
  &lt;/c:choose&gt; 
  &lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;a href="#" title="\${article.articleNo }"&gt;\${article.title }&lt;/a&gt;</strong>
    &lt;c:if test="&#36;{article.attachFileNum &gt; 0 }"&gt;
      &lt;img src="/resources/images/attach.png" alt="Attach File" style="vertical-align: middle;" /&gt;
    &lt;/c:if&gt;
    &lt;c:if test="&#36;{article.commentNum &gt; 0 }"&gt;
      &lt;span class="bbs-strong"&gt;[\${article.commentNum }]&lt;/span&gt;
    &lt;/c:if&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;
    &lt;fmt:formatDate pattern="yyyy.MM.dd" value="\${article.regdate }" /&gt;
  &lt;/td&gt;
  &lt;td style="text-align: center;"&gt;\${article.hit }&lt;/td&gt;
&lt;/tr&gt;
&lt;/c:forEach&gt;
&lt;!--  List items end --&gt;
&lt;/table&gt;
    
&lt;div id="paging"&gt;
  &lt;c:if test="\${prevPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${prevPage }"&gt;[Prev]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
    
  &lt;c:forEach var="i" begin="\${firstPage }" end="\${lastPage }"&gt;
    &lt;c:choose&gt;
      &lt;c:when test="\${param.page == i }"&gt;
        &lt;span class="bbs-strong"&gt;\${i }&lt;/span&gt;
      &lt;/c:when&gt;
      &lt;c:otherwise&gt;   
        <strong>&lt;a href="#" title="\${i }"&gt;\${i }&lt;/a&gt;</strong>
        &lt;/c:otherwise&gt;
    &lt;/c:choose&gt;   
  &lt;/c:forEach&gt;
    
  &lt;c:if test="&#36;{nextPage &gt; 0 }"&gt;
    <strong>&lt;a href="#" title="\${nextPage }"&gt;[Next]&lt;/a&gt;</strong>
  &lt;/c:if&gt;
    
&lt;/div&gt;

&lt;div id="list-menu"&gt;
  <strong>&lt;input type="button" value="New Article" /&gt;</strong>
&lt;/div&gt;
</pre>

<p>
Add the following to $(document).ready(function() {} function.
</p>

<pre class="prettyprint">//Title links in Detailed view
$('#list-table a').click(function(e) {
	e.preventDefault();
	const articleNo = this.title;
	$('#viewForm input[name*articleNo]').val(articleNo);
	$('#viewForm').submit();
});
//Paging
$('#paging a').click(function(e) {
	e.preventDefault();
	const page = this.title;
	$('#listForm input[name*=page]').val(page);
	$('#listForm').submit();
});
//New Article Button
$('#list-menu input').click(function() {
	$('#writeForm').submit();
});
</pre>

<p>
It is up to you to use pure JavaScript or jQuery.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://stackoverflow.com/questions/2144386/javascript-delete-cookie">How to delete a cookie?</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>Prev : <a href="<c:url value="/javascript/objects"/>">Objects</a></li>
	</ul>
</div>

</article>