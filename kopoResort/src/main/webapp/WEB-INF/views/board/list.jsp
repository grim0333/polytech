<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>게시판 리스트</title>
    </head>
    <body>
        <h1>게시판</h1>
        <div style="width:800;">
        <hr>
            <table border="1" style="width:800;">
				<thead>
					<tr>
						<th width="50" align="center">번호</th>
						<th width="500" align="center">제목</th>
						<th width="100" align="center">날짜</th>
						<th width="50" align="right">조회수</th>
					</tr>	
				</thead>
					<tbody>
						<c:forEach items="${list.content}" var="list">
							<tr>
								<td width="50" align="center">${list.id}</td>
								<td width="400" align="left"><a href="read?key=${list.id}">${list.title}</a></td> 
		 				 		<td width="100" align="center">${list.date}</td>
								<td width="50" align="center">${list.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				<%-- <tbody>
					<c:forEach items="${list.content}" var="list">
						<tr>
							<td width="50" align="center">${list.id}</td>
							<td width="400" align="left"><a href="read?key=${list.id}">${list.title}</a></td> 
	 				 		<td width="100" align="center">${list.date}</td>
							<td width="50" align="center">${list.viewcnt}</td>
						</tr>
						<c:if test="${not empty list.comments}">
				            <tr>
				            <c:forEach items="${list.comments}" var="comment">
				                <tr>
				                    <td width="50" align="center"></td>
									<td width="400" align="left"><a href="comm/read?key=${comment.comId}">&nbsp;=&gt;${comment.comTitle}</a></td> 
			 				 		<td width="100" align="center">${comment.comDate}</td>
									<td width="50" align="center">${comment.comViewCnt}</td>
				                </tr>
				            </c:forEach>
				        </c:if>
					</c:forEach>
				</tbody> --%>
			</table>
			<form action ="create" method="get">
            <table>
                <tr>
                    <td width=750></td>
                    <td><input type ="button" value="쓰기" onclick="location.href='./create'"></td>
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
        	<form action="/board/list" method="get" align="center">
				<select name="field" id="field" class="form-control form-control-sm">
					<option value="id">번호</option>
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