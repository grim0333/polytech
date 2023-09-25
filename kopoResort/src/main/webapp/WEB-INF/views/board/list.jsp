<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>공지 게시판</title>
         	<style type='text/css'>
               	content:{font-size: 15; text-align: left; text-decoration: none; color:black}
				a:link{text-decoration: none; color:black}
              	a:visited{text-decoration: none; color: #056466}
               	a:hover{text-decoration:underline; color: #0be0e5}
               	a:active{text-decoration: none;}
           </style>
    </head>
    <body background="./img/desk.jpg">
        <h1 align="center">공지사항</h1>
        <hr>
        <div align="center">
            <table border="1" style="width:800; border: 2px solid black; border-collapse:collapse; background-color: #fafafa;">
				<thead>
					<tr height="50" style="border: 2px solid black; background-color: #7dc5fd">
						<th width="50" align="center">번호</th>
						<th width="500" align="center">제목</th>
						<th width="80" align="center">작성자</th>
						<th width="100" align="center">날짜</th>
						<th width="50" align="center">조회수</th>
					</tr>	
				</thead>
					<tbody>
						<c:set var="currentPage" value="${param.page != null ? param.page : 0}" />
						<c:forEach items="${list.content}" var="list" varStatus="i">
							<tr height="30" id="content">
								<td width="50" align="center">${cnt - (currentPage*20) - i.index}</td>
								<td width="400" align="left"><a href="read?key=${list.id}"><c:out value="${list.title}" escapeXml="true" /></a></td>
								<td width="80" align="center">${list.user}</td>
		 				 		<td width="100" align="center">${list.date}</td>
								<td width="50" align="center">${list.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			<form action ="create" method="get">
            <table>
                <tr>
                    <% if ("yes".equals(session.getAttribute("login_ok"))) { %>
					    	<td width=750></td>
					        <td>
					            <input type="button" value="쓰기" onclick="location.href='./create'">
					        </td>
					<% } else { %>
					        <td colspan="2"></td>
					<% } %>
                </tr>
            </table>
            </form>
            <table align="center">
            	<c:choose>
				<c:when test="${list.first}"></c:when>
				<c:otherwise>
				<tr>
					<td><a href="/board/list?field=${param.field}&word=${param.word}&page=0">&lt;&lt;</a></td>
					<td><a href="/board/list?field=${param.field}&word=${param.word}&page=${list.number-1}">&lt;</a></td>
				</c:otherwise>
			</c:choose>

			<!-- 페이지 그룹 -->
			<c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
				<c:choose>
					<c:when test="${list.pageable.pageNumber+1 == i}">
						<td style="color:red">${i}</td>
					</c:when>
					<c:otherwise>
						<td><a href="/board/list?field=${param.field}&word=${param.word}&page=${i-1}">${i}</a></td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
				<c:when test="${list.last}"></c:when>
				<c:otherwise>
					<td><a href="/board/list?field=${param.field}&word=${param.word}&page=${list.number+1}">&gt;</a></td>
					<td><a href="/board/list?field=${param.field}&word=${param.word}&page=${list.totalPages-1}">&gt;&gt;</a></td>
				</c:otherwise>
			</c:choose>
			</table>
        	<form action="/list" method="get" align="center">
				<select name="field" id="field" class="form-control form-control-sm">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> 
				<input type="text" id="word" name="word" class="form-control form-control-sm"
					style="margin: 10px;"> 
				<input type="submit" class="btn btn-outline-info btn-sm" value="검색">
			</form>
        </div>
    </body>
</html>