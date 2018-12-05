<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script language="javascript">
		alert("로그아웃 되었습니다");
		<%
			session.invalidate(); // 스크립트릿이 없으면 Login.html로 이동하지않음
		%>
		location.href="Login.jsp";
	</script>
</body>
</html>