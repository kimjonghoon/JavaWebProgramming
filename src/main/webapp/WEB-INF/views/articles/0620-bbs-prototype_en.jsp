<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Prototype</h1>

<p>
A prototype is a kind of model that creators make at the beginning of development. The web application prototype is mostly JSPs that show screens. You don't need to implement program logic in prototypes except those required for testing or not change until the end of development.
</p>

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

<h1>Main menu styling</h1>

<p>
Create a foider named images and save the following five images in the images folder.
</p>

<ol>
	<li><img src="https://lh3.googleusercontent.com/-sQJqA2Xy4lA/VYJgApAGzmI/AAAAAAAACak/QoRi8LP0HEA/s4/bull_circle.gif" alt="bull_circle.gif" style="width: 90px;height: 90px;background: #ebebeb;border: 1px solid #999;" /></li>
	<li><img src="https://lh3.googleusercontent.com/-m7AxsWEEYkI/VYJgAlTWMsI/AAAAAAAACag/ZwSK80SF3yI/s11/attach.png" alt="attach.png" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="https://lh3.googleusercontent.com/-CLWzjmg1nE0/VYJgBW3wZ2I/AAAAAAAACao/3fAtEYhiSps/s117/ci.gif" alt="ci.gif" style="width: 117px;height: 39px;border: 1px solid #999;" /></li>
	<li><img src="https://lh3.googleusercontent.com/-HRhH9HImJr0/VYJgB_tbr-I/AAAAAAAACa4/r0w7FPaHy6w/s3/circle.gif" alt="circle.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
	<li><img src="https://lh3.googleusercontent.com/-oNgNdic_nwk/VYJgApt8m8I/AAAAAAAACa0/BbLVtFw5Ayk/s9/arrow.gif" alt="arrow.gif" style="width: 90px;height: 90px;border: 1px solid #999;" /></li>
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
<img src="https://lh3.googleusercontent.com/7KuwVb8C6br52eRzZ47KTIP9u-OMLpZB970ltbzveIypbUdrvlYXSdKFb1ScHyEEzyR6ZoOcgEdS4COqYCOlhyx0JkKTvv7KayQm-ZzvtxQsIiVwvXSfMkg0vml5_TdenYNrVjJBBYkIMN0fOBqbzWN8izQ9LQBeVKGUWnNTe2lNZDQYnDEsCykpLgdnc-RanSrCudRTt0tFAnUpOYNpoHj7H6eSV0UVCGs6rYQUV6ZwYQTIZKgqopQYNZt3oXvbf1d9SBtAgmvALii-ufCeMLS-Xi1fywyLpbjhB-EX3Q-jhG9FRhBjVieQ7mJqwppobNrbphoCNHf_iAKdjUH-HG7eCWERg5bAYGWjlu_4MbKiGZ3FE83TzBwQV5fPhu8XcpjZ93847_nwd9V65-37LdxhdJJWo6M6akTTjdwsz7ONerMP5Uaq4LU7sfPeDvjsk6-k53fC-ylfS2ePxZbeyIW1-7RyJheN2g2IGO5oURWxDeQyaPxX5Cj7dv9r8pc7Gvs53NE_7KHmq3EnW_uvvWkmt-I5yXJ9FCvDYobhgLmnKAyuGwaUOeKq1PBhlMJ7ynu1LP8mnNGZVZrB9hnLyNGDmikKXtHabzl7h-dSnQ=w1004-h267-no" alt="Example Screeen 1" />
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
<img src="https://lh3.googleusercontent.com/Z_mGhXSx68DHbZTTR0k93Ae6sUTMqDDHkAV2OGSfnzYaa3lAJ12ZlkSwoKOzrvr_g4B4EqgE4A4ionNGH5sAl8yIiYVNbTM7D3hKE6CYHRlkh41z0LWraborpX_6gJkN-_0Y75YyR61C9x4gUOg-D-qLPrYCxxtIqf7tleieVzgjbzPvQZ0oxSWaIJrzXo3Y-YL4LXrhA5FfVDKZAYMuuwX4om61YMXQhYOtW3Ta0i-wrTq3QutDUwWxyTCWFaizrRcA1Vj4Glrdhusc9HEQ_H-pEdlyjP5-F1qclmXk0DvkyzWFWlYyS3GpsjzHikCiL5P3D2tghJz-CeUZPOP5x_dP4dnWHtmKcF-H1lmsejJkUWo9ZFAYKga0msVj4U5yWxcaqmoCBSbJyN9JDPiHlqUFl4Q4m-9nsoCiF5Ngyrd7KpAPJH__8uJv9iXZDyC-6SPJJoq2C3fuBB2-ms0mfAZdCmFyDSvH40ehMH8YSO9kQXI4Rdt4k0584X_YuBX11m9easpVeSICt1UFtboH8p2jiJHFdVIRu6C0q8C4jd2rXDPqvsHMjEFOA6JMzoIeevQj5Z_AFLZqskIvJxhKA47ck1v_Btgv0PpJA6joPw=w1003-h253-no" alt="Example Screeen 2" />
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
<img src="https://lh3.googleusercontent.com/pksuNst3SA9o4go-EhX5SxzYUKybiFB8K9oPzQqqUGKp2ycTa-ISqL5Fsj_k9gdILsYVai439AXyxs8LpLzbBNxXdAROXD8eQSP9WzPC7RYtwyFv7eYE4cxTMMysx3wIMA6k39LrH09XHAM0aNblLxuVAZIHxdP9POnbzK3SsgIXzFqCWgVwunpwZmiFK65EHTEVvxu__F4kaAc9emRDmA8Mdsa77ac8DzwouK2a9V_aCcpp6eLwEp7AqjpvhB0-OayOqiC5HE_42f2L8pBRzgo5hez_EJs1gXOJuGRg-6d2P5TdHeDog5nAUiyVw67rEO4pZcFkNZ9MBf0cIKeeWYCZgHIKsxZ65cmmH7qvNCXFm45cIzqZ6eGtFmYzuIInAwypzgWzfVLGq8nPmadjFJkOJehv4FCfq1ZdWk9fZAPZuEQYU_-7QDUp4L8KhgZwuO70P3aoz22QSb6hLEQC-e2b6kWPxDN0qqFHMZnCridL8PNC13mMX8Ku4smgFx65uiqkDp6mUIUi3v06EhUL0dYrefuxXLq7GAGkYXtZF3vMznD1Y6TByntg3ia_qdzToD_XoGELGoQbJpKbEyQzMsEXIHfrkAEPs0sZxngArA=w1004-h254-no" alt="Example Screeen 3" />
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
<img src="https://lh3.googleusercontent.com/-eiR9k0tDYLslZm2fJygd0zrByIB8j49j3lmlLbb4OOnlJ5diTkkMFQkAzRyNmVqoJABOAYGyAIsK15dUf4dXT5pLJiRHudqNKYcBpBlfYE1kX5sjyhzxfailk3NftQ6mr8pFRjgYNB6eEV1bpIjAtJ6TFj2VqlezgfTKT_WcVxG6V0TNJ22Vryea0mQj090F3-JXTNlSLjzsbMYPtJIrm-fbJVlRlgnXvwNu7oCeIzX9gjaTPT_U416VWCgpYcLa_zuTFLdz_KJfdxAXYs1jLwL15hFlwc9LJULeU5vxK_lmzSQGiJq299qiZYR3ZZwjX38K0bQ9BCX_598iUreOQ3mdKSipGcWva51cFaSl3hEVRJNlPGwIvEg7CFVjcWOAsGExtqzGPLt8Eo7v-ZXyBMVPs4V1_3f0mk8MjuMAHy5JiKHRL8vqUxwNS8_nzE3k8vmMkkHMgWfR7d5m6_2rXBD3vQK7ySdKo-RDMWnrabQzf5ELDAjd_VFHj8CJIxta99xQLFzjGRES3qhWXxMqwYDEhKocC7Fa3BfvH8bqQa0jw14gLPDEJo8NVFm-KposLRrmvrCMwNxpx1JiVe-LDvQDCMjW-_Y5qtDCfQcMQ=w1005-h254-no" alt="Example Screeen 4" />
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
<img src="https://lh3.googleusercontent.com/jRac0J5LdMDbGLUchmN3NDLo9y0NfpDfTOn9mh6-6IZFyZC3zni-akAuSex_-zSlbZnHk_Pw1BdpUNSHqeClnbqywMB0-2XIAex74hKw6tmnZ_sWXvhXViwDUhESyoiGTJX5PMw3cXUHoGrN_Iw3Nu1qqMgFdxNEcAyyLyA6GrgPG94KvEfhcCjeo2oDX7lZPe3fIku67ijUN1w3EoFCT-bYp2u_ijNu-rH7iyEVKu7sCmE2yt5ZOD-JrCccN4kIo_GTFmVSmR_IYVp88-h4xdoupDSeb1igdDAftWPhV6dz0DDigCFHQM8jiTL4IJsEU5G4oXx05JjZ8vD3T4VaNeZ4HsHyP31_nbJ3njAmy2OWX9BfB61Vo_LTzrFOaO4L4neB2CbAmeKMJ0PNBenyf-IxgqhxO9zQgwJmaVcHIGT-kFpT3Jc-IVbZe9SbNW_Y3wsp6h1EKaITIKzt8ZxDCCCBLdrxoYG--6mojTVyS4b117W79jrofuRE-zxj2vqyJxLul4HDVUJ0ju9kbrD4SqHbeNZIQJfM7upWhuNwbVLs2oxj8-dF8cp80MHTtnCnifyZocngxBM4Pd6SKJirUuBYNEUxGYYL0NgV1kSAmA=w1004-h253-no" alt="Example Screeen 5" />
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
<img src="https://lh3.googleusercontent.com/wS6vm14LPN_JQAIXbIIswjMJ5oz-P0P3X3NphvgKJ4TSdexR1ZMLA798A7rkvNpYeAy8SPRbzC4uTQmwGEhrdCEXqhGkuqArlbsIhR37yoRD5z3dnE3iRVIGHSfYvCix6uQ9qdIgKcA6YPkL5dZqDhlHBs3MtPqHSlKv9OBwH_enMZ3XQSB6QHz9rZAUdeWHiIhKhxoT9cc04VO_8YsdoGcFU9ug4K_x107YeqJR4rf9ZFoVT3w8m9XPSPCITuC9_GjFj4TWrhykrHbJQ2Z25fPkqffU6wLP5x1azwKK1xEQoGigRKnH0ey_wdT04_qrqsQWC_FQoEl83ytMTBPMjZL93aqNk4hFF_og2XQF5VsTJLIYF9_TumFOvGdZlFU3JdCiCDJCe9q3jeI8y1eq9CJM4DvALNmTn0okw2uAjhXg7sr6Tyf_pJGGr7RBdoLND4dzD7LSZFTxoiTRGbd9Y7tPt77QYKoBDiiG8AekwC7Yifbl2H2xEvjCLdCLfwzapMSZu8tjVnzyvYsyc1Uf5Ps50zMqlkS7O42hMbtQ9Pi6V_Lx2L2zZMRUKYFogDpbf1o1__HhMqgnKmS8xZ8AhGB3_YR9bYvpx8B-9DqsAQ=w1004-h253-no" alt="Example Screeen 6" />
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
<img src="https://lh3.googleusercontent.com/6YF3yuTJb87bww9eHReuwIpWs8WKSsaFb943mizPcBEGOHLyUB80ZcnlxTcWRluHwt7uf2867hWSAwsYVo3QCFxSbm5IlLXcaRMbYS4-h_rrA-smoV6ChTvRoNiEAOeH1kqpFjjOOiIr1ATVazxeEGAki2nLR9xoDesfv94hHIUc9YPFYCuardZc4e1a7Ajwa6bYA6zeisGHCyXjX5G_nr74xHSACvF0JxNuLShTinw8w2lDt5nn2F3r2-_2zJ6-YCLJ-vBtk-XfT7LuJP6OzepaMQTU8S4Q9Ov--vHtvhEsl6y1_UrFZEy2mcrTSOadYzSIEv2kEH4tZjjXPHZ-oVpYls1lR-szFlFJnuZSPWiE0mNoORB9Fyp3ISjNvJ73VkQbLUDErZzp-E61myn26BpmTPj6k-uT5nfWLiErEieHP87Iz_jDOsoKjWQEuXqdv_i51NbOmKFxDndRGzjkWTB7MvWUFW1NSRVU8g4jIxR3dBA_-3XmlIrJnMrvSicpYRNiW4PxQj8Tt6kBt5-1182lnW-m8RuHc-lOknOD70U-buU4X0bkMokjBvQSCX4TrqJBCH16NHkrMXTcgDGC1p7hriBbfOgWbeFnMUUzLg=w1003-h287-no" alt="Example Screeen 8" />
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.css3.info/preview/rounded-border/">http://www.css3.info/preview/rounded-border/</a></li>
	<li><a href="http://border-radius.com/">http://border-radius.com/</a></li>
	<li><a href="http://www.the-art-of-web.com/css/border-radius/">http://www.the-art-of-web.com/css/border-radius/</a></li>
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h1>Sub menu styling</h1>

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
<img alt="Sub menu 1" src="https://lh3.googleusercontent.com/6hfhN57OwwG1Rx8ex25H6LtvkR1xUpX7QsmlrMdHEvYTLYZdz4mmMnU3OSMie_mZ9LvrzfgEzJmyR_RPUMaYldJji8MrVwdNc56JufccuB6-Xbg5FrFZ9oisap9_fYzLrIP4LvWE2j0NjgnGZpMUaLlqelguZyBHLI9eX1I8bxZQFkqa2PKX8bpRurbH-_tRbxUFO-rpP8B_SAexMaxCeUlHnNZz4XT3DLyFPG37RVjfUAp3WSykclBPLQH4WLRS_I9lbDdFUNDRQJ4y2tXLdR9P5gEUNT4Pk1Ie5ZlylXHX4fEmVxIAXMLMhJdBS9tDdT7gdB1xgqORmKVT6V5UtfUeNjCAH0I-R5X6E1Mz5h0geutpoSfvuFlmsxp0z9y7lW_6a3G3jz4TrkTzpk91pPEf72lxypTyBUmXOfRwH5zBkSJpubKaLQX0Umfy_0YEWTzRS2FBldfiw-zuLwn0m6BMfw1pGfAEtrPwaur--Vr96tVE4-IlNuyPqSxxxlpWSMXa6bCFbgS65QE2VW3bNA02zY9kP6NzSWcwom7Iu9Fi8kLdwwoa2kvPiDkDHVkeINdmUMLQTzn5_1GzmD1XgFeFHOCvh3_gJqdIZJY=w592-h333-no" />
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
<img alt="Sub menu 2" src="https://lh3.googleusercontent.com/qI1xvIolg-FCQezlBo-WX664uSpD2VaDRL6NtghuQM2Wxg1EieRCR3HMCifhyhgmm4Ywl-1px8BWItGYL_qoVa2i1in7Uy_whXhgx05pgugR6Wh-dL6_Mfc-2JM2s7vrCA2GtL0On4MCOSebtuBxsbs23EgB85j6Kri03jI0BYeE3vrnObjS7gzTg7P9beLGWDWSEs3lTvKOeJIE0ewSUlkfUt9h687c43lbsNPPxYT0URkZCqCBenDS0ICxues0irZQE9dlaUbOWr9_Yw3pzM-Ux-WZSGmITxYNdBR9RFc3RL2uuvb-nnZZw7kmVANGC3XiNvpSufMYO-VpI_fbk_pfx2Jrb1ZBQpPma7Rbm-vFlZbW8OMKlOaG_NQUlIBtKfoovnLZZq7m1MRvpA3QC1smoit1-Vitfj95C7yGc6g5CWrt1sI2T16d3Pcc29XUQGQOrNDYn0WbYyJi-GUVjTVMjvkEmRWZ86C_mjUPfD5mR8eRKPWR6IDfAa-BxDNaTSVYa9FITDbQqXJaDql_NIk3eunw9Vy230qPVknRfRrobrN0-efzItix-4iIzqB7O_ugoSrQL7XPuLf2ZIaTkz1hUxZ5Rkln3KpzvoI=w592-h318-no" />
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
<img alt="Sub menu 3" src="https://lh3.googleusercontent.com/-AUC0nn21RvFLQliPCP_ZivWItIAIQoR4nphisvgA86EU5K_FMg-2D3cB8rUBJo69DGk8AFJbVRCuY5v7s7wDc9nK9YSqi8GDeW7LRegzMckqYvEPnFte3yoiLs4wOWknTzr0k7Db7ikJYDcYrVjGxlksVf0YPmA8h5IHtY_1LO4EC7gtgQrhjwh2VIwUzPQM4GVMGM-2gmOiX9gj1IjV_Yz0a23022vvsO76U9z9OTFNv55ENf6QNknow014KfTwwYlHFPIEn-iUbThXGpiKuXQXQspRJFjCQ8YAibThNBeLlnQEorBd18SpvmlzYRilWq64PdSAff_agcsODiFnUwFuLrzWwy-tEiV0LoVLaSTvgJOLXoI6RZcscBKafRMSugoppS49Fbus3egXA7PLC9VO3K0sLJ4OdLqZkDidjbjFZR3HhGbKSORoFlcFlZFK-OY8agh3-phmmTwMpI0j_Y9GzMv6V0Ohd1rLEYa3QJAlqaoULggZOBVJsidmG7XVw9KkyWqWCYaIs09u5oy38zS5g9jEBHYP_yTtGVBPc9CjgTcnMOcSIAQAfT2A5XgCpsaEbYmlIUE4c7m9h652g61fgljvdG0oeLVfZQ=w592-h296-no" />
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
<img alt="Sub menu Final" src="https://lh3.googleusercontent.com/gpoDnZscNtj1mP0ZLtzJmwJv_OHqyzraZkt6gFuOyVqZtCpVrpnC_8nTYeQMwPxoN0FeiRE-HLlXYKz95945JjyI7Lyp2SYHWgcQhl-MA5Kyp1oKjKX3s_Ti2J30Yvgg_a30wEIYMB1jHhQd0jB8J-Ga4Y25piKNJy09XESeE9eWVLRZhX8FG0YfZ570VnWoqTsmWoA50JWWymBK-VVhIiMeo3JFFwK81f-vHlCBO6etoaRZ0K3ZRrYzlWP_CPT9XCJfrFgaj0YgZskd4U51g6VOb0WRrxHOdmsy6yu1Ki1ZMxlyNmD0X1MSaW0k_sIM6qcgkd9ZJbn4q8XiiT03xLopT_KcL6IQn3ZxVG0v2-Mg-XmHvS5FsO1AiM_wN63ymPgY9evaZLzLiMKMUftpM9LbeHG1qPC0ovU_jhs9bCZL7nmuPpeJLnQ0JK-2-77zNAXeHxU_k-lHeQkF4kNshXKR5wKbCYGUruSBsNXwSmREmM-7GNdP_cSc-8086kZryySFIXgoax8gk4GX4DwJNM4Wjc7iX4gAaeglOOasGtTbxq_r7P7nSV6zwAqPYFQ5xANeNDmJRrrHr7JcMFAnY4k0LHhphP9W2R4Waog=w592-h329-no" />
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h1>#header, #footer, #content styling</h1>

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
<img alt="header 1" src="https://lh3.googleusercontent.com/ycRVhzLc95luYa84rElkcjTLF3hk4M1daae50kYbB-W09rUQUoo_V_jb1-NxS4Kh_fo16jw4gvbbHXZdUwGiet7ZSXykZWJUw2SHM_D3b7O-m0LWu78RZLs_yHmE1j9zM3rSXwLcEnTdKSSEV89nFaeyIRPlJ6S7h3U828mZ2tiX-hDASOlecySVM9md7yydmXDgMQ_-ovgw3BMYFF1Ul6B6S1u8mAcFDhJs61QUJrqxk3HYVlHfUOSf3QMCgjj4sX-RKVv-WlEE1JY122hgOLkv1NeQnK2J0XKJMhQH9tKxYfxp7I23y0Own6hSf9RI5-2GfZiqe8WPyXyX60f8bcByUoTcVbA14MrimM-2Od1o5ThskgOCPDyOTvynaoOiP2rlNBHJfFHt3mdr9fpEgeX4AahFUafpACYbqfFUtxcJ5p0u0JwlVwHESsc6S1kYZREuYol0O-plzsCHiSaeaxlKB82JGeCflhVbOVhO1NdEqklWK8i2GGf-TIHo1Wk2UCfAxOrfLXy7lYNpEazG0w2-hop-wu2yPUxP8nam4-pZGwd8QM_DDW9Hi9D9CgY4x5VHtiFVlGW-CUJSHX-UECdoTTadReRANKe5ZGI=w592-h355-no" />
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
<img alt="header 2" src="https://lh3.googleusercontent.com/i10EkfFmD4Ch8Zqf6FXWDlVW7pw1eeMaGXTncVGnz_r2F1WGfAki2i--njq2CNqLCw-d8ZLRj5YQvhVYDiFOqorwRYo173kcGIh7jvoWJPREjrPHzFdlq32ps8qVR9hhS5VPnYUQtVkmPbfOPZhUe-A0KFAQuWz5xRdQ549U9n5-eMkV5rQ0XPB6bXguh97v2WprKEqAy6cWomxcAtz7L9vx9cc9QgfplZUn8VRUqsJxw8GVJRT6bUWqdAIu1AEjUdbYJ0QxVnPxANfWR-7AcPNX5BFvjojydnA0L9M3TdRPIfLOYlfk57sChJso3VPVPhq6jyLRFdignTe215kIFmv8fuWqJlpRl3y6hm6bSBQTl33BlFAPuJmtMGMTEO4JLzWkmfS6PmBzS-kn5qnnTNXA8UwElROxl6dq-GIdK_W0_s6FCgPSGOgYwfAWY-_z8tQmP_9Ks_nVAd4CIshrPGBml9REe8YetMWfrijn4dLTm_eCujvE9ew1cHWtmu3cdPrjCblFw7ePHz7d-6ZDOfBR2SljIMFA9hTUL5n3v0IhWU1xojCE-3sKsVHntaFRMVcd5wKRo0Q1daYDRr203o1F5iwjNqStV82JCjg=w592-h330-no" />
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
<img alt="footer 1" src="https://lh3.googleusercontent.com/C18c71I9GUkdCOEUHCMwVv8bbQ46tgpFscAJjNdpownHyY-rAw_nfs1DgBrwLetCKyhIXHTig0VspgSi7CefBPWhxUkpg5S5lIvHKpEp9A3f5sAbgqlWwVatK10rGrE4RLd9yFo-QN8p6kqnQY3n-kbSZfxoEYMII0hjH8K5tJQw64UyRGI1QmmeJrj2WtvwW7zu-H_EJtmpA0zWQMsfo6mNYhG8WBGo3F-jUFCVoqi54piEYhIS3cI0d-ituoQgC1TEv3iLjWOVhzyp9YfsZFo80-oLOJuVNlbBK264R4fek-j_XVNaNeHhe-Nag7-M9aznSVfZqJYpKrKpjRRS8mlmdnBmxTwcQ6UZ5ygIYc2TPd7lqYzStzbB53fhMC-kPM4p60C8AizwT59kJfWqr26UkCfC2wRFNbmYUvHFVMLR5VjRbisbh_44JA8Od6HVyxz3LsadVW4TI82VeEbfAnW-x7T3-f7rlH1O_lsuMuDQA-5upD_jdJYl1K4JAkmPNz8xS57wwWCBXMBgXXLvP09rY-DHu1QChydAJXHP7uccuSKPEOAzqdj4t34MFPt6ScbLCnsVOAgLKxQ8Gb5z4owxg6ZB8iQdYDBeWPM=w592-h371-no" />
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
<img alt="footer 2" src="https://lh3.googleusercontent.com/SYHL9sv8QvaASFu0Fc2vd22Cu4GZtneuv5UNuKJeRnep8zyLTyyMAATn5WwZs92KDHyxrY-ivvQuz-m6RPMINFr519iY5T7cc6zPUe4ggxpSXJDXPJQAjpg9N5KfDaOpRjxOie232Z6aF8-AGp7FqgLrgBf3P3nIkDAg8poplzPL8t9JYvXvL2bpc456K_HLpIQOd6lffi4MJHTHmQB8qy-h3yObBT1-zKGXcHJRqG0aBI2ud6pnfBK1QEHqkZgCwzSEtze3UD7HseFmj-BJsbfhS7iZnB9AYDsKRCUAv6HrHFYNk0oT4QC4cKaIY3IJelyGHWuKGGqyHjIAjEobGqbb0eNs03DLW_tvoU_K4E4ratt1tCEcTF-wcHqmjkKv2ZcxF3SaX6qAnSnGX-SuWJ1rCSNxgSH8IYhgwZKHOSf4daIM7S2jNXBcZQTpLK_G4eZTzDEcbe9Mp2apbvPo8TIduioXAFSKIpMJatztDtRUggKeIHgVzwU_74AamAECuhtSg2Ejaxz3rQaNj6NxwqCf-8nS_Z6Zu1kA0V_ZLvlOG8hX-eD-n_uqyPp-vCPCUwyAzoabnyGfuG2IFaQLzNSldoLWIkJ8k6tDJ_E=w592-h311-no" />
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
<img alt="footer final" src="https://lh3.googleusercontent.com/QaZ2z4SaixxiFiS0qqcZPsGzE1qnjtBP_L3s874HBUMzr5yMlofYdxf-IkanLQDySA-QlOqUH2Ak8eIAMOL-n_3MWzuf9ffZTK72H6tDUrYhi1T_-WBv4AuGAljiT2z0ViObpY7xu27kfyr9WsR6a72mioFsYAqv0WipLPAneAekR2pO3bZugeXGuwHaeFbeb4islM6tUT31oNAaH23wDQ9lKcwox1Gpb5yBSwW52BTGNCpUsgSa8ghtgo5YEhMXZdfkTCNCVmZqx5yVgfMHjL7Yes-O_bPqNtGhXyOx015UPdcx7Skwed8O86OMSNyDKz0WhtY7h7xOxJHRdWMXIngVa4I-_YU6UQ3EWKGQ9ICDHcxqg8wIIyEuqhqr4oXx_Ny1sLQ3Rf1dzzT7poDV8mtXl4P3XWXC81lCuesqi02wgyF8FmjwJCAOkpeGruZ2ElBz7giYPuozjp_I8sFf12z0FYX_NyAaoyrKPDZnD6bUakORsUueO-7ujQS6MFFdc6W4pksSJp9MLoSQI5adU3svDmSvlGmBQLwFlwTOoh4ebns32_oS1CxR-VZE8eQcR7k0CxzCFnbcL7en89ZPT7vuhBx_8JNUVoZVV30=w1002-h316-no" />
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
<img alt="content 1" src="https://lh3.googleusercontent.com/Kgzm8dNzlBQMtXx-ydLKqRpYoOXgpvZEiAG66zn4RqafD_j0ep_a_IAp8PuT7MGp02XtGC70WvbPUo7meEcRQyW8QbqaJeC-U7b_WK9WiJjXxO3O7OcxK8fasDAHcFteWrGY_S_hA_ekYWQrDDQ0XHJJFn0kvcLqNp7q6rm2-s0cvy6m5mdvTUF44l5rVKt_FJYWRMcjNnOkb8C6GqaZrNHBqqwyxm0aScwtSJBlfxoR4dG6PDnR4T0ZOn9YaEq4KTNCFP12znkAaiWEKPdtUJycZuIl1HomSYmpCejperge2lzzB5b7UOkhhHhtEqDA-ni2WU9NyYWAKQtpNos6G90hrqp7L0acIfWBxJ7S9xrd86k0UMdXwDuNPo6OhsxYdEvE_Bzl7X5zySs9JjXxRqEY586om0YN-sSOiFPkWLwSKCmBo2WM9ek6TLhk8a8YdozisKXmG1_C5IYsBkiRM9173rZkeAfUS_5ZVTiFMkdJ_L8hQykmXFTitdDnQw0MfyMfdVEVP-56b8EM4eeUCQ61QUATOhIDziuE9CqcnrvYdGgLqIaaBMgJbgl2N3fQlTjk_JQbjvTXjQcS_7GgXAFI1LllnmSpYFSZy-Q=w1002-h480-no" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h1>Board styling - List</h1>

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
<img alt="list design 1" src="https://lh3.googleusercontent.com/0fHyBzKyiJE8P4KrBDV2m1Zcjz9hgVGzXoLZ9sGtISXh1C6SWpD3I8TcIO6zY-Z1IxjkUVMkZY-Np43em3Y80raf4zvCLtzHj3SYHuyn6iK2iqNjYeQnfQt5niSr7NvaNUTeBHbedijaTj80625XX8z9TH2EX4yowv33O9Va6VVsY7ZQItwpIXcJnCg-RD6LI1Bo9BKIJn9X8XTtoa74DLerBbdPk0fkTaPzvd9POjwv1A9-bsvzAxOSDS4BcG1rrIjahY3J4ttv35Q3R12uULB6vmjhyQdxTqJrg2WkwBkiKqj_SLuBlIYtZ__sm2xwAxzje-LH3mKyftCqLMgikE0k2Kac9wjN5uVZdpIiP8gJ1dQrZ3gugCg20W2Ip-J3r7Feqn7JZTUbvIu_N5pIx_9piU3OqnpEQ1bjYa8qqdDjncZqyyuEdatw7FdRaubEIkfmFHPJsHJ37ehOq7Uae1b1PKwC-uUAS5BzQD6GJov0a54ono6Iz6bpH4_fy4SkUJQjVhWjAnhRojb0ujeHg1oW18XrFaaRvj4-7ahVnKW0APF-oE_XSiQyzuQLXXB_0OSIjLRGsCK_FkAnll-9FUG9qpYNIWu2s013wQE=w1007-h320-no" />
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
<img alt="list design 2" src="https://lh3.googleusercontent.com/m5vKlaHaB257A70-9PAEG464xCh9geVjGTGkKE-jnIqwxF_vf7-7WD5VYz7NgsH2joyqcEvfI1ab7lXAwfCpgjWpuyQgigwQE4-nt65J98dQ-NEayyQUrljvdO6DmYXA8SduOzHKXKPbvEx_zuEq_py-Bq3GQpI2pq6STIGW8E9M9vrIvXA0R_V3o2TzMG0n8F-zNTo3iCmIcaSbPVBvIylyx_7XkIvWUHaPKff-iD64n-AB8Pn9D4y4m9IFwcNz8ln_dde9yZT4cEVaOpy8sEou8Fy1CL-8HSy_QvLUsAh3XLMQUM6_ar5zfkAp-TPgpYVCR8rDy9SdFjHBFQMDlbFPoitwskw4mRZ7PIItSljgOn9vf1D5yU__sMCvSaj_mYZ873gRxTsiaoHsH05HP0uHD8oPMNq9ElyvKBFFYt7J2ICb0r_rycFqawYLQXMoDgxASURDNC8pleW7Ds4lDa3AosZMoQdZ37Fy5HP4UF5YA1IMvVGHC0C9MoE_wBFLVPvwzTD3MMtl5rmFOZnT-9KsNejGXNZCqDvrwp66Q8Tn4TIka-KPFWdjM8_M7Wylz9WkYBPXfLWCr_uy2RtGDwDiwHI8JKmGnE0Y4BA=w1006-h332-no" />
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
<img alt="list design 3" src="https://lh3.googleusercontent.com/gSSSsrQbIRrKmgP60dCZ5VwNvG4W8gx3LiD47Udvt9Ev8VLOpxG63WpGZbwe-Z_191wIRgaUUwkajK0FylB3DSe9_zNooRc5ExHHClRmLODdEhwpbmDLx1dLEO5KcTdsqb5LAibcDmq5pEso9zOy-nUEsmfktt1ZyoQC_jU-78Iv0omuSOI1dhm-s_VMnzhxx2lLeT5M-oC2PyLX5r8-NZOklSK7nN-fhZdwsSlMWTYy6N4RqR4ZJ-Gc45_1kbw2s1MVuKy-MsSX6xn6qQpk5CGtb8JvrF2pUZVOddfKoWwg2Pu9TH_-7dHgtKlP_dXyk9ilVqimEbFvczGDSx-N_x-isEZDjThJ06lqKTuumXQ6GaY22Mb5B53l0Fix_xDMoOgWnoTHD-PuLZtUXyaSdn2HE-ioajuhcTa6UaaXOno7DRRKegvCCEloWn_k1hxjQiy9dNzbEkIKFgdvaI-XimCBzIldPCTp2kaU8LBDyNggaBxEZEntPy7sym7DowwFvNnHnZOcQWPOrUbIT-wPIzPyZi98DvgPIzFj9w34RSOARnD0iKa5Gh_JR7CQhpBuFDyP_wviimPuNNZ7NyJECKB2VfuC3si2m00QuKs=w1007-h342-no" />
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
<img alt="list design 4" src="https://lh3.googleusercontent.com/h-rN5D9WksTpZYde-7h3mfxi-I6p-JwZH1T5g5UXBAFaJc6mbURGNkwERYIBF9cUaosMYPQDikSSpZTU604VkKZT_xyu_jc-15PezsnA6g_TlZIySaTrf9N0Ss0ZqHaHXPHdxHH6leB_PAPtYw_lv38gbm-ucM6uT7d5CbrAfS7tWjqHkyF7LkgcXMmnghJ_2BgoRIe2i81RGwzHyX1hdTDMzItiQrYAYNfb1raZgbwQ8UoeXhwr7zd5z73ZoIurF9yEu6fbpDjflpD5OgyR0rTK0Xm_o8ccRtp_GlP_DHQTx9YjdkSKJvfh5vORFIUr99yhS1luYb-3qUgvJglLXZJgq6HtmCKYR_j1XzTHsPq9_91aTYjfirFXG7OWF20sXfCpNWcyjmACIP3oMmi_pbApvWm21vSCDvZL6BsgjE2YiMEgcLnNGZV7wWR5m_apdRoPo5Slc1uVCbrChaUHuWJcTjj-DRV0B3eNh97vS_iH4faDxvQNn3iGz1hT9yyE3f0m2fEP7VBxiYqFfyE46XMsA34urbVrlW04Gw4pMWkuZjBuhmK4NLOIjilrtAcwft0osEfoVYoJknLk62_gwSzdU8fPJEk5A-RZh_E=w1008-h358-no" />
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
<img alt="list design 5" src="https://lh3.googleusercontent.com/mC_0qGaHQ8XXQtHJtjAeua1Cy1o3eB9owv0_iDi80phOIXrUfct81LvfGm7wh-VoVIZEWwvUXrkq9Ivg-BOxlTnGtLNpWENmesGv-c2KYNuBbrp0Iwv5J5t6R2pCNVqfx4VMokyDnU5XLeNFujaopy-HnAYgbQIJeYQOtIeXU8JTKuA6cCAmZV-a0BPxuyA39LY7xi7QPgdhCzbUxxXO3RGMkQxzH0cKvIFMi6ptvpPJH_IE7HvLi7mLc4UoonzByL_ghgjNQMrQohAKhV7Aoh8qLI0aqo0m6D75gIErwVgaPB0S0S7i394REL31kgDylo-_XmcOcFGouWv8dsl3WvocZ1JxzRji_RNFhoTIRhwYp3qlzzKVwavc1fFiZ_TKQS8o_hgWiBOalGsEBokgYOrwBiqLT8b2foeIp7aeAi4xLkjPhGltpveyPMOC6hEmfePBkJPaybuoATWVGEmENMwxXU8K28QNHdDuhTDWMoLZ7455EkGtr3XThBnLzXec-hwHaxQ-NHBeNlKxMKFP-BDTkK9eUIdRfT01LFuqo20AgA_MLeHv6X6TXo4LG2DlTp_i67ugwjBw56r_EcVsAP0zabeVjfdjLBd2U2k=w1005-h357-no" />
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
<img alt="list design 6" src="https://lh3.googleusercontent.com/nnKyOau1nLVfV5I2DWDGbRrEpOUuHMqRIKcR7YpvmlEj8yIqd3hBg2u-1PMkn44vt_dMKReh6lDEBBx5JqnP-MMQgxNg82s4WakYToQK6FJaBsl4NN0VKYf8kH5_U42nlz0voXXE3joXHRDOZMJkuTkduYA9UaGTTJySf76rhXzR3eZBcGrp8vYc4_ZbigtZ12VMx0MrNyPhcBPdNKwaQNfsk7MHRhdT37TQZKVosQ5DtxBUcMyNB81rAFYCH4ufmamUDqK61iCBSLXUst4DDGcvLIfON9OyGepRTYpUJf_jCnz5b2Ht6qRl8ina6Dj8Rmw1UK0neVa-mi3EIbSxCW6GMdjdMVUcCyVgyYGFRawMkBlY7xefAY5GSvFJwLRhchGZ9KupGqgyYF12fMcr8M1cNhtBO7tS4tISxdegIFi9q7kzBEvAtIKtmMFl9JRi9JxaMfsBSiEV2FnmQC1Lrrz91bAZ5AtZcILcHGUQl51XKGQABTS_UJvke-3rS5TU8yudCEVMbhZqukdFkFyJLylUBn7olvBGsIWJY8BUunOZn3WlyYi0d69EVU4BtDlJcCMCVzDcVPtaCF-nEhxxFAXHCtDqCneGyBN_Qxk=w1008-h361-no" />
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
<img alt="list design 7" src="https://lh3.googleusercontent.com/-uZqkGsHeDZFNpSoW2Cp7qhn3JvpoojtnjriRk0UOPpguow8paFNRxzJLz78cddtJij-VXP5Al797XAbG-kuiM_PqI3Vp217fas-4d2AOFPhFnqyP_ny70kHR0D6xFE--PeXFC9C9WYwJCoNW24C24TT8ZOWRbXQKHkc16T9p8X0sp0TWA6vBd4El4B3YKPjOY01zgUCBViAAwlmPZ5bL7Df0nb9ItH72oYIpBDTz00kYeLE0N0e2v17c9nJaeJ5KD97tlMQJfWS5UqkyuuGKWZLI405QfVBESVpqtN9kRMUNuNyPHEc1pGYzi_JPBMk_zLq07Xm16DTogTukIc9TiuTw3NT0S3pznxemnJKjvnEG8uBgBwnW0j4WYFf72FLBqRbKYiMWNqnUMxMSKVelvX-1Wl4hqF-kb6AlRH6R4BlxzOzFNcscNEUNvnzi5bMxX7UMovjhxlfvhStD5hQRuWQXVbhDnnTGqlr-LurWKDXMlRqZTRL7An7-etTRyc7WqGnPu_ZkRFgbz1O9B1y42xIffEA9eMufuyJ2E_PP8t_q13UZtHilXEhPXXnjP8YyDnVGCdvq5sRkplVAMQf0YMu3XTP3ngiW1ZyJOk=w1004-h358-no" />
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
<img alt="list design 8" src="https://lh3.googleusercontent.com/emVH-Jm6M686OotxY8E29vDO1VuIvJe3kxsuGf3yGhnfXmgtOVf-BtuPJb7WDzccTbWHHD42y3oldO6YRZpGhl1Yd5PijvR7JUIOWA-75rY7YuwSUKhCOlvarAcDhR2tgGdILsJBQwczSNNVDUSJDySzpcRgHaVdVOTYT8TznU1NAsLmMZi34qf2pCI36MlEFSJsrdQs0n_MZGjJYB31PWbaSXf61ILOnldjMYIJq1JkCNsYKDtA0Fxfe9bA9ctcKpskVxHDS3RuQKY81QkTIM_Fpwrydyts5oB88ubsVwcW5N2WrWgMqC4xpfMKjKdYeELH-lT-dEq_ifT3HG9YAkOZ5fR8Dhf4s043_xiRhh7V4s5FZAM2VjGXCagcGz4tKBwrfA12FkwVmKg4BEaCrCx3SjvnUdYkFttQFWHwiaqxzsDiGPYWiXgbJzm6BCFbn8CcRuuoUnCpy4OXNVbLs69Ryb1sEh0-hFX3er3Ov5QlupLmT-z-U2qXQC6TFy4UKDyR6uT8MZIw3wbuwkbK8iZDX8_U1tbUnQajCv_EZIOnJxveBJghoJV82O7QFU-f4NwSk26LpDvPC5nfu6uzgZoctJg-C_W1049GAbA=w1007-h362-no" />
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
<img alt="list design 9" src="https://lh3.googleusercontent.com/4mPt38wj3S9IiTN2ig2pz4FD-_8dHn46o6ZFDVFw_qMsOSefXhxQh0DbgmzkiPDhd6a0on-G-o6F5BeXWaqxM0nidHQrcXq9CX9eoNwdxTqSkCLdzJfx2p18xqB52tXSdBEsBTMq2wh_WebKruD0MA0CDh9VVCYQnzcqaX4TkwzRjFZscZNlhqzYMOxecDNk1cd0qhy04ec0mJdpaT1v5psH_PdfjD87G9gM5mPQbx9z8ROR3qh4mCQQHDAfVdfkDCVlD5f2AM_8sllfc8FKIeAu9UerhRVxZJKxqPbutK5jFvu0bqu6cB40vmf67pLE6Sqz9L3GHk8k9HytMmJC0dYY7eGuMnJUHUSs9lMEpVyb48QuT3NOHilsyngfcWGAOouihnPoCcgUr5HM8SCKf116Nsqxr826TW-SaAmMuNyMxK0nlVTrMBZswmOyWtaR1cAYsEOk9E5FPBdhNg70kzWWh_jCMZLkpd2Lk_eafm5z34jfN8j77BcBC4WkN4Kkc-HiSWICSa8lkvY3Rx0xvFQ1jgK6OAdNHdFFyryKuT_i56HU7-RJzFTqTJ96jxZYS-Rz4Zg6hu2lQPK6rXMnJM-jNRZgBi0R9jiNhhU=w1008-h357-no" />
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
<img alt="list design 10" src="https://lh3.googleusercontent.com/OWH-7T5NUT9mwFTHHchsjcxSEsa_xqwnPo-AKkbK0lTdDVCC-R8xGf-RgIbIPF4SilTFMUuHl4zhKqDiIiZdmbuVM8O_vn_sWswH1uehJm1cQe1Ro7TVzkgfsVZwvH-FZXpRVNz40xMJ1f2SzAe7hfXTBEyKyZQRCCCZGO6yhT16-mjxlYsF0AupbwpN70b5iVXQ6XChqJd8jE8pD_TECB5GDjNzqZq8pcR6AL1X0v_AlzTUIwKL6vDaVHwSBgC0w4E7BdzIyGc4U1mwi3riDiacPe40hXDIQXWMDlH0oeX3xComvCVXghHRf6JmVGNPvuAou9SLDO2crGTagQd_Oz9bB5E5A4DpmLAtIt8mrV580N1udfGtVrETu1sPVctZ68aRUgykmjmX_jsHkeVaTRDOLCpktfFru4hpefsZVrW_Z-ApStJSblFrV9NuNpGuvQ_-rlrTtkO5SfcvnEXT-ZJSuYuF2qydyLn-0tu8QsphK9clMuUhLP4WcVIJTqUT-Igrp2q2pwi14NlF0mfKyatcZp9u85oSkXOfxgiilMqRC-Iw_SNBab3ydnOVt8LNa7KpBmH6WDzrhLU0aHpD-jBdFZcYdm_aG9ZYza8=w1006-h355-no" />
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
<img alt="list design 11" src="https://lh3.googleusercontent.com/PGwkZsNVoA3tQaiYH-mC_NPBcEWdKffqaQJeIKkkC4L08nvFZ7g4vHtqY4kVNCHpd23CabTG3h_qZ1GgJCo4tqdezlDO0qKVv3XQZmQMzJZ_yuxVf40-W8TvG7TplcOCz2MwwG6nlEYxCEkjZtKmYjcesWSTEbhnLvBmDcSthqhzZEPx0pzAKY0tWVrld5tubzT7YDhLjsQZHjo8XibHYpnwHZJ7oc2-cyFMKz3U0_jssJ35tB-OIofxdPAm3Hhpe-rLmV_-DaCtjNC8ryvXw3P4KVj0GfLz7mNwPTFWFGW9o8x1im2Kk4pyOnoKlK-eE2Ih-h1dpCR_P2CdLKAxPQsK9O3kULeSMg2NOXbmV3lSIRvNnDeJj_sdrExfT6tx0xPpTVKpqjxVH_jf2m7ier71lxCdEyhpRvYXtLcpfsY0dn4i-8M4dJWjkPtgLdf6DE3gt1_XuyKXjvSuJw3yU5VupVpgQiPqx-zA_B0XszQs4bT1VbrLkAPix2UPe_bY-tAWHQiKL0bbvM36t7-iUM6A8qeRMG4xd1DiUQVrYdbfKaZq8sURywiBnMB7_hIKGW7aOwaQqjGIelQ0s9nR5xUlUItDg5lC0f-FFyU=w1012-h360-no" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://phrogz.net/css/vertical-align/index.html">http://phrogz.net/css/vertical-align/index.html</a></li>
  <li><a href="http://www.homejjang.com/09/border_collapse.php">http://www.homejjang.com/09/border_collapse.php</a></li>
  <li><a href="http://www.w3schools.com/cssref/pr_tab_border-collapse.asp">http://www.w3schools.com/cssref/pr_tab_border-collapse.asp</a></li>
