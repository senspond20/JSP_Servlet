<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP&Servlet</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
	body{ 
		background:url('<%= request.getContextPath() %>/images/bf.png') no-repeat center center fixed;
						/* ContextPath를 굳이 적을 필요 없이 어떤 이름이든지 이렇게 쓰면 contextPath가 나옴 */ 
		background-size: cover;
	}
	#loginBtn input, #memberJoinBtn{
		float: right; display: inline-block; text-align: center; background: #D1B2FF; 
		color: white; height: 25px; width: 100px; border-radius: 15px;
	}
	#memberJoinBtn{background: #B2CCFF;}
	#loginBtn:hover, #memberJoinBtn:hover{cursor: pointer;}
	.loginArea > form{float: right;}
	#logoutBtn, #myPageBtn{
		float: right; display: inline-block; text-align: center; background: #D1B2FF;
		color: white; height: 25px; width: 100px; border-radius: 15px;
	}
	#myPageBtn{background: #B2CCFF;} 
</style>
</head>
<body>
	<h1 align="center">Welcome to JSP&Servlet World!</h1>
	<div class="loginArea">
		<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post" onsubmit ="return validate();">
			<table>
				<tr>
					<td><label>ID : </label></td>
					<td><input type="text" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td><label>PWD : </label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="saveId" id="saveId">&nbsp;
						<label for="saveId">아이디 저장</label>
					</td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				<div id="memberJoinBtn">회원가입</div>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>
		</form>
	</div>
	
	<!-- 유효성 검사 -->
	<script>
		function validate(){
			if($('#userId').val().trim().length == 0){
				alert('아이디를 입력해주세요');
				$('#userId').focus();
				return false;
			}
			if($('#userPwd').val().trim().length == 0){
				alert('비밀번호를 입력해주세요');
				$('#userPwd').focus();
				return false;
			}
			return true;
		}
	</script>
	
	
	
	
	
	
	
</body>
</html>