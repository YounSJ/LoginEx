<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입 화면</h1>
	<form action="JoinOk" method="post">
	<table border="0">
		<tbody>
			<tr>
				<td>이름</td><td><input type="text" name="name" placeholder="이름을 입력해주세요." size="30"></td>
			</tr>
			<tr>
				<td>아이디</td><td><input type="text" name="id" placeholder="아이디를 입력해주세요." size="30" required></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요." size="32"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td><td><input type="password" name="pwconfig" placeholder="한번 더 입력해주세요." size="32"></td>
			</tr>
		</tbody>
	</table>
	
	<input type="submit" value="완료"> <input type="reset" value="다시입력">
	</form>
</body>
</html>