<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<h1>ȸ������ ȭ��</h1>
	<form action="JoinOk" method="post">
	<table border="0">
		<tbody>
			<tr>
				<td>�̸�</td><td><input type="text" name="name" placeholder="�̸��� �Է����ּ���." size="30"></td>
			</tr>
			<tr>
				<td>���̵�</td><td><input type="text" name="id" placeholder="���̵� �Է����ּ���." size="30" required></td>
			</tr>
			<tr>
				<td>��й�ȣ</td><td><input type="password" name="pw" placeholder="��й�ȣ�� �Է����ּ���." size="32" required></td>
			</tr>
			<tr>
				<td>��й�ȣȮ��</td><td><input type="password" name="pwconfig" placeholder="�ѹ� �� �Է����ּ���." size="32" required></td>
			</tr>
		</tbody>
	</table>
	
	<input type="submit" value="�Ϸ�"> <input type="reset" value="�ٽ��Է�">
	</form>
</body>
</html>