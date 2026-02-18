<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Prototype</h1>

<p>
A prototype is a kind of model that creators make at the beginning of development. The web application prototype is mostly JSPs that show screens. You don't need to implement program logic in prototypes except those required for testing or not change until the end of development.
</p>

<h2>Positioning div elements for layout</h2>

<p style="margin: 17px; font-weight: bold; font-size: 15px;">
This section covers CSS positioning. CSS positioning is a technology that uses CSS to position the screen of a website. Float and margin are properties that play an essential role in CSS positioning.
</p>
 
<h3>Float property</h3>

<p>
Typical element following float element does not recognize the existence of float element and acquire float box area. However, the contents of the two boxes do not invade each other's space.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  background-color: #66f;
}
#B {
  background-color: #ddd;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b_en.png"/>" alt="A float:left" />
</p>

<h3>Clear property</h3>

<p>
The clear property values are left, right, and both. The following examples describe each value's exact meaning.
</p>

<p>
A has <strong>float: left</strong>.<br />
B has <strong>float: right</strong>.<br />
C has no clear property.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  <strong>float: left;</strong>
  width: 100px;
  background-color: #66f;
}
#B {
  <strong>float: right;</strong>
  width: 100px;
  background-color: #ddd;
}
#C {
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right.png"/>" alt="A float:left,B float:right" />
</p>

<p>
Added <strong>clear: left</strong> to #C.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  background-color: #66f;
}
#B {
  float: right;
  width: 100px;
  background-color: #ddd;
}
#C {
  <strong>clear: left;</strong>
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-left.png"/>" alt="A float:left,B float:right,C clear:left" />
</p>

<p>
Change clear: left of #C to <strong>clear: right</strong>.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  background-color: #66f;
}
#B {
  float: right;
  width: 100px;
  background-color: #ddd;
}
#C {
  <strong>clear: right;</strong>
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-right.png"/>" alt="A float:left,B float:right,C clear:right" />
</p>

<p>
Change clear: right of #C to <strong>clear: both</strong>.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  background-color: #66f;
}
#B {
  float: right;
  width: 100px;
  background-color: #ddd;
}
#C {
  <strong>clear: both;</strong>
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left-b-float-right-c-clear-both.png"/>" alt="A float:left,B float:right,C clear:both" />
</p>

<h3>Negative Margins</h3>

<p>
It is possible to assign negative numbers for the margin values. Negative margins can minimize the number of elements required for the screen.
</p>

<p>
First, let's look at an example of elements that does not have negative margins.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  background-color: #ddd;
}
&lt;/style&gt;
</pre>

<div style="margin: 0 auto;width: 268px;border-left: 4px red dotted;border-right: 4px red dotted;">
<img src="<c:url value="/resources/images/a-b.png"/>" alt="A float:left,B float:left" />
</div>

<p>
Suppose you assign a negative value to the margin-left of #A, #A moves to the left by that value. #B moves along #A too.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  <strong>margin-left: -50px;</strong>
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  background-color: #ddd;
}
&lt;/style&gt;
</pre>

<div style="margin: 0 auto;width: 265px;height: 100px;border-left: 4px red dotted;border-right: 4px red dotted;">
<img src="<c:url value="/resources/images/a-margin-left-50px-b.png"/>" alt="A float:left;margin-left: -50px;,B float:left" style="display: block;float: left;margin-left: -50px;opacity: 0.6;"/>
</div>

<p>
If you assign a negative value to #A's margin-right, #A pulls #B towards himself and increases #B as much as that value.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100px;
  <strong>margin-right: -50px;</strong>
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  background-color: #ddd;
}
&lt;/style&gt;
</pre>

<div style="margin: 0 auto;width: 265px;border-left: 4px red dotted;border-right: 4px red dotted">
<img src="<c:url value="/resources/images/a-margin-right-50px-b.png"/>" alt="A float:left;margin-right: -50px;,B float:left" />
</div>

<h3>3 column layout</h3>

<p>
#A, #B, #C have <strong>float: left</strong>. Because they do not have negative margins, each element does not invade other areas.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  <strong>float: left;</strong>
  width: 100px;
  background-color: #66f;
}
#B {
  <strong>float: left;</strong>
  width: 100px;
  background-color: #ddd;
}
#C {
  <strong>float: left;</strong>
  width: 100px;
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-b-c-all-float-left.png"/>" alt="A float:left;B float:left,C float:left" />
</p>

<p>
Modify #A's width value from 100px to 100%.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  <strong>width: 100%;</strong>
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  background-color: #ddd;
}
#C {
  float: left;
  width: 100px;
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-100-width-b-c-all-float-left.png"/>" alt="A float:left;width:100%,B float:left,C float:left" />
</p>

<p>
There are #B and #C under #A. But it would help if you thought that #A, #B, and #C are side by side because all three boxes are float boxes.
</p>

<p>
Add <strong>margin-right: -100%</strong> to #A.<br />
You can confirm #B and #C overlap on the left side of #A.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100%;
  <strong>margin-right: -100%;</strong>
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  background-color: #ddd;
}
#C {
  float: left;
  width: 100px;
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-100-width-margin-right-100-b-c-all-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<p>
Remove <strong>margin-right: -100%</strong> from #A. Add <strong>margin-left: -100%</strong> to #B.<br />
You can confirm that #B overlaps on the left side of #A, and #C moves to the original #B position.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100%;
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  <strong>margin-left: -100%;</strong>
  background-color: #ddd;
}
#C {
  float: left;
  width: 100px;
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-b-margin-left-100-c-all-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<p>
Add <strong>margin-left: -100px</strong> to #C. (100px is the width of C element)<br />
You can confirm that #C moves on the right side of #A.
</p>

<pre class="prettyprint">
&lt;style type="text/css"&gt;
#A {
  float: left;
  width: 100%;
  background-color: #66f;
}
#B {
  float: left;
  width: 100px;
  margin-left: -100%;	
  background-color: #ddd;
}
#C {
  float: left;
  width: 100px;
  <strong>margin-left: -100px;</strong>
  background-color: #f66;
}
&lt;/style&gt;
</pre>

<p>
<img src="<c:url value="/resources/images/a-float-left.png"/>" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
</p>

<h3>Website Design using 3 column layout with fixed width</h3>

<p>
The screen consists of #header, #man-menu, #sidebar, #content, #extra, #footer.
</p>

<ul>
	<li><strong>header</strong>: It is located at the top and contains the company logo image.</li>
	<li><strong>main-menu</strong>: It is under the header and displays the main menu.</li>
	<li><strong>sidebar</strong>: It shows the submenu on the left of the screen.</li>
	<li><strong>content</strong>: It shows actual contents on the center of the screen.</li>
	<li><strong>extra</strong>: It shows ads on the right side of the screen.</li>
	<li><strong>footer</strong>: It is located at the bottom and contains global menus such as Copyright, Contact, Directions, etc.</li>
</ul>

<p>
The size of the elements mentioned above is specified as follows.
</p>

<h4>header</h4>

<p style="padding-left: 20px;">
width: 1000px<br />
height: 48px
</p>

<h4>main-menu</h4>

<p style="padding-left: 20px;">
width: 1000px<br />
height: 35px
</p>

<h4>sidebar</h4>

<p style="padding-left: 20px;">
width: 175px<br />
</p>

<h4>content</h4>

<p style="padding-left: 20px;">
width: 720px<br />
</p>

<h4>extra</h4>

<p style="padding-left: 20px;">
width: 205px<br />
</p>

<h4>footer</h4>

<p style="padding-left: 20px;">
width: 1000px<br />
height: 70px
</p>

<h3>Default HTML document</h3>

<p>
Copy the following and paste it to your editor.
</p>

<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="<em>keywords</em>" /&gt;
&lt;meta name="Description" content="<em>description</em>" /&gt;
&lt;title&gt;<em>title</em>&lt;/title&gt;
&lt;link rel="stylesheet" href="css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Save it as index.html on the document base. Paste the following to the body elements of index.html.
</p>

<pre class="prettyprint">
&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;header&lt;/div&gt;
	
  &lt;div id="main-menu"&gt;main-menu&lt;/div&gt;
	
  &lt;div id="container"&gt;
    &lt;div id="content"&gt;content&lt;/div&gt;
  &lt;/div&gt;
	
  &lt;div id="sidebar"&gt;sidebar&lt;/div&gt;
	
  &lt;div id="extra"&gt;extra&lt;/div&gt;
	
  &lt;div id="footer"&gt;footer&lt;/div&gt;
	
&lt;/div&gt;
</pre>

<p>
The #wrap and #container are extra elements needed for an unbreakable layout. The #wrap wraps all divs in the document. The #container is required to place three columns.
</p>

<p>
The #content comes before the #sidebar. The #content element is the most important and frequently changed on the web page, so it is advantageous for maintenance if it comes more first.
</p>

<p>
Create a folder named css on the document base and create a screen.css file in css folder with the following content:
</p>

<pre class="prettyprint">
@CHARSET "UTF-8";
/*** The Essential Code ***/
html, body {
  margin: 0;
  padding: 0;
  background-color: #FFF;
  font-family: "Liberation Sans", Helvetica, sans-serif;
  font-size: 1em;
}
#wrap {
  margin: 0 auto;
  padding: 0;
  width: 1000px;
}
#header {
  width: 1000px;
  height: 48px;
}
#main-menu {
  width: 1000px;
  height: 35px;
}
#container {
  width: 100%;
}
#content {
        
}
#sidebar {
  width: 175px;
}
#extra {
  width: 205px; 
}
#footer {
  height: 70px;
}
/*** Just for Looks ***/
#header, #footer {
  font-size: large;
  text-align: center;
  background: #999;
}
#main-menu {
  font-size: large;
  text-align: center;
  background: #DAEAAA;
}
#content {
  font-size: large;
  text-align: center;
  background: #DDD;
  height: 100px;
}
#sidebar {
  font-size: large;
  text-align: center;
  background: #66F;
  height: 100px;
}
#extra {
  font-size: large;
  text-align: center;
  background: #F66;
  height: 100px;
}
</pre>

<p>
The content of the CSS document is an iteration of the following form:
</p>

<pre class="prettyprint">
Selector {
  Property: value;
  ..
  .
}
</pre>

<p>
There are various types of selectors such as Type, Descendant, Class, Id, Child, and Attribute.<br />
The following shows each selector.
</p>

<pre class="prettyprint">
/* Type Selector */
body {

}
/* Descendant Selector */
ul strong {

}
/* Class Selector */
.redwine {

}
/* id Selector */
#header {

}
/* Child Selector */
body &gt; p {

}
/* attribute Selector */
input[type="text"] {

}
</pre>

<p>
The selector that begins with # is the Id selector. The Id selector gives styles to unique elements in the HTML document. In index.html, wrap, header, main-menu, container, content, sidebar, extra, and footer are unique elements.
</p>

<p>
The selector that begins with a dot (.) is the Class selector.
</p>

<dl class="note">
<dt><em>div.redwine</em> vs <em>div .redwine</em></dt>
<dd><em>div.redwine</em> gives styles to <em>&lt;div class="redwine"&gt;</em>.<br />
<dd><em>div .redwine</em> gives styles to elements that are descendants of div whose class is redwine.</dd>
</dl>

<p>
Double-click the index.html to see the design.
No web server is required.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-1.png"/>" alt="Example Screeen 1" />
</p>

<h3>screen.css</h3>

<p>
Let's take a look at the contents of the CSS file.
</p>

<h4>html, body</h4>

<pre class="prettyprint">
html, body {
  margin: 0;
  padding: 0;
  background-color: #FFF;
  font-family: "Liberation Sans", Helvetica, sans-serif;
  font-size: 1em;
}
</pre>

<p>
The above give styles to both html and body elements. Unlike div, html and body elements have default margins and padding. So, most web designers set margins and padding of html and body to zero, then start designing.
</p>

<h4>#wrap</h4>

<pre class="prettyprint">
#wrap {
  margin: 0 <strong>auto</strong>;
  padding: 0;
  width: 1000px;
}
</pre>

<p>
The margin needs four values. When you set four values to margin, each value is assigned to top, right, bottom, left in order. When you set only one value to margin (e.g, <strong>margin: 100px</strong>), 100px is assigned to top, right, bottom, left. When you set two values to margin (e.g, <strong>margin: 100px 50px</strong>), 100px is assigned to top and bottom, and 50px is assigned to right and left. When you set three values to margin (e.g, <strong>margin: 100px 50px 25px</strong>), 100px is assigned to top and 50px is assigned to right and 25px is assigned to bottom in order. Left margin is assigned to equal to right.
</p>

<p>
You can set auto to margin. This value lays the element to center or middle. #wrap is centered because its second margin value is auto.
</p>

<p>
The default margin and padding of div elements are zero.
</p>

<p>
The contents of the CSS file are divided into /*** Essential Code ***/ and /*** Just for Looks ***/.  /*** Just for Looks ***/ is for screen test, which disappears when the CSS file is completed.
</p>

<h4>#container</h4>

<pre class="prettyprint">
#container {
  width: 100%;
}
</pre>

<p>
100% means the maximum extent to which the content of the #container can fit. Since the margin and padding of the #container are zero and no border is set, 100% is 1000px like the #wrap.
</p>

<h3>Set left and right margins of #content</h3>

<p>
Modify #content of /*** Essential Code ***/ as shown below.
</p>

