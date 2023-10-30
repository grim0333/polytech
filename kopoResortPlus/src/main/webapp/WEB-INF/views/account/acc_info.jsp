<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>회원정보 수정</title>
    <script>
	  const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	</script>
    </head>
    <body background="./img/wall.jpg">
    <h1 align="center">회원정보 수정</h1>
    <hr>
        <form method="post" action="/accPost">
        <div align="center">
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" value=""></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="passwd" value=""></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" value=""></td>
                </tr>
                 <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr" value=""></td>
                </tr>
                 <tr>
                    <td>전화번호</td>
                    <td>
                    	<input type="tel" name="telnum" value="" oninput="hypenTel(this)" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
					</td>
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
                    <td><input type ="button" value="취소" onclick="location.href='main'"></td>
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>