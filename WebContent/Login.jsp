<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<h1>로그인 화면</h1>
	<form action="LoginOk" method="post">
	<table border="0">
		<tbody>
			<tr>
				<td>아이디</td><td><input type="text" name="id" placeholder="아이디를 입력해주세요." size="30" required></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요." size="32"></td>
			</tr>
	</table>
	
	<input type="submit" value="로그인">
	</form>
</body>
</html>