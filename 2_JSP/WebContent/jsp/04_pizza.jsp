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
		오늘은 <span style="color: pink;"><%@ include file="today.jsp"%></span>입니다.
	</h2>
	<h2>피자 아카데미</h2>

	<table border="1";>
		<tr>
			<th>종류</th>
			<th>이름</th>
			<th>가격</th>
			<th rowspan="12"></th>
			<th>종류</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
		<tr>
			<td rowspan="5">피자</td>
			<td>치즈피자</td>
			<td>5000</td>
			<td rowspan="11">사이드</td>
			<td>오븐구이통닭</td>
			<td>9000</td>
		</tr>
		<tr>
			<td>콤피네이션피자</td>
			<td>6000</td>
			<td>치킨스틱&윙</td>
			<td>4900</td>
		</tr>
		<tr>
			<td>포테이토피자</td>
			<td>7000</td>
			<td>치즈오븐스파게티</td>
			<td>4000</td>
		</tr>
		<tr>
			<td>고구마피자</td>
			<td>7000</td>
			<td>새우링&웨지감자</td>
			<td>3500</td>
		</tr>
		<tr>
			<td>불고기피자</td>
			<td>8000</td>
			<td>갈릭포테이토</td>
			<td>3000</td>
		</tr>
		<tr>
			<td rowspan="6">토핑</td>
			<td>고구마무스</td>
			<td>1000</td>
			<td>콜라</td>
			<td>1500</td>
		</tr>
		<tr>
			<td>콘크림무스</td>
			<td>1500</td>
			<td>사이다</td>
			<td>1500</td>
		</tr>
		<tr>
			<td>파인애플토핑</td>
			<td>2000</td>
			<td>갈릭소스</td>
			<td>500</td>
		</tr>
		<tr>
			<td>치즈토핑</td>
			<td>2000</td>
			<td>피클</td>
			<td>300</td>
		</tr>
		<tr>
			<td>치즈크러스트</td>
			<td>2000</td>
			<td>핫소스</td>
			<td>100</td>
		</tr>
		<tr>
			<td>치즈바이트</td>
			<td>3000</td>
			<td>파마산 치즈가루</td>
			<td>100</td>
		</tr>
	</table>
	<br>
	<br>
	<form action="/2_JSP/pizzaServlet.do" method ="post">
		피자: <select>
			<option value="치즈피자" selected>치즈피자</option>
			<option value="콤비네이션 피자">콤비네이션 피자</option>
			<option value="포테이토피자">포테이토피자</option>
			<option value="고구마피자">고구마피자</option>
			<option value="불고기피자">불고기피자</option>
		</select><br> 토핑 : 
		
		<input type="checkbox" name="topping" id="sp" value="고구마무스"><label>고구마무스</label> 
		<input type="checkbox" name="topping" id="corn" value="콘크림무스"><label>콘크림무스</label> 
		<input type="checkbox" name="topping" id="pine" value="파인애플토핑"><label>파인애플토핑</label>
		<input type="checkbox" name="topping" id="cheezetop" value="치즈토핑"><label>치즈토핑</label>
		<input type="checkbox" name="topping" id="cheezecro" value="치즈크러스트"><label>치즈크러스트</label>
		<input type="checkbox" name="topping" id="cheezebite"><label>치즈바이트</label>
		
		<br> 사이드 : <input type="checkbox" name="side" id="s1"
			value="오븐구이통닭"><label>오븐구이 통닭</label> <input type="checkbox"
			name="side" id="s2" value="치즈스틱&윙"><label>치즈스틱&윙</label> <input
			type="checkbox" name="side" id="s3" value="치즈스파게티"><label>치즈스파게티</label>
		<input type="checkbox" name="side" id="s4" value="새우링&웨지감자"><label>새우링&웨지감자</label>
		<input type="checkbox" name="side" id="s5" value="갈릭포테이토"><label>갈릭포테이토</label>
		<input type="checkbox" name="side" id="s6" value="콜라"><label>콜라</label>
		<input type="checkbox" name="side" id="s7" value="사이다"><label>사이다</label>
		<input type="checkbox" name="side" id="s8" value="갈릭소스"><label>갈릭소스</label>
		<input type="checkbox" name="side" id="s9" value="피클"><label>피클</label>
		<input type="checkbox" name="side" id="s10" value="핫소스"><label>핫소스</label>
		<input type="checkbox" name="side" id="s11" value="파마산 치즈가루"><label>파마산
			치즈가루</label> <br>
		<br> <input type="submit" name="btnOk" id="btnOk" value="확인">

	</form>

</body>
</html>