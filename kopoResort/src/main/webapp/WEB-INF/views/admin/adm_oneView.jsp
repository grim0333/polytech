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
</script>
</head>
	<body>
	<h1>예약조회 - 관리자</h1>
		<div style="width:900;">
		<hr>
			<form method="post" action="" id="myForm">
	            <table width="650" border="1" cellspacing="0" cellpadding="5">
	            <!--테이블 생성-->
	            	<tr>
	                    <td>성명</td>
	                    <td><input type="text" name="name" value="${view.name}"></td>
	                </tr>
	                <tr>
	                    <td>예약일자</td>
	                    <td> <fmt:formatDate value="${view.resvDate}" pattern="yyyy-MM-dd" var="resvForm" />
                			<input type="date" name="resvDate" value="${resvForm}"></td>
	                </tr>
	                <tr>
	                    <td>예약방</td>
	                    <td>
	                    	<select name="room">
							    <option value="1" <c:if test="${view.room eq '1'}">selected</c:if>>VIP룸</option>
							    <option value="2" <c:if test="${view.room eq '2'}">selected</c:if>>일반룸</option>
							    <option value="3" <c:if test="${view.room eq '3'}">selected</c:if>>싱글룸</option>
							</select>
						</td>
	                </tr>
	                <tr>
	                    <td>주소</td>
	                    <td><input type="text" name="addr" value="${view.addr}"></td>
	                </tr>
	                <tr>
	                    <td>전화번호</td>
	                    <td><input type="text" name="telnum" value="${view.telnum}"></td>
	                </tr>
	                <tr>
	                    <td>입금자명</td>
	                    <td><input type="text" name="inName" value="${view.inName}"></td>
	                </tr>
	                <tr>
	                    <td>남기실말</td>
	                    <td><input type="text" name="comment" value="${view.comment}"></td>
	                </tr>
	                <tr>
	                    <td>신청일자</td>
	                    <td><fmt:formatDate value="${view.writeDate}" pattern="yyyy-MM-dd" var="wrtForm" />
                			<input type="text" name="writeDate" value="${wrtForm}"></td>
	                </tr>
	                <tr>
	                    <td>진행상황</td>
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