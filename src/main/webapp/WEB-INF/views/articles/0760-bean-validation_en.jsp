<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Bean Validation</h1>

<h2>Sign Up</h2>

<p>
Add Hibernate Validator dependency to pom.xml.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.hibernate.validator/hibernate-validator --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.hibernate.validator&lt;/groupId&gt;
  &lt;artifactId&gt;hibernate-validator&lt;/artifactId&gt;
  &lt;version&gt;9.1.0.Final&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Bean validation need <em>&lt;mvc:annotation-driven /&gt;</em> in spring-bbs-servlet.xml.
</p>

<p>
Declare constraints rules on the User class that is bound to the sign-up form.
</p>

<h6 class="src">User.java</h6>
<pre class="prettyprint">
<strong>import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Size(min=5, message="It is not an email.")
@Email(message="It is not an email.")</strong>
private String email;
<strong>
@Size(min=4, message="Your password must be at least 4 characters long.")</strong>
private String passwd;
<strong>
@Size(min=2, message="The full name must exceed two characters.")</strong>
private String name;
<strong>
@Size(min=6, max=20, message="It is not a mobile phone number.")</strong>
private String mobile;
</pre>

<p>
The sign-up form handler must create an empty object with no content and pass it to the view. Creating an empty object and giving it to the view is a spec and should be followed.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
@RequestMapping(value="/signUp", method=RequestMethod.GET)
public String signUp(<strong>Model model</strong>) {
  <strong>model.addAttribute("user", new User());</strong>
  return "users/signUp";
}
</pre>

<p>
The subscription handler must have a parameter of type BindingResult after the @Valid annotated parameter. Otherwise, an HTTP 400 error will occur.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">import javax.validation.Valid;
import org.springframework.validation.BindingResult;

@RequestMapping(value="/signUp", method=RequestMethod.POST)
public String signUp(<strong>@Valid</strong> User user, <strong>BindingResult bindingResult</strong>) {
  <strong>//A bean that fails validation is stored in the BindingResult and the BindingResult is passed to the view.</strong>
  <strong>if (bindingResult.hasErrors()) {</strong>
    <strong>return "users/signUp";</strong>
  <strong>}</strong>
  
  //...omit...
}
</pre>

