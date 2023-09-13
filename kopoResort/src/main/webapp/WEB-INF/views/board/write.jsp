<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
    <head>
        <title>글 쓰기</title>
        <%!
            public String reply(int lev){
                //relevel값을 받아 댓글의 깊이 정도를 제목에 표시하는 함수
                String re = ""; //빈 문자열값 생성
                for(int i=0;i<lev;i++){ //lev값만큼 "-"를 re에 추가
                    re += "-";
                }
                return re + ">[RE]"; //결과값에 댓글 표시를 추가 후 반환
            }
        %>
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
    //key 파라미터 값 호출 후 변수에 지정
    String title = request.getParameter("title");
    String titleHan = new String(title.getBytes("8859_1"),"utf-8");
    //title 값을 지정한 변수를 UTF-8로 인코딩
    String cont = request.getParameter("content");
    String contHan = new String(cont.getBytes("8859_1"),"utf-8");
    //cont 값을 지정한 변수를 UTF-8로 인코딩
    String date = request.getParameter("date");
    //date값 호출 후 변수에 지정
    String rootid = "";
    if(request.getParameter("rootid") == null){ //rootid 값이 없는 경우
        rootid = request.getParameter("root"); //root 파라미터 값에서 지정
    }else{                                     //rootid 값이 있는 경우
        rootid = request.getParameter("rootid"); //그대로 지정
    }
    String relevel = request.getParameter("relevel");
    String recnt = request.getParameter("recnt");
    //나머지 파라미터에서 해당 항목 값을 변수에 입력
    if(relevel != null) { //relevel 값이 0이 아닌 경우(댓글인 경우)
        int re = Integer.parseInt(relevel); //relevel값을 정수로 전환하여 변수에 저장
        if(re > 0){
        titleHan = reply(re) + titleHan; //제목에 reply 함수에 relevel값을 넣어 나온 결과값을 더함
        }
    }else{ //그 외의 경우(원글인 경우)
        relevel = "0"; 
        recnt = "0";
        //댓글 깊이, 댓글 순서 값 0으로 초기화
    }
    //파라미터 값에서 이름에 해당하는 값을 변수에 입력
    String sql=""; //쿼리문 입력할 빈 값
    ResultSet rset = stmt.executeQuery("select * from gongji where id=" + key + " ;");
    //테이블에서 id=key값에 해당하는 항목들을 전부 쿼리하여 결과값에 저장
    boolean check = rset.next(); //결과값 읽기->읽은 값 체크
    if(check == false){ //체크가 false일때=읽은 값이 없을때(게시물 입력)
    sql = "insert into gongji(id, title, date, content, rootid, relevel, recnt)"+
                    " value ("+ key +", '"+ titleHan +"', '"+date+"' , '"+ contHan +"',"+ rootid +" ,"+ relevel +" ,"+ recnt +");";
                    //입력할 각 항목의 값을 변수에 문자열로 같이 더해 입력
    }else{ //체크가 true일때=읽은 값이 있을때(게시물 수정)
    sql = "update gongji set "+
                    "title = '"+ titleHan +"',"+
                    "date = '"+ date +"',"+
                    "content = '"+ contHan +"'"+
                    " where id = " + key + ";";
                    //업데이트할 각 항목의 값을 변수에 문자열로 같이 더해 입력
    }
    stmt.executeUpdate(sql);
    //만들어진 쿼리문으로 쿼리 실행
    rset.close();
    //ResultSet 종료
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