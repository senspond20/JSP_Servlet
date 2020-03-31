<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>에러페이지 입니다</title>
</head>
<body>
	<h1 style="color: red;">에러다,에러!</h1>
	<%-- isErrorPage= true 사용으로 exception 접근 --%>
	<%= exception %><br>
	<%= exception.getClass().getName() %><br>
	<%= exception.getMessage() %>
</body>
</html>