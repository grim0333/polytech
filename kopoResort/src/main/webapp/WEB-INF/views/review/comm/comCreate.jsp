<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
        <title>새 글 입력</title>
    </head>
    <body background="./img/desk.jpg">
    <h1>댓글 쓰기</h1>
    <hr>
    	<div align="center">
        <form method="post" action="/commPost?key=${param.key}">
        <!--폼 생성-->
            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: white;">
            <!--테이블 생성-->
                <tr>
                    <td>번호</td>
                    <td>번호 자동 지정</td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="comTitle" value="이용후기 댓글"></td>
                </tr>
                <tr>
                    <td>일자</td>
                    <td>일자 자동 생성</td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td style="height:400px;"><textarea style="width:100%; height:100%; resize: none; overflow-y: auto;" name="comContent">답글 내용</textarea></td>
                    <!--텍스트 입력칸을 유지하는 상태에서 입력 초과시 스크롤(세로)로 나머지를 나타낼 수 있도록 설정-->
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="button" value="취소" onclick="location.href='/revList'"></td>
                    <td><input type ="submit" value="쓰기"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동-->
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>