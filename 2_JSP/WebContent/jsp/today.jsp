<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		Date now = new Date();
		String today = String.format("%tY년 %tm월 %td일 %tA",now,now,now,now);
	
	  %>
	  <%= today %>
</body>
</html>