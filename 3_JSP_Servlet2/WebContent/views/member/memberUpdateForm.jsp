<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String nickName = request.getParameter("nickName");
	String phone = !request.getParameter("phone").equals("-") ? request.getParameter("phone") : "";
	String email = !request.getParameter("email").equals("-") ? request.getParameter("email") : "";
	String address = !request.getParameter("address").equals("-") ? request.getParameter("address") : "";
	
	String[] checkedInterest = new String[6];
	if(!request.getParameter("interest").equals("-")){
		String[] interests = request.getParameter("interest").split(",");
		
		for(int i = 0; i < interests.length; i++){
			switch(interests[i]){
			case "운동" : checkedInterest[0] = "checked"; break;
			case "등산" : checkedInterest[1] = "checked"; break;
			case "낚시" : checkedInterest[2] = "checked"; break;
			case "요리" : checkedInterest[3] = "checked"; break;
			case "게임" : checkedInterest[4] = "checked"; break;
			case "기타" : checkedInterest[5] = "checked"; break;
			}
		}
	}
%>
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
	#cancelBtn, #updateBtn{background: #B2CCFF; color: white; border-radius: 5px; width: 110px; heigth: 25px; text-align: center; display:inline-block;}
	#cancelBtn:hover, #updateBtn:hover, #nickCheck:hover {cursor:pointer;}
	#nickCheck{background: #FFD8D8; color: white; border-radius: 5px; width: 80px; heigth: 25px; text-align: center;}
	#updateForm td {text-align: right;}
	#updateBtn {background: #D1B2FF;}
	#must{color: red; font-weight: bold;}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">내 정보 수정하기</h2>
		
		<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
			<table>
				<tr>
					<td width="200px"><label id="must">*</label> 아이디</td>
					<td>
						<input type="text" name="joinUserId" style="background:lightgray;" readonly value="<%= userId %>">
					</td>
				</tr>
				<tr>
					<td><label id="must">*</label> 이름</td>
					<td><input type="text" name="userName" required value="<%= userName %>"></td>
				</tr>
				<tr>
					<td><label id="must">*</label> 닉네임</td>
					<td><input type="text" maxlength="15" name="nickName" required value="<%= nickName %>"></td>
					<td width="200px"><div id="nickCheck" onclick="checkNick();">중복확인</div></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678" value="<%= phone %>">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="<%= email %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= address %>"></td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" id="sports" name="interest" value="운동" <%= checkedInterest[0] %>>
						<label for="sports">운동</label>
						<input type="checkbox" id="climbing" name="interest" value="등산" <%= checkedInterest[1] %>>
						<label for="climbing">등산</label>
						<input type="checkbox" id="fishing" name="interest" value="낚시" <%= checkedInterest[2] %>>
						<label for="fishing">낚시</label>
						<input type="checkbox" id="cooking" name="interest" value="요리" <%= checkedInterest[3] %>>
						<label for="cooking">요리</label>
						<input type="checkbox" id="game" name="interest" value="게임" <%= checkedInterest[4] %>>
						<label for="game">게임</label>
						<input type="checkbox" id="etc" name="interest" value="기타" <%= checkedInterest[5] %>>
						<label for="etc">기타</label>
					</td>
					<td></td>
				</tr>
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<input id="updateBtn" type="submit" value="수정하기">
				<div id="cancelBtn" onclick="location.href='javascript:history.go(-1)'">취소하기</div>
			</div>
		</form>
	</div>
</body>
</html>