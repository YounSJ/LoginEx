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
		alert("�α׾ƿ� �Ǿ����ϴ�");
		<%
			session.invalidate(); // ��ũ��Ʈ���� ������ Login.html�� �̵���������
		%>
		location.href="Login.html";
	</script>
</body>
</html>