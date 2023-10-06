<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 예약확인 </title>
<style>
	#field{background-color: #e6e6e6; width:150px;}
</style>
</head>
	<body background="./img/background.jpg">
	<h1 align="center">예약확인</h1>
		<hr>
		<div align="center" style="margin-top: 40px;">
			<img src="./img/approve.jpg" style="height: 300px; width: 300px">
		</div>
		<div align="center" style="width:900; margin-top: 40px;">
			<form method="post" action="/resvUpdate">
	        <!--폼 생성-->
	        	<%
				// 이전 페이지에서 받은 room 파라미터의 값을 가져옵니다.
				String room = request.getParameter("room");
	        	String dateStr = request.getParameter("date");
				// 결과값을 초기화합니다.
				String roomNum = "";
				String roomName = "";
				
				// Java 코드 블록 내에서 현재 날짜를 생성
				
				// room 파라미터 값에 따라 결과값을 설정합니다.
				if ("1".equals(room)) {
					roomNum = "1";
					roomName = "VIP룸";
				} else if ("2".equals(room)) {
					roomNum = "2";
					roomName = "일반룸";
				} else if ("3".equals(room)) {
					roomNum = "3";
					roomName = "싱글룸";
				}
				%>
				<%
				Date curDate = new java.util.Date();

				// SimpleDateFormat을 사용하여 날짜를 원하는 형식으로 포맷팅
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				dateFormat.setLenient(false); // 엄격한 파싱 활성화
				String wrtStr = dateFormat.format(curDate);
				%>
	            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
	            <!--테이블 생성-->
	            	<tr>
	                    <td id="field">성명</td>
	                    <td><input type="hidden" name="name" value="${param.name}" readonly><c:out value="${param.name}" escapeXml="true" /></td>
	                </tr>
	                <tr>
	                    <td id="field">예약일자</td>
	                    <td><input type="hidden" name="resvDate" value="${param.date}" readonly>${param.date}</td>
	                </tr>
	                <tr>
	                    <td id="field">예약방</td>
	                    <td><input type="hidden" name="room" value="<%=roomNum %>" readonly><%=roomName %></td>
	                </tr>
	                <tr>
	                    <td id="field">주소</td>
	                    <td><input type="hidden" name="addr" value="${param.addr}" readonly><c:out value="${param.addr}" escapeXml="true" /></td>
	                </tr>
	                <tr>
	                    <td id="field">전화번호</td>
	                    <td><input type="hidden" name="telnum" value="${param.telnum}" readonly>${param.telnum}</td>
	                </tr>
	                <tr>
	                    <td id="field">입금자명</td>
	                    <td><input type="hidden" name="inName" value="${param.inName}" readonly><c:out value="${param.inName}" escapeXml="true" /></td>
	                </tr>
	                <tr>
	                    <td id="field">남기실말</td>
	                    <td><input type="hidden" name="comment" value="${param.comment}" readonly><c:out value="${param.comment}" escapeXml="true" /></td>
	                </tr>
	                <tr>
	                    <td id="field">신청일자</td>
	                    <td><input type="hidden" name="writeDate" value="<%=wrtStr %>" readonly><%=wrtStr %></td>
	                </tr>
	                <tr>
	                    <td colspan="2" align="center">
	                    <input type ="submit" value="전송">
	                    <input type="button" value="취소" onclick="history.back()">
	                    </td>
	                </tr>
	            </table>
        	</form>
        </div>
	</body>
</html>