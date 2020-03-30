<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	<%
		Date now = new Date();
		String today = String.format("%tY년 %tm월 %td일 %tA",now,now,now,now);
	%>
	<h2>오늘 날짜<span style="color: lightgray"><%= today %></span></h2> --%>
	
	<h2>오늘 날짜<span style="color: lightgray"><%@ include file="today.jsp"%></span></h2>
	
	<%-- <% String today ="이선제 살 찐 날"; --%> 
</body>
</html>