<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
        <title>글 보기</title>
         <%
		    String loginOK = null;
		    String backURL = "/admLogin";
		    loginOK = (String)session.getAttribute("login_ok");
		    if(loginOK == null) {
		    	response.sendRedirect(backURL);
		    }
	    %>
    </head>
    <body background="./img/desk.jpg">
    <h1>댓글 수정</h1>
    <hr>
        <div align="center">
        <form method="post" action="/commUpdate">
        <input type="hidden" name="comId" value="${comment.comId}" readonly>
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="comTitle" value="${comment.comTitle}"></td>
                </tr>
                <tr>
                    <td>날짜</td>
                    <td>${comment.comDate}</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="comUser" value="${comment.comUser}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea style="width:500px; height:250px;" name="comContent" cols="70" rows="600">${comment.comContent}</textarea></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="submit" value="쓰기"></td>
                    <td><input type ="button" value="취소" onclick="location.href='/revList'"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>