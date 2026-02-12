<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<article>

<h1>Positioning div elements for layout</h1>

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
<img src="https://lh3.googleusercontent.com/6zfq7QrRIJKGa821vtn9ycho9dUjMWBCLy7d637ndIp8WaoNxwvhBij3TU7AofJaAZ0NgcEzGBmscERrpfZcZAehaD1Y0c2ZAYuTLbVgf7DHJyx1Rb6CHfu6NsLe6kHRtdGPOM-7nnoGFNB7w-6_NTJr0fConNn7PUk2yHwAqRTB9P9Yrv3W6cct57bgaamTWGU47F7hfu2cIHzd2HRsHdqCcwwRPRj_NTJ00IYEhExLgzP3iJyuYQCyA5GS_2HrHYwnKfv7IF88AFmq2H3zN_xhd7tgE11YA_naIfd1eOGWLyvB2B_Ik17KdjNkteuuKVTb7CP9vWHxq6sjhYxm2SBpnnMZ95oVVkK-vS8h1fgEI_RYWOIiAIXcXtHIvRF2oto6RHSMeA3zYwzqvrofSp6ypjbp6rMikJJM1T2g_N2BRhXptNw3Ay2Rz4-PjkwRd_bZDY-vNnkkWKqeut2GSmTNmTsmP8nkMegS9G80rnvPV3iqSjv_huSb_I-Wtx2tLX4GfhxVfEbaDG0hXg1XFKgNYh6FIAif7SLBokhxQjbDeAygcmeZ4oWFE0gA3tnDOrC5GBI4_JarnjTNbNoFcsZc2LCZGjmd8JUqMvk=w789-h79-no" alt="A float:left" />
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
<img src="https://lh3.googleusercontent.com/-JwgR1omC9cM/VYIykC0huYI/AAAAAAAACYQ/4FgkuPnTW00/s789/a-float-left-b-float-right.png" alt="A float:left,B float:right" />
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
<img src="https://lh3.googleusercontent.com/-El9vX54a-po/VYIyjeyMSkI/AAAAAAAACX4/5wuSIN7BFRM/s789/a-float-left-b-float-right-c-clear-left.png" alt="A float:left,B float:right,C clear:left" />
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
<img src="https://lh3.googleusercontent.com/-3dIp3C9coOM/VYIykEsPWWI/AAAAAAAACYM/ObzhAYQ7yns/s789/a-float-left-b-float-right-c-clear-right.png" alt="A float:left,B float:right,C clear:right" />
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
<img src="https://lh3.googleusercontent.com/-TVJbd4acXvE/VYIyjCCYaPI/AAAAAAAACXw/n_JPIsP5oJI/s790/a-float-left-b-float-right-c-clear-both.png" alt="A float:left,B float:right,C clear:both" />
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
<img src="https://lh3.googleusercontent.com/-cewqRIDShsE/VYIyhgdKhKI/AAAAAAAACXI/OfaLfR_ODc8/s268/A-B.png" alt="A float:left,B float:left" />
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
<img src="https://lh3.googleusercontent.com/-xn-gY2INVBI/VYIyieX75lI/AAAAAAAACXY/mBZY8t0e6UM/s265/A-margin-left%25253A-50px-B.png" alt="A float:left;margin-left: -50px;,B float:left" style="display: block;float: left;margin-left: -50px;opacity: 0.6;"/>
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
<img src="https://lh3.googleusercontent.com/-LsOwnQ044vM/VYIyjOiq3hI/AAAAAAAACX0/NQ6jLC2BR6E/s202/A-margin-right%25253A-50px-B.png" alt="A float:left;margin-right: -50px;,B float:left" />
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
<img src="https://lh3.googleusercontent.com/-7uanSRHPQHI/VYIyhnbJZkI/AAAAAAAACXg/-Pwjw7wtUhs/s399/A-B-C-all-float-left.png" alt="A float:left;B float:left,C float:left" />
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
<img src="https://lh3.googleusercontent.com/-yPcb_VPnrSg/VYIyhGdkjRI/AAAAAAAACW4/6d-fBbwojl8/s790/A-100%252525width-B-C-all-float-left.png" alt="A float:left;width:100%,B float:left,C float:left" />
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
<img src="https://lh3.googleusercontent.com/-T6ZyBKMa2ps/VYIyhGLHKXI/AAAAAAAACXE/lsK4ae5g58I/s790/A-100%252525width%25253Bmargin-right%25253A%252520-100%252525-B-C-all-float-left.png" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
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
<img src="https://lh3.googleusercontent.com/-0tUdI0oI3yc/VYJKqoLCR1I/AAAAAAAACYg/FXINmUkV720/s790/A-B%25253Amargin-left%25253A-100%252525-C-all-float%25253Aleft.png" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
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
<img src="https://lh3.googleusercontent.com/-FkqZtWbtXxA/VYIykWeB9uI/AAAAAAAACYI/oH68R5L31og/s789/a-float-left.png" alt="A float:left;width:100%;margin-right:-100%;,B float:left,C float:left" />
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
<img src="https://lh3.googleusercontent.com/95wLutuUcUGJItBsXMolga7mpCIO29gzKMxyYYaEa8ozGm64joo0AmqSbwrUDXknBOxggE4In5x1KQsRcxYGJtnCAOQhQCh_kVM8ZEfzv4SUFEzFgblqr_FuMeFEFHdXsrZuXcDFvKAWSsFDjzliFGpDW-sdARW5aom1YZpo1E_ygS2whOizL8UaDcyZbuTzqzC2SRDDuy20fQ5YMjT7Y4ZgO6stX5ZpO3n5tnmTTAp1YWyw-sVOgLlSAwlbGv2pI6EKkBzaWT8rd4NgQo-adHC7cFLoRDp67OyWgYCLO7Od5-MSTazR5fGarH4msc9dODbB1hMkTcj4c4alxkv9xUflvyfx91c94-y9D58O1k0owEZ1Ikvf7i4uBMdhjz0BGXE0EidqCNUCSCtLdJt6T8_ENPHNs00pdYDTYd3EBdVDvC44lKWu4o_zxJc4KL2K4ZXWW8byTv-T0k4_vX_brsixS9S5bukoh4whD_AFfHkBoXCXgzgcp1kFSAjUIht_hYxiLtfjwNl8K98GkworEptCMDrGRcb8PfYQsdKwIi7qe3lfdd1z8az19GprvlqzRDuOuHXci5TfQfNs58S9_ld9T_eDFez8ZIHmuuazxg=w1007-h456-no" alt="Example Screeen 1" />
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
<img src="https://lh3.googleusercontent.com/Uq0RL2J9hPslzA74L6bpsY-M1atZ-PpvTlwK_0pnqSXMOFrU3xDsde2yrahtbpbGcKB2jzavEfkWgwjQGu9RWZyq8ZlLg5uKmeVFyhvcLwxvIq2ZDtTtqu_iyDmzjaaiPPuN7Y4BhQMLlgaZ84uVLW_fmwu0caK-kQq7yMD1zlY4EOzYGZw8tKXp0Gv_Y20eOyaZw_WLDyRJ_zNme7DtV1q1jdcp9O3EuVyWagGjPNpi0w4WgmvzQAQ4VKAF9ej7ZrDfctF7dRcV8pM0_DiW3wqQzmjwf_zcak4YtUJRrVoKdbGapfjLydKflZ-35yBCF3ja5UtAcJTPeqEfhOjMv7kLuLWdemrmVkWDon5iGMv48IXDS6vokTE30NRm54N728KRu9_4Ps_gR_czDkK4cTMJyofyiY70-9oEcKF9m396JLy3BWb1lSvYFY0fmEQOXZa3Z2D6rKL1HoCHDJMtHhAoKX2wO1HL5Att65bXQQcvEDC2GVm1DpJQ6b1LuIVUSBVGcnhItwBbRrQSCdprDdGjH5TIWssaJyoCNRlM8cK9qQvmjUsZyNFKC8b4kvcPFWTuKx93gLd7qjq3vTejGnaNjtYCQLC1D3R8Yfld9A=w1003-h454-no" alt="example 2" />
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
<img src="https://lh3.googleusercontent.com/lkF4JNsGRUHDnMFnXPQsAKsFJzeY3F21IJl9wRC0sto8EqynAe7eWCJVDIeWniyUsscLGYjLqD5wXSzeu19fmQEbiib7YqloaS2avOB0uTyb7zA6C_6po0yZDUuXq96f_ARpd2D-bgC6q19UWZ0zPx30CQIvkFnePu20BbO1MSvveSFJ4VMeW2NE3dAbeQe9YVHhO6oKLtoAl-Mahno62VCT6CI_WKPVZqXEFlcninxgFRkHB_OVhXQwg59BdvtX64YhWN3jQ88Wmr1Quap04eUIIJyCmW5BOfYDxoWejpizLss37t8j4kOBtMhqYrEqp2HOSm9TSdthRTFIHzWEOOOHatEfhZkqGAzas4hpXDV-uYtuyqTgTQVY10F5FfDKmauyKfqWsbWoSx_iG1MIKTOHerDQC7-1hNQFp2NTElse9HN-1VybT8VwW81MyTV4PZW3DILpt33cqrYko4KpIYLuQVHtfA3PnC1N5HHJaQZqOPoZLRd-jrIloik31C-sXBORqca_I108Y9YVSVlvEyf8VK7LghzV60ZanHRlIaSJl8usqwfeOmBZaOPlCMp1_w2XfnSNtpvyBQuXWLlnF3FdI_UUfiVkPXDJpNwItQ=w1007-h355-no" alt="Example Screeen 3" />
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
<img src="https://lh3.googleusercontent.com/Opm1K3E0xe6vuQvPxKRkCOpgdO95yRey0C-E-yomTjxXy9wbxhPISvw1RsLMaPrLPStNlpDT6wekpWAZGooOuQS1a-1IGri5ZgNDuVcwfQ7ztZfsrmEbDLEJl17gZBBr6m8Nyh8VZOT8K4vEwKkKrG_n9bMC5dIS5mWJhRpyCyhp_EaRg3OOgwdKjVlWvxso8ACLd7_DjeCpwMdZ9oBS6T-BTHRP7NksDMMIwQINYQNsUxd4gLYE2bnyahEqyvV7jTcTTj4kUdYJ8Nut36wgZrXhlcnZugDGhJe1oauPuJtBYVG_LVN_ktni_wID8r-Cz1S1Y-dtOTjHocvZTmm89ZuJDvChm4jgIvjhXdI4WwCQUOqf8qJC65mo6XfqIS1qCdaXgL6BrddD3g2OqP11V9cQM8JU94XKdQHyt9qagqk3BGUhHirkbjhGQwOjMA5VgH13uoY-C7ZgAgPfzigSGQTzWL_agO4rqLL6cXVb4lhsAGKnrIbPFlTV7ijfgTu0woWkvSOl1SXBp6HDgJI6HoZXvvmCyLw3q-STf05Nzjpopu14YMV_25azjgwMXyrcBJ2cxlGdBzBGR4YxLFdmpE_bIcQGADjiCjNfhNyOGg=w1002-h353-no" alt="Example Screeen 4" />
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

