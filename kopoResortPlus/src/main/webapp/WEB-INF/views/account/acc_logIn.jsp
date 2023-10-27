<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body background="./img/wall.jpg">
    <div align="center" style="margin-top:300px">
    	<% if ((Long)session.getAttribute("admin_auth") == null) { %>
            <h2 style="margin-top: 250px;">로그인</h2>
            <br>
            <form method="post" action="/accLogChk">
                <table style="border-collapse: separate; border-spacing: 0; background-color: white; height: 120px; width: 350px; border: 1px solid black;">
                    <tr align="center">
                        <td>아이디</td>
                        <td><input type="text" name="id"></td>
                    </tr>
                    <tr align="center">
                        <td>비밀번호</td>
                        <td><input type="password" name="passwd"></td>
                    </tr>
                    <tr align="center" height="40px">
                        <td><input type="submit" value="로그인"></td>
                    	<td><input type="button" value="회원가입" Onclick="location.href='/accCreate'"></td>
                    </tr>
                </table>
            </form>
        <% } else if ((Long)session.getAttribute("admin_auth") == 1 && "in".equals((String)session.getAttribute("login_stat"))) { %>
            <h2>관리자 인증 상태입니다.</h2>
            <table style="border-collapse: separate; border-spacing: 0; background-color: white; height: 150px; width: 300px; border: 1px solid black;">
	            <tr height="70">
	           	 	<td align="center"> 관리자 <b>'<%= session.getAttribute("id") %>'</b> 인증됨</td>
	       	 	</tr>
	       	 	<tr>
		            <td align="center"><input type="button" value="관리자 페이지로 이동" onclick="location.href='/admView'" /></td>
		        </tr>
		        <tr>
		            <td align="center"><input type="button" value="로그아웃" Onclick="location.href='/accLogOut'"></td>
		        </tr>
            </table>
        <% } else if((Long)session.getAttribute("admin_auth") == 0 && "in".equals((String)session.getAttribute("login_stat"))) { %>
        	<h2>로그인 상태입니다.</h2>
            <table style="border-collapse: separate; border-spacing: 0; background-color: white; height: 150px; width: 300px; border: 1px solid black;">
	          	 <tr height="70">
	           	 	<td align="center"> <b>'<%= session.getAttribute("id") %>'</b> 회원님</td>
	       	 	</tr>
	          	<tr>
		            <td align="center"><input type="button" value="로그아웃" Onclick="location.href='/accLogOut'"></td>
		        </tr>
            </table>
        <% } %>
    </div>
</body>
</html>
