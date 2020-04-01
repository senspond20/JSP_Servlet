<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white; 
		color: black; margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	input{margin-top: 2px;}
	#updatePwdBtn, #cancelBtn{background: #B2CCFF; color: white; border-radius: 5px; width: 110px; heigth: 25px; text-align: center; display: inline-block;}
	#updatePwdBtn:hover, #cancelBtn:hover{cursor:pointer;}
	#updatePwdForm td{text-align: right; height: 50px;}
	#cancelBtn {background: #D1B2FF;}
	table{margin: auto;}
</style>

<!-- 비밀번호가 같은지 다른지 확인하는 유효성검사도 넣기 -->
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">비밀번호 수정하기</h2>
		
		<form action="<%= request.getContextPath() %>/updatePwd.me" method="post" id="updatePwdForm" name="updatePwdForm" onsubmit="return send();">
			<table>
				<tr>
					<td><label>현재 비밀번호</label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<td><label>변경 비밀번호</label></td>
					<td><input type="password" name="newPwd"></td>
				</tr>
				<tr>
					<td><label>변경 비밀번호 확인</label></td>
					<td><input type="password" name="newPwd2"></td>
				</tr>
			</table>
			
			<br><br>
			
			<div class="btns" align="center">
				<input id="updatePwdBtn" type="submit" value="변경하기">
				<div id="cancelBtn" onclick="location.href='javascript:history.back()'">취소하기</div>
			</div>
		</form>
	</div>
	<script>
		function(){
		
		}
	
	</script>
</body>
</html>