<pre class="prettyprint">
#content {
  <strong>margin-left: 175px;
  margin-right: 205px;</strong>
}
</pre>

<p>
The above settings are the same as the following settings:<br />
<strong>margin: 0 205px 0 175px;</strong>
</p>

<p>
<img src="<c:url value="/resources/images/layout1-2.png"/>" alt="example 2" />
</p>

<h3>Add float: left to #container, #sidebar, #extra</h3>

<p>
To place #sidebar on the left of #content and #extra on the right of #content, Modify the following at /*** The Essential Code ***/
</p>

<pre class="prettyprint">
#container {
  <strong>float: left;</strong>
  width: 100%;
}
#content {
  margin-left: 175px;
  margin-right: 205px;
}
#sidebar {
  <strong>float: left;</strong>
  width: 175px;
}
#extra {
  <strong>float: left;</strong>
  width: 205px; 
}
#footer {
  <strong>clear: both;</strong>
  height: 70px;
}
</pre>

<p>
Added <strong>float: left</strong> to #container and #sidebar and #extra.
</p>

<p>
Because #container, #sidebar, and #extra are float elements, you should think that they are side by side, not up and down like boxes in normal flow.
</p>

<p>
Added <strong>clear: both</strong> to #footer to prevent #content, #sidebar, and #extra content from invading #footer.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-3.png"/>" alt="Example Screeen 3" />
</p>

<h3>Place #sidebar on the left of #content</h3>

<p>
Add the following to #sidebar in the /*** The Essential Code ***/
</p>

<pre class="prettyprint">
#sidebar {
  float: left;
  width: 175px;
  <strong>margin-left: -1000px;</strong>
}
</pre>

<p>
The <strong>margin-left: -100%</strong> has same effect.
</p>

<p>
<img src="<c:url value="/resources/images/layout1-4.png"/>" alt="Example Screeen 4" />
</p>

<h3>Place #extra on the right of #content</h3>

<p>
Add the following to #extra.
</p>

<pre class="prettyprint">
#extra {
  float: left;
  width: 205px;
  <strong>margin-left: -205px;</strong> 
}
</pre>

<img src="<c:url value="/resources/images/layout1-5.png"/>" alt="Example Screeen 5" />

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.html.net/tutorials/css/">http://www.html.net/tutorials/css/</a></li>
	<li><a href="http://www.subcide.com/articles/creating-a-css-layout-from-scratch/P1/">http://www.subcide.com/articles/creating-a-css-layout-from-scratch/P1/</a></li>
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
	<li><a href="http://coding.smashingmagazine.com/2009/07/27/the-definitive-guide-to-using-negative-margins/">http://coding.smashingmagazine.com/2009/07/27/the-definitive-guide-to-using-negative-margins/</a></li>
	<li><a href="http://www.w3.org/QA/2002/04/valid-dtd-list.html">http://www.w3.org/QA/2002/04/valid-dtd-list.html</a></li>
	<li><a href="http://www.ibm.com/developerworks/kr/library/wa-css/">http://www.ibm.com/developerworks/kr/library/wa-css/</a></li>
	<li><a href="http://www.maxdesign.com.au/articles/css-layouts/">http://www.maxdesign.com.au/articles/css-layouts/</a></li>
</ul>

<h2>Main menu styling</h2>

<p>
Create a folder named images and save the following five images in the images folder.
</p>

<ol>
	<li><img src="<c:url value="/resources/images/bull_circle.gif"/>" alt="bull_circle.gif" style="width: 90px;height: 90px;background: #ebebeb;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/attach.png"/>" alt="attach.png" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/ci.gif"/>" alt="ci.gif" style="width: 117px;height: 39px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/circle.gif"/>" alt="circle.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="<c:url value="/resources/images/arrow.gif"/>" alt="arrow.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
</ol>

<p>
Open index.html and add the following to #main-menu in index.html.
</p>

<pre class="prettyprint">
&lt;div id="main-menu"&gt;
<strong>
  &lt;ul id="nav"&gt;
    &lt;li&gt;&lt;a href="#"&gt;Java&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;JSP&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;Spring&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
  &lt;/ul&gt;
</strong>	
&lt;/div&gt;	
</pre>

<p>
Add the following to #main-menu in stylesheets. (Remove #main-menu in /*** Just for Looks ***/)
</p>

<pre class="prettyprint">
#main-menu {
  width: 1000px;
  height: 35px;
  <strong>font-family: Verdana, sans-serif;
  font-weight: bold;
  font-size: 12px;</strong>	
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-01.png"/>" alt="Example Screeen 1" />
</p>

<h3>ul#nav</h3>

<p>
To remove default margin and padding of ul and li, add the following in /*** The Essential Code ***/.
</p>

<pre class="prettyprint">
<strong>ul#nav {
  margin: 0;
  padding: 0;
  list-style-type: none;
}</strong>	
</pre>

<p>
<img src="<c:url value="/resources/images/main-02.png"/>" alt="Example Screeen 2" />
</p>

<h3>ul#nav li</h3>

<p>
To list the menus horizontally, add the following to /*** The Essential Code ***/.
</p>

<pre class="prettyprint">
<strong>ul#nav li {
  float: left;
}</strong>
</pre>

<p>
<img src="<c:url value="/resources/images/main-03.png"/>" alt="Example Screeen 3" />
</p>

<p>
Add padding between menus like below.
</p>

<pre class="prettyprint">
ul#nav li {
  float: left;
  <strong>padding: 0 17px 0 8px;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-04.png"/>" alt="Example Screeen 4" />
</p>

<h3>Positioning ul#nav</h3>

<p>
The menus position is too upwards. To move menus to middle while not changing the height of #main-menu, modify ul#nav like below.
</p>

<pre class="prettyprint">
ul#nav {
  margin: 0;
  padding: 0;
  list-style-type: none;
  <strong>position: relative;
  top: 9px;
  left: 17px;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-05.png"/>" alt="Example Screeen 5" />
</p>

<h3>Main Menu Link Style</h3>

<p>
Add a background color to #main-menu.
</p>

<pre class="prettyprint">
#main-menu {
  width: 1000px;
  height: 35px;
  font-family: Verdana, sans-serif;
  font-weight: bold;
  font-size: 12px;
  <strong>background: #92B91C;</strong>
}
</pre>

<p>
Add the following to /*** The Essential Code ***/ to remove the link's default underscore and set the underline to appear when the mouse hovers.
</p>

<pre class="prettyprint">
<strong>ul#nav &gt; li &gt; a {
  text-decoration: none;
  color: #FFF;
}
ul#nav &gt; li &gt; a:hover {
  text-decoration: underline;
  background: none;
  color: #FFF;
}</strong>
</pre>

<p>
<img src="<c:url value="/resources/images/main-06.png"/>" alt="Example Screeen 6" />
</p>

<h3>Using an image instead of default list style</h3>

<p>
If you add <strong>list-style-type: none</strong> to ul, the default list style disappears. You can express lists more elegantly if you put a background image in front of li instead of the default list style.
</p>

<p>
Add the following to <strong>ul#nav li</strong>.
</p>

<pre class="prettyprint">
ul#nav li {
  float: left;
  padding: 0 17px 0 8px;
  <strong>background: url('../images/bull_circle.gif') no-repeat 0 50%;</strong>
}
</pre>

<p>
The image path should be relative to the location of the stylesheets.
</p>

<p>
Add a border to #main menu box like below.
</p>

<pre class="prettyprint">
#main-menu {
  <strong>margin: 15px 0;</strong>
  width: <strong>996px;</strong>
  height: 35px;
  font-family: Verdana, sans-serif;
  font-weight: bold;
  font-size: 12px;	
  background: #92B91C;
  <strong>border: 2px solid #DAEAAA;</strong>
}
</pre>

<p>
<img src="<c:url value="/resources/images/main-final.png"/>" alt="Example Screeen 8" />
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.css3.info/preview/rounded-border/">http://www.css3.info/preview/rounded-border/</a></li>
	<li><a href="http://border-radius.com/">http://border-radius.com/</a></li>
	<li><a href="http://www.the-art-of-web.com/css/border-radius/">http://www.the-art-of-web.com/css/border-radius/</a></li>
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h2>Sub menu styling</h2>

<p>
Add submenu items to #sidebar as shown below.
</p>

<pre class="prettyprint">
&lt;div id="sidebar"&gt;
  <strong>&lt;h1&gt;Eclipse&lt;/h1&gt;
  &lt;ul&gt;
    &lt;li class="sub-heading"&gt;Introduction&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;Features&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href="#"&gt;Object &amp; Class&lt;/a&gt;&lt;/li&gt;
  &lt;/ul&gt;</strong>
&lt;/div&gt;
</pre>

<p>
Delete #sidebar in /*** Just for Looks ***/.
</p>

<p>
<img alt="Sub menu 1" src="<c:url value="/resources/images/sub-01_en.png"/>" />
</p>

<p>
Add border and font styles to #sidebar
</p>

<pre class="prettyprint">
#sidebar {
  float: left;
  width: <strong>173px;</strong>
  margin-left: -1000px;<strong>
  margin-bottom: 20px;
  border: 1px solid #DAEAAA;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  position: relative;
  top: 7px;</strong>
}
</pre>

<p>
Actual width of the area that the contents of other boxes cannot invade is calculated as <strong>width + left/right padding sum + left/right border sum</strong>. So, changed the width property of #sidebar with left/right padding sum of 0 and left/right border sum of 2px from 175px to 173px.
</p>

<p>
<strong>position: relative</strong> and <strong>top: 7px</strong> moves #sidebar box down by 7px from its original position. If #sidebar moves down, #sidebar invades #footer. So, added <strong>margin-bottom: 20px</strong> so that #sidebar does not invade #footer.
</p>

<p>
Add the following to /*** The Essential Code ***/ to style the category (main menu) to which the submenus belong at #sidebar.

<pre class="prettyprint">
<strong>#sidebar &gt; h1 {
  margin: 0;
  padding: 14px;
  background: #92B91C;
  color: #FFF;
  font-size: 16px;
}</strong>
</pre>

<p>
<img alt="Sub menu 2" src="<c:url value="/resources/images/sub-02_en.png"/>" />
</p>

<h3>Styling submenu items at #sidebar</h3>

<p>
Add the following to /*** The Essential Code ***/.
</p>

<pre class="prettyprint">
<strong>#sidebar &gt; ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}</strong>
</pre>

<p>
<img alt="Sub menu 3" src="<c:url value="/resources/images/sub-03_en.png"/>" />
</p>

<p>
Add the following to /*** The Essential Code ***/.
</p>

<pre class="prettyprint">
<strong>#sidebar &gt; ul &gt; li.sub-heading {
  display: block;
  padding: 6px 10px 6px 10px;
  color: #64615D;
  background: #DAEAAA;
  text-decoration: none;
  font-weight: bold;
}
#sidebar &gt; ul &gt; li &gt; a:hover {
  background-color: #EDFEBA;
  color: #64615D;
}
#sidebar &gt; ul &gt; li &gt; a {
  display: block;
  color: #64615D;
  padding: 5px 3px 4px 17px;
  text-decoration: none;
  border-bottom: 1px solid #FFF;
  font-weight: normal;
  background: #FFF url('../images/circle.gif') no-repeat 5% 50%;
}</strong>
</pre>

<p>
The <strong>a</strong> is an inline element, but it becomes a box element and links the entire box area to other documents if you add <strong>display: block</strong>.
</p>

<p>
<img alt="Sub menu Final" src="<c:url value="/resources/images/sub-final_en.png"/>" />
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h2>#header, #footer, #content styling</h2>

<p>
Add the following to #header in index.html.
</p>

<pre class="prettyprint">
&lt;h1&gt;&lt;a href="/"&gt;&lt;img src="images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
</pre>

<p>
Remove the rest of #header and #footer styles except for the background color in /*** Just for Looks ***/.
</p>

<pre class="prettyprint">
#header, #footer {
  background: #999;
}
</pre>

<p>
<img alt="header 1" src="<c:url value="/resources/images/header-01_en.png"/>" />
</p>

<h3>#header</h3>

<p>
Since the h1 element has a default margin, the #header moves down by the margin value. For delicate design, remove the default margin and padding of h1 in the #header.
</p>

<p>
Add the following to /*** The Essential Code ***/ to move h1 down 9px in #header.
</p>

<pre class="prettyprint">
<strong>#header h1 {
  margin: 0;
  padding: 0;
  position: relative;
  top: 9px;
}</strong>
</pre>

<p>
<img alt="header 2" src="<c:url value="/resources/images/header-02_en.png"/>" />
</p>

<h2>#footer</h2>

<p>
Add the following to the #footer in index.html.
</p>

<pre class="prettyprint">
<strong>&lt;ul&gt;
  &lt;li&gt;&lt;a href="#"&gt;Guide&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Privacy&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Email Collection Ban&lt;/a&gt;&lt;/li&gt;
  &lt;li id="company-info"&gt;Phone : 1234-5678, FAX : 1234-5678&lt;br /&gt;
  johndoe@gmail.org&lt;br /&gt;
  Copyright java-school.net All Rights Reserved.&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Map&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;</strong>
</pre>

<p>
Modify #footer in /*** The Essential Code ***/ as shown below.
</p>

