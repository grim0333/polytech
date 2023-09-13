<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
    <%-- <script>
        function submitForm(mode, insert){
            if(mode == "write"){
                fm.action = "gongji_write.jsp?key="+ insert;
            }else if(mode == "delete"){
                fm.action = "gongji_delete.jsp?key="+ insert;
            }
            fm.submit();
        }
        //mode에 따라 연동되는 페이지를 변경(입력,삭제)
        //key값을 부여하여 게시물에 대한 작업 유지
    </script> --%>
        <title>글 보기</title>
    </head>
    <body>
        <form method="post" name="fm">
        <!--폼 생성-->
        <div>
            <table width="650" border="1" cellspacing="0" cellpadding="5">
            <!--테이블 생성-->
                <tr>
                    <td>번호</td>
                    <%-- <td><%=id%><input type="hidden" name="id" value="id" readonly></td> --%>
                    <!--hidden으로 입력을 제한 후 값을 그대로 input을 통해 submit하도록 설정-->
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="title"></td>
                </tr>
                <tr>
                    <td>일자</td>
                    <%-- <td><%=date%><input type="hidden" name="date" value="date" readonly></td> --%>
                    <!--hidden으로 입력을 제한 후 값을 그대로 input을 통해 submit하도록 설정-->
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea style="width:500px; height:250px;" name="content" cols="70" row="600">content</textarea></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td width=500></td>
                    <td><input type ="button" value="취소"></td>
                    <td><input type ="button" value="쓰기"></td>
                    <td><input type ="button" value="삭제"></td>
                    <!--취소: 목록 페이지로 이동, 쓰기: 입력 페이지로 이동, 삭제:삭제 페이지로 이동-->
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>