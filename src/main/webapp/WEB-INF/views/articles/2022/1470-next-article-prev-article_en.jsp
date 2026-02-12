<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Next Article and Prev Article Feature Correction</title>
<meta name="Keywords" content="java,web programming,pagination,Next Article,Prev Article," />
<meta name="Description" content="This article describes the update of the Next Article and Prev Article functions on the bulletin detail view page" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 10.25.2022</div>

<h1>Next Article and Prev Article Feature Correction</h1>

<p>
The 'Next Article' and 'Prev Article' functions cannot change pages when viewing articles belonging to different pages.
</p>

<h6 class="src">The form to request a detailed view page</h6>
<pre class="prettyprint">
&lt;form id="viewForm" action="/bbs/${boardCd }/" method="get"&gt;
  &lt;input type="hidden" name="page" value="${param.page }" /&gt;
  &lt;input type="hidden" name="searchWord" value="${param.searchWord }" /&gt;
&lt;/form&gt;
</pre>

<p>
If the number of the 'Prev Article' is less than that of the last article on the current page, the page value in the viewForm form should be increased by 1.<br />
See below.
</p>

<p>
<img src="https://lh3.googleusercontent.com/KDJywothSmPFQFdhwWOx1zQwAjmsN1CYMthS_FzkxPASj0OL26zcjZdLZgNjc-8MYA50gWKqF-EEBQ50KoSIJz2GVWhEfCvqqpM-yoqipdIF1uVpkDi-v4c1CY3vGn12IHL3hrU94eMJycA6y6zbXUUL5yCmEDugoq01cYo-jr8vmf4yLIRXeCXf7mTGsZjpxaRgkmuHO3723FEWPlzzA2J6xYiB_Ei30zu5-wo802uBxQmONqOqRp3zVZ0GxlYMIU8ypUQ_B9wDyTy7iCI73v822Q7I9FOyuwattfZanQs4IGTVabohQ3ni5NEeTgF0UPJbNbaBwi8oLaFpkzcY4mNpmkRlEn-cuIDshVxvLUqRrrAWrQ8j-F34m1j3K1dPkR_msZEulkMGD8ShlwnuVhp0cPw-GzjU3Wh3vyfa2geCDdqC5JpeeC-L42mSvrAH5I9HAhQq3Im8tJgdALloozQvM9BzL4GuLaAU4Ymp9i-pw1fGqlvKwyn_cDHgi76uZ9vInFiGSpI1-XfyXNHjyWMXyuiYKg_46q8F2lP0UMPENt_S7SpWongSB3FIMERaSq0XPQeEv5AqotG919ai7oU2c39XnXsDyaXPmtuBz6uKPuWAZqbpKInru6wk4iI8Q89L9E9HA7-9Tancj1alR6Wk5qpf8MlI9wq8zxsKyjXEOzoEMPLrYNNipngkyKVLSYTymEEwxpk0F0CacmS5ZOKTgQYjunOtE-dXRMeemzroDOzzMh5_QCadJC7p7Kh0nP-b17sOd9RX-bJ00VBGhdUT7p_ah7cGNgr5Cxf8GEmo-aHeoBBUTg-Qx4JcbguQA2-DW9jFoNmZqFVQwfqYYTVpVJjepU56_ZexN_XarofuqlVYaQzVM-LcG88uiKZTBDdsKrnTWXwh8oWUMwA5Z5pk3Yg3Kcdsm7UOeyHFUmFR=w770-h532-no?authuser=0" alt="detail view page of the board program" />
</p>

<p>
If the number of the 'Next Article' is more than of the first article on the current page, the page value in the viewForm form should be decreased by 1.<br />
See below.
</p>

