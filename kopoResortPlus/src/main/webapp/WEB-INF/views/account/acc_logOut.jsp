<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
</head>
<script>
	function log() {
    	return alert("로그아웃 되었습니다.");
  	}
</script>
</head>
<body>
<%
	if(session != null){
		session.invalidate();
%>
	<script>
	log();
	window.onload = function() {
		top.location.href = "index.html";
	}
	</script>
<%
	} else {
		out.println("<h2 align='center'>로그아웃 오류.</h2>");
    	out.println("<input type='button' value='돌아가기' Onclick=\"location.href='/main'\"/>");
	}
%>
	
</body>
</html>