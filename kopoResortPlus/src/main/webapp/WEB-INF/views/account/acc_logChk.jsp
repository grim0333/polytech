<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> 로그인 체크 </title>
	</head>
	<body background="./img/wall.jpg">
		<div align="center" style="margin-top:300px;">
		<%
		    boolean accChk = (boolean)request.getAttribute("check");
		    String id = (String)request.getAttribute("id");
		    Long auth = (Long)request.getAttribute("auth");
		    if(accChk){
		    	session.setAttribute("login_stat", "in");
		    	session.setAttribute("id", id);
		    	session.setAttribute("admin_auth", auth);
		    	response.sendRedirect("/main");
		    }else{
		    	out.println("<h2 align='center'>아이디 또는 패스워드 오류.</h2>");
		    	out.println("<input type='button' value='로그인' Onclick=\"location.href='/main'\"/>");
		    }
		%>
		</div>
	</body>
</html>