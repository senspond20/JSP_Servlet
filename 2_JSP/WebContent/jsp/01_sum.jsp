<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1���� 10������ �� ���ϱ�</title>
</head>
<body>
		<!-- HTML �ּ��Դϴ�. -->
		<%-- JSP �ּ��Դϴ�. --%>
		<%--�� �ּ��� ���̸� ����� --%>
		<%-- ���� : HTML �ּ��� ������ �ҽ����⳪ F12�� Ȯ�ΰ���������(Ŭ���̾�Ʈ���� ������ �Ǳ� ����) JSP�ּ��� �� 2���� �ص� �ȳ��� --%>
		
		
		<%
			// �ڹ� �ڵ� �ִ°��̴ϱ�
			/* �� 2���� �ּ��� ��� ����*/
			// <% % > : ��ũ��Ʋ��(�ڹ��ڵ� �ۼ�)
			
			int total=0;
			for(int i =1; i<=10;i++){
				total += i;
				
		%>
			�̷��Ե� �����ִٰ��?!<br>
		<% 
			}
			
			System.out.println(total);
		%>
		<br>
		
		expression ��� : 1���� 10������ ����  <%= total %> �Դϴ�.<br>
		scriptlet ��� : 1���� 10������ ���� <% out.println(total); %> �Դϴ�.<br>
		
		
		
</body>
</html>