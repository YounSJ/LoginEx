<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%= session.getAttribute("name") %>님의 정보가 수정되었습니다.<br />
	<a href="Logout.jsp">로그아웃</a>
</body>
</html>