</ul>

<h1>Board styling - Detailed view</h1>

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
<img alt="bbs-view-01" src="https://lh3.googleusercontent.com/ZrqF84nRD9OjQEWyrf25rh6gw1g4IdAzJ0wr9tQEEu34VVjBL89FoiV2ZtvC2w608UrbMiaqcJABkhV1QojQtJlgfL5KJeHgogLfWNmmeAxIfG52LawrfTQt3aAD_dZceo1tho2ICfvFwh_HvD30crX-BAhky0V29F1iTf7CAF7pP1k7bHoGL865P9uoMYCv-q8FxwRc3L6DVqdBuJ8hUukQ427YWe5viY2qa0E66SrMdIYFkjSl3IQh8sGti7BNnqXO5xf2P_oTKi6iZlsRErYKINp2SW7WaJlpRzfw4TspalIicsdp1cZlvCQXbIs41NTRxyEt04IlipUmzFUY3h7uVFEOO4lfCPwhBCapA72KE0b4UZLN7BAKADqKZxSV2crtrBQDW6ydOMhauOb4M2Gr9UxX-9zYFaSPevrGYtd5KfEbah90r0nUIlcZLo2ojGDD02QxGIhlYIaciukm1cPYWL4ZZQZFpZJIWpI18HZ-ohjFaRt0pCoqAXpBcZko0pN77nFtPxS5pQrDPNufo7neezeAvism62dUOCapXtri0bK8YECGrhNbFMirQPM0pLt6F643QwNWXSDsos888yZY6wfSLZRosW663DY=w614-h760-no" style="border: 1px solid grey;"/>
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
<img alt="Comment modify link" src="https://lh3.googleusercontent.com/O8HB0Ud85bOmvLpPD0RgkKvR7zueSjxdq4VhLo774lnWdp611RgLyZMoNaGwdTCrDpgftRDJnN5ucJAKkpfPzJd8yUyUWVHVtFQVyI8CrwrNY2EHF8dHckVrMYatUNiMi4xSyolnKnODRbkfZYz0zckw0fLQzELW2vCJVj6GMbHbTDTFDE4_70j7GdbD_HgUtR8fIS0UVzNr25sLtF4oLLrfL0iVTbc7w9n9bC-yreYI7582f_0FxNM81N7b2e6vAdFsFBQXgw_ui6YWaRZ2oQ8LhcfgGcG_ziyScwgb1JuTNjBzw3Bq1g8zVMuq9gNtTEV40DSRgrJv-AQhR0Y2uc5sixCBuvUnt2paxg-ALe1xTPEPhgL7wWvJ2LAxayfmnM5eHM0rk-1pCMumj05o8gmFoYM24nTB1bj_QP6uDWVSGVgIRqgvZlIZQImIThlUpF-xmedTTGra4mRE6cEpp8Zq18Eycleynsux5LH25bscJj6gbH0Rqmmv1z6oFAxd2MI0jzV-XOB23VLWbsO8t-pSJgV7qCiRCWbw5cvwhC4JtgqmQMwe68qgi5wNh65nkC-QljJA2N2W5XLboZuLgbSHWwiIc4seYF-1BZU=w436-h71-no" style="border: 1px solid grey;"/>
</p>

