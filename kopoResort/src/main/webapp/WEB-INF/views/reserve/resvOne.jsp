<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약하기</title>
</head>
	<body>
	<h1>예약하기</h1>
		<div style="width:900;">
		<hr>
			<form method="post" action="/resvWrite">
	        <!--폼 생성-->
	        <%
		        Date curDate = new java.util.Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				String wrtStr = dateFormat.format(curDate);
		        String date = request.getParameter("date");
			    String room = request.getParameter("room");
			    if (date == null) {
		            date = wrtStr;
		        }
			    
			%>
	            <table width="650" border="1" cellspacing="0" cellpadding="5">
	            <!--테이블 생성-->
	            	<tr>
	                    <td>성명</td>
	                    <td><input type="text" name="name" value=""></td>
	                </tr>
	                <tr>
	                    <td>예약일자</td>
	                    <td><input type="date" name="date" value="<%=date%>"></td>
	                </tr>
	                <tr>
	                    <td>예약방</td>
	                    <td>
	                    	<select name="room">
						        <option value="1" <% if ("1".equals(request.getParameter("room"))) { %>selected<% } %>>VIP룸</option>
						        <option value="2" <% if ("2".equals(request.getParameter("room"))) { %>selected<% } %>>일반룸</option>
						        <option value="3" <% if ("3".equals(request.getParameter("room"))) { %>selected<% } %>>싱글룸</option>
						    </select>
						</td>
	                </tr>
	                <tr>
	                    <td>주소</td>
	                    <td><input type="text" name="addr" value=""></td>
	                </tr>
	                <tr>
	                    <td>전화번호</td>
	                    <td><input type="text" name="telnum" value=""></td>
	                </tr>
	                <tr>
	                    <td>입금자명</td>
	                    <td><input type="text" name="inName" value=""></td>
	                </tr>
	                <tr>
	                    <td>남기실말</td>
	                    <td><input type="text" name="comment" value=""></td>
	                </tr>
	                <tr>
	                    <td colspan="2" align="center"><input type ="submit" value="전송"></td>
	                </tr>
	            </table>
        	</form>
        </div>
	</body>
</html>