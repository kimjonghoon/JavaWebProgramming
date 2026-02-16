<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Bean Validation - Sign Up</h1>

<h2>Sign Up</h2>

<p>
Add Hibernate Validator dependency to pom.xml.
</p>

<h6 class="src">pom.xml</h6>
<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-validator --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;org.hibernate&lt;/groupId&gt;
  &lt;artifactId&gt;hibernate-validator&lt;/artifactId&gt;
  &lt;version&gt;6.2.5.Final&lt;/version&gt;
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
<img alt="Sign Up" src="https://lh3.googleusercontent.com/x9fu3nCqMzHBBm2cgastO0tuXZgi4jRNHVMAA8qa5r2soXtjxhMpVfgvk7C_LhCyOwXuoDxC6wcLkZCkUGtxUW3VCEPJrgHda-kK8lmMi2t9-q_DXRDmSohIHRUrPtIFb-cLEPUL2a6wzEiWUl87aXvUrbNAp6RpNeoBJjyjMcDXCBAk0WFEx63RCD93VYBZDpt5QyytIX7Mz-mXQq8XCKpaWcQs_APtYIdjEb3psN9OY7fS_haRV737cKCqC96pQcG74AuvbqmomZ2wIH8G5l5ud-DmO7i4-fmhA1Fl96ZaW4kgavILn_hpFW8gLICEI9p7BwDG5zQJbemzXwmpi15sU50bnrYsC1pIJjUv7vkuDh1y0S1LtKvJfJGU8AKvViBWpKcGUkW-40jV8cpf1TP2n_ylX2VqL3UqvBGCe6KAd9G_LjMLzmjsKEnpSOcFVELcpnoOfa0wZdwp0SsvDcZTLBWJkoR-V-As7v-mvnSBisIF0g8ZYSGZAzY7JNtAgm0S8tQd1RLyzwE1Su7crfTn0zXhGvhEhbxobSIPvxy2IXARZGEH3Rd4QJxARyjfzzAUYMH7812P2HPuHSwRtXtlvNvZwF3O7rQpmII=w513-h258-no" />
</p>

<p>
<img alt="Bean validaion failed" src="https://lh3.googleusercontent.com/pUTL1EQtTUYOMD9Hyu4UjAKWMogymyC_9sLcGez97htYKPiMgiYlyq0i43yw2XIu8Mq6EZs54FbO8ZBnbmGxIAJY7O90JbHrI58tK6Ob-iG693Us2-R7pXvBchI5PFXpy8RChnWIft7x87YOt9cASPT8FC239j0TOgQ64WTswd6NyuiTDvM5YSnj4CnuyXZaJwnul4UrYNKLmycS1iIF-pXYXYU5WUyV3DeqiIQ5dx85ZKKlrx01lxP0GLA59YGKdb3bpoOeNvMvhcEXeE9g1T_5w1Xpnl2NhuNOL84Ob9DvA8t1mnP6gLN6psz9x2x7shQtdU5z1iiawGvswxLBbk9YkuyWvmasuYgA_gcOFADZCpmFGcetlYf_uqhYnotq1Megw_vuPxebmFDgCQlhXKp5i1eS7ox7aY6ZC5Z2vIlyWi7stbkowWQ6zA8ojDRw4ZYFSl8MuWfORDTr8kSLiYNuoPXjO7RVr3lU_Hg79uSFEMytpU1mrx4OkbdJyOSmXFUKEvfxevVh4PcjsPjKlNHmRI3Ne8WmKFyZ1KPKE4UKhnpZzNsd0bxMPecCdd23mohQQJWwhaLRhCw1-5lyV6mGqv8bFvrmGlGJtUQ=w516-h389-no" />
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

<h2>Bean Validation - Edit Account</h2>

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
<img alt="modify account test 1" src="https://lh3.googleusercontent.com/fNMbzaoKIUWHB7OCiRe4J0kEB_4d1tD7a3hunE5XbVeOiRkY2VYwoA5Hkr5SnzDghjdIa1VWjvnhg67QcynkCoJ3Hr2CaKrP1i6ndTVOXyivJRtT_wenqY98QWr8fvUokcFsEvOr5ZPCpFph87a7dOHyR-kRp58yFqRR9w0-FSDhdIaKrykqim6xXRVXld5qW5kqkYI0vMP579GvGLthQNfq8m9pjrYTayvIAG-oP1j4-SjlV4A-bt9AEf10N5nfi-c4_fQBohwxOAhACXOAiihdo_CIbXMfe4e5CymK9Yw1tn4nGOCHJgojFFZDqWtRsBWGWmgTwY8o_dAw7Tdggu8UUH9ylSgyTfiTkDaOI03JNAOGdWaA-YZvj0mE_y-yujxXXmI5m7gUPfFn9GRs0XKtybQW_V3QUOI_ir__D1MpdObO2tN9zURjK1AtrjrqYdYM59e211D83moP_1-PxRC5SAxb2Gz7QohH51WN3d7B7jZkE3L_PGkZdh_Tf7hY6h1Kq0QwM-2Kqbm8-Y8DhyowwlMyWOUbbuHkgDh4Y93nIMr-EDG_9UNIQVwaIb7EnPAtA_tc0wP5TX0eLtozqjIYjM-_m2I2lGUu2oU=w541-h195-no" />
</p>