<p>
<img alt="Comment modify link click" src="https://lh3.googleusercontent.com/bWanhB4w0NWVNYY0upxLO-xIJqelszVJgeY1Ofuvs18rzUJahSv1uGNEsGD3A1fOHkISMJbeFJ5yZ6aLSt3a8YgP4D22f-SK4gE9BFiQP3uuccogRy_1dYo-6slrlirHnTCQKKRDFOtYNMabZ8H_eZS9IYhHjG_g6V8dmg6cV8JqvipIDn8N-_AtKHaO-nwg4obIpGDDNXOdYzOAtNTH-bNv4vb7DN6_aEKpE2EEKg-3SLFGWRgWM3OkkKu-pU9VWWk1cCCw1DS0UCBlX7zN5-nhs4AGIyaobHo1BksE2zvjVhR_nHP50zJs5a8ByDdloZwRiVryfh8lHvCCK4thP2aZDJR2bTcbgxVz-9v0RHTQMRZHChrJLGtCihGV-VXTeu2PjOj6ouJUHqz1TG2jPftSar-su28n12fgt_28NIByfij7y6_j4CbOxmLst1VfZYxtySaoOHDUvt2Q9p_Cfbvz70eE7p_woB5E6qNMtpAu5L9ZDOVILoIyhbSC-rBw7O1TMgv3XuMPjruk-U3u3FVarZ_Xuz46DoX7T4DC9fiSa6L_RS1nAQsQOf3Bj2fagkcMWeUHTrzJKxKalSCYAu0YaoKimEQNV0EY_2M=w447-h173-no" style="border: 1px solid grey;"/>
</p>

