<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%!
		Connection conn;
		Statement stmt;
		ResultSet res;
		
		String name, id, pw, pwconfig;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		id = (String)session.getAttribute("id");
	
		String query = "select * from ex where id = '" + id + "'";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "scott" , "tiger");
		stmt = conn.createStatement();
		res =  stmt.executeQuery(query);
		
		while(res.next()) {
			name = res.getString("name");
			pw = res.getString("pw");
			pwconfig = res.getString("pwconfig");
		}
		
	%>
	
	<form action="ModifyOk" method="post">
		�̸�: <input type="text" name="name" value=<%=name %>><br />
		���̵�: <%=id %><br />
		��й�ȣ:<input type="password" name="pw" size="10"><br /> 
		��й�ȣȮ��: <input type="password" name="pwconfig"><br />
		<input type="submit" value="�����Ϸ�">
	</form>
</body>
</html>