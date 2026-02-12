<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Objectify</h1>

<p>
Objectify is a Java API created for Datastore, a NoSQL database created by Google, and the official repository of Google Cloud.
</p>

<h3>How to use Objectify</h3>

<p>
Add the following to the dependencies in pom.xml.
</p>

<pre class="prettyprint">
&lt;dependency&gt;
  &lt;groupId&gt;com.google.guava&lt;/groupId&gt;
  &lt;artifactId&gt;guava&lt;/artifactId&gt;
  &lt;version&gt;23.0&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
  &lt;groupId&gt;com.googlecode.objectify&lt;/groupId&gt;
  &lt;artifactId&gt;objectify&lt;/artifactId&gt;
  &lt;version&gt;5.1.22&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Create a helper class as belows.
</p>

<pre class="prettyprint">
package net.java_school.guestbook;

//..Omit..

public class OfyHelper implements ServletContextListener {
  public static void register() {
    ObjectifyService.register(Guestbook.class);
    ObjectifyService.register(Greeting.class);
  }

  public void contextInitialized(ServletContextEvent event) {
    //This will be invoked as part of a warmup request, or the first user
    //request if no warmup request was invoked.
    register();
  }

  public void contextDestroyed(ServletContextEvent event) {
    //App Engine does not currently invoke this method.
  }
}
</pre>

<p>
Add the following to the web.xml.
</p>

<pre class="prettyprint">
&lt;!-- [START Objectify] --&gt;
&lt;filter&gt;
  &lt;filter-name&gt;ObjectifyFilter&lt;/filter-name&gt;
  &lt;filter-class&gt;com.googlecode.objectify.ObjectifyFilter&lt;/filter-class&gt;
&lt;/filter&gt;
&lt;filter-mapping&gt;
  &lt;filter-name&gt;ObjectifyFilter&lt;/filter-name&gt;
  &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;
&lt;listener&gt;
  &lt;listener-class&gt;net.java_school.guestbook.OfyHelper&lt;/listener-class&gt;
&lt;/listener&gt;
&lt;!-- [END Objectify] --&gt;
</pre>

<p>
The guestbook archetype uses Objectify, so it already has the above configuration.
</p>

<h3>Delete Greetings</h3>

<p>
Let's look at the Objectify code snippets implemented in the guestbook.jsp to add new code.
</p>

<h6 class="src">Fetch List</h6>
<pre class="prettyprint">
List&lt;Greeting&gt; greetings = ObjectifyService.ofy()
  .load()
  .type(Greeting.class) //We want only Greetings
  .ancestor(theBook)    //Anyone in this book
  .order("-date")       //Most recent first - date is indexed.
  .limit(5)             //Only show 5 of them.
  .list();
</pre>

<h6 class="src">Save Entity</h6>
<pre class="prettyprint">
ObjectifyService.ofy().save().entity(greeting).now();
</pre>

<p>
The followings are the code to add.
</p>

<h6 class="src">Delete Entity</h6>
<pre class="prettyprint">
ObjectifyService.ofy().delete().key(<em>key</em>).now();
</pre>

<p>
Here, the <em>key</em> is the unique key of the entity. You can obtain the unique key with the following code.
</p>

<pre class="prettyprint">
Key.create(theBook, Greeting.class, id);
</pre>

<p>
With the above code, you can get the unique key of each Greeting object in the guestbook.jsp. Add the following method to the Greeting class to make getting the key easy:
</p>

<pre class="prettyprint">
public Key&lt;Greeting&gt; getKey() {
  return Key.create(theBook, Greeting.class, id);
}
</pre>

<p>
The type of Key is com.googlecode.objectify.Key. Key has toWebSafeString() method that returns a string with which you can restore Key.
</p>

<p>
Add code to the guestbook.jsp like below.
</p>