<p>
<img src="https://lh3.googleusercontent.com/JXZWbxUHoAb_Z3n4La7KZhfH21328DsWoYbU8yF38K-LNsQo2-rMMFXT0WuTWpt7y44njSP9jJqaMedSD8yxdhNz3KkAtlbIz2EkKZKZM5Q-Fy3CQL4JrhveJiG8REi-euX1r5_0-5pSBlamfUgWFzz_oExcNX0OB2erWeNonU6JFYigQRcV2m8sdAWtSJ2Y7ComuWVYYw9T-evct0qdrjkxfCM54fjmxZ4ThGBT_fs5TFMFhtMx4Blx6FPqnLOon3Xp1fJK4p3RzBN8NuZyQK3P_oCxoH2K47xq3SCTiyyKH3xWeAgLYjkS-FM00qOwon0CFcdnuE2oSPOEgz32RzQHNSNmDu40aDgsKANL1Iz67hPQaiIMBwZQLrajXT-FpJcGD9uLs83Z9T7h3Y4_UKktzblwapWvyBfl_msXWd2RSjWYLCLCY-grPGNujGXFSkq1LHmPmwfg-aH4gJar3B-4MtJdgq5Ygdf9zM2vxNBTSLZqaP0ZqcITvKqVLVbqZmGex47hhQOTo_Ya8np7ftQqTapG4l4xvC5S7MYhRD_KlqpsJmewVzPCUu8KfdQ4v9FWFmW0cLsEzirX1qbu5zl8tLKa5Q-mTIhpF6jxjfC7EiMA09DYrxhqJP70VX_Zbobtob3WHMf-GNPWTA6SeltmozgVO4q5ALjv30e2CDefDA_9zs-WDtnM8xICT-36rQEE-LglmhrD0i7eJPhEqvSaQBWgYHI_1MxaIbS7ScGl9FfHbWWCWAeZp5opaTYOCzw61SMSMPLDbFbnyxx5ScjN6WVMocw1QJTNKd2Qru3g2QA3muNX9BIb7wK2ZZ8M-cNCBSmpggm1xIO3MixatL_vHSgl85Uru-juz0_B6KP9EMsYWRbdNeUAFN-J991SLfOxi6EtvzGX5fv1SGnNBSeQ16hky1lVBp99MDew8_H2=w769-h541-no?authuser=0" alt="detail view page of the board program" />
</p>


<p>
Add the id attribute to the page input element of the viewForm form.
</p>

<pre class="prettyprint">
&lt;form id="viewForm" action="/bbs/${boardCd }/" method="get"&gt;
  &lt;input type="hidden" name="page" value="${param.page }" <strong>id="viewForm-page"</strong> /&gt;
  &lt;input type="hidden" name="searchWord" value="${param.searchWord }" /&gt;
&lt;/form&gt;
</pre>

<p>
Below is the HTML code you need to reference to write your JavaScript code.
</p>

<h6 class="src">View page source</h6>
<pre class="prettyprint">
&lt;div class="next-prev"&gt;
  &lt;p&gt;Next Article : &lt;a href="#" title="9105" <strong>id="next-article-link"</strong>&gt;sysctl vm.swappiness&lt;/a&gt;&lt;/p&gt;
  &lt;p&gt;Prev Article : &lt;a href="#" title="9103" <strong>id="prev-article-link"</strong>&gt;free -h&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class="view-menu" style="margin-bottom: 47px;"&gt;
  &lt;div class="fl"&gt;
    &lt;input type="button" value="Modify" class="goModify" /&gt;
    &lt;input type="button" value="Del" class="goDelete" /&gt;
  &lt;/div&gt;
  &lt;div class="fr"&gt;
    &lt;input type="button" value="Next Article" title="9105" <strong>class="next-article"</strong> /&gt;
    &lt;input type="button" value="Prev Article" title="9103" <strong>class="prev-article"</strong> /&gt;
    &lt;input type="button" value="List" class="goList" /&gt;
    &lt;input type="button" value="New" class="goWrite" /&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;table id="list-table" class="bbs-table"&gt;
  &lt;tr&gt;
    &lt;th style="width: 60px;"&gt;NO&lt;/th&gt;
    &lt;th&gt;TITLE&lt;/th&gt;
    &lt;th style="width: 84px;"&gt;DATE&lt;/th&gt;
    &lt;th style="width: 60px;"&gt;HIT&lt;/th&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td style="text-align: center;"&gt;&lt;img src="/resources/images/arrow.gif" alt="You are Here!" /&gt;&lt;/td&gt;
    &lt;td&gt;&lt;a href="#" title="9104"&gt;swapon -s&lt;/a&gt;&lt;/td&gt;
    &lt;td style="text-align: center;"&gt;10/9/22&lt;/td&gt;
    &lt;td style="text-align: center;"&gt;9&lt;/td&gt;
  &lt;/tr&gt;

  &lt;!-- omit --&gt;

