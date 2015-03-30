<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<h1 style="float: left; width:150px;"><a href="../"><img src="../images/ci.gif" alt="java-school logo" /></a></h1>
<div id="memberMenu" style="float: right;position: relative; top: 7px;">
<%
User loginUser = (User) session.getAttribute("user");
if (loginUser == null) {
%>
	<input type="button" value="로그인" onclick="location.href='../users/login.jsp'" />
	<input type="button" value="회원가입" onclick="location.href='../users/signUp.jsp'" />
<%
} else {
%>
	<input type="button" value="로그아웃" onclick="location.href='../users/logout_proc.jsp'" />
	<input type="button" value="내정보수정" onclick="location.href='../users/editAccount.jsp'" />
<%
}
%>
</div>
