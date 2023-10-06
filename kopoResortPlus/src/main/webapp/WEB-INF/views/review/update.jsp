<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
        <title>글 보기</title>
    </head>
    <body background="./img/desk.jpg">
    <h1 align="center">게시물 수정</h1>
    <hr>
    	<div align="center">
        <form method="post" action="/revUpdate">
        	<input type="hidden" name="id" value="${read.id}" readonly>
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="${read.title}"></td>
                </tr>
                <tr>
                    <td>날짜</td>
                    <td>${read.date}<input type="hidden" name="date" value="${read.date}" readonly></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="user" value="${read.user}"></td>
                </tr>
                 <tr>
                    <td>조회수</td>
                    <td>${read.viewcnt}<input type="hidden" name="viewcnt" value="${read.viewcnt}" readonly></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea style="width:550px; height:400px;" name="content" cols="70" rows="600">${read.content}</textarea></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="submit" value="쓰기"></td>
                    <td><input type ="button" value="취소" onclick="location.href='/revList'"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동, 삭제:삭제 페이지로 이동-->
                </tr>
            </table>
       </form>
       </div>
    </body>
</html>