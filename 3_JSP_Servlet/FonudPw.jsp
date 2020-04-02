<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#i1{
	display : inline-block;
	background-color : lightgray;
	color : black;
	height : 100px;
	width : 50%;
	font-size : 15pt;
	margin : 0 auto;
}

</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<nav>
		<ul>
			<li><a id = "i1"><center>아이디 찾기</center></a><a id = "i1"><center>비밀번호 찾기</center></a></li>
		</ul>
		</nav>
		<table>
			
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input class="input-standard" type="text"
						placeholder="아이디를 입력해 주세요." /></td>
					<td></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input class="input-standard" type="text"
						placeholder="이름을 입력해 주세요." /></td>
					<td></td>
				</tr>
				
				<tr>
					<td>이메일 주소</td>
					<td><input class="input-standard" type="text"
						placeholder="이메일 주소를 입력해주세요." />
						<button class="btn-standard">인증번호 받기</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input class="input-standard" type="text"
						placeholder="인증번호를 입력해 주세요." /></td>
				</tr>
				<tr>
					<td></td>
					<td>
						본인확인 이메일 주소와 입력한 이메일 주소<br>
						가 같아야, 인증번호를 받을 수 있습니다.
					</td>
				</tr>
				<tr>
				<td>
					<button class = "btn-standard">다음</button>
				</td>
				</tr>
			</tbody> 
		</table>




	</div>

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="../../resources/js/main.js"></script>
</body>
</html>