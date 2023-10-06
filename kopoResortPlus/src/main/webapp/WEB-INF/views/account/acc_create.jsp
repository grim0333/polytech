<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>회원가입</title>
    </head>
    <body background="./img/desk.jpg">
    <h1 align="center">회원가입</h1>
    <hr>
        <form method="post" action="/accPost">
        <div align="center">
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
            <!--테이블 생성-->
            <!-- https://mag1c.tistory.com/206 참고 -->
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" value=""></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="text" name="passwd" value=""></td>
                </tr>
                 <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr" value=""></td>
                </tr>
                 <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="telnum" value=""></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" value=""></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="submit" value="완료"></td>
                    <td><input type ="button" value="취소" onclick="location.href='/revList'"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동-->
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>