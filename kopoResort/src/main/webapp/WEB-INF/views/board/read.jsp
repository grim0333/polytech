<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--c:out 이스케이프 문 사용을 위해 외부 라이브러리에서 호출-->
<html>
    <head>
        <title>글 보기</title>
    </head>
    <body>
        <form method="post" name="fm">
        <!--폼 생성-->
        <div>
            <table width="800" border="1" cellspacing="0" cellpadding="5">
            <!--테이블 생성-->
                <tr>
                    <td width="70">번호</td>
                    <td colspan="3">id</td>
                </tr>
                <tr>
                    <td width="70">제목</td>
                    <td colspan="3"><c:out value="title" escapeXml="true" /></td>
                    <!--c:out 이스케이프 문을 통해 HTML나 JS 태그구문이 구현되지 않도록 제한-->
                </tr>
                <tr>
                    <td width="70">일자</td>
                    <td colspan="3">date</td>
                </tr>
                <tr>
                    <td width="70">조회수</td>
                    <td colspan="3">viewcnt</td>
                </tr>
                <tr>
                    <td width="70">내용</td>
                    <td colspan="3" style="height:400px;">
                    <textarea style="width:100%; height:100%; resize: none; overflow-y: auto;" readonly><c:out value="content" escapeXml="true" />
                    </textarea></td>
                    <!--텍스트 입력칸을 유지하는 상태에서 입력 초과시 스크롤(세로)로 나머지를 나타낼 수 있도록 설정-->
                    <!--c:out 이스케이프 문을 통해 HTML나 JS 태그구문이 구현되지 않도록 제한-->
                </tr>
            </table>
            <table>
                <tr>
                    <td width=600></td>
                    <td><input type ="button" value="목록"></td>
                    <td><input type ="button" value="수정"></td>
                    <td><input type ="button" value="삭제"></td>
                    <td><input type ="button" value="답글"></td>
                    <!--목록: 목록 페이지로 이동, 수정: 수정 페이지로 이동-->
                    <!--삭제: 삭제 페이지로 이동, 답글: 답글 페이지로 이동-->
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>