<p>
Modify and Cancel links work the same way. If you click these links when the modify form is visible, the modify form disappears. If you click the same link when the modification form is not visible, the modification form appears. The p element works the opposite. This feature is called a toggle.
</p>

<h3>Styling Date, Writer, Hit</h3>

<p>
[Before]
<img alt="creation date writer read styling before" src="https://lh3.googleusercontent.com/S742yrg7zYIZ66JMmPezC6fyqtqVcqQtRHel_1Rof3C7V0r74g6GZIbuG1M0BAKlH9b1kCx1638EIHrueCxxxWQaLpEQSPySND0N2RQz9WKrAsiFSxCMiN4OKpaIzgMwHbxwvlPE0tWTzzgzFxbQwDmmbLXKcg14MgF36n7cymGFaCnrRppBWUqLu3zHEQs2hOEZ9tShN8LPmRT0-jaWqGX8NTzzYotB41AdBDWbNu8DYGw6m8X40KbD_siCJrrAaZMAmDaORX-2A2mYFrm8f7Rw51PM5PngLUYt_RQzbnE0v6GrddBmnIuuHKcYb_GYQT1POeUYkB8LSY1bTbV6nIUTtzariL-rCXmYyc6SyuP1vLXV91AOpcXkh94XtCJVMN-I5Cw0EXYK9RZMWJRNIHLts4P7L-D6P-jSa_smVqrKR7xF80KUydjBinq3dkwrL8HdvwWFisFiuhNtAJlhu_GwSKyD2GcsQDneyAb5DCOdp4PumZHn3byoPoNVeL1pNZGpVZy693NzeU8orAetI2rMjfYjUhG34joYBhbjoBHQGIzbJcAiYWpToUoRUIBrG05ltDb24zJVYxWeqwH6HTjWh4j1Lvbjf0vZaUA=w605-h129-no" style="border: 1px solid grey;"/>
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
<img alt="creation date writer read styling after" src="https://lh3.googleusercontent.com/aLshBZgscP0W9wN_ENorwodEyu6W57U2M9SfF0xRiDl28Krb9dNtDFmYJIwxoftw8htS90bBDIpd0fMy5avUgfoPQeVtRhQ8QzdIFcHk-D_32MKmdtOmvUD3EaHJvyPWsMVUYJeHJlw_WXNq3V-qMvN6o0H52ytjJ0YEw5lLs-3zcPACTvC7Z79Q9wp4mdkIoeu5X7NWtTvy-XtQUNLGqtLZDHYwnXHAvxgmpISFkvMBmgZ5kn2U8x6j6t9iJx0TNp8N2paez78lNXirLcRMLSPWO8QRkSWiaWdqtzxjcthaiHdUwnpc8DkJsaw9-HLAxVAlXFxqQSSfkOh649XhwctzDwbb_sq4rLL9N_pqK4U2xJw8aOnFRv_PP6dvI_YrxGij-MCvi_5a3nMpGCzNIUm9yvZ0zCiw3teWu-lC9HWqBCqcv97kLyhmzTiowITUAaZ90mop9xx6aWhiMX578uKjNsVlT5GJXV4ut46Ycm33AUA5nNN5bywoCQDPb5YC7ZgOF_h1vOSLjTSf9vnysQnNARiGO3gLbIfXdo54Q4Cy885G3qCgD11MQGXO5uEfiMyNkp9RL8Im8hMz0O3-2yHlVJOkGniSSAiAfL0=w612-h126-no" style="border: 1px solid grey;" />
</p>

