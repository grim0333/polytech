<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
</head>
<body background="./img/wall.jpg">
<%
	session.invalidate();
%>
	<div align="center">
		<h2 style="margin-top: 250px;">로그아웃 되었습니다.</h2>
		<br>
		<input type='button' value='로그인 화면 돌아가기' onclick="location.href='/admLogin'">
	</div>
</body>
</html>