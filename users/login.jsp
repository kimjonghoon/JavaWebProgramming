<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String url = request.getParameter("url");
if (url == null) url = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="로그인" />
<meta name="Description" content="로그인" />
<title>로그인</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[

function check() {
	//var form = document.getElementById("loginForm");
	//TODO 유효성 검사
	return true;
}

//]]>
</script>
</head>
<body>

<div id="wrap">

    <div id="header">
		<%@ include file="../inc/header.jsp" %>
    </div>
    
    <div id="main-menu">
		<%@ include file="../inc/main-menu.jsp" %>
    </div>
    
	<div id="container">
		<div id="content" style="min-height: 800px;">
			<div id="url-navi">회원</div>

<!-- 본문 시작 -->
<h1>로그인</h1>
<form id="loginForm" action="login_proc.jsp" method="post" onsubmit="return check()">
<p style="margin: 0; padding: 0;">
<input type="hidden" name="url" value="<%=url %>" />
</p>
<table>
<tr>
    <td style="width: 200px;">Email</td>
    <td style="width: 390px"><input type="text" name="email" style="width: 99%;" value="captain@heist.com" /></td>
</tr>
<tr>
    <td>비밀번호(Password)</td>
    <td><input type="password" name="passwd" style="width: 99%;" value="1111" /></td>
</tr>
</table>
<div style="text-align: center;padding: 15px 0;">
    <input type="submit" value="확인" />
    <input type="button" value="회원가입" onclick="location.href='signUp.jsp'" />
</div>
</form>
<!-- 본문 끝 -->
		
		</div>
    </div>
    
	<div id="sidebar">
		<%@ include file="notLoginUsers-menu.jsp" %>
	</div>
    
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>
    
    <div id="footer">
		<%@ include file="../inc/footer.jsp" %>
    </div>
        
</div>

</body>
</html>