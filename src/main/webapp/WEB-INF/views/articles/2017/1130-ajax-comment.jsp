<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Ajax 댓글</title>
<meta name="Keywords" content="java,spring mvc,스프링 MVC,ajax,댓글,comment" />
<meta name="Description" content="Ajax 댓글" />
<link rel="stylesheet" href="../../../../static/css/korean.css" type="text/css" />
<link rel="stylesheet" href="../../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../../static/css/prettify.css" type="text/css" />
<script src="../../../../static/js/jquery.js"></script>
<script src="../../../../static/js/commons.js"></script>
<script src="../../../../static/js/prettify.js"></script>
<script src="../../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 2025.5.5</div>
	
<h1>Ajax 댓글</h1>

<p>
<span class="repository">https://github.com/kimjonghoon/ajax-comment</span>
</p>

<p>
게시판에 올라온 동영상에 대한 댓글을 작성한다고 가정하자.<br />
동영상을 보면서 댓글을 전송할 때 동영상이 멈추지 않게 하려면 애이잭스를 사용해야 한다.<br />
예제는 데이터베이스를 사용하지 않으니 바로 실행할 수 있다.
</p>


<h3>실행 방법</h3>

<pre class="shell-prompt">
mvn jetty:run
</pre>

</article>

</body>
</html>