<h3>Styling #article-content and #attach-file</h3>

<p>
[Before]
<img alt="article content and attach file before" src="https://lh3.googleusercontent.com/9r4yoEByNnKwVtorid2NcUj19pDI0dHrVk7wphku1HjNiVKmb4FdWS5db9ChJhyLVDxNGWkq33vvINskja5-kQxcfsiNROx2wbFxPjSz4NG2Z2Y3XiFOk5WaV3LOZyYcX8zAr4tDO1-MvyJZ5BqhdAwZVD3CWrYoSu-ipbmUF66qb2SHPptCCa7LUXw6tgHvClgEUd6zSsBP_wmKsTjeFmAV41sEnT3hJ5Ee7fY3Ky7P_ybBBAmyJY0K6IMdS20n7tmy4vmBzvtuNLPLo-yh-E0857fTd8sVJc_uTxVfCm7ALlRAsqZdLJLayXVgAOrGShaswirDYaKUjtQeVERgN51SU9wI4ftAbzGMs31ZSD03Q6N-ToPCyy6k2NO45t1XynZYTXIm2QGGQhE4e4tPmdOk1MUDdVpJpSICvBsoR0uQn5W2emQzlRx_jVZEVgxGHaocrxwvdK_itDZ6jHIdw69xwyiP8Oa6QD5VlyTTuc0whl7yzYCZhRocY5RWC6jPKWk_MDyRXe_tK6-YoZDCbbs-zGocMgSWx1Si7JM5NujZ_q5SJnYoQtNmtskvP8KqT0rKigQ11d-OWcswFOj9ffeRVPNTGoI6JWNKlBw=w607-h124-no" style="border: 1px solid grey;" />
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

