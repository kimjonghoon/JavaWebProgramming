<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.java_school.user.User"%>
<%
String url = request.getParameter("url");
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");

session.setAttribute("user", new User(email, passwd, "홍길동", "010-1234-5678"));
if (url != null && !url.equals("")) {
    response.sendRedirect(url);
} else {
    response.sendRedirect("../bbs/list.jsp?boarCd=free&curPage=1");
}
%>