<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>예약조회(Admin) </title>
	<style>
		#field{background-color: #f0f0f0;}
	</style>
	<script>
	    function submitForm(action) {
	        var form = document.getElementById("myForm");
	        if (action === "up") {
	            form.action = "/admOneChk";
	            form.submit();
	        } else if (action === "del") {
	            form.action = "/admDelete";
	            var message = "삭제하시겠습니까?";
	            if (confirm(message)) {
	                form.submit();
	            }
	        }
	    }
	    const hypenTel = (target) => {
	   	 target.value = target.value
	   	   .replace(/[^0-9]/g, '')
	   	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	   	}
	</script>
		<%
		    String loginOK = null;
		    String backURL = "/admLogin";
		    loginOK = (String)session.getAttribute("login_ok");
		    if(loginOK == null) {
		    	response.sendRedirect(backURL);
		    }
	    %>
	    <%
	    	String room = request.getParameter("room");
	    	String roomStr = "";
	    	if(room == "1"){
	    		roomStr = "VIP룸";
	    	}else if(room == "2"){
	    		roomStr = "디럭스룸";
	    	}else{
	    		roomStr = "일반룸";
	    	}
	    %>
	</head>
	<body background="./img/wall.jpg">
	<h1 align="center">예약조회 - 관리자</h1>
		<hr>
		<div style="width:900; margin-top: 100px;" align="center">
			<form method="post" action="" id="myForm">
	            <table width="650" border="1" cellspacing="0" cellpadding="5" style="background-color: white">
	            <!--테이블 생성-->
	            	<tr>
	                    <td id="field">성명</td>
	                    <td><input type="text" name="name" value="${view.name}"></td>
	                </tr>
	                <tr>
	                    <td id="field">예약일자</td>
	                    <td> <fmt:formatDate value="${view.resvDate}" pattern="yyyy-MM-dd" var="resvForm" />
                			<input type="date" name="resvDate" value="${resvForm}" readonly></td>
	                </tr>
	                <tr>
	                    <td id="field">예약방</td>
	                    <td>
	                    	<input type="hidden" name="room" value="${view.room}" readonly><%=roomStr %>
						</td>
	                </tr>
	                <tr>
	                    <td id="field">주소</td>
	                    <td><input type="text" name="addr" value="${view.addr}"></td>
	                </tr>
	                <tr>
	                    <td id="field">전화번호</td>
	                    <td>
	                    	<input type="tel" name="telnum" value="${view.telnum}" oninput="hypenTel(this)" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
	                    </td>
	                </tr>
	                <tr>
	                    <td id="field">입금자명</td>
	                    <td><input type="text" name="inName" value="${view.inName}"></td>
	                </tr>
	                <tr>
	                    <td id="field">남기실말</td>
	                    <td><input type="text" name="comment" value="${view.comment}" readonly></td>
	                </tr>
	                <tr>
	                    <td id="field">신청일자</td>
	                    <td><fmt:formatDate value="${view.writeDate}" pattern="yyyy-MM-dd" var="wrtForm" />
                			<input type="text" name="writeDate" value="${wrtForm}" readonly></td>
	                </tr>
	                <tr>
	                    <td id="field">진행상황</td>
	                    <td><input type="text" name="processing" value="${view.processing}"></td>
	                </tr>
	                <tr align="center">
	                    <tr align="center">
						    <td colspan="2">
						        <input type="button" value="수정" onclick="submitForm('up')">
						        <input type="button" value="삭제" onclick="submitForm('del')">
						        <input type="button" value="돌아가기" onclick="location.href='/admView'">
						    </td>
						</tr>
	                </tr>
	            </table>
        	</form>
        </div>
	</body>
</html>