<img alt="article content attach file after" src="https://lh3.googleusercontent.com/zH6PYgy-DaM6LSYERcqFBc_7eUjfuzjEU6epCClgIk6ys6ptpdXVQxxI4sj059BnHmDOCmCweePrHihaDxYcPDivCN8OZcod37i5YINc-KaPStr7_yaoKuGW4Nuramf2unMsMHORMPyNqNddwiNfoaDoH4CZb_2kuV88euLr9irmYuVENYzlfClP8auXjuVMdUS1vrs7xYohBb99tNCaiFvIcOUFHW0qe96kMJhtxKc3aJVxm6gA29wLTm_LE6A20FgxBpInqEko2NPujGcZd_YNOHKmOkAVQ5HLRq87HIpRsQL4aBFcW-7pEXEmiJgoGyQmYD5iTIrun9V15VPWZ7E1SxZ-EiTuFGFFDsdePE8saw5uPpsFo5dOsfbjXMvOiRMDNQMYoujeRy9v-r8iC75QhX_nH5QzlQSlKNAhczoL5KvGUa7tAy8gE9TOzKxdE3PD4KJBtE3eOwPiQ0DAgdIOqrDCTiGVqCQDockST8nzCF7qryIqkT0GmCQvQIS6stjb1UFomhs3FbY1Y7JigZ9ekUMDnReXGHi0c-1mtQHR0L30OvBdMK-b91LLcwSDbQAwvLVqIGr3qJF1QvV7BA3vhpZCx-nmhVKE5Es=w607-h115-no" style="border: 1px solid grey;"/>
</p>

<h3>Styling Comment writer, Comment creation date, Modify and Del links, Comment body</h3>

<p>
[Before]<br />
<img alt="writer creation date modify del links comment body styling before" src="https://lh3.googleusercontent.com/O8HB0Ud85bOmvLpPD0RgkKvR7zueSjxdq4VhLo774lnWdp611RgLyZMoNaGwdTCrDpgftRDJnN5ucJAKkpfPzJd8yUyUWVHVtFQVyI8CrwrNY2EHF8dHckVrMYatUNiMi4xSyolnKnODRbkfZYz0zckw0fLQzELW2vCJVj6GMbHbTDTFDE4_70j7GdbD_HgUtR8fIS0UVzNr25sLtF4oLLrfL0iVTbc7w9n9bC-yreYI7582f_0FxNM81N7b2e6vAdFsFBQXgw_ui6YWaRZ2oQ8LhcfgGcG_ziyScwgb1JuTNjBzw3Bq1g8zVMuq9gNtTEV40DSRgrJv-AQhR0Y2uc5sixCBuvUnt2paxg-ALe1xTPEPhgL7wWvJ2LAxayfmnM5eHM0rk-1pCMumj05o8gmFoYM24nTB1bj_QP6uDWVSGVgIRqgvZlIZQImIThlUpF-xmedTTGra4mRE6cEpp8Zq18Eycleynsux5LH25bscJj6gbH0Rqmmv1z6oFAxd2MI0jzV-XOB23VLWbsO8t-pSJgV7qCiRCWbw5cvwhC4JtgqmQMwe68qgi5wNh65nkC-QljJA2N2W5XLboZuLgbSHWwiIc4seYF-1BZU=w436-h71-no" style="border: 1px solid grey;"/>
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
<img alt="comment creation writer hit styling after" src="https://lh3.googleusercontent.com/AkBwuD5uEfriCuz2Q7gF7TZX352T5i9rt9ojODX4Qs8I2AsXNp6E7ENIKI3VP0msxHZz-yl1IIdO7LcNFDem3zOx-nn8SRogUCCrJEyMhT0rhrww-BmE2VzWtkBXaUUGQtdvGXSvx7YEjsT0rME-P0X1MuqMPqXjB6Kp3kLrxhlln04AR71_gU9lAr_2zV_zgznjALNowBu7gNoxGhjcrnnadQxJYvPcoWdjY2x9JUmMFgIzjrHriUFIp2YQLe6YeSlogQpQH8Yzg936JeH3TwH0BnxpG7GA2jWZ5vK94_d5NuzQjwBGDokzW74reFUYG4symq1KW0M8BaJyyfoluz5nX_JVB8b1vH7xZAi_rNwPAEm1E3kfwGrFLgVSR5-DcrNAmw_eqVntVWGmu2KsuW49ZIX6QIvXoMHI1FkVAXMTONDKFChjYVxCB63ODv4gwusPRNsDCAVFsnkh7fNk0Rft_p0viV_bkx2Glxt1_--9AhuxC1ZLWtusIfLq6QOPzV_At_MnyCrilv7CV183aYhEqdO9-KQDczIZymaRz14HLkOFcc7-tw9JPCf64PUj2YwNLI5mwRMbmOkjiMcUrTUrrN8tSu74qWQeukc=w598-h61-no" style="border: 2px solid grey" />
</p>

<h3>Styling Comment modify form</h3>

<p>
[Before]<br />
<img alt="Comment modify link click" src="https://lh3.googleusercontent.com/bWanhB4w0NWVNYY0upxLO-xIJqelszVJgeY1Ofuvs18rzUJahSv1uGNEsGD3A1fOHkISMJbeFJ5yZ6aLSt3a8YgP4D22f-SK4gE9BFiQP3uuccogRy_1dYo-6slrlirHnTCQKKRDFOtYNMabZ8H_eZS9IYhHjG_g6V8dmg6cV8JqvipIDn8N-_AtKHaO-nwg4obIpGDDNXOdYzOAtNTH-bNv4vb7DN6_aEKpE2EEKg-3SLFGWRgWM3OkkKu-pU9VWWk1cCCw1DS0UCBlX7zN5-nhs4AGIyaobHo1BksE2zvjVhR_nHP50zJs5a8ByDdloZwRiVryfh8lHvCCK4thP2aZDJR2bTcbgxVz-9v0RHTQMRZHChrJLGtCihGV-VXTeu2PjOj6ouJUHqz1TG2jPftSar-su28n12fgt_28NIByfij7y6_j4CbOxmLst1VfZYxtySaoOHDUvt2Q9p_Cfbvz70eE7p_woB5E6qNMtpAu5L9ZDOVILoIyhbSC-rBw7O1TMgv3XuMPjruk-U3u3FVarZ_Xuz46DoX7T4DC9fiSa6L_RS1nAQsQOf3Bj2fagkcMWeUHTrzJKxKalSCYAu0YaoKimEQNV0EY_2M=w447-h173-no" style="border: 1px solid grey;"/>
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
<img alt="comment modify form after" src="https://lh3.googleusercontent.com/ydjO6o-BSWtpC89SqsoHrSrfikutKFecxO0X-kJ0ThHU1FkVnwaPwKRhHKhaffL_Q-rFFixS3VJCJ7KxjlrmnM3INofuIo2Gs717GwYb7mTxA37oqTgqfVA4pZG2X0nIF5_A2SwIrKxyiUxi_TPL5fSeD2sOwG2_u4f4qSp7-HfWbtdhqObzgHnB_plkQ-R8CLdPvJwv64cussfo58OsfZgD3RXgqJKt9oHtyJO8SlV83K6VSe1aVfJEnzhVr23ieG8Wo8e8VJicRctDq8cU3csPStiONSpMg5oG5WSPdE9aPnt0jWLATplDiJfMLmfVkLrL39wwoidrBQ3CfHmMrZ46F3Mid-NjuB8OhzB1GFAbBMCsXDFxsRKOBrJTy9acDCjCFG9-9yPdscesEopy_sQBfhkPX1K6skFKOT85YEb4pfq4hRbJHoqTD8kkvSYax1vN-7U23SDl9TtVicNUMqjvinvQiSVJzMY5uqLWOvTWCtV75_AIEu_jP4trNAKceh6yUX91aYBPuvJhD8XjaSbf7oc-6pUdFaeGw-idqmPmcrhPyknbI3x8jYKbQGyFs8SdlstrFlT5XTPEsOViqKaPMRK0pm580LQfYvw=w566-h150-no" style="border: 1px solid grey;" />
</p>

<h3>Styling New comment form</h3>