<pre class="prettyprint">
#footer {
  clear: both;
  height: 70px;
  <strong>font-size: 11px;
  color: #8d8d8d;
  letter-spacing: -1px;
  border-top: 1px solid #DAEAAA;
  position: relative;
  top: 7px;</strong>	
}
</pre>

<p>
Remove #header, #footer in /*** Just for Looks ***/.
</p>

<p>
<img alt="footer 1" src="<c:url value="/resources/images/footer-01_en.png"/>" />
</p>

<p>
Add the following to /*** The Essential Code ***/ to arrange #footer menu items horizontally. 
</p>

<pre class="prettyprint">
<strong>#footer &gt; ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}
#footer &gt; ul &gt; li {
  float: left;
}</strong> 
</pre>

<p>
<img alt="footer 2" src="<c:url value="/resources/images/footer-02_en.png"/>" />
</p>

<p>
Finish styling #footer as shown below.
</p>

<pre class="prettyprint">
#footer &gt; ul {
  margin: 0;
  padding: 0;
  list-style-type: none;<strong>
  position: relative;
  left: 8px;</strong>
}
#footer &gt; ul &gt; li {
  float: left;
  <strong>padding: 6px 12px 6px 8px;
  background: url('../images/circle.gif') no-repeat 0 50%;</strong>
}<strong>
#footer &gt; ul &gt; li &gt; a {
  color: #8D8D8D;
  text-decoration: none;
}
#footer &gt; ul &gt; li &gt; a:hover {
  text-decoration: underline;
}
#footer &gt; ul &gt; li#company-info {
  margin-left: 350px;
  letter-spacing: 0;
  background: none;
}</strong>
</pre>

<p>
<img alt="footer final" src="<c:url value="/resources/images/footer-03_en.png"/>" />
</p>

<h2>#content</h2>

<p>
Increase #content the left and right margins of #content by 5px to make the gap between #content and #sidebar and #content and #extra.
</p>

<pre class="prettyprint">
#content {
  margin-left: <strong>180px;</strong>
  margin-right: <strong>210px;</strong>
}
</pre>

<p>
The size of #content box is 1000px. The #content's width is 610px because the sum of left and right margins is 390px (180 + 210). With borders set to 1px on the left and right, #content's width will be 608px.
</p>

<p>
Modify #container and #extra as shown below. 
</p>

<pre class="prettyprint">
#container {
  float: left;
  width: 100%;
  <strong>border-top: 1px solid #DAEAAA;</strong>
}
</pre>

<pre class="prettyprint">
#extra {
  float: left;
  width: 205px;
  margin-left: -205px;
  <strong>margin-bottom: 20px;
  position: relative;
  top: 7px;</strong>
}
</pre>

<p>
Change the height of #content from 100px to 300px in the /*** Just for Looks ***/ for testing.
</p>

<pre class="prettyprint">
#content {
  font-size: large;
  text-align: center;
  background: #DDD;
  <strong>height: 300px;</strong>
}
</pre>

<p>
<img alt="content 1" src="<c:url value="/resources/images/content-01.png"/>" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h2>Board styling - List</h2>

<p>
The following are standard styles for our website. Add these after the html, body selector in the /*** The Essential Code ***/.
</p>

<pre class="prettyprint">
<strong>pre {
  margin: 0 0 0.7em 0;
  font-family: Consolas, "Liberation Mono", Courier, monospace;	
}
input, select, textarea, td, th {
  color: #646464; 
  font-size: 12px;
  font-family: Roboto, sans-serif; 
}
table {
  border-collapse: collapse;
}
form { 
  margin: 0;
  padding: 0; 
}
a:link {
  color: #2C80D0;
  text-decoration: none;
}
a:visited {
  color: #2C80D0;
  text-decoration: none;
}
a:active {
  color: #2C80D0;
  text-decoration: none;
}
a:hover {
  color: #2C80D0;
  text-decoration: underline;
}</strong>
</pre>

<p>
Do not assume that all elements inherit html and body fonts. Elements such as input, select, textarea, td do not inherit html and body fonts. So you should specify their font styles separately. Although not set above, also div doesn't inherit html and body fonts.
</p>

<p>
The <strong>border-collapse: collapse;</strong> make adjacent cells have shared borders.
</p>

<p>
The form's margin and padding have default values. For delicate design, removed the default margin and padding of form elements. 
</p>

<p>
Remove #content in /*** Just for Looks ***/.
</p>

<p>
Open index.html and create a list.html file using the Save As editor menu.
</p>

<p>
Add the following to #content of list.html.
</p>

<pre class="prettyprint">
&lt;div id="content-categories"&gt;Small talk&lt;/div&gt;
&lt;table class="bbs-table"&gt;
&lt;!--  List Heading --&gt;
&lt;tr&gt;
  &lt;th&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th&gt;DATE&lt;/th&gt;
  &lt;th&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
&lt;!--  List Items start --&gt;
&lt;tr&gt;
  &lt;td&gt;11&lt;/td&gt; &lt;!--No--&gt;
  &lt;td&gt;
    &lt;a href="#"&gt;Title&lt;/a&gt;
    &lt;!--If Attach File exists--&gt;
    &lt;img src="images/attach.png" alt="Attach File" /&gt;
    &lt;!--Total Comments--&gt;
    &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt; 
  &lt;/td&gt;
  &lt;td&gt;2011.11.15&lt;/td&gt; &lt;!--Creation Date--&gt;
  &lt;td&gt;4555&lt;/td&gt; &lt;!--Read--&gt;
&lt;/tr&gt;
&lt;!--  List Items end --&gt;             
&lt;/table&gt;
&lt;div id="paging"&gt;
  &lt;a href="#"&gt;[Prev]&lt;/a&gt;
  &lt;span class="bbs-strong"&gt;6&lt;/span&gt; &lt;!--Current Page--&gt;
  &lt;a href="#"&gt;[7]&lt;/a&gt;
  &lt;a href="#"&gt;[8]&lt;/a&gt;
  &lt;a href="#"&gt;[9]&lt;/a&gt;
  &lt;a href="#"&gt;[10]&lt;/a&gt;
  &lt;a href="#"&gt;[Next]&lt;/a&gt;
&lt;/div&gt;
&lt;div id="list-menu"&gt;
  &lt;input type="button" value="New" /&gt;
&lt;/div&gt;
&lt;form method="get"&gt;
  &lt;input type="hidden" name="curPage" value="1" /&gt;
  &lt;input type="hidden" name="boardCd" value="chat" /&gt;
  &lt;div id="search"&gt;
    &lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
    &lt;input type="submit" value="Search" /&gt;
  &lt;/div&gt;
&lt;/form&gt;
</pre>

<p>
<img alt="list design 1" src="<c:url value="/resources/images/bbs-list-01_en.png"/>" />
</p>

<p>
Modify #content as shown below.
</p>

<pre class="prettyprint">
#content {
  margin-left: 180px;
  margin-right: 210px;
  <strong>padding-left: 9px;
  padding-right: 9px;
  font-size: 0.9em;
  line-height: 1.6;</strong>
}
</pre>

<p>
Since added padding, #content's width is 592px.
</p>

<p>
<em>1000 - Sum of left and right margins 390 (180 + 210) - Sum of left and right padding 18 (9 + 9) = 592</em>
</p>

<p>
<img alt="list design 2" src="<c:url value="/resources/images/bbs-list-02_en.png"/>" />
</p>

<p>
#content-categories show the content's category on the top of #content.
</p>

<p>
Add the following to the stylesheets.
</p>

<pre class="prettyprint">
<strong>#content-categories {
  margin: 0;
  padding-top: 10px;
  font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
  font-size: 11px;
  color: #666;</strong>
}
</pre>

<p>
<img alt="list design 3" src="<c:url value="/resources/images/bbs-list-03_en.png"/>" />
</p>

<p>
Add the following to style the table's heading of the board.
</p>

<pre class="prettyprint">
<strong>.bbs-table {
  width: 100%;
  margin: 0.7em 0 0 0;
}
.bbs-table th {
  color: #92B91C;
  border-top: 1px solid #92B91C;
  border-bottom: 1px solid #92B91C;
}</strong>
</pre>

<p>
<img alt="list design 4" src="<c:url value="/resources/images/bbs-list-04_en.png"/>" />
</p>

<p>
Add the following to style table cells of the board.
</p>

<pre class="prettyprint">
<strong>.bbs-table td {
  padding-top: 3px;
  padding-bottom: 3px;
  border-bottom: 1px solid silver;
  line-height: 1.45;
}
.bbs-table td a {
  color: #555;
  text-decoration: none;
}
.bbs-table td a:hover {
  color:#555;
  text-decoration: underline;
}</strong>
</pre>

<p>
<img alt="list design 5" src="<c:url value="/resources/images/bbs-list-05_en.png"/>" />
</p>

<p>
Adjust the width of list headings as shown below.
</p>

<pre class="prettyprint">
&lt;!-- Board list heading --&gt;
&lt;tr&gt;
  &lt;th <b>style="width: 60px;"</b>&gt;NO&lt;/th&gt;
  &lt;th&gt;TITLE&lt;/th&gt;
  &lt;th <b>style="width: 84px;"</b>&gt;DATE&lt;/th&gt;
  &lt;th <b>style="width: 60px;"</b>&gt;HIT&lt;/th&gt;
&lt;/tr&gt;
</pre>

<p>
<img alt="list design 6" src="<c:url value="/resources/images/bbs-list-06_en.png"/>" />
</p>

<p>
Add <strong>style="text-align: center"</strong> to list's item except the title.
</p>

<pre class="prettyprint">
&lt;!-- List items start --&gt;
&lt;tr&gt;
  &lt;td <strong>style="text-align: center;"</strong>&gt;11&lt;/td&gt;&lt;!-- No --&gt;
  &lt;td&gt;
    &lt;a href="#"&gt;Title&lt;/a&gt;
    &lt;!-- If attach file exists --&gt;
    &lt;img src="images/attach.png" alt="Attach File" <strong>style="vertical-align: middle;"</strong> /&gt;
    &lt;!-- Total comments --&gt;
    &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;
  &lt;/td&gt;
  &lt;td <strong>style="text-align: center;"</strong>&gt;2011.11.15&lt;/td&gt;
  &lt;td <strong>style="text-align: center;"</strong>&gt;4555&lt;/td&gt;
&lt;/tr&gt;
&lt;!-- List items end --&gt;
</pre>

<p>
<img alt="list design 7" src="<c:url value="/resources/images/bbs-list-07_en.png"/>" />
</p>

<p>
Add the following to style the page move link.
</p>

<pre class="prettyprint">
<strong>#paging {
  text-align: center;
  font-size: 13px;
}
#paging &gt; a {
  color: #555;
  text-decoration: none;
}
#paging &gt; a:hover {
  color: #555;
  text-decoration: underline;
}</strong>
</pre>

<p>
<img alt="list design 8" src="<c:url value="/resources/images/bbs-list-08_en.png"/>" />
</p>

<p>
Add the following and emphasize the comments' total number and the current page number using this.
</p>

<pre class="prettyprint">
<strong>.bbs-strong {
  color: #FFA500;
  font-weight: bold;
}</strong>
</pre>

<p>
<img alt="list design 9" src="<c:url value="/resources/images/bbs-list-09_en.png"/>" />
</p>

<p>
Place the New button on the right.
</p>

<pre class="prettyprint">
<strong>#list-menu {
  text-align: right;
}</strong>
</pre>

<p>
<img alt="list design 10" src="<c:url value="/resources/images/bbs-list-10_en.png"/>" />
</p>

<p>
Center the text field and button for searching.
</p>

<pre class="prettyprint">
<strong>#search {
  text-align: center;
}</strong>
</pre>

<p>
<img alt="list design 11" src="<c:url value="/resources/images/bbs-list-11_en.png"/>" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://phrogz.net/css/vertical-align/index.html">http://phrogz.net/css/vertical-align/index.html</a></li>
  <li><a href="http://www.homejjang.com/09/border_collapse.php">http://www.homejjang.com/09/border_collapse.php</a></li>
  <li><a href="http://www.w3schools.com/cssref/pr_tab_border-collapse.asp">http://www.w3schools.com/cssref/pr_tab_border-collapse.asp</a></li>
</ul>

<h2>Board styling - Detailed view</h2>

<p>
Open the list.html and use the Save As editor menu to create a view.html. Paste the following code below the <strong>div id="content-categories"</strong> element in #content of the view.html. (Do not delete the existing code that shows the list)
</p>

<pre class="prettyprint">
&lt;div class="view-menu" style="margin-top: 15px;margin-bottom: 5px;"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" /&gt;
    &lt;input type="button" value="Del" /&gt;
  &lt;/div&gt;
  &lt;div class="fr"&gt;
    &lt;input type="button" value="Next Article" /&gt;
    &lt;input type="button" value="Prev Article" /&gt;
    &lt;input type="button" value="List" /&gt;
    &lt;input type="button" value="New" /&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;table class="bbs-table"&gt;
&lt;tr&gt;
  &lt;th style="width: 47px;text-align: left;vertical-align: top;font-size: 1em;"&gt;TITLE&lt;/th&gt;
  &lt;th style="text-align: left;color: #555;font-size: 1em;"&gt;What makes us happy?&lt;/th&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div id="detail"&gt;
  &lt;div id="date-writer-hit"&gt;2014 10-09 17:50:30 by John hit 1330&lt;/div&gt;
  &lt;div id="article-content"&gt;
  What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
  What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
  &lt;/div&gt;
    &lt;div id="file-list" style="text-align: right;"&gt;
    &lt;div class="attach-file"&gt;
      &lt;a href="#" title="filename" class="download"&gt;TEST.png&lt;/a&gt;
      &lt;a href="#" title="filekey"&gt;Del&lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;!--  New Comment --&gt;
&lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
  &lt;div id="addComment"&gt;
    &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
  &lt;/div&gt;
  &lt;div style="text-align: right;"&gt;
    &lt;input type="submit" value="Submit" /&gt;
  &lt;/div&gt;
&lt;/form&gt;
&lt;!--  Comments start --&gt;
&lt;div class="comments"&gt;
  &lt;span class="writer"&gt;xman&lt;/span&gt;
  &lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
  &lt;span class="modify-del"&gt;
    &lt;a href="javascript:modifyCommentToggle('5')"&gt;Modify&lt;/a&gt;
    | &lt;a href="javascript:deleteComment('5')"&gt;Del&lt;/a&gt;
  &lt;/span&gt;
  &lt;p id="comment5"&gt;What makes us happy?&lt;/p&gt;
  &lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
  &lt;input type="hidden" name="commentNo" value="5" /&gt;
  &lt;input type="hidden" name="boardCd" value="smalltalk" /&gt;
  &lt;input type="hidden" name="articleNo" value="12" /&gt;
  &lt;input type="hidden" name="curPage" value="1" /&gt;
  &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;div class="fr"&gt;
    &lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;Submit&lt;/a&gt;
    | &lt;a href="javascript:modifyCommentToggle('5')"&gt;Cancel&lt;/a&gt;
  &lt;/div&gt;
  &lt;div&gt;
    &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;What makes us happy?&lt;/textarea&gt;
  &lt;/div&gt;
  &lt;/form&gt;
&lt;/div&gt;
&lt;!--  Comments end --&gt;
&lt;div id="next-prev"&gt;
  &lt;p&gt;Next Article : &lt;a href="#"&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
  &lt;p&gt;Prev Article : &lt;a href="#"&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class="view-menu" style="margin-bottom: 47px;"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" /&gt;
    &lt;input type="button" value="Del" /&gt;
  &lt;/div&gt;
  &lt;div class="fr"&gt;
    &lt;input type="button" value="Next Article" /&gt;
    &lt;input type="button" value="Prev Article" /&gt;
    &lt;input type="button" value="List" /&gt;
    &lt;input type="button" value="New" /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<p>
In comment5 and modifyCommentForm5, <strong>5</strong> is the comment number. We should give this number programmatically.
</p>

<p>
<img alt="bbs-view-01" src="<c:url value="/resources/images/bbs-view-01_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h3>JavaScript toggle function for modifying comments</h3>

<p>
Create a working JavaScript function by clicking on the <strong>Modify</strong> link. If you click on the <strong>Modify</strong> link, a modification form containing the text area should appear. (modification form is not visible at first)
</p>

<p>
Paste the following JavaScript code before &lt;/ head&gt;:
</p>

<pre class="prettyprint">
&lt;script type="text/javascript"&gt;
function modifyCommentToggle(articleNo) {
  var p_id = "comment" + articleNo;
  var p = document.getElementById(p_id);
    
  var form_id = "modifyCommentForm" + articleNo;
  var form = document.getElementById(form_id);
    
  var p_display;
  var form_display;
    
  if (p.style.display) {
    p_display = '';
    form_display = 'none';
  } else {
    p_display = 'none';
    form_display = '';
  }
  p.style.display = p_display;
  form.style.display = form_display;
}
&lt;/script&gt;
</pre>

<p>
Click the Modify and Cancel links to make sure the JavaScript function is working correctly.
</p>

<p>
<img alt="Comment modify link" src="<c:url value="/resources/images/bbs-view-comments_en.png"/>" style="border: 1px solid grey;"/>
</p>

<p>
<img alt="Comment modify link click" src="<c:url value="/resources/images/bbs-view-comments-toggle_en.png"/>" style="border: 1px solid grey;"/>
</p>

<p>
Modify and Cancel links work the same way. If you click these links when the modify form is visible, the modify form disappears. If you click the same link when the modification form is not visible, the modification form appears. The p element works the opposite. This feature is called a toggle.
</p>

<h3>Styling Date, Writer, Hit</h3>

<p>
[Before]
<img alt="creation date writer read styling before" src="<c:url value="/resources/images/bbs-view-creation-writer-hit_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;span id="date-writer-hit&gt;2014 10-09 17:50:30 by John hit 1330&lt;/span&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#date-writer-hit {
  display: block;
  margin: 0;
  padding: 0;
  font-size: 11px;
  color: #555;
  text-align: right;
}</strong>
</pre>

<p>
[After]
<img alt="creation date writer read styling after" src="<c:url value="/resources/images/bbs-view-creation-writer-hit-after_en.png"/>" style="border: 1px solid grey;" />
</p>

<h3>Styling #article-content and #attach-file</h3>

<p>
[Before]
<img alt="article content and attach file before" src="<c:url value="/resources/images/article-content-attach-file-before_en.png"/>" style="border: 1px solid grey;" />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div id="article-content"&gt;
What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
&lt;/div&gt;
&lt;div id="file-list" style="text-align: right;"&gt;
  &lt;div class="attach-file"&gt;
    &lt;a href="#" title="filename" class="download"&gt;TEST.png&lt;/a&gt;
    &lt;a href="#" title="filekey"&gt;Del&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#article-content {
  font-size: 0.9em;
  color: #333;
}
.attach-file {
  font-size: 11px;
  line-height: 1.3;
}</strong>
</pre>

<p>

<img alt="article content attach file after" src="<c:url value="/resources/images/article-content-attach-file-after_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h3>Styling Comment writer, Comment creation date, Modify and Del links, Comment body</h3>

<p>
[Before]<br />
<img alt="writer creation date modify del links comment body styling before" src="<c:url value="/resources/images/bbs-view-comments_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;span class="writer"&gt;xman&lt;/span&gt;
&lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
&lt;span class="modify-del"&gt;
&lt;a href="javascript:modifyCommentToggle('5')"&gt;Modify&lt;/a&gt;
 | &lt;a href="javascript:deleteComment('5')"&gt;Del&lt;/a&gt;
&lt;/span&gt;
&lt;p id="comment5"&gt;What makes us happy?&lt;/p&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
.comments {
  border-top: 1px solid #ebebeb;
}
.comments &gt; span.writer {
  display: block;
  float: left;
  margin: 3px;
  padding: 0;
  font-size: 12px;
  font-weight: bold;
  color: #555;
}
.comments &gt; span.date {
  display: block;
  float: left;
  margin: 3px;
  padding: 0;
  font-size: 12px;
  color: #555;
}
.comments &gt; span.modify-del {
  display: block;
  float: right;
  margin: 3px;
  padding: 0;
  font-size: 12px;
  color: #555;
}
.comments a {
  color: #555;
  text-decoration: none;
  font-size: 11px;
}
.comments a:hover {
  color: #555;
  text-decoration: underline;
}
.comments &gt; p {
  clear: both;
  margin: 0;
  padding: 0 3px 3px 3px;
  color: #555;
  font-size: 11px;
}
</pre>

<p>
[After]<br />
<img alt="comment creation writer hit styling after" src="<c:url value="/resources/images/coment-creation-writer-hit-styling-after_en.png"/>" style="border: 2px solid grey" />
</p>

<h3>Styling Comment modify form</h3>

<p>
[Before]<br />
<img alt="Comment modify link click" src="<c:url value="/resources/images/bbs-view-comments-toggle_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
&lt;input type="hidden" name="commentNo" value="5" /&gt;
&lt;input type="hidden" name="boardCd" value="smalltalk" /&gt;
&lt;input type="hidden" name="articleNo" value="12" /&gt;
&lt;input type="hidden" name="curPage" value="1" /&gt;
&lt;input type="hidden" name="searchWord" value="happy" /&gt;
&lt;div style="text-align: right;"&gt;
  &lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;Submit&lt;/a&gt;
  | &lt;a href="javascript:modifyCommentToggle('5')"&gt;Cancel&lt;/a&gt;
&lt;/div&gt;
&lt;div&gt;
  &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;What makes us happy?.&lt;/textarea&gt;
&lt;/div&gt;
&lt;/form&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>.comment-form {
  clear: both; 
  padding: 0.22em 2.22em 0.22em 3.22em; 
}
.comment-textarea {
  border: 1px solid silver;
  padding: 3px;
  width: 99%;
  color:#555;
  background-color: #eee;
  font-size: 11px; 
}</strong>
</pre>

<p>
[After]<br />
<img alt="comment modify form after" src="<c:url value="/resources/images/bbs-view-comment-form-after_en.png"/>" style="border: 1px solid grey;" />
</p>

<h3>Styling New comment form</h3>

<p>
[Before]<br />
<img alt="New Comment form before" src="<c:url value="/resources/images/bbs-view-new-comment-before_en.png"/>" style="border: 1px solid grey;" />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
  &lt;div id="addComment"&gt;
    &lt;textarea style="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
  &lt;/div&gt;
  &lt;div style="text-align: right;"&gt;
    &lt;input type="submit" value="Submit" /&gt;
  &lt;/div&gt;
&lt;/form&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#addComment {
  margin-bottom: 5px;
  padding: 0.22em;
  border: 1px solid #eee;
  background-color: #fafbf7;
}
#addComment textarea {
  width: 99%;
  padding: 3px;
  border: 0;
  color: #555;
}</strong>
</pre>

<p>
[After]<br />
<img alt="New Comment form after" src="<c:url value="/resources/images/bbs-view-new-comment-after_en.png"/>" style="border: 1px solid grey;" />
</p>

<h3>Styling Next Article and Prev Article</h3>

<p>
[Before]<br />
<img alt="Next and Prev article before" src="<c:url value="/resources/images/bbs-view-next-prev-article-before_en.png"/>" style="border: 1px solid grey;" />
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div id="next-prev"&gt;
  &lt;p&gt;Next Article : &lt;a href="#"&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
  &lt;p&gt;Prev Article : &lt;a href="#"&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#next-prev {
  margin: 7px 0;
  border-top: 1px solid #e1e1e1;
}
#next-prev &gt; p {
  margin: 0;
  padding: 5px;
  border-bottom: 1px solid #e1e1e1;
  font-size: 12px;
  color: #333;
}
#next-prev &gt; p &gt; a {
  color: #333;
  text-decoration: none;
}
#next-prev &gt; p &gt; a:hover {
  color: #333;
  text-decoration: underline;
}</strong>
</pre>

<p>
[After]<br />
<img alt="Next and Prev Article after" src="<c:url value="/resources/images/bbs-view-next-prev-article-after_en.png"/>" style="border: 1px solid grey;" />
</p>

<h3>Positioning Modify, Del, Next Article, Prev Article, List, New Butons</h3>

<p>
[Before]<br />
<img alt="Buttons positioning before" src="<c:url value="/resources/images/bbs-view-buttons-before_en.png"/>" style="border: 1px solid grey;" />
</p>

<p>
The following code is in two places in view.html.
</p>

<h6 class="src">[HTML]</h6>
<pre class="prettyprint">
&lt;div class="view-menu" ..&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" /&gt;
    &lt;input type="button" value="Del" /&gt;
  &lt;/div&gt;
  &lt;div class="fr"&gt;
    &lt;input type="button" value="Next Article" /&gt;
    &lt;input type="button" value="Prev Article" /&gt;
    &lt;input type="button" value="List" /&gt;
    &lt;input type="button" value="New" /&gt;
  &lt;/div&gt;
&lt;/div&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#view-menu {
  height: 22px;
}
.fl {
  float: left;
}
.fr {
  float: right;
}</strong>
</pre>

<p>
[After]<br />
<img alt="Buttons positioning after" src="<c:url value="/resources/images/bbs-view-buttons-after_en.png"/>" style="border: 1px solid grey;" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h2>Board styling - New Writing and Sign up form</h2>

<h3>New Writing form</h3>

<p>
Open the view.html and use the Save As editor menu to create a write.html. Clear the existing contents of the #content of write.html and paste the following code instead.
</p>

<pre class="prettyprint">&lt;div id="content-categories"&gt;Chat&lt;/div&gt;
&lt;h3&gt;New&lt;/h3&gt;
&lt;form id="writeForm" action="write_proc.jsp" method="post" enctype="multipart/form-data"&gt;
&lt;input type="hidden" name="boardCd" value="chat" /&gt;
&lt;table id="write-form" class="bbs-table"&gt;
&lt;tr&gt;
  &lt;td&gt;Title&lt;/td&gt;
  &lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    &lt;textarea name="content" rows="17" cols="50"&gt;&lt;/textarea&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Attach File&lt;/td&gt;
  &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="Submit" /&gt;
  &lt;input type="button" value="Cancel" /&gt;
  &lt;input type="button" value="List" /&gt;
&lt;/div&gt;
&lt;/form&gt;
</pre>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint"><strong>#write-form td {
  border: none;
}
#write-form textarea {
  width: 99%;
}</strong>
</pre>

<p>
<img alt="New Article page after" src="<c:url value="/resources/images/bbs-write-after_en.png"/>" style="border: 1px solid grey;"/>
</p>

<h4>Styling #extra</h4>

