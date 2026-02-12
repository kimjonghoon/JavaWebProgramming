<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<article>

<h1>Handling Cookies</h1>

<p>
The code below gets all cookies that the current document object can access. 
</p>

<pre class="prettyprint no-border">
var allCookies = document.cookie
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
  var newCookie = name + "=" + escape(value);
  if (days) {
    var expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    newCookie += "; expires=" + expires.toGMTString();
  }
  document.cookie = newCookie;
}
function readCookie(name) {
  var allCookies = document.cookie;
  var beginIndex = allCookies.indexOf(" " + name + "=");
  if (beginIndex === -1) {
    beginIndex = allCookies.indexOf(name + "=");
  }
  if (beginIndex === -1) {
    return null;
  } else {
    beginIndex = allCookies.indexOf("=", beginIndex) + 1;
    var endIndex = allCookies.indexOf(";", beginIndex);
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
  var selectBox = document.getElementById("numPerPage");
  selectBox.onchange = setNumPerPage;
  var delNumPerPageBtn = document.getElementById("del-numPerPage-btn");
  delNumPerPageBtn.onclick = delNumPerPageCookie;
}
function setNumPerPage() {
  var selectBox = document.getElementById("numPerPage");
  var numPerPage = selectBox.value;
  createCookie('numPerPage', numPerPage, '100');
  showCookie();
}
function showCookie() {
  var numPerPage = readCookie("numPerPage");
  var div = document.getElementById('show-npp-div');
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
  var newCookie = name + "=" + escape(value);
  if (days) {
    var expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    newCookie += "; expires=" + expires.toGMTString();
  }
  document.cookie = newCookie;
}
function readCookie(name) {
  var allCookies = document.cookie;
  if (!allCookies) {
    return null;
  }
  var beginIndex = allCookies.indexOf(" " + name + "=");
  if (beginIndex === -1) {
    beginIndex = allCookies.indexOf(name + "=");
  }
  if (beginIndex === -1) {
    return null;
  } else {
    beginIndex = allCookies.indexOf("=", beginIndex) + 1;
    var endIndex = allCookies.indexOf(";", beginIndex);
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

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://stackoverflow.com/questions/2144386/javascript-delete-cookie">How to delete a cookie?</a></li>
</ul>

</article>