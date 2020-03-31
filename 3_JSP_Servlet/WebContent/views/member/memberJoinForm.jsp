<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white; color: black;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.outer label, .outer td{color: black;}
	input{margin-top: 2px;}
	#idCheck, #nickCheck, #goMain, #joinBtn{background: #B2CCFF; color: white; border-radius: 5px; width: 80px; heigth: 25px; text-align: center;}
	#idCheck:hover, #nickCheck:hover, #joinBtn:hover, #goMain:hover {cursor:pointer;}
	#joinForm td {text-align: right;}
	#idCheck, #nickCheck {background: #FFD8D8; color: white;}
	#joinBtn {background: #D1B2FF; color: white;}
	#joinBtn, #goMain {display:inline-block;}
	label.must{color: red; font-weight: bold;}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		
		<form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm">
			<table>
				<tr>
					<td width="200px"><label class="must">*</label> 아이디</td>
					<td><input type="text" maxlength="13" name="joinUserId" required></td>
					<td width="200px"><div id="idCheck" onclick="checkId();">중복확인</div></td>
				</tr>
				<tr>
					<td><label class="must">*</label> 비밀번호</td>
					<td><input type="password" maxlength="13" name="joinUserPwd" required></td>
				</tr>
				<tr>
					<td><label class="must">*</label> 비밀번호 확인</td>
					<td><input type="password" maxlength="13" name="joinUserPwd2" required></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td><label class="must">*</label> 이름</td>
					<td><input type="text" name="userName" required></td>
				</tr>
				<tr>
					<td><label class="must">*</label> 닉네임</td>
					<td><input type="text" maxlength="15" name="nickName" required></td>
					<td width="200px"><div id="nickCheck" onclick="checkNick();">중복확인</div></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" id="sports" name="interest" value="운동">
						<label for="sports">운동</label>
						<input type="checkbox" id="climbing" name="interest" value="등산">
						<label for="climbing">등산</label>
						<input type="checkbox" id="fishing" name="interest" value="낚시">
						<label for="fishing">낚시</label>
						<input type="checkbox" id="cooking" name="interest" value="요리">
						<label for="cooking">요리</label>
						<input type="checkbox" id="game" name="interest" value="게임">
						<label for="game">게임</label>
						<input type="checkbox" id="etc" name="interest" value="기타">
						<label for="etc">기타</label>
					</td>
					<td></td>
				</tr>
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<div id="goMain" onclick="goMain();">메인으로</div>
				<input id="joinBtn" type="submit" value="가입하기">
			</div>
		</form>
	</div>
	
	<script>
		function checkId(){
			window.open('idCheckForm.jsp', 'checkForm', 'width=500, height=300');
		}
		
	</script>
</body>
</html>