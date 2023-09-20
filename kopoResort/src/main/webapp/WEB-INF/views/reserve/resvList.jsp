<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title> 예약상황 </title>
        <style>
	        .blue-text {
	            color: blue;
	        }
	        .red-text {
	            color: red;
	        }
	    </style>
	    <script>
	    	function goPost(dateStr, num){
	    		var form = document.createElement("form");
		            form.setAttribute("method", "post");
		            form.setAttribute("action", "/resvOne");
		            
				var dateInput = document.createElement("input");
					dateInput.setAttribute("type", "hidden");
					dateInput.setAttribute("name", "date");
					dateInput.setAttribute("value", dateStr);
					form.appendChild(dateInput);
				
				var roomInput = document.createElement("input");
					roomInput.setAttribute("type", "hidden");
					roomInput.setAttribute("name", "room");
					roomInput.setAttribute("value", num);
					form.appendChild(roomInput);
					
					document.body.appendChild(form);
					form.submit();
	    	}
	    	function date(curDate){
	    		
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
    <body background="./img/background.jpg">
        <h1 align="center">예약상황</h1>
        <hr>
        <div style="width:800;" align="center">
            <table border="1" style="width:800; background-color: #fafafa">
				<tr align="center">
					<td width="200"><b>예약일자</b></td>
					<td width="200"><b>VIP룸</b></td>
					<td width="200"><b>일반룸</b></td>
					<td width="200"><b>싱글룸</b></td>
				</tr>
	            <c:forEach items="${list}" var="row">
			    <tr align="center">
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
			        <td class="${cssClass}">${dateStr}(${dayStr})</td>
			        <td><c:choose>
			        		<c:when test="${row[4] == 0}">
			        			<a href="javascript:goPost('${dateStr}','1')">예약가능</a>
				        	</c:when>
				        <c:otherwise><b>${row[1]}</b></c:otherwise>
				    	</c:choose>
				    </td>
			        <td><c:choose>
			        		<c:when test="${row[5] == 0}">
			        			<a href="javascript:goPost('${dateStr}','2')">예약가능</a>
				        	</c:when>
				        <c:otherwise><b>${row[2]}</b></c:otherwise>
				    	</c:choose>
				    </td>
			        <td><c:choose>
			        		<c:when test="${row[6] == 0}">
			        			<a href="javascript:goPost('${dateStr}','3')">예약가능</a>
				        	</c:when>
				        <c:otherwise><b>${row[3]}</b></c:otherwise>
				    	</c:choose>
				    </td>
			    </tr>
				</c:forEach>
	            <tr>
	            	<td colspan="4" height="25" align="left">
	            		<input type="button" value="초기화" onclick="location.href='/generateData'">
	            	</td>
	            </tr>
			</table>
		</div>
	</body>
</html>