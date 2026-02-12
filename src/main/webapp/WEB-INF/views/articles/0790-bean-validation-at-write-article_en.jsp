<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Bean Validation - New Article</title>
<meta name="Keywords" content="bean validation,new account,hibernate-validator,@Size,@Valid,BindingResult,modelAttribute," />
<meta name="Description" content="This article describes new article bean validation" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>Bean Validation - New Article</h1>

<p>
Modify Article.java as shown below.
</p>

<h6 class="src">Article.java</h6>
<pre class="prettyprint">private Integer articleNo;//Change int to Integer

@Size(min=2,max=10,message="The board code must be between 2 and 10 characters.")
private String boardCd;

@Size(min=1,max=60,message="The title must be between 1 and 100 characters.")
private String title;

@Size(min=1,message="The content must be at least two characters.")
private String content;

//omit..

public Integer getArticleNo() {
  return articleNo;
}

public void setArticleNo(Integer articleNo) {
  this.articleNo = articleNo;
}
</pre>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">@RequestMapping(value="/write", method=RequestMethod.GET)
public String writeForm(String boardCd, Model model) {
  String boardNm = boardService.getBoardNm(boardCd);
  model.addAttribute("boardNm", boardNm);
  <strong>model.addAttribute("article", new Article());</strong>
  return "bbs/write";
}

@RequestMapping(value="/write", method=RequestMethod.POST)
public String write(<strong>@Valid Article article, BindingResult bindingResult,</strong>
    Model model,
    MultipartHttpServletRequest mpRequest,
    Principal principal) throws Exception {
        
  if (bindingResult.hasErrors()) {
    String boardNm = boardService.getBoardNm(article.getBoardCd());
    model.addAttribute("boardNm", boardNm);
    return "bbs/write";
  }
    
  //article.setEmail(principal.getName());
  boardService.addArticle(article);

  //..omit..

  return "redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
}
</pre>

<h6 class="src">write.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="writeForm" action="write" method="post" enctype="multipart/form-data" 
    <strong>modelAttribute="article"</strong> onsubmit="return check();"&gt;
&lt;input type="hidden" name="articleNo" value="${param.articleNo }" /&gt;
&lt;input type="hidden" name="boardCd" value="${param.boardCd }" /&gt;
&lt;input type="hidden" name="page" value="${param.page }" /&gt;
&lt;input type="hidden" name="searchWord" value="${param.searchWord }" /&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table id="write-form"&gt;
&lt;tr&gt;
  &lt;td&gt;Title&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="title" style="width: 90%" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="title" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;
    <strong>&lt;sf:textarea path="content" rows="17" cols="50" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="content" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Attach File&lt;/td&gt;
  &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center; padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="Submit" /&gt;
  &lt;input type="button" value="List" onclick="goList()" /&gt;
  &lt;c:if test="${not empty param.articleNo }"&gt;
    &lt;input type="button" value="Detailed view" onclick="goView()" /&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<h3>Test</h3>

<p>
On the new post screen, click the Submit button without typing anything.
</p>

<p>
<img alt="New article test 1" src="https://lh3.googleusercontent.com/QCXQioh1cvBSctfkuS4VWcozTRCo00sELf1waptSk2NqI2Q8VI6E_I4aLrdB3GoadzEyd5sKYIkMGO0J3IguzKaVrY_SCJ7-DJ4Vl-z74JVY4yJoCxtTWOwUDRj1E4eqjG-JaK1B9IXCjrgCPPiU_JonMWXDpAGnTkZkSIB3Nz3Y-TTFADEcrol9UFjlHRIGsO5ImwWdVyOcd_IF9i4OudOjWWHhVnxLX4mRhEY6-efcmAB44aPs7N8k7TGqDzBSthX-N7_R_Dy1K2NvXtBu3Vc8US5IrXgOpi2OUqMxOgonBXQKUDZ2bU12nazOtIBrU79VcQdBdc3cmb5zR9Xv4qn1aBqKKTazx3wEweqIZMUgtpfc2tVRZi2_rah4z2KI3GXW71okjnx3_1p_hZ8ZUXmbmRQqlEljtD_Z9QsnQIqUgrxFThvY76vggoW4G--UGnEgFsYGnIndDKEyiRw3Z2xiQ87_YVyuAjGxnOZxZvbEodaSCnqswBIeNhoe8OWBzMLMo0go01H1pHg_FFmZWY4oWsljp9MbDKksE4ewvt-ojPrmVJBi_QGeyA2lswOVJYPMIbj8HcHjKC3kwk0pya53hHuHc_KBM659QjI=w610-h403-no" />
</p>

<p>
<img alt="New article test 2" src="https://lh3.googleusercontent.com/gnm7wn_RqUsNegXWl3jwoi_GpjNf7qD2S8W8x64sv7IFJV2SlmqwCnP4rrzEXKSTitBayIby3pCc0gVnFB6OUzKL6PmeSDzp2mXRkOf3-WjHckneGpsL61KCt7zGIP_wynraZBLiBD6Dwe02EcHZSKilEILQMA2Hi0LDuekxdkQWxfVAWn-TIeqEylGeM9ba2NMDpvdQcMslBIo5TegYCb8QmTU8GxZ0oqNfR0ZO9f9ZoIvaMDiCgOu6mqLPEhJsvS2Fb7uaYYd0eX1-jxCJukMMEB53mokgjxeVYYywpxSp55V0GM2lp_ImCV7rzxFa4EH7lG9vGpEcFotZNNCWE1tQBkKCYlJceMmQKlCPtwbN8F_kRz6ZcJM6ubfoMgyD1kuaYI0KiHmaI-ZtmRsqnFTLoA22cplChuYqjPriaCAGXhwlYwDmw_ncoakJNNrC0T-ht1aeQliwH1jAzMCBzftciVsSmmzwMGVEfmO6cCxiw8TPuSHM7_nJI2LNI94kqlrKCtAx19NSHIEfENRCJ7zx-DLT5VPq-7PPQuInd5N2RI1nrPBGk7WTJRHbVleKcLQUsxezbODoFl_GshLuQiJHde7ia3qWASljjx-xNVNpO0Hbw1IDqHhoIYTn8_9-vbkZ6EOfjBfaNWHKcGOM8OqyzR4FKxdvq3Nm_mJkpJsoyZ_6FNq2wo9W2mCtILEBX5vPLBmsmux-oVuwhk8UM6tT=w614-h494-no?authuser=0" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="http://hibernate.org/validator/documentation/getting-started/">Getting started with Hibernate Validator</a></li>
  <li><a href="http://forum.spring.io/forum/spring-projects/web/80192-validation-empty-int-field">Validation - Empty int field</a></li>
  <li><a href="http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work">http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work</a></li>
  <li><a href="http://stackoverflow.com/questions/6227547/spring-3-validation-not-working">http://stackoverflow.com/questions/6227547/spring-3-validation-not-working</a></li>
  <li><a href="http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found">http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found</a></li>
  <li><a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/pdf/">spring-framework-reference.pdf</a></li>
  <li><a href="http://mybatis.github.io/mybatis-3/getting-started.html">MyBatis Getting started</a></li>
</ul>
</article>

</body>
</html>
