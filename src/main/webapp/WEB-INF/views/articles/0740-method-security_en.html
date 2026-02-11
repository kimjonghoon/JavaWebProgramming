<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Method Security</title>
<meta name="Keywords" content="java,spring security,method security,@PreAuthorize,hasAnyRole,principal,ROLE_ADMIN,ROLE_USER," />
<meta name="Description" content="This article describes Method Security" />
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

<h1>Method Security</h1>

<p>
Spring recommends you apply method security to the service layer.
</p>

<p>
Modify UserService.java as shown below.
</p>

<h6 class="src">UserService.java</h6>
<pre class="prettyprint">
import org.springframework.security.access.prepost.PreAuthorize;

public int addUser(User user);

public void addAuthority(String email, String authority);

public User login(String email, String passwd);

@PreAuthorize("#user.email == principal.username or hasRole('ROLE_ADMIN')")
public int editAccount(User user);

@PreAuthorize("#email == principal.username or hasRole('ROLE_ADMIN')")
public int changePasswd(String currentPasswd, String newPasswd, String email);

@PreAuthorize("#user.email == principal.username or hasRole('ROLE_ADMIN')")
public void bye(User user);

@PreAuthorize("#email == principal.username or hasRole('ROLE_ADMIN')")
public User getUser(String email);
</pre>

<p>
Modify BoardService.java as shown below.
</p>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public List&lt;Article&gt; getArticleList(String boardCd, String searchWord);

public int getTotalRecord(String boardCd, String searchWord);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public int addArticle(Article article);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public void addAttachFile(AttachFile attachFile);

@PreAuthorize("#article.email == principal.username or hasRole('ROLE_ADMIN')")
public void modifyArticle(Article article);

@PreAuthorize("#article.email == principal.username or hasRole('ROLE_ADMIN')")
public void removeArticle(Article article);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public void increaseHit(int articleNo);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public Article getArticle(int articleNo);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public Article getNextArticle(int articleNo, 
		String boardCd, String searchWord);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public Article getPrevArticle(int articleNo, 
		String boardCd, String searchWord);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public List&lt;AttachFile&gt; getAttachFileList(int articleNo);

@PreAuthorize("#attachFile.email == principal.username or hasRole('ROLE_ADMIN')")
public void removeAttachFile(AttachFile attachFile);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public String getBoardNm(String boardCd);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public void addComment(Comment comment);

@PreAuthorize("#comment.email == principal.username or hasRole('ROLE_ADMIN')")
public void modifyComment(Comment comment);

@PreAuthorize("#comment.email == principal.username or hasRole('ROLE_ADMIN')")
public void removeComment(Comment comment);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public List&lt;Comment&gt; getCommentList(int articleNo);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public AttachFile getAttachFile(int attachFileNo);

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public Comment getComment(int commentNo);
</pre>

<h3>Test</h3>

<p>
After build, visit http://localhost:8080/users/login.<br />
Log in as username: jane@gmail.org, password: 1111.<br />
On the bulletin board list, click on a post written by john@gmail.org.<br />
Click Modify button to go to the modify form page.<br />
On the Modify form screen, edit the content and click the Submit button.<br />
If method security works well, you will see noAuthority.jsp.
</p>

</article>

</body>
</html>
