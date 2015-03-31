<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.User" %>
<%@ page import="net.java_school.user.UserService" %>
<%@ page import="net.java_school.commons.WebContants" %>
<%
request.setCharacterEncoding("UTF-8");

String url = request.getParameter("url");
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");

UserService service = new UserService();
User user = service.login(email, passwd);
if (user == null) {
	//로그인에 실패하면 다시 로그인 화면으로 되돌아간다.
	response.sendRedirect("login.jsp?url=" + url + "&msg=Login-Failed");
} else {
	session.setAttribute(WebContants.USER_KEY, user);
	if (url != null && !url.equals("")) {
	    response.sendRedirect(url);
	} else {
	    response.sendRedirect("../bbs/list.jsp?boarCd=free&curPage=1");
	}
}
%>