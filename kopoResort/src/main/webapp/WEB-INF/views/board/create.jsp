<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.util.Date" %>
<html>
    <head>
        <title>새 글 입력</title>
        <%
	        // 현재 날짜를 가져오기
	        Date currentDate = new Date();
	        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	        String date = sdf.format(currentDate);
	    %>
    </head>
    <body background="./img/desk.jpg">
    <h1 align="center">게시물 쓰기</h1>
    <hr>
        <form method="post" action="./post">
        <!--폼 생성-->
        <div align="center">
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
            <!--테이블 생성-->
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="공지사항"></td>
                </tr>
                <tr>
                    <td>날짜</td>
                    <td><%=date %></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="user" value=""></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td style="height:400px;"><textarea style="width:100%; height:100%; resize: none; overflow-y: auto;" name="content">공지사항 내용</textarea></td>
                    <!--텍스트 입력칸을 유지하는 상태에서 입력 초과시 스크롤(세로)로 나머지를 나타낼 수 있도록 설정-->
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="submit" value="쓰기"></td>
                    <td><input type ="button" value="취소" onclick="location.href='./list'"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동-->
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>