<p>
Save the following images in images folder.
</p>

<ol>
	<li><img src="<c:url value="/resources/images/youtube.png"/>" alt="youtube" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/gmail.gif"/>" alt="gmail" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/google-drive.png"/>" alt="google drive" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="<c:url value="/resources/images/gcp-logo.png"/>" alt="gcp" style="border: 1px solid grey;width: 203px;" /></li>
</ol>

<p>
Add the following to #extra of write.html.
</p>

<pre class="prettyprint">&lt;div id="extra"&gt;
  <strong>&lt;a href="http://www.youtube.com"&gt;&lt;img src="images/youtube.png" alt="youtube" /&gt;&lt;/a&gt;
  &lt;a href="http://gmail.com"&gt;&lt;img src="images/gmail.gif" alt="gmail" /&gt;&lt;/a&gt;
  &lt;a href="http://drive.google.com"&gt;&lt;img src="images/google-drive.png" alt="google drive" /&gt;&lt;/a&gt;
  &lt;a href="https://cloud.google.com/"&gt;&lt;img src="images/gcp-logo.png" alt="google cloud" /&gt;&lt;/a&gt;</strong>
&lt;/div&gt;
</pre>

<p>
Delete all of /*** Just for Looks ***/. 
</p>

<h6 class="src">[CSS]</h6>
<pre class="prettyprint">
<strong>#extra img {
  width: 203px;
}
#extra a {
  display: block;
  border: 1px solid #DAEAAA;
  margin-bottom: 7px;
}
#extra a:hover {
  opacity: 0.7;
}</strong>
</pre>

<p>
<img alt="New Article Form" src="<c:url value="/resources/images/extra-imgs_en.png"/>" style="border: 1px solid grey;" />
</p>

<h3>Sign up form</h3>

<p>
Open the write.html and use the Save As editor menu to create a signUp.html. Clear the existing contents of the #content of signUp.html and paste the following code instead.
</p>

<pre class="prettyprint"><strong>&lt;div id="content-categories"&gt;Membership&lt;/div&gt;
&lt;h3&gt;SignUp&lt;/h3&gt;
&lt;form id="signUpForm" action="signUp_proc.jsp" method="post"&gt;
&lt;table&gt;
&lt;tr&gt;
  &lt;td style="width: 200px;"&gt;Full Name&lt;/td&gt;
  &lt;td style="width: 390px;"&gt;&lt;input type="text" name="name" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Password&lt;/td&gt;
  &lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
  Do not make the password the same as your email account password because Email is used as an ID.
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Confirm&lt;/td&gt;
  &lt;td&gt;&lt;input type="password" name="confirm" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Email&lt;/td&gt;
  &lt;td&gt;&lt;input type="text" name="email" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Mobile&lt;/td&gt;
  &lt;td&gt;&lt;input type="text" name="mobile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/div&gt;
&lt;/form&gt;</strong>
</pre>

<p>
<img alt="New Article form Screen" src="<c:url value="/resources/images/sign-up_en.png"/>" style="border: 1px solid grey;" />
</p>

<p>
We will create a website with the final design created here in the next chapter.
</p>

<p>
<a href="https://github.com/kimjonghoon/css-layout">Final Sources</a>
</p>


<p>
The following is a list of JSP files required for our project.
</p>

<p>
<strong>DocumentBase</strong>
</p>

<ul>
  <li>index.jsp: Homepage</li>
  <li>error.jsp: Error page</li>
</ul>

<p>
<strong>/inc</strong>
</p>

<ul>
	<li>header.jsp: Logo, Membership menu(Login, Sign Up, Logout, Modify account)</li>
	<li>main-menu.jsp: Main menus</li>
	<li>extra.jsp: Image external Links</li>
	<li>footer.jsp: Copyright, Contact</li>
	<li>loginCheck.jsp: Pages that require authentication among pages that show screens include this page.</li>
</ul>

<p>
<strong>/users</strong>
</p>

<p>
I created a naming convention to append _proc to the end of the file name for JSP pages that do not display screens.
</p>

<ul>
	<li>user-sub.jsp: Membership menu</li>
	<li>login.jsp: Login form page</li>
	<li>login_proc.jsp: Login execution</li>
	<li>logout_proc.jsp: Logout execution</li>
	<li>signUp.jsp: Sign Up form page</li>
	<li>signUp_proc.jsp: Sign Up execution</li>
	<li>welcome.jsp: Welcome page</li>
	<li>editAccount.jsp: Account modify forom page</li>
	<li>editAccount_proc.jsp: Account modify execution</li>
	<li>changePasswd.jsp: Password change form page</li>
	<li>changePasswd_proc.jsp: Password change execution</li>
	<li>changePasswd_confirm.jsp: Passsword change confirmation page</li>
	<li>bye.jsp: Account Removal form page</li>
	<li>bye_proc.jsp: Account Removal execution</li>
	<li>bye_confirm.jsp: Account Removal confirmation page</li>
</ul>

<p>
<strong>/bbs</strong><br />
We will implement a bulletin board as Model 1 in JSPProject. In Model 1, clients request JSPs directly.
</p>

<ul>
	<li>bbs-sub.jsp: Board menu</li>
	<li>list.jsp: Board List page</li>
	<li>write.jsp: Board article write form page</li>
	<li>write_proc.jsp: Board article write execution</li>
	<li>view.jsp: Board detailed view page</li>
	<li>addComment_proc.jsp: Comment write execution</li>
	<li>updateComment_proc.jsp: Comment modify execution</li>
	<li>deleteComment_proc.jsp: Comment delete execution</li>
	<li>deleteAttachFile_proc.jsp: Attach file delete execution</li>
	<li>del_proc.jsp: Board article delete execution</li>
	<li>modify.jsp: Board article modify form page</li>
	<li>modify_proc.jsp: Board article modify execution</li>
</ul>

<p>
<strong>/java</strong>
</p>

<ul>
	<li>index.jsp: Java Home</li>
</ul>

<h2>Main page and Subpage Design</h2>

<p>
The first task of the website prototype is designing the main page and subpages.
The main page is the page you see when visiting a website called the homepage. A subpage is any page except the main page.<br />
<img src="<c:url value="/resources/images/prototype-dir.png"/>" alt="Prototype Directory Structure" style="width: 178px;" />
</p>

<p>
The output of this work is HTML files, a Style Sheet, and images.
We will reuse them created in the CSS Layout chapter.
Set <a href="https://github.com/kimjonghoon/css-layout">https://github.com/kimjonghoon/css-layout</a>
</p>

<p>
Copy the Style Sheet and images into the css and images folder, respectively, and copy HTML files to the document base.
</p>

<p>
Let's add the login logic to the prototype.
Create a User class as follows.
</p>

<h6 class="src">User.java</h6>
<pre class="prettyprint">package net.java_school.user;

public class User {
  private String email;
  private String passwd;
  private String name;
  private String mobile;
    
  public User() {}

  public User(String email, String passwd) {
    this.email = email;
    this.passwd = passwd;
  }
    
  public User(String email, String passwd, String name, String mobile) {
    this.email = email;
    this.passwd = passwd;
    this.name = name;
    this.mobile = mobile;
  }

  public String getEmail() {
    return email;
  }
    
  public void setEmail(String email) {
    this.email = email;
  }

  public String getPasswd() {
    return passwd;
  }
    
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
    
  public String getName() {
    return name;
  }
    
  public void setName(String name) {
    this.name = name;
  }
    
  public String getMobile() {
    return mobile;
  }
    
  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

}
</pre>

<p>
The User class does not have an ID. We will use email instead of ID.
</p>

<h3>Login policy</h3>

<ul>
  <li>Only authenticated users can use the bulletin board.</li>
  <li>When an unauthenticated user visits a page that requires authentication, the program takes the user to the login page. The program transfers the URL that the user initially intended to see to the login page as a parameter. If the login is successful, the program redirects the login page to that URL.</li>
  <li>When a user visits the login page and tries to logs in and login is successful, the program redirects the login page to the first page of the chat bulletin board list.</li>
  <li>When a user logs out, the program redirects a page to the homepage.</li>
</ul>

<h3>Main page</h3>

<p>
Change the file name from index.html to index.jsp in the document base. Modify the contents of the index.jsp file as follows.
</p>

<h6 class="src">/index.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="<strong>Main page</strong>" /&gt;
&lt;meta name="Description" content="<strong>Main page</strong>" /&gt;
&lt;title&gt;<strong>Main page</strong>&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;h1 style="float: left; width: 150px;"&gt;&lt;a href=<strong>"/</strong>"&gt;&lt;img src=<strong>"/images/ci.gif"</strong> alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
    &lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;   
      &lt;input type="button" value="Login" onclick="location.href=<strong>'/users/login.jsp'</strong>" /&gt;
      &lt;input type="button" value="SignUp" onclick="location.href=<strong>'/users/signUp.jsp'</strong>" /&gt;
&lt;%
} else {
%&gt;
      &lt;input type="button" value="Logout" onclick="location.href=<strong>'/users/logout_proc.jsp'</strong>" /&gt;
      &lt;input type="button" value="Modify Account" onclick="location.href=<strong>'/users/editAccount.jsp'</strong>" /&gt;
&lt;%
}
%&gt;
    &lt;/div&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;ul id="nav"&gt;
      &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
			
    &lt;/div&gt;
  &lt;/div&gt;&lt;!--  container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Main&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;a href="http://www.youtube.com"&gt;&lt;img src=<strong>"/images/youtube.png"</strong> alt="youtube.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.twitter.com"&gt;&lt;img src=<strong>"/images/twitter.png"</strong> alt="twitter.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.facebook.com"&gt;&lt;img src=<strong>"/images/facebook.png"</strong> alt="facebook.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.gmail.com"&gt;&lt;img src=<strong>"/images/gmail.png"</strong> alt="gmail.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.java-school.net"&gt;&lt;img src=<strong>"/images/java-school.png"</strong> alt="java-school.net" /&gt;&lt;/a&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;ul&gt;
      &lt;li&gt;&lt;a href="#"&gt;Guide&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Policy&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Email Collection Ban&lt;/a&gt;&lt;/li&gt;
      &lt;li id="company-info"&gt;Phone : 123-4567-7890, FAX : 123-4567-7890&lt;br /&gt;
      people@ggmail.org&lt;br /&gt;
      Copyright java-school.net All Rights Reserved.&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Contact&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;

&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>Subpage</h3>

<p>
Copy the homepage, index.jsp to the java subdirectory and modify it as follows.
</p>
    
<h6 class="src">/java/index.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" %&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;    
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Java Home" /&gt;
&lt;meta name="Description" content="Java Home" /&gt;
&lt;title&gt;Java Home&lt;/title&gt;
&lt;link rel="stylesheet" href=<strong>"/css/screen.css"</strong> type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;h1 style="float: left; width: 150px;" &gt;&lt;a href=<strong>"/"</strong>&gt;&lt;img src=<strong>"/images/ci.gif"</strong> alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
    &lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;   
      &lt;input type="button" value="Login" onclick="location.href=<strong>'/users/login.jsp'</strong>" /&gt;
      &lt;input type="button" value="SignUp" onclick="location.href=<strong>'/users/signUp.jsp'</strong>" /&gt;
&lt;%
} else {
%&gt;
      &lt;input type="button" value="Logout" onclick="location.href=<strong>'/users/logout_proc.jsp'</strong>" /&gt;
      &lt;input type="button" value="Modify Account" onclick="location.href=<strong>'/users/editAccount.jsp'</strong>" /&gt;
&lt;%
}
%&gt;
    &lt;/div&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;ul id="nav"&gt;
      &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h1&gt;JDK Install&lt;/h1&gt;
    &lt;/div&gt;
  &lt;/div&gt;&lt;!--  container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Java&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;a href="http://www.youtube.com"&gt;&lt;img src=<strong>"/images/youtube.png"</strong> alt="youtube.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.twitter.com"&gt;&lt;img src=<strong>"/images/twitter.png"</strong> alt="twitter.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.facebook.com"&gt;&lt;img src=<strong>"/images/facebook.png"</strong> alt="facebook.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.gmail.com"&gt;&lt;img src=<strong>"/images/gmail.png"</strong> alt="gmail.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.java-school.net"&gt;&lt;img src=<strong>"/images/java-school.png"</strong> alt="java-school.net" /&gt;&lt;/a&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;ul&gt;
      &lt;li&gt;&lt;a href="#"&gt;Guide&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Private&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Email Collection Ban&lt;/a&gt;&lt;/li&gt;
      &lt;li id="company-info"&gt;Phone : 123-4567-8901, FAX : 123-4567-8901&lt;br /&gt;
      john@gmail.org&lt;br /&gt;
      Copyright java-school.net All Rights Reserved.&lt;/li&gt;
      &lt;li&gt;&lt;a href="#"&gt;Contact&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
To keep the example simple, we designed the main page and subpage to be the same. However, most sites do not have the same design for the main page and subpage.
</p>

<h3>Separating JSPs</h3>

<p>
If several pages have the same screen layout, you can separate the code using the JSP include directive. Separating pages makes maintenance easier. The logo and login/logout buttons in #header, the main menus in #main-menu, the external links in #extra, and the global menus in #footer are common to all pages. Create the following JSP files in the inc subdirectory. (where inc means included)
</p>

