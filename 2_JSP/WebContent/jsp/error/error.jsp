<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���������� �Դϴ�</title>
</head>
<body>
	<h1 style="color: red;">������,����!</h1>
	<%-- isErrorPage= true ������� exception ���� --%>
	<%= exception %><br>
	<%= exception.getClass().getName() %><br>
	<%= exception.getMessage() %>
</body>
</html>