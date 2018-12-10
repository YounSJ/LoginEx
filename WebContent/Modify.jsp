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
		이름: <input type="text" name="name" value=<%=name %>><br />
		아이디: <%=id %><br />
		비밀번호:<input type="password" name="pw" size="10"><br /> 
		비밀번호확인: <input type="password" name="pwconfig"><br />
		<input type="submit" value="수정완료">
	</form>
</body>
</html>