<h6 class="src">/inc/header.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;h1 style="float: left; width: 150px;"&gt;&lt;a href="/"&gt;&lt;img src="/images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
&lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
  &lt;input type="button" value="Login" onclick="location.href='/users/login.jsp'" /&gt;
  &lt;input type="button" value="SignUp" onclick="location.href='/users/signUp.jsp'" /&gt;
&lt;%
} else {
%&gt;   
  &lt;input type="button" value="Logout" onclick="location.href='/users/logout_proc.jsp'" /&gt;
  &lt;input type="button" value="Modify Account" onclick="location.href='/users/editAccount.jsp'" /&gt;
&lt;%
}
%&gt;
&lt;/div&gt;
</pre>

<h6 class="src">/inc/main-menu.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;ul id="nav"&gt;
  &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>

<h6 class="src">/inc/extra.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;a href="http://www.youtube.com"&gt;&lt;img src="/images/youtube.png" alt="youtube.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.twitter.com"&gt;&lt;img src="/images/twitter.png" alt="twitter.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.facebook.com"&gt;&lt;img src="/images/facebook.png" alt="facebook.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.gmail.com"&gt;&lt;img src="/images/gmail.png" alt="gmail.com" /&gt;&lt;/a&gt;
&lt;a href="http://www.java-school.net"&gt;&lt;img src="/images/java-school.png" alt="java-school.net" /&gt;&lt;/a&gt;
</pre>

<h6 class="src">/inc/footer.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;ul&gt;
  &lt;li&gt;&lt;a href="#"&gt;Guide&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Privacy&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Email Collection Ban&lt;/a&gt;&lt;/li&gt;
  &lt;li id="company-info"&gt;Phone : 123-4567-8901, FAX : 123-4567-8901&lt;br /&gt;
  john@gmail.org&lt;br /&gt;
  Copyright java-school.net All Rights Reserved.&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Map&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p>
The contentType attribute of the page directive of the including page and included pages must be the same. If they are not the same, the servlet container will fail to convert JSPs to a servlet. Therefore, the contentType of all JSPs you created should be:
</p>

<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
</pre>

<h3>Modify subpages using JSP files in the inc folder</h3>

<h6 class="src">/java/index.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Java Home" /&gt;
&lt;meta name="Description" content="Java Home" /&gt;
&lt;title&gt;Java Home&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;<strong>
    &lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;<strong>
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;

    &lt;/div&gt;
  &lt;/div&gt;&lt;!--  container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Java&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;<strong>
    &lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;<strong>
    &lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit the homepage and subpage (/java/index.jsp) with a web browser to test them.
</p>

<h2>Create Login Form, Login, Logout pages</h2>

<p>
Create a user-sub.jsp in the directory named users as follows.
</p>

<h6 class="src">/users/user-sub.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;h1&gt;Membership&lt;/h1&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
&lt;ul&gt;
  &lt;li&gt;&lt;a href="login.jsp"&gt;Login&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="signUp.jsp"&gt;SignUp&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Forgot ID&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#"&gt;Forgot Password&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;%
} else {
%&gt;
&lt;ul&gt;
  &lt;li&gt;&lt;a href="editAccount.jsp"&gt;Modify Account&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="changePasswd.jsp"&gt;Change Password&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="bye.jsp"&gt;Bye&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;%
}
%&gt;
</pre>

<p>
Open /java/index.jsp and use the Save As editor menu to create a login.jsp in the directory named users and modify it as shown below.
</p>

<h6 class="src">/users/login.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;<strong>
&lt;%
request.setCharacterEncoding("UTF-8");
String url = request.getParameter("url");
if (url == null) url = "";
%&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Login" /&gt;
&lt;meta name="Description" content="Login" /&gt;
&lt;title&gt;Login&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Login&lt;/h2&gt;
      &lt;form id="loginForm" action="login_proc.jsp" method="post"&gt;
      <strong>&lt;input type="hidden" name="url" value="&lt;%=url %&gt;" /&gt;</strong>
      &lt;table&gt;
      &lt;tr&gt;
        &lt;td style="width: 200px;"&gt;Email&lt;/td&gt;
        &lt;td style="width: 390px"&gt;&lt;input type="text" name="email" style="width: 99%;" value="captain@heist.com" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
      &lt;td&gt;Password&lt;/td&gt;
      &lt;td&gt;&lt;input type="password" name="passwd" style="width: 99%;" value="1111" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;div style="text-align: center;padding-top: 15px;"&gt;
        &lt;input type="submit" value="Submit" /&gt;
        &lt;input type="button" value="SignUp" onclick="location.href='signUp.jsp'" /&gt;
      &lt;/div&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;<strong>
    &lt;%@ include file="user-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;<strong>
    &lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;<strong>
    &lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create a page that authenticates users.
</p>

<h6 class="src">/users/login_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User"%&gt;
&lt;%
String url = request.getParameter("url");
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");

session.setAttribute("user", new User(email, passwd, "John doe", "123-4567-8901"));
if (url != null &amp;&amp; !url.equals("")) {
  response.sendRedirect(url);
} else {
  response.sendRedirect("../bbs/list.jsp?boarCd=chat&amp;curPage=1");
}
%&gt;
</pre>

<p>
Create a logout execution page.
</p>

<h6 class="src">/users/logout_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
session.removeAttribute("user");

response.sendRedirect("../");//redirect to the homepage.
%&gt;
</pre>

<h2>JSP error handling</h2>

<p>
Open web.xml and add the following before &lt;/web-app&gt; in web.xml.
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;error-page&gt;
  &lt;error-code&gt;403&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;error-code&gt;404&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;error-code&gt;500&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;exception-type&gt;java.lang.Throwable&lt;/exception-type&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
</pre>

<p>
This error.jsp will take care of all significant errors.
</p>

<h3>error.jsp</h3>

<p>
With the home page open, use the Save As editor menu to create a file named error.jsp in the document base and modify it like below.
</p>
    
<h6 class="src">/error.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Error" /&gt;
&lt;meta name="Description" content="Error" /&gt;
&lt;title&gt;Error&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
//Analyze the servlet exception
Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
String servletName = (String) request.getAttribute("jakarta.servlet.error.servlet_name");

if (servletName == null) {
  servletName = "Unknown";
}

String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");

if (requestUri == null) {
  requestUri = "Unknown";
}
%&gt;
&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;h1 style="float: left; width: 150px;"&gt;&lt;a href="/"&gt;&lt;img src="/images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
    &lt;div id="memberMenu" style="float: right; position: relative; top: 7px;"&gt;
&lt;%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%&gt;
      &lt;input type="button" value="Login" onclick="location.href='/users/login.jsp'" /&gt;
      &lt;input type="button" value="SignUp" onclick="location.href='/users/signUp.jsp'" /&gt;
&lt;%
} else {
%&gt;   
      &lt;input type="button" value="Logout" onclick="location.href='/users/logout_proc.jsp'" /&gt;
      &lt;input type="button" value="Modify Account" onclick="location.href='/users/editAccount.jsp'" /&gt;
&lt;%
}
%&gt;
    &lt;/div&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;ul id="nav"&gt;
      &lt;li&gt;&lt;a href="/java"&gt;Java&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jdbc"&gt;JDBC&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp"&gt;JSP&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/css-layout"&gt;CSS Layout&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/jsp-pjt"&gt;JSP Project&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/spring"&gt;Spring&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/javascript"&gt;JavaScript&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="/bbs/list.jsp?boardCd=chat&amp;curPage=1"&gt;BBS&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Error&lt;/div&gt;
      &lt;h2&gt;Error Page&lt;/h2&gt;
