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
	        #open{font-style: italic;}
                tbody{text-align: center;}
                a:link{text-decoration: none; color:black}
                a:visited{text-decoration: none;}
                a:hover{text-decoration: underline; color:#00a3a3;}
                a:active{text-decoration: none;}
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
        <div style="width:1100;" align="center">
            <table border="1" style="width:1050; border: 2px solid black; border-collapse:collapse; background-color: #fafafa">
				<thead style="color:white">
					<tr align="center" height="60" style="background-color: #2c7fc9" >
						<td width="150">예약일자</td>
						<td width="300">VIP룸</td>
						<td width="300">디럭스룸</td>
						<td width="300">일반룸</td>
					</tr>
				</thead>
				<tbody>
	            <c:forEach items="${list}" var="row">
			    <tr align="center" height="40" id="field">
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
			        <c:choose>
			        		<c:when test="${row[4] == 0}">
			        			<td id="open"><a href="javascript:goPost('${dateStr}','1')">예약가능</a></td>
				        	</c:when>
				        	<c:otherwise>
				        		<td><b><c:out value="${row[1]}" escapeXml="true" /></b></td>
				        	</c:otherwise>
				    	</c:choose>
				    
			        <c:choose>
			        		<c:when test="${row[5] == 0}">
			        			<td id="open"><a href="javascript:goPost('${dateStr}','2')">예약가능</a></td>
				        	</c:when>
				        	<c:otherwise>
				        		<td><b><c:out value="${row[2]}" escapeXml="true" /></b></td>
				        	</c:otherwise>
				    	</c:choose>
				    
			        <c:choose>
			        		<c:when test="${row[6] == 0}">
			        			<td id="open"><a href="javascript:goPost('${dateStr}','3')">예약가능</a></td>
				        	</c:when>
				        	<c:otherwise>
				        		<td><b><c:out value="${row[3]}" escapeXml="true" /></b>
				        	</c:otherwise>
				    	</c:choose>
				    
			    </tr>
				</c:forEach>
	            <tr>
	            	<td colspan="4" height="25" align="left">
	            		<input type="button" value="초기화" onclick="location.href='/generateData'">
	            	</td>
	            </tr>
	            </tbody>
			</table>
		</div>
	</body>
</html>