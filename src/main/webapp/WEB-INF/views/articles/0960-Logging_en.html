<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Logging</h1>

<p>
To see the log messages,
</p>

<p>
1. You should add the following to Appengine-web.xml:
</p>

<pre class="prettyprint">
&lt;system-properties&gt;
  &lt;property name="java.util.logging.config.file" value="WEB-INF/logging.properties"/&gt;
&lt;/system-properties&gt;
</pre>

<p>
2. In the logging.properties file, change .level = WARNING to .level = INFO.
</p>

<p>
In your code, use java.util.logging.Logger as shown below.
</p>

<pre class="prettyprint">
import java.util.logging.Logger;

public class MyClass {
  private static final Logger log = Logger.getLogger(MyClass.class.getName());
  log.info("log message");
  
  // ...
  
}
</pre>

<p>
Users can't use Google Cloud's file system, so they can't stack logs to files. Users can only see log messages at https://console.cloud.google.com/logs.
</p>

<h3>Using logs in the Guestbook example</h3>

<pre class="prettyprint">
//...

<strong>import java.util.logging.Logger;</strong>

public class SignGuestbookServlet extends HttpServlet {
  <strong>private static final Logger log = Logger.getLogger(SignGuestbookServlet.class.getName());</strong>

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    Greeting greeting;

    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    String guestbookName = req.getParameter("guestbookName");
    String content = req.getParameter("content");
    if (user != null) {
      <strong>log.info("Google User: " + user.getUserId() + ":" + user.getEmail() + ":" + user.getNickname());</strong>
      greeting = new Greeting(guestbookName, content, user.getUserId(), user.getEmail());
    } else { 
      greeting = new Greeting(guestbookName, content);
    }
    // Use Objectify to save the greeting and now() is used to make the call synchronously as we
    // will immediately get a new page using redirect and we want the data to be present.
    ObjectifyService.ofy().save().entity(greeting).now();

    resp.sendRedirect("/guestbook.jsp?guestbookName=" + guestbookName);
  }
}
</pre>

<p>
Visit https://your-app-id.appspot.com/guestbook.jsp?guestbookName=default. Click Sign In to sign in to your Google Account. After publishing the guestbook, visit https://console.cloud.google.com/logs to confirm log messages.
</p>

<p>
<img src="https://lh3.googleusercontent.com/WEfrXeXTwD8vue1VPQxlUo50lPBdDXQ3XnOjL6QhczsSZ6W0S0X3wf3dJpA9i0VC-eIORK9q6t6S-UyMYadmVtYFNtL5N2aMuudtZ5dcWgVUq7_2KJuyCIT1vWtMGu4V17Ujr-j0g4x4qPwRlkE6pwTfM6fdwYEu7D83kznJbqBIoeMHT9D-0oNiVm3E5LWGN-U_34cU_fN6JI2OrwzkzsGimYabR_onaRj3bwMjR1pu5DNXXwZ42o3sOFLbbCzxqIthBPz0ewZEDke5pbTRlKRC6NvID6jG-EEpggx_LpvNsMiMNz8tOCbmLNVMJIxBCfLtlPrQVRw4zfrLPzEfBCec1wYPL2J3XNL-SOf1u7pEtIgohjF7nbHILcfVFzFdXXGjDZl9Bsn_ifZY612vFPLaq2YqAY1ntfRnCNcCJylP3z5PXHpJCDjL1vp8fH6v9qMeCzFa0cnoVhuNb3v-JtdkKSlJcpe6DH5NL8qJDARNL_wHURU4iQeagPrsXwEs_Gf7-TXokhCB27yVi2l5OwP0gQss51qj0CZWN5zeDtQc0-E1CxqalAqVmvOSHtDn_UmWPQBTg64Lay1B5DnKU99SBF86NWf4a4qgnZw=w999-h113-no" alt="GAE Logging Test" style="display: block;width: 100%;" />
</p>

<p>
For local tests, the command prompt outputs log messages.
</p>

<span id="refer">References</span>
<ul id="references">
  <li><a href="https://cloud.google.com/appengine/docs/standard/java/logs/">https://cloud.google.com/appengine/docs/standard/java/logs/</a></li>
</ul>
</article>