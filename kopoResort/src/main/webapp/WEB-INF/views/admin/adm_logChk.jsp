<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title> 로그인 체크 </title>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pass = request.getParameter("passwd");
    
    boolean bPassChk = false;
    
    if(id.replaceAll(" ","").equals("admin") && pass.replaceAll(" ", "").equals("admin")) {
    	bPassChk = true;
    }else{
    	bPassChk = false;
    }
    
    if(bPassChk){
    	session.setAttribute("login_ok", "yes");
    	session.setAttribute("login_id", id);
    	response.sendRedirect("/admView");
    }else{
    	out.println("<h2>아이디 또는 패스워드 오류.</h2>");
    	out.println("<input type='button' value='로그인' onclick=\"location.href='/admView'\"/>");
    }
%>
</head>
<body>
</body>
</html>