<p>
[Before]<br />
<img alt="New Comment form before" src="https://lh3.googleusercontent.com/0YEEM85H9EK757mqWKslmBozaY3I1wahQn-Sf5_wTXWA1uonmr7kKLwQ_5-BLzEVWlyomCa9MVl0z2Bkx_oir6WgrLMZTmFlD_LCbtVKco8VF2aEg1-qUE2u3ZbA6-FWTqJ3r2tPPduyoYgWI1KWaEqXCHAxtpPQcEXQkH617dYnu03NbJfEwpRRw7qjMJGQOPsV__ac39CjmAo8vNPwBy-t22_gkoHkJLVWHU5E1dYRUQMAYcMJUmXx3iE-HgvTHNeXsNBbaTdIXB1pg-yyZdqteqREUN-O_IZg_o0XSCA34PKPRpQ28lKUWEt5ywZdcNX2QQcIZVCxlkv42tGop7HALwBd0ymotbE2utivw7YPPwZMyTtjRgAucZuvxao6T2t8ydO3mHg6TBGumnh1cwcEgaaMbEM9YQKwm7aVCiobpiZcV2pD4Mv1G35Theokbm3eWcJc_w13pKbG58sjAQq0or2DPOWJO-RL3VwE03UXFc0JFjk-tYLP67CGF1e2sTp9kHcCfOtAsooE9oXavz1YYxWxaslIO-KslNQo_xgYKG9IB_YBi_OXQRBQUrPtl00ktmwv0n90JY6rzrfBD1NKb1MhUjEGT427K9U=w605-h155-no" style="border: 1px solid grey;" />
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
<img alt="New Comment form after" src="https://lh3.googleusercontent.com/5dcSs5QvA9MewmsiVUHZRStpvcjA98IqVu3MB_8qQWdu2Ube3gxHq1nO6zCcgwlTbyTGe1D0R-UAflO1FgebkHXm4lYQA4-yzbBg7rCGcY2tAG7aWB4ZfXtY2mtMPbk5qrrOK6OPTSKKMmBTtgTYsI_o87iQgP5_wd-WlVzF0a1i6tyUJ7f7SpAUXHTZWmIkMI7s_REd614lL5KUeNaxmnoWEBf2MNA1VWlmlhFnggixZmJAUP2oR8Yl0V1NdKfsJrsw-bukzgArPfZ3BeyEbVbMs1FLAEBcMOZXCxaT5KzDk65reA7cwp1q9giLK5qUr0gfknZGVTFyhckzl2SCoBbPjzbEDMbceYbCWcffJeTOl4GZRljc8w9F-1tnW5_REDQKqtvzdf2M1vnkGM3hq4eje6_VeWICcMS0bzggbRqFG4ad_h1YxLSkcymTAIMRIdOjadr9G5boyTFGF3i3dsszlbzYsqhyYWHqFUoWoXtXh_6Ags7tgxlPKwuTTxJOsgTl1-QwaEzpin0uo8PMd85K6l5_Z4wC_69P0hVrIJdL9dcqAUiPO1g0pniFoFidEawmEg3klX45dko5kThTmZE833Np3EU8oMV2tDs=w601-h168-no" style="border: 1px solid grey;" />
</p>

<h3>Styling Next Article and Prev Article</h3>

<p>
[Before]<br />
<img alt="Next and Prev article before" src="https://lh3.googleusercontent.com/lKPRzdqrJnUBuNKrZ0yBuFpVpJ5vYnReUB6aTACILtQ8fUjhZ0gZQs9FSOLSfMtRIQELK-Nzcjop0kT9dVajTuIREzMllhFsEyGnG77rZZLu-X9RJx7vGV7ZqL_LXd-ShXtuurFFntTO56CMzNHIA7h1KBlrG2dE4TluYmopiCPzpH7dGRZHuAmaka1vc4myglyqCAanWXX09ybPL6eoCEqnOqekqzWOdC1YYEKIz9h84LArpDIbxJnZiWtwNIMnGeCKJBNfMpv7PFdbGWv0ALKLFTwzk_hLJ9LYw-9n0YKePLGuG6Y_Dap4Puq3BUCRWXMqOHS9gYyrwDZ-ILspzxh7JeQQmQegk3LiXU7Gfsk-Z3IRD49QaCfnEDp5lV8gtoIm1Wggfywekjh2CUSIJiD6Jy1eqb65t6yXbJc0q7nh3HL8cMpeDjgv5CLP8nae4XVrDbH0L4Pf1tNZOxCowsMQo2_YSjGxRF8J568k-VNEJOHAu4GtHzbmjG4nu-UmStRvhjUXJPW8C0eDexNpRlMUruAvkZUo4OsEYfV9LBSIPf4L_2MCkAIopF_EczoF7IjTKMTRgBia4Af3Z56KEcXGMV0cVEyoerD6jmM=w594-h70-no" style="border: 1px solid grey;" />
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
<img alt="Next and Prev Article after" src="https://lh3.googleusercontent.com/O4SBv3X6q4rDm0OITHIKunz6UHIfzqA3YA0wSBvB1-mrN28To1-jqggl0Q9zijyY5LaU0NTvpSYxyI1GitkZiSxFh9bnY93ul-mKevVDu7VG65RzcxWjmOouKKIB668HkQkSNzCHzseD3w4JtHfLcdNu0_Wxdh2mPjwIL3g3HsEpnpjF5-qldxIGeshsHOK50odx3ZBG_0jP-OwP4F3vE9xA8PWrge7QHZ_ofScyJoCp_gwI9sn8qNRBfppT1wtOl1DS8mkr-OO3ym9cYtlsaim4yeMnmKzRomMesXKe4yO3HBBAim5Orli5Q9pRjcZR-Vuj4_5mfkwXhxMNvQ8wARXbdFTCX8lfaTl7Hj5UZld4WMCwMQ9UxT5FHt0-mEmfkODYfmO20pvqbrGD3dmCDTum-mA3p3At_doXG1IbdmoVPWit-g_VH_TD4OMKl8CL3IhAjq91S1SZHCAz4jwbAhEWYRE2VqTzxeiLy9tQnpj8CZkn67I_atjBJtxZeGoGUDGrWi_8AFKK7irj8JE9Ar0-KrMc_EGVBbOMP6c-o0nbw6YiLnGs8s5CwMpD-YFI3xhvsluGG7jr3eiAlEL-Mub2WGV-lqc5fWzFoWQ=w601-h72-no" style="border: 1px solid grey;" />
</p>

<h3>Positioning Modify, Del, Next Article, Prev Article, List, New Butons</h3>

<p>
[Before]<br />
<img alt="Buttons positioning before" src="https://lh3.googleusercontent.com/Y0Del6TIF3mucBopWPuEeA3qGwXy59mxVflX35wvGT9JLtCn8cbMpeOhuvWXmxyRaPm5ecTSq5Oi3jKFUy3y_TnsuEj-fheM_J2afVG1rPKhC9kl60YAoi3kGGouXtfXwutXxhr_Zp0G_p2yAmdElOMNrv-44cYp-nxOthAfG2P7FM_oZ0zgz0vPS1sOdWBP5UF5a-HDeUzHZers4MRJgJVzGTIm-fKmp65hs841sDzOVIVtSU8M1SjKOp91LRRVEnAv9ZSOkFQJgDkR1vMiDrU81qq7bcRAzFJsVIijT3qK0-1d0OGgK0Y6n8nVTrrQED3Tt4C-5cqHjbA-a8aIhmeh2FODibeKYFSQxhuL6Mzigtk8fqZdjYoq_sexbqCWU6nVxmqloAqa2-XZhaFVLa4kEROP0jABrap6u4OhFFMvLcIPT4epRw86fvGgmRtGe62zAbj48AjfVmERY-0BCCQZ0WyTo-qUGFM6-dawyzEScSNng_n-afj6WWxW0zOxwkUVAyau-kNY1r0ZPlzxRqJKNwEGhJ190KR_Wd8zSdc6eQUyA_Cvk8FUGsHSa_LZffjc6W-qKSr7CkQR40nHfyUqXmRvNuU7yXiTjWM=w339-h66-no" style="border: 1px solid grey;" />
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
<img alt="Buttons positioning after" src="https://lh3.googleusercontent.com/j_2vLoyk4qptzexfZsUxrDPzVNj9uotdh35pk54PmN8td91aiYv1tHQaYtukoAgM3QYCxt698WrCEtiv3eW7NWwvOgOViOgWF6vAooIHXcssYN6QN-Cx9VgrbdTKE3sUgBq3wuAVZ24y_4g_GjgZuZgOEtlUxASQDLsbZmjEvZgelOBoiPbIOEBc_KrQZE3DVOFoGZcIQT-f_9ivwYgouexJJvd3e5Ocf9MGj257rvmlSqIJxIYJ8KTN4Zl8vnoU8r1t8XJHn54B-D1v_fAFusz5pKoQKWrhVZ-yKzntfR3yVDlkWP8WH7-ORLcWLFbixJzMCKlXfajopGHlckRgY8erOuZbI1HYIhmNdmO76dH3MJG3QdDjKLdir0aBB22pDN6zJOK2KnolczcWFOai4OrIbOnCzNLfj95E4lj8VdivzyfH6tobQg6zLAEOivsTkf1IqKHN4xWL1VN8J8dmygGVpWA2cPbMOeDSpdWf2fO8e3HqPTCvOs_ZutLR6OKltrYrdNFp_EKTHGYgY9-frRuA9af5P4L7FhRE1HIPydrlRy-1r9DaUuYQOJOQlS764oxcgS4it1BiXnTNBhMsM_WkAsISmSPsSs5IrzU=w600-h38-no" style="border: 1px solid grey;" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://www.alistapart.com/articles/holygrail/">http://www.alistapart.com/articles/holygrail/</a></li>
</ul>

<h1>Board styling - New Writing and Sign up form</h1>

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
<img alt="New Article page after" src="https://lh3.googleusercontent.com/DyYL6_N5LWKydCt9n3aDmYoTRSQNM0xhIDo68smBLZhlW4BARHhIS9jxF-dVz__5jjgYuSsDmlvyy4Hgkm05HRKEuiUZSui55Q0Hi7BgLmBiTFKsAVIxg9wbCHQL1weSmixkXMBz_SCzX9nR1e5Tcpu8dxZdZCMYXe4eXb-ByLqpLlfLcUKYzBrGJFaRBStNQSzza8NU0HoQIkTXaodHKuRUcLg3aGVtNtpewGTIPd8L3ZrPCIR413UbyywmBqWT9WCaj4bqCtyhwOT4ZS5uT6koh73kTUNFVd_mgUau3RmFBTbbd7gUf7s25PD0cyTqjtTCQBK6QdZTIXbC4j-YasTDlawaoNENlRJHQVzPr1MpnKanfr2V1yp7z8PpB0_SXD7zTWPa4R_DwCmUU8YKgtyTEhWtzc9N5JeQyuRNYPdWA39fVAoPaMEKtAGDj48ToutAZVi_BBmhVF7otV0nuOOzXI-BLJlP9Q80uDAnbULO_DFToMjTExRqdojZ-gXWyrRYiHrnNiHF9Sq2XYH8Z9yJxM1N9clh1N-9EGf8KqMGWEkM59bTwbvvpxYbP9L0LqhL1hCJBixHc0-WbaowmtCSSeVH1zLZJpqNIKo=w607-h445-no" style="border: 1px solid grey;"/>
</p>

<h4>Styling #extra</h4>

<p>
Save the following images in images folder.
</p>

