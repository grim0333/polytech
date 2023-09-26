<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title> 예약현황(Admin) </title>
        <%
		    String loginOK = null;
		    String backURL = "/admLogin";
		    loginOK = (String)session.getAttribute("login_ok");
		    if(loginOK == null) {
		    	response.sendRedirect(backURL);
		    }
	    %>
        <style>
	        .blue-text {
	            color: blue;
	        }
	        .red-text {
	            color: red;
	        }
	    </style>
	    <script>
		    function goPost(date, num){
	    		var form = document.createElement("form");
		            form.setAttribute("method", "post");
		            form.setAttribute("action", "/admOneView");
		            
				var dateInput = document.createElement("input");
					dateInput.setAttribute("type", "date");
					dateInput.setAttribute("name", "date");
					dateInput.setAttribute("value", date);
					form.appendChild(dateInput);
				
				var roomInput = document.createElement("input");
					roomInput.setAttribute("type", "text");
					roomInput.setAttribute("name", "room");
					roomInput.setAttribute("value", num);
					form.appendChild(roomInput);
					
					document.body.appendChild(form);
					form.submit();
	    	}

	    	function dateColor(dayStr){
	    		 if (dayStr.equals("토")) {
                     cssClass = "blue-text";
                 } else if (dayStr.equals("일")) {
                     cssClass = "red-text";
                 }
	    	}
	    </script>
    </head>
    <body background="./img/wall.jpg">
        <h1 align="center">예약현황 - 관리자</h1>
        <div style="width:1100;" align="center">
        <hr>
            <table border="1" style="width:1050; border: 2px solid black; border-collapse:collapse; background-color: white">
				<tr align="center" height="60" style="background-color: #7dc5fd">
					<td width="200"><b>예약일자</b></td>
					<td width="300"><b>VIP룸</b></td>
					<td width="300"><b>일반룸</b></td>
					<td width="300"><b>싱글룸</b></td>
				</tr>
	            <c:forEach items="${list}" var="row">
			    <tr align="center" height="40">
			        <c:set var="date" value="${row[0]}" />
				    <c:set var="dateStr"><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" /></c:set>
					<c:set var="dayStr"><fmt:formatDate pattern="E" value="${date}" /></c:set>
				    <c:set var="cssClass">
				        <c:choose>
				            <c:when test="${dayStr eq '토'}">blue-text</c:when>
				            <c:when test="${dayStr eq '일'}">red-text</c:when>
				            <c:otherwise></c:otherwise>
				        </c:choose>
				    </c:set>
			        <td style="background-color: #f0f0f0" class="${cssClass}">${dateStr}(${dayStr})</td>
			        <td><c:choose>
			        		<c:when test="${row[4] == 0}">예약없음</c:when>
				        <c:otherwise><a href="javascript:goPost('${dateStr}','1')">${row[1]}</a></c:otherwise>
				    	</c:choose>
				    </td>
			        <td><c:choose>
			        		<c:when test="${row[5] == 0}">예약없음</c:when>
				        <c:otherwise><a href="javascript:goPost('${dateStr}','2')">${row[2]}</a></c:otherwise>
				    	</c:choose>
				    </td>
			        <td><c:choose>
			        		<c:when test="${row[6] == 0}">예약없음</c:when>
				        <c:otherwise><a href="javascript:goPost('${dateStr}','3')">${row[3]}</a></c:otherwise>
				    	</c:choose>
				    </td>
			    </tr>
				</c:forEach>
	            <tr>
	            	<td colspan="4" align="right" height="20"></td>
	            </tr>
			</table>
		</div>
	</body>
</html>