<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ϱ�</title>
</head>
<body>
	<h1>�����Ȳ</h1>
	<div style="width:900;">
	<hr>
	<form method="post" action="/revPost">
        <!--�� ����-->
        <%
	        String date = request.getParameter("date");
		    String room = request.getParameter("room");
		    if (date == null) {
	            date = "";
	        }
		%>
        <div>
            <table width="650" border="1" cellspacing="0" cellpadding="5">
            <!--���̺� ����-->
            	<tr>
                    <td>����</td>
                    <td><input type="text" name="name" value=""></td>
                </tr>
                <tr>
                    <td>��������</td>
                    <td><input type="text" name="date" value="<%=date%>"></td>
                </tr>
                <tr>
                    <td>�����</td>
                    <td>
                    	<select name="room">
					        <option value="1" <% if ("1".equals(request.getParameter("room"))) { %>selected<% } %>>VIP��</option>
					        <option value="2" <% if ("2".equals(request.getParameter("room"))) { %>selected<% } %>>�Ϲݷ�</option>
					        <option value="3" <% if ("3".equals(request.getParameter("room"))) { %>selected<% } %>>�̱۷�</option>
					    </select>
					</td>
                </tr>
                <tr>
                    <td>�ּ�</td>
                    <td><input type="text" name="addr" value=""></td>
                </tr>
                <tr>
                    <td>��ȭ��ȣ</td>
                    <td><input type="text" name="telnum" value=""></td>
                </tr>
                <tr>
                    <td>�Ա��ڸ�</td>
                    <td><input type="text" name="inName" value=""></td>
                </tr>
                <tr>
                    <td>����Ǹ�</td>
                    <td><input type="text" name="comment" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type ="submit" value="����"></td>
                </tr>
            </table>
        </div>
        </form>
	</body>
</html>