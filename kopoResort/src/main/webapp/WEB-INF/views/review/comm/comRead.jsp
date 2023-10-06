<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--c:out 이스케이프 문 사용을 위해 외부 라이브러리에서 호출-->
<html>
    <head>
	    <script>
		function del(id) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='/commDelete?key='+id;
			}
		}
		</script>
        <title>글 보기</title>
    </head>
    <body background="./img/desk.jpg">
    <h1 align="center">이용후기 게시판</h1>
    <hr>
    	<div align="center">
        <form method="post" name="fm">
        <!--폼 생성-->
        
            <table width="800" border="1" cellspacing="0" cellpadding="5" style="background-color: #fafafa;">
            <!--테이블 생성-->
                <tr>
                    <td width="70">제목</td>
                    <td colspan="3"><c:out value="${comment.comTitle}" escapeXml="true" /></td>
                    <!--c:out 이스케이프 문을 통해 HTML나 JS 태그구문이 구현되지 않도록 제한-->
                </tr>
                <tr>
                    <td width="70">날짜</td>
                    <td colspan="3">${comment.comDate}</td>
                </tr>
                <tr>
                    <td width="70">작성자</td>
                    <td colspan="3"><c:out value="${comment.comUser}" escapeXml="true" /></td>
                    <!--c:out 이스케이프 문을 통해 HTML나 JS 태그구문이 구현되지 않도록 제한-->
                </tr>
                <tr>
                    <td width="70">조회수</td>
                    <td colspan="3">${comment.comViewCnt}</td>
                </tr>
                <tr>
                    <td width="70">내용</td>
                    <td colspan="3" style="height:400px;">
                    <textarea style="width:100%; height:100%; resize: none; overflow-y: auto;" readonly><c:out value="${comment.comContent}" escapeXml="true" />
                    </textarea></td>
                </tr>
            </table>
            <table>
                <tr>
                	<% if ("yes".equals(session.getAttribute("login_ok"))) { %>
                    <td width=660></td>
                    <td><input type ="button" value="수정" onclick="location.href='./commModify?key='+'${param.key}'"></td>
                    <td><input type ="button" value="삭제" onclick="del(${param.key})"></td>
                    <% } else { %>
                    <td width=750></td>
                    <% } %>
                    <td><input type ="button" value="목록" onclick="location.href='/revList'"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
</html>