<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <div align="center">
    	
        <% if ("yes".equals(session.getAttribute("login_ok"))) { %>
            <h2>관리자 인증 상태입니다.</h2>
            <p>관리자 '<%= session.getAttribute("login_id") %>' 인증됨</p>
            <p><input type="button" value="관리자 페이지로 이동" onclick="location.href='/admView'" /></p>
            <p><input type="button" value="로그아웃" Onclick="location.href='/admLogOut'"></p>
        <% } else { %>
            <h2>관리자 로그인</h2>
            <form method="post" action="/admLogChk">
                <table border="1">
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="id"></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="passwd"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="전송">
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
