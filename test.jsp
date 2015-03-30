<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

DataSource ds = null;

int totalRecord = 0;

try {
	Context ic = new InitialContext();
	Context envCtx = (Context) ic.lookup("java:comp/env");
	ds = (DataSource) envCtx.lookup("jdbc/jsppjt");
} catch (NamingException e) {
	out.println(e.getMessage());
}

try {
	con = ds.getConnection();
	
	String sql = "SELECT count(*) FROM board";
	
	pstmt = con.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	rs.next();
	totalRecord = rs.getInt(1);
} catch(SQLException e) {
	out.println(e.getMessage());
} finally {
	try {
		rs.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
	try {
		pstmt.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
	try {
		con.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataSource Test</title>
</head>
<body>
<%=totalRecord %>
</body>
</html>