<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*" errorPage="error/error.jsp"%>
<%--  <%@ page import="java.util.ArrayList" %> --%>
<%--
	page ���þ� : ���� JSP�������� �����̳ʿ��� ó���ϴµ� �ʿ��� ���� �Ӽ��� ����ϴ� �κ�
 --%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			// <% % > : ��ũ��Ʋ��(�ڹ��ڵ� �ۼ�)
			/* */
			
			int total=0;
			for(int i =1; i<=10;i++){
				total += i;
				
		%>
			�̷��Ե� �����ִٰ��?!<br>
		<% 
			}
			
			System.out.println(total);
			ArrayList<String> list = new ArrayList<String>();
			list.add(0,null);
			
			System.out.println(list.get(0).charAt(0));
		%>
		<br>
		
		expression ��� : 1���� 10������ ����  <%= total %> �Դϴ�.<br>
		scriptlet ��� : 1���� 10������ ���� <% out.println(total); %> �Դϴ�.<br>
		
		<%-- <%= exception %> --%>
</body>
</html>