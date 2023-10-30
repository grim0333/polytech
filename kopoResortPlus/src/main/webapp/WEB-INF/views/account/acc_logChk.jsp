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
		    }else{
		    	out.println("<h2 align='center'>아이디 또는 패스워드 오류.</h2>");
		    	out.println("<input type='button' value='로그인' Onclick=\"location.href='/main'\"/>");
		    }
		%>
		<script>
		  // 페이지 로드 후 실행되는 코드
		  window.onload = function() {
		    // top.location을 이용하여 상위 프레임의 위치를 변경
		    top.location.href = "index.html";
		  }
		</script>
		</div>
	</body>
</html>