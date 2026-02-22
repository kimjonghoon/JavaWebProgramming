<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>빈 검증</h1>

<p>
Spring MVC 프로젝트에서 폼 입력에 바인딩되는 빈을 검증하는 예제를 실습한다.
실습 과정은 다음과 같다.
</p>

<ol>
  <li>Hibernate Validator 의존 라이브러리를 pom.xml에 추가</li>
  <li>폼 입력에 바인딩 되는 자바 빈에 유효성 검사 규칙 선언</li>
  <li>컨트롤러의 요청 핸들러 메소드에 빈 검증 로직 추가</li>
  <li>JSP에 스프링 태그 라이브러리를 적용하여 검사 에러가 출력되도록 수정</li>
</ol>

<h2>회원 가입</h2>

<p>
Hibernate Validator 의존 라이브러리를 pom.xml에 추가한다.
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
pom.xml의 내용이 변경되었으니 컨텍스트 메뉴의 Maven - Update Project Cofiguraion을 실행하여 이클립스와 동기화한다.<br /> 
빈 검증은 스프링 설정 파일에 &lt;mvc:annotation-driven /&gt; 설정이 필요하다.<br /> 
web.xml에 요청 파라미터의 캐릭터 셋을 "UTF-8"로 바꾸는 필터가 설정되어 있는지 확인한다.
</p>

<p>
회원 가입 폼 입력에 바인딩되는 빈에 빈 검증 어노테이션을 사용하여 검사 규칙을 선언한다.
</p>

<h6 class="src">User.java</h6>
<pre class="prettyprint">
<strong>import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Size(min=5, message="이메일 형식이 아닙니다.")
@Email(message="이메일 형식이 아닙니다.")</strong>
private String email;
<strong>
@Size(min=4, message="패스워드는 4자 이상이어야 합니다.")</strong>
private String passwd;
<strong>
@Size(min=2, message="이름은 2자 이상이어야 합니다.")</strong>
private String name;
<strong>
@Size(min=6, max=20, message="모바일폰 번호형식이 아닙니다.")</strong>
private String mobile;
</pre>

<p>
회원 가입 폼 페이지로 포워딩하는 요청 핸들러 메소드(아래 첫 번째 signUp() 메소드)에 내용이 없는 빈 객체(User 객체)를 생성해 뷰에 전달해야 한다.<br />
(이건 스펙이니 따라야 한다)<br />
회원 가입을 처리하는 요청 핸들러 메소드(아래 두 번재 signUp() 메소드)에 빈 검증 로직을 추가한다.<br />
두 번재 signUp() 메소드의 매개 변수 리스트에서 @Valid 어노테이션이 적용된 매개 변수 다음에는 반드시 BindingResult 타입의 매개 변수를 선언해야 한다.<br />
그렇지 않으면 HTTP 400 에러가 발생한다.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
import javax.validation.Valid;
import org.springframework.validation.BindingResult;

@RequestMapping(value="/signUp", method=RequestMethod.GET)
public String signUp(<strong>Model model</strong>) {
  <strong>model.addAttribute("user", new User());</strong>
    
  return "users/signUp";
}

@RequestMapping(value="/signUp", method=RequestMethod.POST)
public String signUp(<strong>@Valid</strong> User user, <strong>BindingResult bindingResult</strong>) {
  <strong>if (bindingResult.hasErrors()) { //검증에 실패한 빈은 BindingResult에 담겨 뷰에 전달</strong>
    <strong>return "users/signUp";</strong>
  <strong>}</strong>
  
  //...중간 생략...
}
</pre>

<p>
JSP를 아래를 참고하여 수정한다.<br />
&lt;sf:errors&gt; 태그는 사용자에게 검증 에러를 표시하는 스프링 폼 태그이다.
</p>


