<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
    <%-- <script>
        function submitForm(mode, insert){
            if(mode == "write"){
                fm.action = "gongji_write.jsp?key="+ insert;
            }
            fm.submit();
        }
        //mode에 따라 연동되는 페이지를 변경(입력)
        //key값을 부여하여 게시물에 대한 작업 유지
    </script> --%>
        <title>새 글 입력</title>
    </head>
    <body>
        <form method="post" name="fm">
        <!--폼 생성-->
        <div>
            <table width="650" border="1" cellspacing="0" cellpadding="5">
            <!--테이블 생성-->
                <tr>
                    <td>번호</td>
                    <td>insert<input type="hidden" name="id" value="insert"></td>
                    <!--hidden으로 입력을 제한 후 값을 그대로 input을 통해 submit하도록 설정-->
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="공지사항1"></td>
                </tr>
                <tr>
                    <td>일자</td>
                    <%-- <td>now<input type="hidden" name="date" value="<%=now%>"></td> --%>
                    <!--hidden으로 입력을 제한 후 값을 그대로 input을 통해 submit하도록 설정-->
                </tr>
                <tr>
                    <td>내용</td>
                    <td style="height:400px;"><textarea style="width:100%; height:100%; resize: none; overflow-y: auto;" name="content">공지사항 내용1</textarea></td>
                    <!--텍스트 입력칸을 유지하는 상태에서 입력 초과시 스크롤(세로)로 나머지를 나타낼 수 있도록 설정-->
                </tr>
            </table>
            <table>
                <tr>
                    <td width=550></td>
                    <td><input type ="button" value="취소"></td>
                    <td><input type ="button" value="쓰기"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동-->
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>