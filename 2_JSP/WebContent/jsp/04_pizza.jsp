<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>
		������ <span style="color: pink;"><%@ include file="today.jsp"%></span>�Դϴ�.
	</h2>
	<h2>���� ��ī����</h2>

	<table border="1";>
		<tr>
			<th>����</th>
			<th>�̸�</th>
			<th>����</th>
			<th rowspan="12"></th>
			<th>����</th>
			<th>�̸�</th>
			<th>����</th>
		</tr>
		<tr>
			<td rowspan="5">����</td>
			<td>ġ������</td>
			<td>5000</td>
			<td rowspan="11">���̵�</td>
			<td>���챸�����</td>
			<td>9000</td>
		</tr>
		<tr>
			<td>���ǳ��̼�����</td>
			<td>6000</td>
			<td>ġŲ��ƽ&��</td>
			<td>4900</td>
		</tr>
		<tr>
			<td>������������</td>
			<td>7000</td>
			<td>ġ����콺�İ�Ƽ</td>
			<td>4000</td>
		</tr>
		<tr>
			<td>��������</td>
			<td>7000</td>
			<td>���층&��������</td>
			<td>3500</td>
		</tr>
		<tr>
			<td>�Ұ������</td>
			<td>8000</td>
			<td>������������</td>
			<td>3000</td>
		</tr>
		<tr>
			<td rowspan="6">����</td>
			<td>��������</td>
			<td>1000</td>
			<td>�ݶ�</td>
			<td>1500</td>
		</tr>
		<tr>
			<td>��ũ������</td>
			<td>1500</td>
			<td>���̴�</td>
			<td>1500</td>
		</tr>
		<tr>
			<td>���ξ�������</td>
			<td>2000</td>
			<td>�����ҽ�</td>
			<td>500</td>
		</tr>
		<tr>
			<td>ġ������</td>
			<td>2000</td>
			<td>��Ŭ</td>
			<td>300</td>
		</tr>
		<tr>
			<td>ġ��ũ����Ʈ</td>
			<td>2000</td>
			<td>�ּҽ�</td>
			<td>100</td>
		</tr>
		<tr>
			<td>ġ�����Ʈ</td>
			<td>3000</td>
			<td>�ĸ��� ġ���</td>
			<td>100</td>
		</tr>
	</table>
	<br>
	<br>
	<form action="/2_JSP/pizzaServlet.do" method ="post">
		����: <select>
			<option value="ġ������" selected>ġ������</option>
			<option value="�޺���̼� ����">�޺���̼� ����</option>
			<option value="������������">������������</option>
			<option value="��������">��������</option>
			<option value="�Ұ������">�Ұ������</option>
		</select><br> ���� : 
		
		<input type="checkbox" name="topping" id="sp" value="��������"><label>��������</label> 
		<input type="checkbox" name="topping" id="corn" value="��ũ������"><label>��ũ������</label> 
		<input type="checkbox" name="topping" id="pine" value="���ξ�������"><label>���ξ�������</label>
		<input type="checkbox" name="topping" id="cheezetop" value="ġ������"><label>ġ������</label>
		<input type="checkbox" name="topping" id="cheezecro" value="ġ��ũ����Ʈ"><label>ġ��ũ����Ʈ</label>
		<input type="checkbox" name="topping" id="cheezebite"><label>ġ�����Ʈ</label>
		
		<br> ���̵� : <input type="checkbox" name="side" id="s1"
			value="���챸�����"><label>���챸�� ���</label> <input type="checkbox"
			name="side" id="s2" value="ġ�ƽ&��"><label>ġ�ƽ&��</label> <input
			type="checkbox" name="side" id="s3" value="ġ��İ�Ƽ"><label>ġ��İ�Ƽ</label>
		<input type="checkbox" name="side" id="s4" value="���층&��������"><label>���층&��������</label>
		<input type="checkbox" name="side" id="s5" value="������������"><label>������������</label>
		<input type="checkbox" name="side" id="s6" value="�ݶ�"><label>�ݶ�</label>
		<input type="checkbox" name="side" id="s7" value="���̴�"><label>���̴�</label>
		<input type="checkbox" name="side" id="s8" value="�����ҽ�"><label>�����ҽ�</label>
		<input type="checkbox" name="side" id="s9" value="��Ŭ"><label>��Ŭ</label>
		<input type="checkbox" name="side" id="s10" value="�ּҽ�"><label>�ּҽ�</label>
		<input type="checkbox" name="side" id="s11" value="�ĸ��� ġ���"><label>�ĸ���
			ġ���</label> <br>
		<br> <input type="submit" name="btnOk" id="btnOk" value="Ȯ��">

	</form>

</body>
</html>