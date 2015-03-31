<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.user.*"%>
<%@page import="java.net.URLEncoder"%>
<%   
User user = (User) session.getAttribute("user");
if (user == null) {
    //로그인 후 되돌아갈 URL를 구한다.
    String uri = request.getRequestURI();
    String query = request.getQueryString();
    String url = uri;
    if (query != null) url += "?" + query;
    //로그인 페이지로 리다이렉트
    String contextPath= request.getContextPath();
    url = URLEncoder.encode(url, "UTF-8");
    response.sendRedirect(contextPath + "/users/login.jsp?url=" + url);
    return;
}
%>