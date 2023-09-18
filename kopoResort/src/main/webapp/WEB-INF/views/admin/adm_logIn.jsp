<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title> 로그인 </title>
<%
	String jump = request.getParameter("jump");
%>
</head>
<body>
	<div align="center">
		<h2> 관리자 로그인 </h2>
		<form method="post" action="/admLogChk">
			<table border="1">
				<tr>
					<td> 아이디 </td>
					<td><input type="text" name="id"></td>
				</tr>
                <tr>
                    <td> 비밀번호 </td>
                    <td><input type="password" name="passwd"></td>
                </tr>
                    <td colspan="2" align="center"><input type="submit" value="전송"></td>
			</table>
		</form>
	</div>
</body>
</html>