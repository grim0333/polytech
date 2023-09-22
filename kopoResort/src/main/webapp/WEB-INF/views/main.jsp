<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.text.DateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <title> 리조트 </title>
        <style>
            body {
              background-image: url('./img/background.jpg'); /* 배경 이미지 경로 설정 */
              background-position: center; /* 이미지를 가운데로 정렬 */
              background-repeat: no-repeat; /* 이미지 반복 없음 */
              background-attachment: fixed; /* 이미지 스크롤 고정 */
            }
          </style>
	          <%
	    Cookie lastDate = null;
	   
	    // 화면에 출력할 메시지를 저장할 문자열 변수
	    String msg = "";
	    // 마지막 방문일을 저장하고 있는 쿠키가 존재하는지를 판별할 변수
	    boolean found = false;
	    // 현재 시간을 저장
	    String newValue = "" + System.currentTimeMillis();
	    // 쿠키를 얻는다.
	    Cookie[] cookies = request.getCookies();
	    // 마지막 방문 일을 정하고 있는 쿠키를 검색
	    if (cookies != null) {
	        for (int i = 0; i < cookies.length; i++) {
	            lastDate = cookies[i];
	            if (lastDate.getName().equals("lastdateCookie")) {
	                found = true;
	                break;
	            }
	        }
	    }
	   
	    // 처음 방문일 경우 새 쿠키 생성
	    if (!found) {    // if (found = false)
	        msg = "처음 방문 입니다.";
	        // 쿠키 객체를 생성
	        lastDate = new Cookie("lastdateCookie", newValue);
	        // 쿠키 속성값을 설정
	        lastDate.setMaxAge(365*24*60*60);    // 365일
	        lastDate.setPath("/");
	        // 쿠키를 추가
	        response.addCookie(lastDate);
	    } else {    // 이미 방문한 적이 있는 클라이언트라면
	        // 이전 방문시간을 알아내어 long형 변수 conv에 저장
	        long conv = new Long(lastDate.getValue()).longValue();
	        // 방문시간을 출력할 수 있도록 msg 변수에 저장
	        Date date = new Date(conv);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
            msg = "당신의 마지막 방문 : " + dateFormat.format(date);
	        
	        // 쿠키에 새 값을 추가
	        lastDate.setValue(newValue);
	        // 쿠키를 추가
	        response.addCookie(lastDate);
	    }
	%>
    </head>
    <body>
        <div align="center" style="margin-top: 100px;">
            <img src="./img/main.jpg" width="400" height="350">
            <br>
            <h2> 리조트 </h2>
            <br>
            <br>
            <p><%=msg %></p>
        </div>
    </body>
</html>