<pre class="prettyprint">
// Look at all of our greetings
for (Greeting greeting : greetings) {
  pageContext.setAttribute("greeting_content", greeting.content);
  <strong>pageContext.setAttribute("keyString", greeting.getKey().toWebSafeString());</strong>
	
  //..omit..
</pre>

<p>
Using the keyString stored in pageContext, you can create a link that passes the keyString to the JavaScript function.
</p>

<p>
Add code to the guestbook.jsp like below.
</p>

<pre class="prettyprint">
&lt;p&gt;&lt;b&gt;${fn:escapeXml(greeting_user)}&lt;/b&gt; wrote:&lt;/p&gt;
&lt;blockquote&gt;${fn:escapeXml(greeting_content)}&lt;/blockquote&gt;
<strong>&lt;blockquote&gt;&lt;a href="javascript:del('${keyString }')"&gt;Del&lt;/a&gt;&lt;/blockquote&gt;</strong>
</pre>

<p>
The above code allows non-author users or even non-logged users to delete posts. Spring security tags will enable you to render views based on permissions selectively. To compare a login user with an author, you need to store the author ID in the pageContext.
</p>

<p>
Modify the guestbook.jsp file like below.
</p>

<pre class="prettyprint">
// Look at all of our greetings
for (Greeting greeting : greetings) {
  pageContext.setAttribute("greeting_content", greeting.content);
  pageContext.setAttribute("keyString", greeting.getKey().toWebSafeString());
  String author;
  <strong>String author_id = null;</strong>
  if (greeting.author_email == null) {
      author = "An anonymous person";
  } else {
      author = greeting.author_email;
      <strong>author_id</strong> = greeting.author_id;
      if (user != null &amp;&amp; user.getUserId().equals(author_id)) {
          author += " (You)";
      }
  }
  pageContext.setAttribute("greeting_user", author);
  <strong>pageContext.setAttribute("author_id", author_id);</strong>
    
  //..omit..
</pre>

<p>
You are all ready to compare the login user with the author.
</p>

<p>
Add the code to the guestbook.jsp like below.
</p>

<pre class="prettyprint">
&lt;p&gt;&lt;b&gt;${fn:escapeXml(greeting_user)}&lt;/b&gt; wrote:&lt;/p&gt;
&lt;blockquote&gt;${fn:escapeXml(greeting_content)}&lt;/blockquote&gt;
<strong>&lt;security:authorize access="isAuthenticated() and (#author_id == principal.userId or hasRole('ROLE_ADMIN'))"&gt;</strong>
  &lt;blockquote&gt;&lt;a href="javascript:del('${keyString }')"&gt;Del&lt;/a&gt;&lt;/blockquote&gt;
<strong>&lt;/security:authorize&gt;</strong>
</pre>

<p>
To use the Spring Security tag, add the Spring Security tag library directive to the guestbook.jsp file.
</p>

<pre class="prettyprint">
&lt;%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %&gt;
</pre>

<p>
Add the following JavaScript function to the guestbook.jsp.
</p>

<pre class="prettyprint">
&lt;script type="text/javascript"&gt;
function del(key) {
  var check = confirm('Are you sure you want to delete this greeting?'); 
  if (check) {
    var form = document.getElementById("delForm");
    form.keyString.value = key;
    form.submit();
  }
}
&lt;/script&gt;
</pre>

<p>
Add the following form to the guestbook.jsp.
</p>

<pre class="prettyprint">
&lt;form id="delForm" action="/guestbook/del" method="post" style="display: none;"&gt;
  &lt;input type="hidden" name="keyString" /&gt;
  &lt;input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/&gt;
  &lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt;
&lt;/form&gt;
</pre>

<p>
GuestbookController needs a handler for the "/guestbook/del" request.
</p>

<pre class="prettyprint">
@PostMapping("/guestbook/del")
public String del(String guestbookName, String keyString) {
  Key&lt;Greeting&gt; key = Key.create(keyString);
  ObjectifyService.ofy().delete().key(key).now();
  return "redirect:/guestbook/?guestbookName=" + guestbookName;
}	
</pre>

<p>
The above code only verifies the user on the client side. You can further enhance security by verifying users on the server-side as well. Method security in Spring Security lets you verify that the login user is the author on the server-side. Spring official documentation recommends implementing method security in the service layer.
</p>

<p>
Create a service layer as shown below.
</p>

<h6 class="src">GuestbookService.java</h6>
<pre class="prettyprint">
package net.java_school.guestbook;

import org.springframework.stereotype.Service;

@Service
public interface GuestbookService {
  public void sign(Greeting greeting);
  public void del(Greeting greeting);
}
</pre>

<h6 class="src">GuestbookServiceImpl.java</h6>
<pre class="prettyprint">
package net.java_school.guestbook;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.googlecode.objectify.Key;
import static com.googlecode.objectify.ObjectifyService.ofy;<b><span>//</span>1.</b>

@Service
public class GuestbookServiceImpl implements GuestbookService{
  public void sign(Greeting greeting) {
    ofy().save().entity(greeting).now();<b><span>//</span>1.</b>
  }

  <strong>@PreAuthorize("isAuthenticated() and (#greeting.author_id == principal.userId or hasRole('ROLE_ADMIN'))")</strong><b><span>//</span>2.</b>
  public void del(Greeting greeting) {
    Key&lt;Greeting&gt; key = greeting.getKey();
    ofy().delete().key(key).now();<b><span>//</span>1.</b>
  }
}
</pre>

<p>
1. You need <em>import static com.googlecode.objectify.ObjectifyService.ofy;</em> to use Objectify codes like below:
</p>

<pre class="prettyprint">
ofy().save().entity(greeting).now();
ofy().delete().key(key).now();
</pre>

<p>
2. In the annotation of the del() method, #greeting.author_id calls the getAuthor_id() method of the greeting instance. So you need to add the following getter to Greeting.java:
</p>

<h6 class="src">Greeting.java</h6>
<pre class="prettyprint">
public String getAuthor_id() {
  return author_id;
}
</pre>

<p>
Modify the GuestbookController to use the service layer.
</p>

<h6 class="src">GuestbookController.java</h6>
<pre class="prettyprint">
//omit
import net.java_school.spring.security.GaeUserAuthentication;
import net.java_school.user.GaeUser;
import static com.googlecode.objectify.ObjectifyService.ofy;
//omit
<strong>
@Autowired
private GuestbookService guestbookService;
</strong>
//omit

@PostMapping("/guestbook/sign")
public String sign(String guestbookName, String content, GaeUserAuthentication gaeUserAuthentication) {
  Greeting greeting = null;

  if (gaeUserAuthentication != null) {
    GaeUser gaeUser = (GaeUser) gaeUserAuthentication.getPrincipal();
    greeting = new Greeting(guestbookName, content, gaeUser.getUserId(), gaeUser.getEmail());
  } else {
    greeting = new Greeting(guestbookName, content);
  }

  guestbookService.sign(greeting);

  return "redirect:/guestbook/?guestbookName=" + guestbookName;
}

@PostMapping("/guestbook/del")
public String del(String guestbookName, String keyString) {
  Key&lt;Greeting&gt; key = Key.create(keyString);
  Greeting greeting = ofy().load().key(key).now();
  guestbookService.del(greeting);
  return "redirect:/guestbook/?guestbookName=" + guestbookName;
}
</pre>

<h3>Local Test</h3>

<pre class="cmd">
mvn clean
mvn appengine:run
</pre>

<p>
When not logged users visit the guestbook, they can not see the Del link.
</p>

<p>
<img src="https://lh3.googleusercontent.com/Y6J9Qd40NaGUTxLNIWZ8E83M7_fmWj1-Kq5dMRDSPDnr8-5i7fzT3W5a1D0ttYP0sA-y0NtNZacJ6gewrEq5kww4q2LlcwWzUy6QARgcMLSLiPSE4LBFy7m_VaRNHNdFZI3oGB6208ckmcaAKIt7WHw4ljmN8EWzo-FDEoQ7pHtrJwDL0uX7qp-Yv5_zlk5r8zKwUWVVxD4ebjOFgQYo5ref6LeoCmMy6V0AQfVckKWePr04X52X6lqRgGbM9jTXbqGdTCo0AGwkUxoVDpyeepNEGap0VioGoikFKDblfOAj7GBO8BBiBes3G3YStGTZ7lbs1NnMr61j0hziEkQFUCUrtRHQjTaWKzlie3cpccv2PLy9fzg53lFjrGKswFh2hMSN2_b7puHcudQEeTLOfK0hrjZp_noTIYO9Q0pVkD52Oml6icGWe837cDMYXnpgL2Yu7h8gSfBk07lDJ3K4-kg83FFMo1zukzL8GGbcdkf_pHq_6o-cpxG4Fx-4qQ2XcOE_CpwUUg6uLECRqmY4_vtA7E6_fWnJRZlgfdDmXvKZoZgsNGkQntkl9LuXsDVnQk8DUnAqa7EwEsfquKuGiPmNxxv4edfpi30ObKWYcF5qYP8o_M8o0rLC=w442-h417-no" alt="not login" />
</p>

<p>
Log in as a regular user.
</p>

<p>
<img src="https://lh3.googleusercontent.com/JFIPDnglJq8KtPG5Pv4KMWthG4fUPhGgv2NAYaACQQMxyDzgxKe87titAJKBoTvY-GtcHodBFEZ3C_1u3G6VPuUPqrw65pnxAdxQysd5IP3YCf9FHPBWIOBFHgM6xqb6E87Nm1qQvacYg5kmZg3DUIcydZOwad4JcgFAbNaUmYnnhPG2P95BxyYXqEpAwPXw4BFvJNc0TU36-O3kw2g1mA3ahx9FxbV3AfGdFW-RaTkEKa6NeLlzCehZg7iOWrRw5BXEbTsXkWven_HYHd0PtLrB_Wa1_1qQ7t29OoXL1ox-2HzlkPZNLhqtUmcuVM4JV1OBRQ9efsgne896L2I2i2MdBZffAzWLFLCglvzabSsYhFJ1E-8y8ZFAkylraWxq7MF_cy7jpdHUsaxCLEo6Zgp_uSYc4aO2O88eWrlJIr7pJhlCDy4st8q7XLCeD2LStxEkePbkqKOUBSYpb_wrbsN11N15FpXE67rezkz6J2Dno-5e54JQspx_o3ujA4DZU25iHpgZIwSv3G9lAo0mRz_wWW6zPx7sTZRduMF4fDlA1jEDwUpy1avu89m5xhTT8PESM1hngBxHQIN3GCPRDeQFdqKg6TMuOKMYjsN-_6IV-M5dxPqlIHVZ=w451-h275-no" alt="Normal user login screen" />
</p>

<p>
User can see links to delete his posts.
</p>

<p>
<img src="https://lh3.googleusercontent.com/G0a6f8GgQ4UQJqm9e5TTXIkp-rcViRwt6amF5I0qUtnMx2k0NZfiLDsR8dSFLcDIbKbTYVvBQMbxD91XCHG9vS-QdlorJoV0d2b9l4BShXC9iigRLjR4ZBTdKW1Ecy4uEdm34_S0l08jdJLAiox4eVt-tXqB2g99S2PXb07a6ZWSWeWOUZ09tm6zdsH0Ra8CiHeUHODiMGSZN0khIQIIgGYMYh44ohLm56nDLVs3HaP2NCFFtBlFCa0wKj5zYMk2ZaXRdYYSJRKkSyibwzdQUmKjQ76CpTBzMOCXd2UspMoR6jEkqgQiNr1_F-nKhhcI1117ss_sODQKbGDymaEa__GJj84zAR95YoCzYjf9kSH078CpcCRC7W5mo40qwuQh3LTQbw0tqJZtkl_hg7mQly4r-omP62C1yMRRA6gjDiiR4yRVra6bjrHPY61RbaaxaH8EkdcP2XmykXdASI4ikdbUof-gG1swB_8ZNtRw104NKLPs_kYVIG58szVb6R_NFzGHwNisaqhZoNO8jyZrvCS1J3AIZ_PZLnht6NJjNz7ZQHwcYpEWjka-URrKzOFBwxN0Da1T9brmaM-JAV5EnZYuJrwN67ZEx8vM69NGHFW-VVGHVg3Oenlu=w384-h439-no" alt="Normal user login" />
</p>

<p>
Log out and log in as an administrator.
</p>

<p>
<img src="https://lh3.googleusercontent.com/njUdDdcv3eSIj9LTF1ApHIJ6XgpJLSKKIttSNDJQHDCDLkdDWtzG9nGcFGKwKfl_f8d-rrXSo6KRliovQ7a4haZSjjZKTgpqqftWlXtppbDYJOwFErv4GqgWf3iWE5-eXZovYMBiL5FtRV4sre9JiBNIOk80DZ5RSchiXqICdNOjAeI09lO_IonI6CMNWXgAc21w4LJ2n6k-xlktrfdAK4p73gzesBmTCjpA8-bibwgubs95ym0S1CznUS5MuV2X2sE2rsw9Va6bZWfgdlr8jEYs4vgddmW8m2jMXMcD8qxxLRGhh3KaPl7ofZQsSNtOPkpxi3ybXAjUMX4I4nvWIBJ2orwetlr2ZpKBRZmFNC5Z6XSaEfIeXL0WJT0LNKbEDQz3bku0rmTcz1zI9b9xYhzDFP-wk-ig9qkDXXjFPmwXr5NB2fGNC0cuH-NjX11KZ2hfcltGhuBO9DW5gryVjXcda1Em-2iboPpRuwJNmlmJrvCKVW1dIswuQA8I8MLCfIp8Mb0io-vWYMj-Id90fr_K5r17Q0C-SUabGMJIydxSmsAUgXPLOwUW07bO_4xFIIcqqVzcCO2absJGYgpkSgGv6qnwH4wKBuK5L4Ytu1xG7M5aQ07eBx83=w419-h319-no" alt="Admin user login screen" />
</p>

<p>
An administrator can see the Delete link of all posts.
Delete an article written by an anonymous user.
</p>

<p>
<img src="https://lh3.googleusercontent.com/ctnX35ER0KHhSB_PDCIGtwA71EOlWuPMvpBSQxgbXQ4D33BP-QtH3qgNLQcBuBNTIEBMsM-x-CqlPvzQNE51EP1Rs41IojCjv1qaY0cX2TKH1sj8hP7YblahI3X1KDDDb7h4jqx-6RBUgVrHpRIeJ8fb82jQPlwnuUSLWlQLHTDWU_PWlMAnRbx9_PSAkchzrYMs1by4e6Dlod7w75gv7AMNTOz9-bLshBGxS_lVhX5iPPHYsdwbSsIgOaeJM8QddR7bvq-AYrbFImNaCumP0Jth2bpIyQC3tbwgHCeLPzPjroXJNdIHTcWUe913WvreuqFSfQnixLEZweTlr84wUivwOo8ZOdPicg-MMpnH0IYoCgdZArHjEpgviXpG1zjfcQS0GFg8HUAl8LV-yf9g7wyoavUQUktqaBFEKAFw8emPwhbPJcpmq1NbKJSHSJuB6QGpftgmtCsdnp53Ss9At-658EczNN7QVkLr1IYpP_HFjD5-ebLj_MKSdVS_ycAM8NoWL0GQGHWD2vI4Ako6-QyXlb0C5Wqjkt5OVsNuEcGq2lwuZmvELeTaNsuS4Ub5yd9mN_NFgkVo5LwXnkOQgBWskwdvIu3pzb7idIqGCTMT7JsSeMlXlWwD=w441-h504-no" alt="Admin login" />
</p>

<p>
Confirm that the guestbook system has deleted the article written by the anonymous user.
</p>

<p>
<img src="https://lh3.googleusercontent.com/uIo5pSF4T3-zg8Tndd881s21vj4bUtxQzlQWv8TstMovPWnFHpwP0Kt4XePrssZuL43K2dFBB3uSqsOINBYc6B2CW-hzy7e-Yui_63HpEVW7QH-BX_pJr0HEWaVi2XtD48EjG_hwGWPSANSf5kYPHp0b7LRtVKv4fNFrmDXZz8B1pe27UskkResudM3sjfNSB_zC3zfTDMEWnTnQ_R4SbKmZFzXLpQcxh3J2RoX3LFYNWzIJn6IfYtIBKfiP3yXblbquUkKT_kzkooM4HDl8CS5GBxGdrBPKrzCMg4diqAAqfIYbAF2Wsp-Dm1_cwM8jORaK-guqlyHnrWGXIFm6yyimT3nS01fIlYtWGf4UW8He761T231BqW5RDSigeIxoW7UdVe8Hl7axKciXMLg_wmxUxFmw9dh_m-TCdifS0W7uRkZ4GjGelan4LLRsziQ8V6Ud5jg8Ho9YZsBLFpD87_oCcUCYpuUT0zFNYT_88FprwnKXKARW02YNg9oGD5OgWPffOx4Gt8MdYc8zMgTjS1sFaQLF2m7pcK_seOwo41XRBuRRPtPACckckNFlgL4Mf_QNAWiv9hkXFuGzmpX1Bvq1L484xiifOsowqjUR0ba3QERyzpxlMoQt=w510-h380-no" alt="delete Anomynous user's greeting" />
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://github.com/objectify/objectify/wiki">https://github.com/objectify/objectify/wiki</a></li>
</ul>
</article>