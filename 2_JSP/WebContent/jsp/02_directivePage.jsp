<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" errorPage="error/error.jsp"%>
<%--  <%@ page import="java.util.ArrayList" %> --%>
<%--
	page 지시어 : 현재 JSP페이지를 컨테이너에서 처리하는데 필요한 각종 속성을 기술하는 부분
 --%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			// <% % > : 스크립틀릿(자바코드 작성)
			/* */
			
			int total=0;
			for(int i =1; i<=10;i++){
				total += i;
				
		%>
			이렇게도 쓸수있다고요?!<br>
		<% 
			}
			
			System.out.println(total);
			ArrayList<String> list = new ArrayList<String>();
			list.add(0,null);
			
			System.out.println(list.get(0).charAt(0));
		%>
		<br>
		
		expression 출력 : 1부터 10까지의 합은  <%= total %> 입니다.<br>
		scriptlet 출력 : 1부터 10까지의 합은 <% out.println(total); %> 입니다.<br>
		
		<%-- <%= exception %> --%>
</body>
</html>