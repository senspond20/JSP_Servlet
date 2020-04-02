<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
//	System.out.println(loginUser);
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP&Servlet</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
	body{ 
		background:url("<%= request.getContextPath() %>/images/bg.png") no-repeat center center fixed;
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
	
	.wrap{background:white; width: 100%; height: 50px;}
	.menu{background:white; color: navy; text-align: center; font-weight: bold;
		  vertical-align: middle; width: 150px; height: 50px; display:table-cell;
	}
	nav{width: 600px; margin-left: auto; margin-right: auto;}
	.menu:hover{background: beige; color: orangered; font-weight: bold; cursor: pointer;}
</style>
</head>
<body>
	<h1 align="center">Welcome to JSP&Servlet World!</h1>
	<div class="loginArea">
	
	<% if(loginUser == null) { %>
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
				<div id="memberJoinBtn" onclick ="memberJoin();">회원가입</div>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>
		</form>
	<% }else{ %>
		<div id = "userInfo" align ="right">
			<label><%= loginUser.getUserName() %>님의 방문을 환영합니다.</label>
			<div class = "btns">
				<div id = "myPageBtn" onclick = "myPage();">내 정보보기</div>
				<div id = "logoutBtn" onclick = "logout();">로그아웃</div>
			</div>
		</div>
	<% } %>	
	</div>
	
	<br clear ="all">
	<br>
	
	<div class ="wrap">
		<nav>
			<div class ="menu" onclick="goHome();">HOME</div>
			<div class ="menu" onclick="goNotice();">공지사항</div>
			<div class ="menu" onclick="goBoard();">게시판</div>
			<div class ="menu" onclick="goThumbnail();">사진게시판</div>		
		</nav>	
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
		
		function logout(){
			location.href ="<%= request.getContextPath() %>/logout.me";
		}
		function memberJoin(){
			location.href ="<%= request.getContextPath() %>/views/member/memberJoinForm.jsp"; 
		}
		var msg = "<%= msg %>";
		// var msg = 'null';
		// var msg = '회원가입에 성공했습니다.';
		$(function(){
			if(msg != 'null'){
				alert(msg);
			}
		});
		
		
		/* Notice */
		function myPage(){
			location.href = '<%= request.getContextPath() %>/myPage.me';
		}
		
		function goHome(){
			location.href ="<%= request.getContextPath() %>/index.jsp";
		}
		
		function goNotice(){
			location.href ="<%= request.getContextPath() %>/list.no";
		}
		
		function goBoard(){
			location.href ="<%= request.getContextPath() %>/list.bo";
		}
		
		function goThumbnail(){
			location.href ="<%= request.getContextPath() %>/list.th";
		}
		
	</script>
	
</body>
</html>