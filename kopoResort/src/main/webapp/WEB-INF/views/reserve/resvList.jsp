<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    </script>
    </head>
    <body>
        <h1>예약상황</h1>
        <div style="width:800;">
        <hr>
            <table border="1" style="width:800;">
				<tr align="center">
					<td width="200">예약일자</td>
					<td width="200">VIP룸</td>
					<td width="200">일반룸</td>
					<td width="200">싱글룸</td>
				</tr>
				<%
	                java.util.Date currentDate = new java.util.Date();
	                java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
	                java.text.SimpleDateFormat dayFormat = new java.text.SimpleDateFormat("E"); // 요일 포맷 추가
	                java.util.Calendar calendar = java.util.Calendar.getInstance();
	
	                // 현재 날짜로부터 30일 동안의 날짜, 요일, 내용을 생성하여 테이블에 추가
	                for (int i = 0; i < 30; i++) {
	                    calendar.setTime(currentDate);
	                    calendar.add(java.util.Calendar.DAY_OF_MONTH, i);
	
	                    String dateStr = dateFormat.format(calendar.getTime());
	                    String dayStr = dayFormat.format(calendar.getTime());
	                    String cssClass = ""; // 초기화

	                    // 토요일인 경우 파란색, 일요일인 경우 빨간색 스타일 적용
	                    if (dayStr.equals("토")) {
	                        cssClass = "blue-text";
	                    } else if (dayStr.equals("일")) {
	                        cssClass = "red-text";
	                    }
	            %>
	            <tr align="center">
	                <td class="<%= cssClass %>"><%= dateStr %>(<%= dayStr %>)</td>
	                <td>
	                	<a href="javascript:goPost('<%= dateStr %>', '1')">예약가능</a>
	                </td>
					<td>
	                	<a href="javascript:goPost('<%= dateStr %>', '2')">예약가능</a>
	                </td>
	                <td>
				       	<a href="javascript:goPost('<%= dateStr %>', '3')">예약가능</a>
	                </td>
	            </tr>
	            <%
	                }
	            %>
	            <tr>
	            	<td colspan="4" height="25"></td>
	            </tr>
			</table>
		</div>
	</body>
</html>