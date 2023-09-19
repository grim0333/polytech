<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
</head>
<body>
<%
	session.invalidate();
	out.println("<h2>로그아웃 되었습니다.</h2>");
	out.println("<input type='button' value='메인페이지' onclick=\"location.href='/admLogin'\"/>");
%>
</body>
</html>