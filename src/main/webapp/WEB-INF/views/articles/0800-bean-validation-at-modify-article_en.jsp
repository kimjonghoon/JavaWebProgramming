<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Bean Validation - Modify Article</title>
<meta name="Keywords" content="bean validation,modify article,hibernate-validator,@Size,@Valid,BindingResult,modelAttribute," />
<meta name="Description" content="This article describes Modify Article bean validation" />
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

<h2>Bean Validation - Modify Article</h2>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">@RequestMapping(value="/modify", method=RequestMethod.GET)
public String modifyForm(Integer articleNo, String boardCd, Model model) {
  
  Article article = boardService.getArticle(articleNo);
  String boardNm = boardService.getBoardNm(article.getBoardCd());

  <strong>model.addAttribute("article", article);</strong>
  model.addAttribute("boardNm", boardNm);
  
  return "bbs/modify";
}

@RequestMapping(value="/modify", method=RequestMethod.POST)
public String modify(<strong>@Valid Article article, BindingResult bindingResult,</strong>
    Integer page,
    String searchWord,
    Model model,
    MultipartHttpServletRequest mpRequest) throws Exception {

  if (bindingResult.hasErrors()) {
    String boardNm = boardService.getBoardNm(article.getBoardCd());
    model.addAttribute("boardNm", boardNm);
    return "bbs/modify";
  }

  String email = boardService.getArticle(article.getArticleNo()).getEmail();
  article.setEmail(email);

  boardService.modifyArticle(article);

  //..omit..

  //Modified setArticleNo(articleNo) to setArticleNo(article.getArticleNo()) in file information insert code

  searchWord = URLEncoder.encode(searchWord, "UTF-8");
    
  return "redirect:/bbs/view?articleNo=" + article.getArticleNo() +
    "&amp;boardCd=" + article.getBoardCd() +
    "&amp;page=" + page +
    "&amp;searchWord=" + searchWord
}
</pre>

<h6 class="src">modify.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="modifyForm" action="modify" method="post" <strong>modelAttribute="article"</strong>
        enctype="multipart/form-data" onsubmit="return check()"&gt;
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
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="Submit" /&gt;
  &lt;input type="button" value="Detailed view" onclick="goView()" /&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
On the post edit screen, clear all the input fields and click the Submit button.
</p>

<p>
<img alt="Modify article test 1" src="https://lh3.googleusercontent.com/FTPcaDDFTESQpwKpjHvgMYs49PnTDG3ac0wbbgc9IXVXOlfrteb-b7Yau4GmJqhFxGYtTsVIjSxqJ6_ZuyvS4Y9BDLYYB830ib01RwEhsNJ1aU4W0XUsTvcEePLUMJHT-L0gFT5V70oWr9QTOVmNh9d-lmdSJc8UXT_4VWk_z-ku7R_H4pbsYLdicDvvxKLGPb3NdCeCTp9H6N-DYpTx19Oa9w4Z7sb7u6tNNZbcmt211RlMfBhZcvJee_Dcgq42ZA0jUCinRHJ04mMoE0sIq3zIOYw3WS04Cxj1h9tvK0WUgjY_J6s8Jm43Tbgpo8QfwkUWaXPPPiDGeuTl6DDzBKinmPmEhmTf2GYC-T_1-zDkuTse8wpAn9fgO4HfEVqErMExAIN0L43phPRvuNxNA7hyF4P2ToWObg1dYJASyEMWW6XBiWrH0z9tDfI0p5v9RKcOUeO8MzybLf8k7wX31f68VNJecNrfs479AY0PH7phJ9OmSxCUYKLXT8K9JmeGXnPE09IABuWRqSLV74JnsLxWtZxo_cO2yL8yXoN90Y_-mnhZdri2uV5Ybc4gmuMIIjkBVYWlvXVg4l2U7E-ToOcYzP6GonIhPWYoGQ8=w612-h406-no" />
</p>

<p>
<img alt="Modify article test 2" src="https://lh3.googleusercontent.com/4qZTGcgTpbaTeVzzipCrz42ExTjEeyIQyNgUPWYERh6_Fcq9bG6j67ORTn1KLZL5StpTXNM-HdeGwdT5xqEJ200xaaRswxvfNMuVDmzjJrkyPrAoRoh3VobsXOake9Dyp0sHEZYq2zAeADBejjNZ2DjjwOoosPAwIXHp8P_mmDxbVLpI9eEQnWIm-i_6u0eVc3l1yXzKRihKbPLBWBe2imI0kbfeR_WvmdczlBBcpn6iK7uNVfn3ngxrU3I7SNwiTF7rBrryReo82DA3yTZNk4Bc4QRwJOr32wxagtCKraehNfWikBeztlydzaeqIaHhYrXbxWOUaz1zfkXRtt_KZUHNxjxs2BK1qFs6HIKAHzc1RKNNM-nlrb2sQrtnKbmhCXg5fMWx1M7Z7x0XTyhIb_s-QT59yxr5B_FkUI-Uy9mKtGAUcJLJ7AC6-nnWkUA3S2loyJfk_aqziiCxrFd7e77EVWLi8bV1Stk9rB__kJNFWlZm709Bu2VjCqWNctQNOaFJXZIsGZPReRjXGs8Mb-NsMGT_EEicAMm07jCjGcyA4NATMJKSEglRbPoGHwcXptcrW6sr-cTMZM_lQC2w3Tzx5T1LcOEP4snsrjyUtDfYqXLeeP0by8qedO4R099TnMtI9Dr2Kmzp1e0c9AhvYt4rYYTbdbwYcEIczR3FD9-gtIaldExPwBWWo3twQYyTzXH8xJhufty5RBQXmOyeccP-=w425-h346-no?authuser=0" />
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