&lt;%
if (statusCode != null &amp;&amp; statusCode != 500) {
  out.write("&lt;h3&gt;Error Details&lt;/h3&gt;");
  out.write("&lt;strong&gt;Status Code&lt;/strong&gt;:" + statusCode + "&lt;br&gt;");
  out.write("&lt;strong&gt;Requested URI&lt;/strong&gt;:"+requestUri);
}    
if (throwable != null) {
  out.write("&lt;h3&gt;Exception Details&lt;/h3&gt;");
  out.write("&lt;ul&gt;&lt;li&gt;Servlet Name:" + servletName + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Name:" + throwable.getClass().getName() + "&lt;/li&gt;");
  out.write("&lt;li&gt;Requested URI:" + requestUri + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Message:" + throwable.getMessage() + "&lt;/li&gt;");
  out.write("&lt;/ul&gt;");
}
%&gt;

    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Error&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;a href="http://www.youtube.com"&gt;&lt;img src="/images/youtube.png" alt="youtube.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.twitter.com"&gt;&lt;img src="/images/twitter.png" alt="twitter.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.facebook.com"&gt;&lt;img src="/images/facebook.png" alt="facebook.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.gmail.com"&gt;&lt;img src="/images/gmail.png" alt="gmail.com" /&gt;&lt;/a&gt;
    &lt;a href="http://www.java-school.net"&gt;&lt;img src="/images/java-school.png" alt="java-school.net" /&gt;&lt;/a&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="./inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Try to login again.  You have requested a page you have not created yet, so an error page should be displayed.
</p>

<h2>Board program</h2>

<p>
Create pages related to the bulletin board.
</p>

<h3>Board menu page</h3>

<h6 class="src">/bbs/bbs-sub.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;h1&gt;BBS&lt;/h1&gt;
&lt;ul&gt;
  &lt;li&gt;
    &lt;ul&gt;
      &lt;li&gt;&lt;a href="list.jsp?boardCd=chat&amp;curPage=1"&gt;Chat&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="list.jsp?boardCd=qna&amp;curPage=1"&gt;QnA&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href="list.jsp?boardCd=data&amp;curPage=1"&gt;Data&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/li&gt;
&lt;/ul&gt;
</pre>

<h3>loginCheck.jsp</h3>

<h6 class="src">/inc/loginCheck.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.*"%&gt;
&lt;%@ page import="java.net.URLEncoder"%&gt;
&lt;%   
User user = (User) session.getAttribute("user");
if (user == null) {
  //URL the user intended to visit
  String uri = request.getRequestURI();
  String query = request.getQueryString();
  String url = uri;
  if (query != null) url += "?" + query;
  String contextPath= request.getContextPath();
  url = URLEncoder.encode(url, "UTF-8");
  response.sendRedirect(contextPath + "/users/login.jsp?url=" + url);
  return;
}
%&gt;
</pre>

<h3>list.jsp</h3>

<p>
Open the list.html file and use the Save As editor menu to create a list.jsp file in the bbs directory and modify it like below.
</p>

<h6 class="src">/bbs/list.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Board list" /&gt;
&lt;meta name="Description" content="Board list" /&gt;
&lt;title&gt;Small talk&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;<strong>
&lt;script type="text/javascript"&gt;
function goList(curPage) {
  var form = document.getElementById("listForm");
  form.curPage.value = curPage;
  form.submit();
}

function goView(articleNo) {
  var form = document.getElementById("viewForm");
  form.articleNo.value = articleNo;
  form.submit();
}

function goWrite() {
  var form = document.getElementById("writeForm");
  form.submit();
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Small talk&lt;/div&gt;
      &lt;table class="bbs-table"&gt;
      &lt;!--  List heading --&gt;
      &lt;tr&gt;
        &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
        &lt;th&gt;TITLE&lt;/th&gt;
        &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
        &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
      &lt;/tr&gt;
      &lt;!--  List items start --&gt;
      &lt;tr&gt;
        &lt;td style="text-align: center;"&gt;11&lt;/td&gt;
        &lt;td&gt;
          &lt;a href="<strong>javascript:goView('1')"</strong>&gt;Title&lt;/a&gt;
          &lt;img src="<strong>../</strong>images/attach.png" alt="Attach File" style="vertical-align: middle;" /&gt;
          &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;
        &lt;/td&gt;
        &lt;td style="text-align: center;"&gt;2011.11.15&lt;/td&gt;
        &lt;td style="text-align: center;"&gt;4555&lt;/td&gt;
      &lt;/tr&gt;
      &lt;!--  List items end --&gt;
      &lt;/table&gt;
      &lt;div id="paging"&gt;
        &lt;a href="<strong>javascript:goList('5')"</strong>&gt;[Prev]&lt;/a&gt;
        &lt;span class="bbs-strong"&gt;6&lt;/span&gt;
        &lt;a href="<strong>javascript:goList('7')</strong>"&gt;7&lt;/a&gt;
        &lt;a href="<strong>javascript:goList('8')</strong>"&gt;8&lt;/a&gt;
        &lt;a href="<strong>javascript:goList('9')</strong>"&gt;9&lt;/a&gt;
        &lt;a href="<strong>javascript:goList('10')</strong>"&gt;10&lt;/a&gt;
        &lt;a href="<strong>javascript:goList('11')</strong>"&gt;[Next]&lt;/a&gt;  
      &lt;/div&gt;

      &lt;div id="list-menu"&gt;
        &lt;input type="button" value="New" <strong>onclick="goWrite()"</strong> /&gt;
      &lt;/div&gt;

      &lt;div id="search"&gt;
        &lt;form action="list.jsp" method="get"&gt;
          &lt;input type="hidden" name="curPage" value="1" /&gt;
          &lt;input type="hidden" name="boardCd" value="chat" /&gt;
          &lt;div&gt;
            &lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
            &lt;input type="submit" value="Search" /&gt;
          &lt;/div&gt;
        &lt;/form&gt;
      &lt;/div&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
  &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
  &lt;form id="listForm" action="list.jsp" method="get"&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="writeForm" action="write.jsp" method="get"&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>write.jsp</h3>

<p>
Open the write.html file and use the Save As editor menu to create a file named write.jsp in the bbs directory and modify it as follows:
</p>
    
<h6 class="src">/bbs/write.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;<strong>
&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="New" /&gt;
&lt;meta name="Description" content="New" /&gt;
&lt;title&gt;Small talk&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
<strong>&lt;script type="text/javascript"&gt;
function goList() {
  var form = document.getElementById("listForm");
  form.submit();
}
function goView() {
  var form = document.getElementById("viewForm");
  form.submit();
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Small talk&lt;/div&gt;
      &lt;h3&gt;New&lt;/h3&gt;
      &lt;form id="writeForm" action="write_proc.jsp" method="post" enctype="multipart/form-data"&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;table id="write-form" class="bbs-table"&gt;
        &lt;tr&gt;
          &lt;td&gt;Title&lt;/td&gt;
          &lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" /&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
          &lt;td colspan="2"&gt;
            &lt;textarea name="content" rows="17" cols="50"&gt;&lt;/textarea&gt;
          &lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
          &lt;td&gt;Attach File&lt;/td&gt;
          &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
        &lt;/tr&gt;
        &lt;/table&gt;
        &lt;div style="text-align: center;padding-bottom: 15px;"&gt;
          &lt;input type="submit" value="Submit" /&gt;
          <strong>&lt;input type="button" value="List" onclick="goList()" /&gt;
          &lt;input type="button" value="Detailed view" onclick="goView()" /&gt;</strong>
        &lt;/div&gt;
      &lt;/form&gt;
    &lt;/div&gt;
  &lt;/div&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>   
  &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
  &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="listForm" action="list.jsp" method="get"&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;   
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>write_proc.jsp</h3>

<p>
This page inserts the information obtained from parameters passed by the writing form into the database.
</p>

<h6 class="src">/bbs/write_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
If the user is not authenticated
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
authenticated
insert new text with the boardCd, title, content, and attachFile parameters.

If the enctype attribute of the form is "multipart / form-data", parameter values can not be obtained with request.getParameter();
To make programming easier in this case, use an external library such as Apache commons-fileupload or cos.

After registering a new article, The program must request the first page of the list.
*/
response.sendRedirect("list.jsp?boardCd=chat&amp;curPage=1");
%&gt;
</pre>

<h3>view.jsp</h3>

<p>
Open the view.html file and use the Save As editor menu to create a view.jsp in the bbs directory and modify it like below.
</p>

<h6 class="src">/bbs/view.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Board detailed view" /&gt;
&lt;meta name="Description" content="Board detailed view" /&gt;
&lt;title&gt;Small talk&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
&lt;script type="text/javascript"&gt;
function modifyCommentToggle(articleNo) {
  var p_id = "comment" + articleNo;
  var form_id = "modifyCommentForm" + articleNo;
  var p = document.getElementById(p_id);
  var form = document.getElementById(form_id);
  var p_display;
  var form_display;
    
  if (p.style.display) {
    p_display = '';
    form_display = 'none';
  } else {
    p_display = 'none';
    form_display = '';
  }
    
  p.style.display = p_display;
  form.style.display = form_display;
}
<strong>
function goList(curPage) {
  var form = document.getElementById("listForm");
  form.curPage.value = curPage;
  form.submit();
}

function goView(articleNo) {
  var form = document.getElementById("viewForm");
  form.articleNo.value = articleNo;
  form.submit();
}

function goWrite() {
  var form = document.getElementById("writeForm");
  form.submit();
}

function goModify() {
  var form = document.getElementById("modifyForm");
  form.submit();
}

function goDelete() {
  var check = confirm("Are you sure you want to delete it?");
  if (check) {
    var form = document.getElementById("delForm");
    form.submit();
  }
}

function deleteAttachFile(attachFileNo) {
  var check = confirm("Are you sure you want to delete it?");
  if (check) {
    var form = document.getElementById("deleteAttachFileForm");
    form.attachFileNo.value = attachFileNo;
    form.submit();
  }
}

function deleteComment(commentNo) {
  var check = confirm("Are you sure you want to delete it?");
  if (check) {
    var form = document.getElementById("deleteCommentForm");
    form.commentNo.value = commentNo;
    form.submit();
  }
}
</strong>
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Small talk&lt;/div&gt;
      &lt;div class="view-menu" style="margin-top: 15px;margin-bottom: 5px;"&gt;
        &lt;div class="fl"&gt;
          &lt;input type="button" value="Modify" <strong>onclick="goModify()</strong>" /&gt;
          &lt;input type="button" value="Del" <strong>onclick="goDelete()</strong>"/&gt;
        &lt;/div&gt;
        &lt;div class="fr"&gt;
          &lt;input type="button" value="Next Article" <strong>onclick="goView('6')"</strong> /&gt;
          &lt;input type="button" value="Prev Article" <strong>onclick="goView('4')"</strong> /&gt;
          &lt;input type="button" value="List" <strong>onclick="goList('1')"</strong> /&gt;
          &lt;input type="button" value="New" <strong>onclick="goWrite()"</strong> /&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;table class="bbs-table"&gt;
      &lt;tr&gt;
        &lt;th style="width: 37px;text-align: left;vertical-align: top;font-size: 1em;"&gt;TITLE&lt;/th&gt;
        &lt;th style="text-align: left;color: #555;font-size: 1em;"&gt;What makes us happy?&lt;/th&gt;
      &lt;/tr&gt; 
      &lt;/table&gt;
      &lt;div id="detail"&gt;
        &lt;div id="date-writer-hit"&gt;<strong>edited 2014-10-09 17:55:30 by John doe hit 1330</strong>&lt;/div&gt;
        &lt;div id="article-content"&gt;
          What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
          What makes us happy?What makes us happy?What makes us happy?&lt;br /&gt;
        &lt;/div&gt;
        &lt;div id="file-list" style="text-align: right"&gt;
          &lt;div class="attach-file"&gt;
            &lt;a href="#" &gt;TEST.png&lt;/a&gt;
            &lt;a href="javascript:deleteAttachFile('23')"&gt;x&lt;/a&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;!-- Add comment --&gt;
      &lt;form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post"&gt;
        &lt;input type="hidden" name="articleNo" value="5"/&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="happy" /&gt;
        &lt;div id="addComment"&gt;
          &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
        &lt;/div&gt;
        &lt;div style="text-align: right;"&gt;
          &lt;input type="submit" value="Add comments" /&gt;
        &lt;/div&gt;
      &lt;/form&gt;
      &lt;!--  comment list start --&gt;
      &lt;div class="comments"&gt;
        &lt;span class="writer"&gt;xman&lt;/span&gt;
        &lt;span class="date"&gt;2011.12.11 12:14:32&lt;/span&gt;
        &lt;span class="modify-del"&gt;
          &lt;a href="javascript:modifyCommentToggle('5')"&gt;Modify&lt;/a&gt;
          | &lt;a href="javascript:deleteComment('5')"&gt;Del&lt;/a&gt;
        &lt;/span&gt;
        &lt;p id="comment5"&gt;What makes us happy?&lt;/p&gt;
        &lt;form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;"&gt;
        &lt;input type="hidden" name="commentNo" value="5" /&gt;
        &lt;input type="hidden" name="boardCd" value="chat" /&gt;
        &lt;input type="hidden" name="articleNo" value="12" /&gt;
        &lt;input type="hidden" name="curPage" value="1" /&gt;
        &lt;input type="hidden" name="searchWord" value="happy" /&gt;
        &lt;div class="fr"&gt;
          &lt;a href="javascript:document.forms.modifyCommentForm5.submit()"&gt;Modify&lt;/a&gt;
          | &lt;a href="javascript:modifyCommentToggle('5')"&gt;Cancel&lt;/a&gt;
        &lt;/div&gt;
      &lt;div&gt;
        &lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;What makes us happy?&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;/form&gt;
  &lt;/div&gt;
  &lt;!-- comment list end --&gt;
  &lt;div id="next-prev"&gt;
    &lt;p&gt;Next Article : &lt;a href="<strong>javascript:goView('6')"</strong>&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
    &lt;p&gt;Prev Article : &lt;a href="<strong>javascript:goView('4')"</strong>&gt;What makes us happy?&lt;/a&gt;&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class="view-menu" style="margin-bottom: 47px;"&gt;
    &lt;div class="fl"&gt;
      &lt;input type="button" value="Modify" <strong>onclick="goModify()</strong>" /&gt;
      &lt;input type="button" value="Del" <strong>onclick="goDelete()</strong>"/&gt;
    &lt;/div&gt;
    &lt;div class="fr"&gt;
      &lt;input type="button" value="Next Article" <strong>onclick="goView('6')"</strong> /&gt;
      &lt;input type="button" value="Prev Article" <strong>onclick="goView('4')"</strong> /&gt;
      &lt;input type="button" value="List" <strong>onclick="goList('1')"</strong> /&gt;
      &lt;input type="button" value="New" <strong>onclick="goWrite()"</strong> /&gt;
    &lt;/div&gt;
    &lt;/div&gt;
    &lt;!-- List --&gt;
    &lt;table class="bbs-table"&gt;
    &lt;tr&gt;
      &lt;th style="width: 60px"&gt;NO&lt;/th&gt;
      &lt;th&gt;TITLE&lt;/th&gt;
      &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
      &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;td style="text-align: center;"&gt;&lt;img src="/images/arrow.gif" alt="You are reading now" /&gt;&lt;/td&gt;
      &lt;td&gt;
        &lt;a href="<strong>javascript:goView('1')"</strong>&gt;Title&lt;/a&gt;
        &lt;img src="/images/attach.png" alt="Attach File" style="vertical-align: middle;" /&gt;
        &lt;span class="bbs-strong"&gt;[5]&lt;/span&gt;
      &lt;/td&gt;
      &lt;td style="text-align: center;"&gt;2011.11.15&lt;/td&gt;
      &lt;td style="text-align: center;"&gt;4555&lt;/td&gt;
    &lt;/tr&gt;
    &lt;/table&gt;
    &lt;div id="paging"&gt;
      &lt;a href="<strong>javascript:goList('5')"</strong>&gt;[Prev]&lt;/a&gt;
      &lt;span class="bbs-strong"&gt;6&lt;/span&gt;
      &lt;a href="<strong>javascript:goList('7')"</strong>&gt;7&lt;/a&gt;
      &lt;a href="<strong>javascript:goList('8')"</strong>&gt;8&lt;/a&gt;
      &lt;a href="<strong>javascript:goList('9')"</strong>&gt;9&lt;/a&gt;
      &lt;a href="<strong>javascript:goList('10')"</strong>&gt;10&lt;/a&gt;
      &lt;a href="<strong>javascript:goList('11')"</strong>&gt;[Next]&lt;/a&gt;
    &lt;/div&gt;
    &lt;div id="list-menu"&gt;
      &lt;input type="button" value="New" <strong>onclick="goWrite()"</strong> /&gt;
    &lt;/div&gt;
    &lt;form action="list.jsp" method="get"&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;div id="search"&gt;
        &lt;input type="text" name="searchWord" size="15" maxlength="30" /&gt;
        &lt;input type="submit" value="Search" /&gt;
      &lt;/div&gt;
    &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;%@ include file="bbs-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
  &lt;/div&gt;

&lt;/div&gt;
<strong>
&lt;div id="form-group" style="display: none"&gt;
  &lt;form id="listForm" action="list.jsp" method="get"&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="writeForm" action="write.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="12" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="modifyForm" action="modify.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="delForm" action="del_proc.jsp" method="post"&gt;
    &lt;input type="hidden" name="articleNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
  &lt;form id="deleteCommentForm" action="deleteComment_proc.jsp" method="post"&gt;
    &lt;input type="hidden" name="commentNo" /&gt;
    &lt;input type="hidden" name="articleNo" value="12" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;   
  &lt;form id="deleteAttachFileForm" action="deleteAttachFile_proc.jsp" method="post"&gt;
    &lt;input type="hidden" name="attachFileNo" /&gt;
    &lt;input type="hidden" name="articleNo" value="23" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;       
&lt;/div&gt;
</strong>
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>addComment_proc.jsp</h3>


<h6 class="src">/bbs/addComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Unauthenticated User 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;

Authorized User 
Insert comments with the boardCd, articleNo, curPage, searchWord, and memo parameters.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=happy");
%&gt;
</pre>

<h3>updateComment_porc.jsp</h3>

<h6 class="src">/bbs/updateComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
authenticated but not owner
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
Authorized and Owner
Modify comments with commentNo, boardCd, articleNo, curPage, searchWord, memo parametes.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=happy");
%&gt;
</pre>

<h3>deleteComment_proc.jsp</h3>

<h6 class="src">/bbs/deleteComment_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Not Owner
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Owner"); return;

Owner
Delete comments with commentNo parameter.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=happy");
%&gt;
</pre>

<h3>deleteAttachFile_proc.jsp</h3>

<h6 class="src">/bbs/deleteAttachFile_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Not Owner
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Now Owner"); return;
Owner
Delete attachFile with attachfileno parameter.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;boardCd=chat&amp;curPage=1&amp;searchWord=happy");
%&gt;
</pre>

<h3>del_proc.jsp</h3>

<h6 class="src">/bbs/del_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Not Owner 
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
Owner
Delete board article with articleNo parameter.
*/
response.sendRedirect("list.jsp?boardCd=chat&amp;curPage=1&amp;searchWord=happy");
%&gt;
</pre>

<h3>modify.jsp</h3>

<h6 class="src">/bbs/modify.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %&gt;
<strong>&lt;%
User user = (User) session.getAttribute("user");
if (user == null) {
  response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login User");
  return;
}
request.setCharacterEncoding("UTF-8");
int articleNo = Integer.parseInt(request.getParameter("articleNo"));
String boardCd = request.getParameter("boardCd");
String curPage = request.getParameter("curPage");
String searchWord = request.getParameter("searchWord");
//TODO logic to confirm that an authenticated user is the owner of the article.</strong>
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Modify article form" /&gt;
&lt;meta name="Description" content="Modify article form" /&gt;
&lt;title&gt;Small talk&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function goView() {
  var form = document.getElementById("viewForm");
  form.submit();
}
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Small talk&lt;/div&gt;
      &lt;h3&gt;Modify article&lt;/h3&gt;
      &lt;form id="writeForm" action="<strong>modify_proc.jsp</strong>" method="post" enctype="multipart/form-data"&gt;
      <strong>&lt;input type="hidden" name="articleNo" value="5" /&gt;
      &lt;input type="hidden" name="boardCd" value="chat" /&gt;
      &lt;input type="hidden" name="curPage" value="1" /&gt;
      &lt;input type="hidden" name="searchWord" value="happy" /&gt;</strong>
      &lt;table id="write-form" class="bbs-table"&gt;
      &lt;tr&gt;
        &lt;td&gt;Title&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="title" style="width: 90%;" value="What makes us happy?" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td colspan="2"&gt;
          &lt;textarea name="content" rows="17" cols="50"&gt;What makes us happy?&lt;/textarea&gt;
        &lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Attach File&lt;/td&gt;
        &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;div style="text-align: center;padding-bottom: 15px;"&gt;
        &lt;input type="submit" value="Submit" /&gt;
        &lt;input type="button" value="Detailed view" onclick="goView()" /&gt;
      &lt;/div&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;%@ include file="bbs-sub.jsp" %&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;div id="form-group" style="display: none"&gt;
  &lt;form id="viewForm" action="view.jsp" method="get"&gt;
    &lt;input type="hidden" name="articleNo" value="5" /&gt;
    &lt;input type="hidden" name="boardCd" value="chat" /&gt;
    &lt;input type="hidden" name="curPage" value="1" /&gt;
    &lt;input type="hidden" name="searchWord" value="happy" /&gt;
  &lt;/form&gt;
&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>modify_proc.jsp</h3>

<h6 class="src">/bbs/modify_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Not Owner
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Authentication Failed"); return;
Owner
Modify board article with articleNo, boardCd, curPage, searchWord, title, content, attachFile parameters.
*/
response.sendRedirect("view.jsp?articleNo=5&amp;curPage=1&amp;boardCd=chat&amp;searchWord=happy");
%&gt;
</pre>

<h2>User</h2>

<h3>SignUp.jsp</h3>

<p>
Open the singUp.html file and use the Save As editor menu to create a signUp.jsp file in the directory named users and modify it as shown below.
</p>

<h6 class="src">/users/signUp.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="SignUp" /&gt;
&lt;meta name="Description" content="SignUp" /&gt;
&lt;title&gt;SignUp&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css" /&gt;
<strong>&lt;script type="text/javascript"&gt;
function check() {
  //var form = document.getElementById("signUpForm");
  //TODO validation logic
  return true;
}
&lt;/script&gt;</strong>           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    <strong>&lt;%@ include file="../inc/header.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    <strong>&lt;%@ include file="../inc/main-menu.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;div id="content-categories"&gt;Membership&lt;/div&gt;
      &lt;h1&gt;SignUp&lt;/h1&gt;
      &lt;form id="signUpForm" action="signUp_proc.jsp" method="post" <strong>onsubmit="return check()"</strong>&gt;
      &lt;table&gt;
      &lt;tr&gt;
        &lt;td style="width: 200px;"&gt;Full Name&lt;/td&gt;
        &lt;td style="width: 390px"&gt;&lt;input type="text" name="name" style="width: 99%;" <strong>value="John Doe"</strong> /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Password&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="passwd" style="width: 99%;" <strong>value="1111"</strong> /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
        Do not input email account password!
        &lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Confirm&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="confirm" style="width: 99%;" <strong>value="1111"</strong> /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Email&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="email" style="width: 99%;" <strong>value="captain@heist.com"</strong> /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Mobile&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="mobile" style="width: 99%;" <strong>value="123-4567-8901"</strong> /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;div style="text-align: center;padding-bottom: 15px;"&gt;
        &lt;input type="submit" value="Submit" /&gt;
      &lt;/div&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;%@ include file="user-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    <strong>&lt;%@ include file="../inc/extra.jsp" %&gt;</strong>
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    <strong>&lt;%@ include file="../inc/footer.jsp" %&gt;</strong>
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>signUp_proc.jsp</h3>

<h6 class="src">/users/signUp_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Not automatically authenticate.
When signup is completed, the sign up form page should be redirected to the welcome page.
*/
response.sendRedirect("welcome.jsp");
%&gt;
</pre>

<h3>welcome.jsp</h3>

<p>
This page informs the user that the subscription was successful. Users who are unsuccessful in a subscription should not see this page. Open the signUp.jsp file and use the Sava As editor menu to create a welcome.jsp file in the directory named users and modify it as shown below.
</p>
 
<h6 class="src">/users/welcome.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Welcome" /&gt;
&lt;meta name="Description" content="Welcome" /&gt;
&lt;title&gt;Welcome&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      <strong>&lt;h2&gt;Welcome&lt;/h2&gt;
      Email is used as an ID.&lt;br /&gt;
      &lt;input type="button" value="Login" onclick="javascript:location.href='login.jsp'" /&gt;</strong>
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;h1&gt;Welcome&lt;/h1&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>editAccount.jsp</h3>

<h6 class="src">/users/editAccount.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Modify Account" /&gt;
&lt;meta name="Description" content="Modify Account" /&gt;
&lt;title&gt;Modify Account&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function check() {
  //var form = document.getElementById("editAccountForm");
  //TODO validation logic
  return true;
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Modify Account&lt;/h2&gt;
      &lt;p&gt;
      You can modify all information of your account except password. &lt;a href="changePasswd.jsp"&gt;Change Password&lt;/a&gt;
      &lt;/p&gt;
      &lt;form id="editAccountForm" action="editAccount_proc.jsp" method="post" onsubmit="return check()"&gt;
      &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;Full Name&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="name" value="&lt;%=user.getName() %&gt;" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Mobile&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="mobile" value="&lt;%=user.getMobile() %&gt;" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Password&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td colspan="2"&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;%@ include file="user-sub.jsp" %&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>editAccount_proc.jsp</h3>

<h6 class="src">/users/editAccount_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Anauthenticated
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
Authorized
After editing the member information, if login again in the login page, the login page be redirected to the Change Password form page.
On the Change Password page, you can see the member information without the password.
*/
response.sendRedirect("changePasswd.jsp");
%&gt;
</pre>

<h3>changePasswd.jsp</h3>

<h6 class="src">/users/changePasswd.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
<strong>&lt;%@ include file="../inc/loginCheck.jsp" %&gt;</strong>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Change Password" /&gt;
&lt;meta name="Description" content="Change Password" /&gt;
&lt;title&gt;Change Password&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
<strong>           
function check() {
  var form = document.getElementById("changePasswordForm");
  if (form.newPasswd.value == form.confirm.value) {
    return true;    
  } else {
    alert("[Change Password] and [Change Password Confirm] values are not the same.");
    return false;
  }
}
</strong>
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Change Password&lt;/h2&gt;
      &lt;%=user.getName() %&gt;&lt;br /&gt;
      Mobile &lt;%=user.getMobile() %&gt;&lt;br /&gt;
      &lt;form id="changePasswordForm" action="<strong>changePasswd_proc.jsp</strong>" method="post" onsubmit="return check()"&gt;
      &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;Password&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="currentPasswd" /&gt;&lt;/td&gt;   
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Change Password&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="newPasswd" /&gt;&lt;/td&gt;   
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Change Password Confirm&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="confirm" /&gt;&lt;/td&gt; 
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td colspan="2"&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    &lt;%@ include file="user-sub.jsp" %&gt;
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>changePasswd_proc.jsp</h3>

<h6 class="src">/users/changePasswd_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Anauthenticated
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;

Authorized
If the password is changed, the changePasswd_proc.jsp be redirected to the password change confirmation page.
*/
response.sendRedirect("changePasswd_confirm.jsp");
%&gt;
</pre>

<h3>changePasswd_confirm.jsp</h3>

<p>
Open the welcome.jsp file and use the Save As editor menu to create a changePasswd_confirm.jsp file in the directory named users and modify it as shown below.
</p>
    
<h6 class="src">/users/changePasswd_confirm.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Change Password Confirmation" /&gt;
&lt;meta name="Description" content="Change Password Confirmation" /&gt;
&lt;title&gt;Change Password Confirmation&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Your password has been changed.&lt;/h2&gt;
      You can login again with the changed password.&lt;br /&gt;<strong>
      &lt;input type="button" value="Login" onclick="javascript:location.href='login.jsp'" /&gt;</strong>
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;%@ include file="user-sub.jsp" %&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>bye.jsp</h3>

<p>
Open the editAccount.jsp file and use the Save As editor menu to create a bye.jsp file in the directory named users and modify it like below.
</p>

<h6 class="src">/users/bye.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ include file="../inc/loginCheck.jsp" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Bye" /&gt;
&lt;meta name="Description" content="Bye" /&gt;
&lt;title&gt;Bye&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;script type="text/javascript"&gt;
function check() {
  //var form = document.getElementById("byeForm");
  //TODO validation logic
  return true;
}
&lt;/script&gt;           
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
    &lt;%@ include file="../inc/header.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Bye&lt;/h2&gt;
      &lt;form id="byeForm" action="bye_proc.jsp" method="post" onsubmit="return check()"&gt;
      &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;Email&lt;/td&gt;
        &lt;td&gt;&lt;input type="text" name="email" /&gt;&lt;/td&gt;   
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td&gt;Password&lt;/td&gt;
        &lt;td&gt;&lt;input type="password" name="passwd" /&gt;&lt;/td&gt;  
      &lt;/tr&gt;
      &lt;tr&gt;
        &lt;td colspan="2"&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/td&gt;
      &lt;/tr&gt;
      &lt;/table&gt;
      &lt;/form&gt;
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;

  &lt;div id="sidebar"&gt;
    &lt;%@ include file="user-sub.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>bye_proc.jsp</h3>

<h6 class="src">/users/bye_proc.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%
/*
Anauthenticated
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
Authorized
If the received email and password are the same as those of the logged-in user, delete the member information from the member table.
Invalidates the current session.
Go to the Account termination confirmation page.
*/
response.sendRedirect("bye_confirm.jsp");
%&gt;
</pre>

<h3>bye_confirm.jsp</h3>

<p>
Open the welcome.jsp file and use the Save As editor menu to create a bye_confirm.jsp file in the directory named users and modify it like below.
</p>

<h6 class="src">/users/bye_confirm.jsp</h6>
<pre class="prettyprint">&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;meta name="Keywords" content="Goodbye" /&gt;
&lt;meta name="Description" content="Goodbye" /&gt;
&lt;title&gt;Goodbye&lt;/title&gt;
&lt;link rel="stylesheet" href="/css/screen.css" type="text/css"  /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;div id="wrap"&gt;

  &lt;div id="header"&gt;
        
  &lt;/div&gt;

  &lt;div id="main-menu"&gt;
    &lt;%@ include file="../inc/main-menu.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="container"&gt;
    &lt;div id="content"&gt;
      &lt;h2&gt;Goodbye&lt;/h2&gt;
      Your Information is all deleted.
    &lt;/div&gt;&lt;!-- content end --&gt;
  &lt;/div&gt;&lt;!-- container end --&gt;
    
  &lt;div id="sidebar"&gt;
    <strong>&lt;h1&gt;Goodbye&lt;/h1&gt;</strong>
  &lt;/div&gt;
    
  &lt;div id="extra"&gt;
    &lt;%@ include file="../inc/extra.jsp" %&gt;
  &lt;/div&gt;

  &lt;div id="footer"&gt;
    &lt;%@ include file="../inc/footer.jsp" %&gt;
  &lt;/div&gt;

&lt;/div&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
The loginCheck.jsp is a file you must include in JSPs that authenticated users can only view. In the bulletin board program, the pages corresponding to the screen are list.jsp, view.jsp, write.jsp, and modify.jsp files. I didn't include loginCheck.jsp in modify.jsp. The reason is that this file needs more logic since it should determine if the logged-in user is the owner of the post. This file is the only exception among the screen pages, so I implemented all necessary logic within the file. EditAccount.jsp, changePasswd.jsp, and bye.jsp among the member module have to include the loginCheck.jsp file.
</p>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/database-design"/>">Database Design</a></li>
		<li>Prev : <a href="<c:url value="/jsp/dynamic-web-project"/>">Dynamic Web Project</a></li>
	</ul>
</div>

</article>