&lt;/table&gt;

&lt;!-- omit --&gt;
</pre>

<p>
Refer to the HTML code and modify the JavaScript handlers of the Next Article and the Prev Article links.
</p>

<h6 class="src">Before</h6>
<pre class="prettyprint">
$('.next-prev a').click(function (e) {
  e.preventDefault();
  var articleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += articleNo;
  $('#viewForm').attr('action', action);
  $('#viewForm').submit();
});
</pre>

<h6 class="src">After</h6>
<pre class="prettyprint">
$('#next-article-link').click(function (e) {
  e.preventDefault();
  var nextArticleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += nextArticleNo;
  $('#viewForm').attr('action', action);
  var firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
  if (parseInt(nextArticleNo) &gt; parseInt(firstItemNo)) {
    $('#viewForm-page').val(${param.page - 1});
  }
  $('#viewForm').submit();
});

$('#prev-article-link').click(function (e) {
  e.preventDefault();
  var prevArticleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += prevArticleNo;
  $('#viewForm').attr('action', action);
  var lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
  if (parseInt(prevArticleNo) &lt; parseInt(lastItemNo)) {
    $('#viewForm-page').val(${param.page + 1});
  }
  $('#viewForm').submit();
});
</pre>

<p>
Change the JavaScript handlers of the Next Article and the Prev Article buttons.
</p>

<h6 class="src">Before</h6>
<pre class="prettyprint">
$('.next-article').click(function () {
  var articleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += articleNo;
  $('#viewForm').attr('action', action);
  $('#viewForm').submit();
});

$('.prev-article').click(function () {
  var articleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += articleNo;
  $('#viewForm').attr('action', action);
  $('#viewForm').submit();
});
</pre>

<h6 class="src">After</h6>
<pre class="prettyprint">
$('.next-article').click(function () {
  var nextArticleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += nextArticleNo;
  $('#viewForm').attr('action', action);
  var firstItemNo = $('#list-table tr:nth-child(2) td:nth-child(2) a').attr('title');
  if (parseInt(nextArticleNo) &gt; parseInt(firstItemNo)) {
    $('#viewForm-page').val(${param.page - 1});
  }
  $('#viewForm').submit();
});

$('.prev-article').click(function () {
  var prevArticleNo = this.title;
  var action = $('#viewForm').attr('action');
  action += prevArticleNo;
  $('#viewForm').attr('action', action);
  var lastItemNo = $('#list-table tr:last-child td:nth-child(2) a').attr('title');
  if (parseInt(prevArticleNo) &lt; parseInt(lastItemNo)) {
    $('#viewForm-page').val(${param.page + 1});
  }
  $('#viewForm').submit();
});
</pre>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/blog/2022/testing-book-source-on-windows-10}">Testing the book source on Windows 10</a></li>
</ul>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://api.jquery.com/attr/">https://api.jquery.com/attr/</a></li>
	<li><a href="https://api.jquery.com/nth-child-selector/">https://api.jquery.com/nth-child-selector/</a></li>
	<li><a href="https://api.jquery.com/last-child-selector/">https://api.jquery.com/last-child-selector/</a></li>
</ul>

</article>
</body>
</html>