<p>
Modify signUp.jsp as shown below.(&lt;sf:errors &gt; is a Spring's form tag that displays validation errors to the user)
</p>

<h6 class="src">signUp.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="signUpForm" action="signUp" method="post" <strong>modelAttribute="user"</strong>
      onsubmit="return check();"&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
  &lt;td style="width: 200px;"&gt;Full Name&lt;/td&gt;
  &lt;td style="width: 390px"&gt;
    <strong>&lt;sf:input path="name" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="name" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Password&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="passwd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="passwd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
    Do not input email account password!
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Confirm&lt;/td&gt;
  &lt;td&gt;&lt;input type="password" name="confirm" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Email&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="email" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="email" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Mobile&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="mobile" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="mobile" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="Submit" /&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
Add the following to the stylesheet.
</p>

<pre class="prettyprint">
.error {
  color: red;
}
</pre>

<h3>Test Screen</h3>

<p>
<img alt="Sign Up" src="<c:url value="/resources/images/sign-up-1_en.png"/>"/>
</p>

<p>
<img alt="Bean validaion failed" src="<c:url value="/resources/images/sign-up-2_en.png"/>"/>
</p>

<h2>Edit Account</h2>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
RequestMapping(value="/editAccount",method=RequestMethod.POST)
public String editAccount(<strong>@Valid</strong> User user, 
    <strong>BindingResult bindingResult</strong>, Principal principal) {
    
  <strong>if (bindingResult.hasErrors()) {</strong>
    <strong>return "users/editAccount";</strong>
  <strong>}</strong>
  
  //user.setEmail(principal.getName());
  
  int check = userService.editAccount(user);
  
  if (check != 1) {
    throw new RuntimeException(WebContants.EDIT_ACCOUNT_FAIL);
  }
  
  return "redirect:/users/changePasswd";
}
</pre>

<h6 class="src">editAccount.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="editAccountForm" action="editAccount" method="post" 
      <strong>modelAttribute="user"</strong> onsubmit="return check();"&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;Full Name&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="name" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="name" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Mobile&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="mobile" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="mobile" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Password&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="passwd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="passwd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<h3>Test</h3>

<p>
After logging in, remove all existing values from the account modification form page and click the Submit button.
</p>

<p>
<img alt="modify account test 1" src="<c:url value="/resources/images/modify-account-1_en.png"/>"/>
</p>

<p>
<img alt="modify account test 2" src="<c:url value="/resources/images/modify-account-2_en.png"/>" />
</p>

<h2>Change Password</h2>

<p>
A password class is required to enable bean validation for passwords.
</p>

<h6 class="src">Password.java</h6>
<pre class="prettyprint">package net.java_school.user;

import javax.validation.constraints.Size;

public class Password {

  @Size(min=4, message="The password must be at least 4 characters long.")
  private String currentPasswd;
    
  @Size(min=4, message="The password must be at least 4 characters long.")
  private String newPasswd;

  public String getCurrentPasswd() {
    return currentPasswd;
  }
  public void setCurrentPasswd(String currentPasswd) {
    this.currentPasswd = currentPasswd;
  }
  public String getNewPasswd() {
    return newPasswd;
  }
  public void setNewPasswd(String newPasswd) {
    this.newPasswd = newPasswd;
  }
}
</pre>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">@RequestMapping(value="/changePasswd", method=RequestMethod.GET)
public String changePasswd(Principal principal, Model model) {
  User user = userService.getUser(principal.getName());
  model.addAttribute("user", user);
  <strong>model.addAttribute("password", new Password());</strong>
    
  return "users/changePasswd";
}

@RequestMapping(value="/changePasswd", method=RequestMethod.POST)
public String changePasswd(@Valid Password password,
    BindingResult bindingResult,
    Model model,
    Principal principal) {

  if (bindingResult.hasErrors()) {
    User user = userService.getUser(principal.getName());
    model.addAttribute("user", user);
    return "users/changePasswd";
  }
    
  int check = userService.changePasswd(password.getCurrentPasswd(),
        password.getNewPasswd(), principal.getName());
    
  if (check &lt; 1) {
    throw new RuntimeException(WebContants.CHANGE_PASSWORD_FAIL);
  }

  return "redirect:/users/changePasswd_confirm";
}
</pre>

<h6 class="src">changePasswd.jsp</h6>
<pre class="prettyprint"><strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="changePasswordForm" action="changePasswd" method="post"
    <strong>modelAttribute="password"</strong> onsubmit="return check();"&gt;
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;Current Password&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="currentPasswd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="currentPasswd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Change password&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="newPasswd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="newPasswd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;Change password Confirm&lt;/td&gt;
  &lt;td&gt;
    &lt;input type="password" name="confirm" /&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
On the Change Password screen, press the Submit button without typing anything.
</p>

<p>
<img alt="Change password test 1" src="<c:url value="/resources/images/change-passwd-1_en.png"/>" />
</p>

<p>
<img alt="Change password test 2" src="<c:url value="/resources/images/change-passwd-2_en.png"/>" />
</p>

<h2>New Article</h2>

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
<img alt="New article test 1" src="<c:url value="/resources/images/new-article-1_en.png"/>" />
</p>

<p>
<img alt="New article test 2" src="<c:url value="/resources/images/new-article-2_en.png"/>" />
</p>

<h2>Modify Article</h2>

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
<img alt="Modify article test 1" src="<c:url value="/resources/images/edit-article-1_en.png"/>" />
</p>

<p>
<img alt="Modify article test 2" src="<c:url value="/resources/images/edit-article-2_en.png"/>" />
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://docs.hibernate.org/validator/9.1/reference/en-US/html_single/#validator-gettingstarted">Getting started with Hibernate Validator</a></li>
  <li><a href="http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work">http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work</a></li>
  <li><a href="http://stackoverflow.com/questions/6227547/spring-3-validation-not-working">http://stackoverflow.com/questions/6227547/spring-3-validation-not-working</a></li>
  <li><a href="http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found">http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found</a></li>
  <li><a href="http://mybatis.github.io/mybatis-3/getting-started.html">MyBatis Getting started</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/javascript/intro"/>">JavaScript Introduction</a></li>
		<li>Prev : <a href="<c:url value="/spring/spring-security"/>">Spring Security</a></li>
	</ul>
</div>

</article>