<h6 class="src">signUp.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="signUpForm" action="signUp" method="post" <strong>modelAttribute="user"</strong> onsubmit="return check();"&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
  &lt;td style="width: 200px;"&gt;이름(Full Name)&lt;/td&gt;
  &lt;td style="width: 390px"&gt;
    <strong>&lt;sf:input path="name" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="name" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;비밀번호(Password)&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="passwd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="passwd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2" style="text-align: center;font-weight: bold;"&gt;
    Email이 아이디로 쓰이므로 비밀번호는 Email계정 비밀번호와 같게 하지 마세요.
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;비밀번호 확인(Confirm)&lt;/td&gt;
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
  &lt;td&gt;손전화(Mobile)&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="mobile" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="mobile" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="전송" /&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
스타일 시트에 에러 메시지를 위한 스타일을 추가
</p>

<pre class="prettyprint">
.error {
  color: red;
}
</pre>

<h3>테스트 화면</h3>

<p>
<img alt="가입 페이지 방문" src="<c:url value="/resources/images/sign-up-1.png"/>"/><br />
<img alt="빈 검증 실패" src="<c:url value="/resources/images/sign-up-2.png"/>" /><br />
</p>


<h2>내 정보 수정</h2>

<p>
컨트롤러의 요청 핸들러에 빈 검증 로직을 추가한다.
요청 핸들러의 매개 변수 리스트에서 @Valid User user 다음은 곧이어 BindingResult bindingResult를 선언해야 한다. 
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
RequestMapping(value="/editAccount",method=RequestMethod.POST)
public String editAccount(<strong>@Valid</strong> User user, <strong>BindingResult bindingResult</strong>, Principal principal) {
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

<p>
JSP 파일을 아래를 참조해 수정한다.
&lt;sf:errors&gt; 태그는 사용자에게 검증 에러를 표시하는 스프링 폼 태그이다.
</p>

<h6 class="src">editAccount.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="editAccountForm" action="editAccount" method="post" 
      <strong>modelAttribute="user"</strong> onsubmit="return check();"&gt;
  <strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;이름(Full Name)&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="name" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="name" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;손전화(Mobile)&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:input path="mobile" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="mobile" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;현재 비밀번호(Password)&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="passwd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="passwd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;&lt;input type="submit" value="전송" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<h3>테스트 화면</h3>

<p>
로그인 후, 내 정보 수정 화면에서 기존 정보 값을 모두 지우고 전송한다.<br />
<img alt="내 정보 수정 페이지 방문 후 모든 데이터를 지운다." src="<c:url value="/resources/images/edit-account-1.png"/>"/><br />
<img alt="검증 실패 후 다시 내 정보 수정 페이지" src="<c:url value="/resources/images/edit-account-2.png"/>" /><br />
</p>


<h2>비밀번호 변경</h2>

<p>
비밀번호 검증에 '빈 검증'을 사용하려면 비밀번호를 위한 클래스를 만들어야 한다.
</p>

<h6 class="src">Password.java</h6>
<pre class="prettyprint">
package net.java_school.user;

import javax.validation.constraints.Size;

public class Password {

  @Size(min=4, message="패스워드는 4자 이상이어야 합니다.")
  private String currentPasswd;
    
  @Size(min=4, message="패스워드는 4자 이상이어야 합니다.")
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

<p>
비밀번호 페이지로 포워딩하는 요청 핸들러 메소드(아래 첫 번째 changePasswd() 메소드)에 내용이 없는 빈 객체(Password 객체)를 생성해 뷰에 전달해야 한다.
이건 스펙이니 따라야 한다.
비밀번호 변경을 처리하는 요청 핸들러 메소드(아래 두 번재 changePasswd() 메소드)에 빈 검증 로직을 추가한다.
두 번째 changePasswd() 메소드의 매개 변수 리스트에서 @Valid 어노테이션이 적용된 매개 변수 다음에는 반드시 BindingResult 타입의 매개 변수를 선언해야 한다.
그렇지 않으면 HTTP 400 에러가 발생한다. 
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
@RequestMapping(value="/changePasswd", method=RequestMethod.GET)
public String changePasswd(Principal principal, Model model) {
  User user = userService.getUser(principal.getName());
  model.addAttribute("user", user);//아래 테스트 화면처럼 홍길동 11111111을 출력하기 위해 필요
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
    model.addAttribute("user", user);//아래 테스트 화면처럼 홍길동 11111111을 출력하기 위해 필요
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

<p>
아래를 참고하여 JSP를 수정한다.
&lt;sf:errors&gt; 태그는 사용자에게 검증 에러를 표시하는 스프링 폼 태그이다.
</p>

<h6 class="src">changePasswd.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="changePasswordForm" action="changePasswd" method="post"
      <strong>modelAttribute="password"</strong> onsubmit="return check();"&gt;
&lt;table&gt;
&lt;tr&gt;
  &lt;td&gt;현재 비밀번호&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="currentPasswd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="currentPasswd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;변경 비밀번호&lt;/td&gt;
  &lt;td&gt;
    <strong>&lt;sf:password path="newPasswd" /&gt;&lt;br /&gt;</strong>
    <strong>&lt;sf:errors path="newPasswd" cssClass="error" /&gt;</strong>
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;변경 비밀번호 확인&lt;/td&gt;
  &lt;td&gt;
    &lt;input type="password" name="confirm" /&gt;
  &lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td colspan="2"&gt;&lt;input type="submit" value="전송" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
아래는 비밀번호 변경 화면에서 아무것도 입력하지 않고 전송 버튼을 눌렀을 때의 화면이다. (스타일시트에 .error { color: red; }가 추가되어 있어야 한다.) 
<img alt="비밀번호 변경 화면" src="<c:url value="/resources/images/change-passwd-1.png"/>"/><br />
<img alt="빈 검증 실패" src="<c:url value="/resources/images/change-passwd-2.png"/>" /><br />
</p>


<h2>새 글쓰기</h2>

<p>
게시글을 표현하는 Article 클래스를 다음을 참조하여 수정한다.
</p>

<h6 class="src">Article.java</h6>
<pre class="prettyprint">
private Integer articleNo;//int에서 변경

@Size(min=2,max=10,message="게시판코드는 2자에서 10자 사이이어야 합니다.")
private String boardCd;

@Size(min=1,max=60,message="제목은 1자에서 60자 사이이어야 합니다.")
private String title;

@Size(min=1,message="내용은 1자 이상이어야 합니다.")
private String content;

//중간 생략..

public Integer getArticleNo() {
  return articleNo;
}

public void setArticleNo(Integer articleNo) {
  this.articleNo = articleNo;
}
</pre>

<p>
아래에서 writeForm() 메소드는 내용이 없는 빈 객체(Article 객체)를 생성해 뷰에 전달해야 한다.
이건 스펙이니 따라야 한다.
글쓰기를 처리하는 요청 핸들러 메소드(write() 메소드)에 빈 검증 로직을 추가한다.
이 메소드의 매개 변수 리스트에서 @Valid 어노테이션이 적용된 매개 변수 다음에는 반드시 BindingResult 타입의 매개 변수를 선언해야 한다.
그렇지 않으면 HTTP 400 에러가 발생한다.
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
//글쓰기 화면
@RequestMapping(value="/write", method=RequestMethod.GET)
public String writeForm(String boardCd, Model model) {
  String boardNm = boardService.getBoardNm(boardCd);
  model.addAttribute("boardNm", boardNm);//아래 테스트 화면처럼 '자유게시판'을 표시하기 위해
  <strong>model.addAttribute("article", new Article());</strong>
  return "bbs/write";
}

//글쓰기 처리
@RequestMapping(value="/write", method=RequestMethod.POST)
public String write(<strong>@Valid Article article, BindingResult bindingResult,</strong>
      Model model,
      MultipartHttpServletRequest mpRequest,
      Principal principal) throws Exception {
        
  //검증 로직
  if (bindingResult.hasErrors()) {
    String boardNm = boardService.getBoardNm(article.getBoardCd());
    model.addAttribute("boardNm", boardNm);//아래 테스트 화면처럼 '자유게시판'을 표시하기 위해
    return "bbs/write";
  }
    
  //article.setEmail(principal.getName());
  boardService.addArticle(article);

  //파일 업로드 - 기존과 같음

  //파일 데이터 삽입 - 기존과 같음

  return "redirect:/bbs/list?page=1&amp;boardCd=" + article.getBoardCd();
}
</pre>

<p>
아래를 참조해 JSP를 수정한다.
&lt;sf:errors&gt; 태그는 사용자에게 검증 에러를 표시하는 스프링 폼 태그이다.
</p>

<h6 class="src">write.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="writeForm" action="write" method="post" enctype="multipart/form-data" 
      <strong>modelAttribute="article"</strong> onsubmit="return check();"&gt;
&lt;input type="hidden" name="articleNo" value="${param.articleNo }" /&gt;
&lt;input type="hidden" name="boardCd" value="${param.boardCd }" /&gt;
&lt;input type="hidden" name="page" value="${param.page }" /&gt;
&lt;input type="hidden" name="searchWord" value="${param.searchWord }" /&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table id="write-form"&gt;
&lt;tr&gt;
  &lt;td&gt;제목&lt;/td&gt;
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
  &lt;td&gt;파일첨부&lt;/td&gt;
  &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center; padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="전송" /&gt;
  &lt;input type="button" value="목록" onclick="goList()" /&gt;
  &lt;c:if test="${not empty param.articleNo }"&gt;
    &lt;input type="button" value="상세보기" onclick="goView()" /&gt;
  &lt;/c:if&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
아래는 글쓰기 화면에서 아무것도 입력하지 않고 전송 버튼을 눌렀을 때의 화면이다. (스타일시트에 .error { color: red; }가 추가되어 있어야 한다.) 
<img alt="글쓰기 화면" src="<c:url value="/resources/images/new-article-1.png"/>"/><br />
<img alt="빈 검증 실패" src="<c:url value="/resources/images/new-article-2.png"/>" /><br />
</p>


<h2>글 수정</h2>

<p>
게시글을 표현하는 Article 클래스의 수정은 '글쓰기에서 빈 검증'에서 다루었다.
</p>

<p>
아래에서 modifyForm() 메소드는 내용이 없는 빈 객체(Article 객체)를 생성해 뷰에 전달해야 한다.
이건 스펙이니 따라야 한다.
게시글 수정을 처리하는 메소드(아래 modify() 메소드)에는 빈 검증 로직을 추가한다.
이 메소드의 매개 변수 리스트에서 @Valid 어노테이션이 적용된 매개 변수 다음에는 반드시 BindingResult 타입의 매개 변수를 선언해야 한다.
그렇지 않으면 HTTP 400 에러가 발생한다.
</p>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
//수정 페이지 포워딩
@RequestMapping(value="/modify", method=RequestMethod.GET)
public String modifyForm(Integer articleNo, String boardCd, Model model) {
  
  Article article = boardService.getArticle(articleNo);
  String boardNm = boardService.getBoardNm(article.getBoardCd());

  //수정페이지에서의 보일 게시글 정보
  <strong>model.addAttribute("article", article);</strong>
  model.addAttribute("boardNm", boardNm);//아래 테스트 화면처럼 '자유게시판'을 표시하기 위해
  
  return "bbs/modify";
}

//게시글 수정 처리
@RequestMapping(value="/modify", method=RequestMethod.POST)
public String modify(<strong>@Valid Article article, BindingResult bindingResult,</strong>
    Integer page,
    String searchWord,
    Model model,
    MultipartHttpServletRequest mpRequest) throws Exception {
  //검증 로직
  if (bindingResult.hasErrors()) {
    String boardNm = boardService.getBoardNm(article.getBoardCd());
    model.addAttribute("boardNm", boardNm);//아래 테스트 화면처럼 '자유게시판'을 표시하기 위해
    return "bbs/modify";
  }

  //관리자가 수정하더라도 글 소유자를 유지
  String email = boardService.getArticle(article.getArticleNo()).getEmail();
  article.setEmail(email);

  boardService.modifyArticle(article);

  //파일 업로드 -기존과 같음..

  //파일데이터 삽입 중 setArticleNo(articleNo)를 setArticleNo(article.getArticleNo())로

  searchWord = URLEncoder.encode(searchWord, "UTF-8");
    
  return "redirect:/bbs/view?articleNo=" + article.getArticleNo() +
    "&amp;boardCd=" + article.getBoardCd() +
    "&amp;page=" + page +
    "&amp;searchWord=" + searchWord
}
</pre>

<p>
아래를 참조해 기존 JSP 파일을 수정한다.
&lt;sf:errors&gt; 태그는 사용자에게 검증 에러를 표시하는 스프링 폼 태그이다.
</p>

<h6 class="src">modify.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;</strong>

<strong>&lt;sf:form</strong> id="modifyForm" action="modify" method="post" <strong>modelAttribute="article"</strong>
        enctype="multipart/form-data" onsubmit="return check()"&gt;
&lt;input type="hidden" name="articleNo" value="${param.articleNo }" /&gt;
&lt;input type="hidden" name="boardCd" value="${param.boardCd }" /&gt;
&lt;input type="hidden" name="page" value="${param.page }" /&gt;
&lt;input type="hidden" name="searchWord" value="${param.searchWord }" /&gt;
<strong>&lt;sf:errors path="*" cssClass="error" /&gt;</strong>
&lt;table id="write-form"&gt;
&lt;tr&gt;
  &lt;td&gt;제목&lt;/td&gt;
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
  &lt;td&gt;파일첨부&lt;/td&gt;
  &lt;td&gt;&lt;input type="file" name="attachFile" /&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;div style="text-align: center;padding-bottom: 15px;"&gt;
  &lt;input type="submit" value="전송" /&gt;
  &lt;input type="button" value="상세보기" onclick="goView()" /&gt;
&lt;/div&gt;
<strong>&lt;/sf:form&gt;</strong>
</pre>

<p>
아래는 수정 화면에서 입력 필드에 모두 지우고 전송 버튼을 눌렀을 때의 화면이다. (스타일시트에 .error { color: red; }가 추가되어 있어야 한다.) 
<img alt="수정 화면" src="<c:url value="/resources/images/modify-article-1.png"/>"/><br />
<img alt="빈 검증 실패" src="<c:url value="/resources/images/modify-article-2.png"/>" /><br />
</p>

<span id="refer">참고</span>
<ul id="references">
  <li><a href="https://docs.hibernate.org/validator/9.1/reference/en-US/html_single/#validator-gettingstarted">Getting started with Hibernate Validator</a></li>
  <li><a href="http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work">http://stackoverflow.com/questions/14715248/simple-springmvc-3-login-doesnt-work</a></li>
  <li><a href="http://stackoverflow.com/questions/6227547/spring-3-validation-not-working">http://stackoverflow.com/questions/6227547/spring-3-validation-not-working</a></li>
  <li><a href="http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found">http://stackoverflow.com/questions/8909482/spring-mvc-3-ambiguous-mapping-found</a></li>
  <li><a href="http://mybatis.github.io/mybatis-3/getting-started.html">MyBatis Getting started</a></li>
</ul>

<div id="next-prev">
	<ul>
		<li>다음 : <a href="<c:url value="/javascript/intro"/>">자바스크립트 소개</a></li>
		<li>이전 : <a href="<c:url value="/spring/spring-security"/>">스프링 시큐리티</a></li>
	</ul>
</div>

</article>