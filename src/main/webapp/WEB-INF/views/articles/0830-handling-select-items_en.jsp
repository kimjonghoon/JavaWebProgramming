<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Handling select items</h1>

<h3>Adding item</h3>

<pre class="prettyprint">
opts[46] = new Option("Option text", "Option value");
</pre>

<p>
Unlike Java, JavaScript arrays automatically expand.
See <a th:href="@{/javascript/Array}">JavaScript Array</a>.
</p>


<h3>Removing item</h3>

<pre class="prettyprint">
opts[46] = null;
</pre>

<p>
Unlike Java, JavaScript arrays automatically shrink.
See <a th:href="@{/javascript/Array}">JavaScript Array</a>.
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
  var form = document.getElementById("testForm");
  var lang = form.programLanguage.value;

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
<a th:href="@{/examples/sel.html}">Run example</a>
</p>

</article>