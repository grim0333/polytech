<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>에러 페이지</title>
	</head>
	<body background="./img/wall.jpg">
		<div align="center" style="width:600; margin-top:300px">
		<%
	    if (request.getParameter("resvDate") != null && request.getParameter("room") != null) {
	        /* SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH); */
	        String date = request.getParameter("resvDate");
	        String room = request.getParameter("room");
	        if (room.equals("1")) { // 문자열 비교 수정
	            room = "VIP룸";
	        } else if (room.equals("2")) { // 문자열 비교 수정
	            room = "디럭스룸";
	        } else {
	            room = "일반룸";
	        }
	    %>
	            
	            <h1>예약을 실패했습니다</h1>
	            <p><b>[<%= date %>] '<%= room %>'</b></p>
	            <p>이미 예약되었습니다</p>
	            <input type="button" value="예약현황으로 돌아가기" onclick="location.href='/resvList'">
	        
	    <%
	    } else {
	    %>
	        <h1>에러가 발생했습니다</h1>
	    <%
	    }
	    %>
    	</div>
	</body>
</html>