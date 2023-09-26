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
        <% if ("yes".equals(session.getAttribute("login_ok"))) { %>
            <h2>관리자 인증 상태입니다.</h2>
            <table style="border-collapse: separate; border-spacing: 0; background-color: white; height: 150px; width: 300px; border: 1px solid black;">
	            <tr height="70">
	           	 	<td align="center">관리자 <b>'<%= session.getAttribute("login_id") %>'</b> 인증됨</td>
	       	 	</tr>
	       	 	<tr>
		            <td align="center"><input type="button" value="관리자 페이지로 이동" onclick="location.href='/admView'" /></td>
		        </tr>
		        <tr>
		            <td align="center"><input type="button" value="로그아웃" Onclick="location.href='/admLogOut'"></td>
		        </tr>
            </table>
        <% } else { %>
            <h2 style="margin-top: 250px;">관리자 로그인</h2>
            <br>
            <form method="post" action="/admLogChk">
                <table style="border-collapse: separate; border-spacing: 0; background-color: white; height: 120px; width: 300px; border: 1px solid black;">
                    <tr align="center">
                        <td>아이디</td>
                        <td><input type="text" name="id"></td>
                    </tr>
                    <tr align="center">
                        <td>비밀번호</td>
                        <td><input type="password" name="passwd"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" height="40px"><input type="submit" value="로그인">
                        <c:choose>
						    <c:when test="${check eq true}">
						    </c:when>
						    <c:otherwise>
						    	<input type="button" value="관리자 생성" onclick="location.href='/genAdmin'" />
						    </c:otherwise>
						</c:choose>
						</td>
                    </tr>
                </table>
            </form>
        <% } %>
    </div>
</body>
</html>
