<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>리조트 공지사항</title>
    </head>
    <body>
        <h1>리조트 공지사항</h1>
        <div style="width:700;">
        <hr>
            <table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>	
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.id}</td>
							<td>${list.title}</td>
							<td>${list.date}</td>
							<td>${list.viewcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
            <table>
                <tr>
                    <td width=540></td>
                    <td><input type ="button" value="초기화"></td>
                    <td><input type ="button" value="신규"></td>
                </tr>
            </table>
        </div>
    </body>
</html>