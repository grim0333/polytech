<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>예약하기</title>
	<script>
	  const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	</script>
	<style>
		#field{background-color: #e6e6e6; width:150px;}
	</style>
</head>
	<body background="./img/background.jpg">
	<h1 align="center">예약하기</h1>
		<hr>
		<div align="center" style="margin-top:40px;">
			<img src="./img/reserve.jpg">
		</div>
		<div style="width:900; margin-top:40px;" align="center">
			<form method="post" action="/resvWrite">
	        <!--폼 생성-->
	        <%
		        Date curDate = new java.util.Date();
	
		        Calendar calendar = Calendar.getInstance();
		        calendar.setTime(curDate);
		        calendar.add(Calendar.DAY_OF_MONTH, 29);
	
		        Date thrDate = calendar.getTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
				String wrtStr = dateFormat.format(curDate);
				String thrStr = dateFormat.format(thrDate);
		        String date = request.getParameter("date");
			    String room = request.getParameter("room");
			    if (date == null) {
		            date = wrtStr;
		        }
			    
			%>
	            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
	            <!--테이블 생성-->
	            	<tr>
	                    <td id="field">성명</td>
	                    <td><input type="text" name="name" value="" required></td>
	                </tr>
	                <tr>
	                    <td id="field">예약일자</td>
	                    <td><input type="date" name="date" 
				           min="<%= wrtStr %>" 
				           max="<%= thrStr %>" value="<%=date%>">
				        </td>
	                </tr>
	                <tr>
	                    <td id="field">예약방</td>
	                    <td>
	                    	<select name="room">
						        <option value="1" <% if ("1".equals(request.getParameter("room"))) { %>selected<% } %>>VIP룸</option>
						        <option value="2" <% if ("2".equals(request.getParameter("room"))) { %>selected<% } %>>일반룸</option>
						        <option value="3" <% if ("3".equals(request.getParameter("room"))) { %>selected<% } %>>싱글룸</option>
						    </select>
						</td>
	                </tr>
	                <tr>
	                    <td id="field">주소</td>
	                    <td><input type="text" name="addr" value=""></td>
	                </tr>
	                <tr>
	                    <td id="field">전화번호</td>
	                    <td>
	                    	<input type="tel" name="telnum" value="" oninput="hypenTel(this)" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
						</td>
	                </tr>
	                <tr>
	                    <td id="field">입금자명</td>
	                    <td><input type="text" name="inName" value="" required></td>
	                </tr>
	                <tr>
	                    <td id="field">남기실말</td>
	                    <td><input type="text" name="comment" value=""></td>
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