<img src="https://lh3.googleusercontent.com/usu6D53Xw_OU25tUIH8oKubV0wbC41xh8sj7b0MHSjMI0ouGTln29XG0Ucsa_8v44FJJ7UKQmJ8x1U5MuuIEZDo3C1kcBBojvoLOF-E3G1U5QRJpc7Y_TAQcnT0MQX5Dp7P93Kyh8k82hx12hY8DzamwcZwq3TlmT3xRcGfhWJt7hhdcPITVQufhdw1Oiu_TGGEiJcibkf_6P-dLkY0qUN4SkOVD5NTzkkCCR1J7GSIIG88WY904aGYvyr9wT0W8CqKwVvn60XUskysEQzviBXxZy2XLMJSyRjc1j5gGADlaIBktDkOPrjzCMvQwl8YzaZtZngc7IaVlO7i5JM7irSzXfDUcZDPXeW5uYq-GXUAZIel37bnKPF_n3EQkj3-Ne5nu5bGPFumYUSrTjOGAqBhEHzV41HTVKTdTiIjszECFiXynvRRL3vIJSVKMAVZwQVgrx1FUBIbDZ-kl_xUEYsMPsL5QQ8FC3rmQP3WQPjI6XOFlSmHMEnusximIT38_v2_ccYRfL4GUko-cTf3zJNSUX_Dqh9m_6cu4F5_mEJt6QGXjSGfnhEsBstmw_SLoGDw6V9XzQKWbll3gBzZo4OBR8gUlY1ATYZAPed7CZA=w1004-h252-no" alt="Example Screeen 5" />

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
</article>