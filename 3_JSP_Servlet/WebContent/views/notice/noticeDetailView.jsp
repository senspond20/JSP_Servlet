<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="notice.model.vo.Notice" %>

<%
	Notice nView = (Notice)request.getAttribute("nView");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	#updateNoBtn, #cancelBtn, #deleteNoBtn{background: #B2CCFF; color: white; border-radius: 15px; width: 80px; heigth: 25px; text-align: center; display: inline-block;}
	#updateNoBtn:hover, #cancelBtn:hover, #deleteNoBtn:hover{cursor: pointer;}
	#cancelBtn{background: #D1B2FF;}
	#deleteNoBtn{background: #D5D5D5;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<div class="tableArea">
			<form action="views/notice/noticeUpdateForm.jsp" id="detailForm" name="detailForm">
				<table>
					<tr>
						<th>제목</th>
						
						<td colspan="3">
						
						<input type="hidden" size="50" name="title" value="<%= nView.getnTitle() %>"></td>				
						<input type="hidden" size="50" name="no" value="<%= nView.getnNo() %>"></td>				
						<!--  noticeUpdateForm으로 보낼 때 공지사항 번호를 같이 보내야 다시 servlet으로 공지사항 번호를 보낼 수 있으므로  
							 hidden에 같이 넣어둠-->
						<%= nView.getnTitle() %>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
						<%= nView.getnWriter() %>
						</td>
						<th>작성일</th>
						
						<td><input type="hidden" name="date" value = "<%= nView.getnDate() %>"></td>
					</tr>
					<tr>
						<th>내용</th>
						
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"><%= nView.getnContent() %></textarea>
						</td>
					</tr>
				</table>
			
				<br>
				
				<div align="center">
				<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
					<button type="submit" id="updateNoBtn">수정</button>
					<button type ="button" id="deleteNoBtn" onclick ="deleteNo();">삭제</button>
				<% } %>
					<!-- <div onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</div>-->
					
					<div onclick="cancel();" id="cancelBtn">취소</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		function deleteNo(){
			var bool = confirm('정말 삭제하시겠습니까?');
			if(bool){
				location.href="<%= request.getContextPath()%>/delete.no?=no" + <%= nView.getnNo() %>;
			}
		}
		// 취소하면서 공지사항 페이지로 돌아가고 조회수가 갱신되어야하므로 
		function cancel(){
			location.href = "<%= request.getContextPath()%>/list.no";
		}
	
	</script>
	
	
</body>
</html>