<p>
<img alt="modify account test 2" src="https://lh3.googleusercontent.com/V1wB9uzW0Wm0kqAIz1ePqBT2ib515kaoyxLaIipoRUra6saZJQ-T-IcU2ORfrGPFW5uw51P2wEskuGXuNOh2jsGdUTyNuTEd-st9Xw1tB7yHq3VP3SLg-E4bS6P7836a2trkzN3o4OYlON6iyZYwoCuDins8gFZToWyNZ6upLPSxoAQZSD6v4Gktjdschvbyks6QlQz17Lq27Io_niZFkaOLJrjyZ5CvlscWplsPBmTxGUkRxrXk9bzW671Y99aJ6QukB21223a0WJplTOPuqqOUfDBq5x8BRwFODNOaU30u99ScZOYEZj2_IsOnNB6YneJDfFC3GQ-bXIli9Nl5fjzPtyZ_pW-OhaSL12FrnpWIamEKpffqjO9xsIaDjK4fqCulbQ5q3K1nEwOIMJdHdxx1Wz1Jv7HHvftmQARBitIr8J_x0IjXRrcriuTeLkMT4TWgk0bhp539ReozVq3RiDX5z6ckRVcobvwpoFMZ2i1FpzN-oKmOJ5Xy-LVwPRE3HjWWlMwpUrIh6oj77w9gK09BFRYVpCxZyjO-CjjRvXIb3VlSoWZt83bE8pVh6wM-Bmcro_oTxIrPaS4Yqv_8oJEmprnATQHsTzOSBJw=w550-h322-no" />
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

<h2>Bean Validation - Change Password</h2>

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
<img alt="Change password test 1" src="https://lh3.googleusercontent.com/0KJpiaAis48TT2dr5_gw86b3nwpHFttzaT5zmzbTLMDQnZmy6oa0Puwip7LSK6domksAqK80lTdxK9fSUjpTui0F-3RgIgHZxBc5l3OReMBh-VNhpM5B8wM1PZ5w21Cp6c5C6Ez2HXX_ZFEBm22Z-BKiHH9w6_NRR7asuz2qwTsQbPnP5pSR8tl30Q5KgA4NosR1fw3IP58inAe_c_LN0uWDlR9yiun279PCkSoO1jGxPjoKlhuKiBzHZ0ES3lcW0-27iK_NaYw0nnl3RWs1CqbMmvvCoKZCuobFWYyeqw0j7jP5ANb8Jqk8-_6o4r_xbCPpsDS8_fE0R8ZzD7pRfhwuX7cfs6faeWoclNi0RYv8HOmJR3hQAtEh-sXPVRd-dQQD8sbq7DQg44lm0JEO-r5Rkyrkw6DeggQ5J_HJOH-u2cOiVqr5Xh2YwXCRZ1F3QyFOfsfCORep1xsu21TEWxx6KCLUDU9-UMcM7JVQYg4h9QuHbD7zj9ecCgQi9pTOgWz223ls0n5c8yNIt1RpbYhjiHKNsVCoJQzSX0qnPOdMb66Cv6enzs4SN16StwyNT8ty9Hi8rdkjarQ4zIAybwpw6zy4P4kTDAkhzog=w305-h207-no" />
</p>

<p>
<img alt="Change password test 2" src="https://lh3.googleusercontent.com/oViWmGzPPcFDlKJfFNssq2Td196p-11fhl34PgsTvcEZbJqY3ZXTxK6tPp9myrh_Np0iQmD-pm856zKtV25grIfNLLZsMpnAEzFEddV8467aEXfyUAq_SFGzogxnBfcinYi8e2PiA3r5rBv9Xykoxyf5NU01TJdMK7LffmWyLLPfr-_R2ieLjPPtyZWcARNdIQeWTLHbJC9QWPiKlnMQ6hND3hctKD-N9Rx7Ynx7SuzrsVRwcWe_FJ1wEzoiwcLkQPARByuNmmvCCasLqUaqQtba-WODZwI8lLFKfnx38aIue0cEgnwUHFNJAZXQd_aXKgUWWR81ybX_V5KrhQpQUCEdcM69W2INAgP07WqloWZGop1MrXNa1Un1BnWewbnvbiPNXMC_cLuJ1l75386OCuVfGDHgr6nzLCBMtIsgQw0W7BaY3pjpJIGtM-4hBR39swUaP2KhQZpUlgp1GlcR_AtZLdIVsVzdYIpHBoFLAJkdaBzGAwP9FFHqFrBVTBmcasAm1si-fA2Digo6dJSSJJe3q-SYx4kkOohqGvlMLCALN1kp3VtXYd70OJ4NUS0iMPcfl-CKGgAleh1oQ_X0duVfkOnYMxCZqa6qlrs=w416-h240-no" />
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

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/javascript/intro"/>">JavaScript Introduction</a></li>
		<li>Prev : <a href="<c:url value="/spring/spring-security"/>">Spring Security</a></li>
	</ul>
</div>

</article>