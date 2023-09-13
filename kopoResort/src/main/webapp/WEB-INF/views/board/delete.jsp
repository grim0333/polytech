<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
        <title>글 삭제</title>
    </head>
    <body>
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    //MySQL JDBC 드라이버를 로드
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.81:33060/kopo32", "root", "kopo1111");
	//지정된 URL, 이름, 패스워드로 MySQL 데이터베이스에 연결
    Statement stmt = conn.createStatement();
    //연결된 데이터베이스에서 SQL 문을 실행하기 위한 Statement 객체를 생성
    String key = request.getParameter("key");
    ResultSet rset = stmt.executeQuery("select rootid from gongji where id = " + key + ";");
    //id=key 값에 해당하는 rootid값을 호출 후 저장값에 저장
    rset.next();
    //rset 읽기
    int root = rset.getInt(1);
    //읽은 값을 변수에 저장
    rset = stmt.executeQuery("select relevel from gongji where rootid = " + root + ";");
    //rootid=root 값에 해당하는 relevel값을 호출 후 저장값에 저장
    rset.next();
    //rset 읽기
    int check = rset.getInt(1);
    //읽은 값을 변수에 저장
    String sql="";
    //쿼리문 입력할 문자열 생성
    if(check > 0){
        sql = "delete from gongji where id = " + key + ";";
        //relevel이 0보다 큰 경우(댓글) 댓글만 해당 key의 댓글만 삭제
    }else{
        sql = "delete from gongji where rootid = " + key +";";
        //relevel이 0인 경우(원글) 원글+댓글 삭제
    }
    //위에서 구한 값을 쿼리문에 입력
    stmt.executeUpdate(sql);
    //쿼리문으로 데이터 삭제 명령 실행
    stmt.close();
    //Statement 종료
    conn.close();
    //데이터베이스 연결 종료
    %>
    <script>
        window.location.href = "gongji_list.jsp";
        //동작 수행 후 목록 페이지로 이동
    </script>
    </body>
</html>