<ol>
	<li><img src="https://lh3.googleusercontent.com/tCf0XFhPUg3bOiSEPEOkn_isc2zkmEUT2YKvtphHSMnn4Rp0o_t5BcHQBI1tI9dNnBBUrxOY43kBsEEohN-WTLwvo-g2qQPRb_H28L5zRc1dmG0fLh6OTlYAyuqX1Z7DQKIyDgIpZdN1MtPAbdbbRn72b2M3P7pwaN9lnTco3q5vPevE-dr9ITTc5rNDPdveMfrIzjkgsoJ0QhlhclrbWkNcIVWsRx98bL-ViwiPTFBI-E2SW1CMAN9Du1zudrZ-EZcm-jfa4NzCofG8l0V6Co1eINB6oESxAGhNkailSJ8dXAOTjFPb2zk0Jlzcm_0Sk7XMtP9JZ7k6w7tf6ixooUE2Fx9YcjvcMvkW0XNEYe5EyWrxwE-wgXt4ypwcITqcK7SDT9r_v1-9z5vfbyskRPjuHi_UEU3eP8QKh-o6nZwobEpsZ9Tgqqm40ReCVcwcxSY5TG7GeI6BGwarysLm_2v-tCkhQg1LiHxQn8xw01kP7TzlJ-pM1ft6fGXgNXcERcYY_ykwxZ27hlDIDTRne9smC0LQAh7INEqsWtDleLmlHje1kdVkK_5YDQ41pbczJtcVzVVFy9_Oemm3GtwCGjf6k8RMY5dJNTqn4M8Uaw=w773-h481-no" alt="youtube" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="https://lh3.googleusercontent.com/PCakyWDCScKyfLZiNyjp7Jx3uEZw1Ad0doucnbvByaw6Y6OTg8pEzLggA2iQIty3MTsIsGeR1KsgxhDzRpx9jnv6gzPbkECAvo8jNiT3ZGPWQP3rL2emuvVG1UF2-LfqOC74LQjZ6d7Q-Ol08hgB9qBJaselBAbhXE-X64x_g8sambVx0aGBZQXlcj8x6U2NQ8_sto1SWGzG8tcN6qai7Z74yPyU2OYziOzsUSwgfzgnWcsl4dVw1rWPY2SdLl6H20N_Jq-yPOqK8SyjKM7z0G623ryvmqXmZV3HbF1nsviXroQCfNfWpTffMCuMvngap_0n35tBrrwM7_SRrzt6CspkCU5LUppKfs3nyf2ZIQHY3RTtluMWDGK8FlRIWIS7mWqoNlDWtWAxHPbS2xx3Ey6q5XQkRezJwiWLNVlf5Njqc3_WBRIl9qPAiI6NjRL_nldIgH5exG4uyu1EOjWMK1ZXMCdwKd0uDHj1ygjKZ4LMHvI5ZmPy1VC7ueFWTm1tpfcl5bYEDGc5lOdh-xYF6YedH2VxLx9oY-6qXpWIHJsg8LsyzCwaHg9xrskqUKSpl3ckOa0L6fvOuZaRZOQAk7O9tTY8uQw-UaVzpAdPfw=w180-h74-no" alt="gmail" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="https://lh3.googleusercontent.com/FkzOL1Y2t-yf1qxqitKUm5-EMCtvJxyrSIsku7h84yju2ceCUxtPk90slo1FrsSUumTRlWfUOr4-t2hwHERozOz-8e2tvvwjaRhU_sGaVA-ZFmLxeNhJSheai6Cm1604RYf1C-N2ngt5L9teo5zYXEStu9Ei9X_QdNm2w8fU-YuA01D7cfod9vJ06FwYEOcdQolodbdMpfi59IGu2zwKpecBfGcEn8bz0pecXzrlE2PeYbVv1tnnWe69pck5JUXYDmTzD0dsnAKOojCBq-hy1j00oeRX1YLn_iw21vPX9hQWnSdPmD2enH6yb_erWHkJO_Mh5Lqtf3BZW18Vlz41n6tM_dDE0myw0OftX5VhUcH8RLWwdtIAsNU_y63QZa3_6X-PH44gi_JzSdWJH6I3FXZ_ag3RfSd18GEiX56Hm3fR-8WVVQSeBnmAk5Jco2ouww2PqDUQcfwDplxB-qBDanfpEsX-Sz60nIND0yDzowvClT3DEN8lflp31jxklwfwU9vmmmJaNO3rLtSTdnYZtaaZK6FENCwGpPWlPSo7hcnZ69SEIaFEmGyQkFHETYlpgT--f7fNH4tHexmJDAgYekzD2Wg1FYDULQ-fzhlqeQ=w695-h279-no" alt="google drive" style="border: 1px solid grey;width: 203px;" /></li>
	<li><img src="https://lh3.googleusercontent.com/9bOAZbL26nFcsqh3awThpBaK9XH_G1dniKYvs0CcPGGJfZe4Wgv7AN6Q4e4a49Vea7xxUHASxdSpMLfvIjzotqIjSpa_uPM13SadQ1RrwospQmZNusdtqDMyfMjaIVcqAelOEpRjZbMZ8HgFEYpESGI9xVf6nRr7TbtlWiTAR0CPopDWKkbm_TDPQwAUgN15atqAj6Nk1XRtF65C8y1lkipMzenqx0RFptt6F7_dAVns5GMqk56wdFXNef3jEAEBCK7RcxdQje7tDpYntiDU1KLfs5cxKGA9mgLWSTZQ5V2ZivsOGw38MknfsF1p69Qjg2MO3jRK7kV2kHjS0QnIknqoUggyVj1t8A1QsxZF5-xeroV1kJWtCxadkpzLLSf7U1kvyLhaiAd9s9iUekBA8MCi-Abb5rrxpCjJm93aHBE7LehW9C2mVPO7A9h-PhLQ8jEqrWRUXqllrbtC7sCJjJqmYSO14kXqMpQlnyYFc-YQW7RPYesICXuhsZeY0t79QdiYuFGEIGDhMaheLNWmOOynZMKZILmUytvge2soUVm_ll4R1NaZJNrIq4-0v7XpYR5R9spXl0TiGwHPyMG5vcwarJzpbf8pTZffsESsjg=w377-h49-no" alt="gcp" style="border: 1px solid grey;width: 203px;" /></li>
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
<img alt="New Article Form" src="https://lh3.googleusercontent.com/3OKDxQzX2uhjfTjYFOmtCA32gR3d2NLl6Y_KfU0JRKUARyvIs3_yJ9vuL-r6293x20_twD6zimBtLeiaP6wTKX87ar26orao8ZWD0wl3oZjWPU1kMmhZVc4V_w74VnmCSiE9hJ76hQ6FTgLZEA0yMkf-n4gleo3mRX310d2rM34vIEEVwdBCrnFeHgz030lXcEey0-koHj7XS5MIGGrKn2AqkklQ9JKJi4MDcom-1vmE5_xZ9frnVB9vuKEbPBoIUTdhjfJtvr8Yx0W8dQGo4nTToFjhNwPc-jSVCR10LYSRfNHy0WmWYSx8eiukcbCvjpAGRLY9yMVVz8mxUMksbYzNnguo62juLOvgg5XOyE-qZe1EzyTmQBmbQDXuv627HNMs-uIbcMDhIshzHsiLCtanoI8owpio0ekoL_3fgh3oI0aZJ3fRE0HWnsLl2YfsSmXnursMY55KKhtsJbBVALtFcyzabtxGSyrA7U_CPQR-YWfe1UiPAhrLnsEhTwl1iP7Jw5fkGhfHZyDH2sf8Y0UBcRaYj7GQuLCwNVRbA-uF-aVYmebCXGt9cd_qeBUxbU6LgM5oNT0fwHfLZATRKCr_yntrqS_1SlR1ecU=w831-h380-no" style="border: 1px solid grey;" />
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
<img alt="New Article form Screen" src="https://lh3.googleusercontent.com/X4FlQA4yLS_bfiLE0ydyfpLuhuidFN9Yq1Eqb8D1XXRvJD9vOUm4KoLqOwsxORqJvcdLvLEHtSvW1hNdbH0v2RH4_QxpntlewzwNfL-dkgV_ZNxjTSLSInWgGdpYis5XfdNF11L6aCYcHejo9RqCbc7DHSNtaNpOQdEJ7ps1CZFWWFUJmvOvbsAyaUT64369904e0IOzPjJU39SSW5Hd-X79M-eLr3BI9Hd7QXsyySgeTgXUDb7xkdDwwhocasO2uVmobioIrF0ej05kZK7LkNl-4xPnu9kVnKX4DpOJMDz0hpdQrczzVyyPTIMThSBAp_7hQIry_QQ9it2XNaJ1qr1rQm_UnpLwBY9cRgAfdVIyasEys8N5u8uUNvQg6Q4Knwtz3tIEtKka6JMPkYgMhiz5gI_FoRjXCYeOtRzP7x-8EuXK_XjqnyXZzZLNUxBhy3uwS5U3iHaI_fNuvwvdQhC3XYsa0S5lYQH_hKKnG5cO9_-CwK62pUHWm_Tr0EvVWEGlUyD-DB35wDEMbpg_unMcNxEdDqIy_IpxyNm7SNcYXBS452B4HOuMBTkcEEFuTdU6KWXGmJvSFzsQhlH6nbYlLEWpeqgV8iJeKj0=w1008-h574-no" style="border: 1px solid grey;" />
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
<img src="https://lh3.googleusercontent.com/oOl5O7d3nb-LO2AxAlPuJuZueUl3co3p5eNV3gV1gF1854fCOuTZFbYJ0twWf2JUDfjm6NVPFJyvgcVYiigbfnF8XglWC_SrMdgV-yyPvUroejLvd2kSAU8y4GlDTIl9R8yCGOO2f6IpAmxtvCtMCEcvtV5nZtaGRRdku-SJWLj4fFIiGIpTK1IAP8YDtZZqsP6DM6N7RY9RDqfqGJZ6tiTSgIPnGq6_JMzvoektRxWRoFjzE1QSy81ZWZ6SnJQorBQv8f31YrJigeUsP8MxZgvbKdRQx9KxkLP_bEkKvHgfRNThWL_as5ReJxTELSq9hFAbHC5x-qmcAAhGtCAXJzgwLKeNcAr_GpcgadQmJUgCRV-wGR58V6q231A-9OFomjt932qo9ShKlmC4roMFXHMJ17Z6CRCAGJdbYuGsM8zrb0fLQtF8-TM6XvYVNOY3Rom_ZTbEPxf15D7mmoZJefSe2hcP9rPNLCLDxG5KnaJk7a6sjEu3-mXMNmwBHiujW-V6AeWdOsJd1NYPtgGA03hZ22yoVfIokaNRO3xeR_FSpyyhI5koaOypNAkRC8wfr27aTMw3Jzcn8uT2G805HGhG1tuDYqY7X9ITnpcJjg=w178-h325-no" alt="Prototype Directory Structure" style="width: 178px;" />
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

</article>