<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1부터 10까지의 합 구하기</title>
</head>
<body>
		<!-- HTML 주석입니다. -->
		<%-- JSP 주석입니다. --%>
		<%--두 주석의 차이를 적어보자 --%>
		<%-- 차이 : HTML 주석은 페이지 소스보기나 F12로 확인가능하지만(클라이언트에게 전달이 되기 때문) JSP주석은 저 2개를 해도 안나옴 --%>
		
		
		<%
			// 자바 코드 넣는곳이니까
			/* 이 2개의 주석을 사용 가능*/
			// <% % > : 스크립틀릿(자바코드 작성)
			
			int total=0;
			for(int i =1; i<=10;i++){
				total += i;
				
		%>
			이렇게도 쓸수있다고요?!<br>
		<% 
			}
			
			System.out.println(total);
		%>
		<br>
		
		expression 출력 : 1부터 10까지의 합은  <%= total %> 입니다.<br>
		scriptlet 출력 : 1부터 10까지의 합은 <% out.println(total); %> 입니다.<br>
		
		
		
</body>
</html>