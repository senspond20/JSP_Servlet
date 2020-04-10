<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>
<% Board b = (Board)request.getAttribute("board");
   ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:800px; height:500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.tableArea {width: 450px; height:350px; margin-left:auto; margin-right:auto; align: center;}
	table{align: center;}
	#updateBtn, #menuBtn, #deleteBtn, #addReply {background: #B2CCFF; color: white; border-radius: 15px; width: 80px; heigth: 25px; text-align:center; display: inline-block;}
	#menuBtn{background: #D1B2FF;}
	#deleteBtn{background: #D5D5D5;}
	#updateBtn:hover, #menuBtn:hover, #deleteBtn:hover, #addReply:hover{cursor: pointer;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
		
	<div class="outer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<form action="views/board/boardUpdateForm.jsp" id="detailForm" method="post">
				<table>
					<tr>
						<th>분야</th>
						<td>
							<%= b.getCategory() %>
							<input type="hidden" name="category" value=<%= b.getCategory() %>>
						</td>
						<th>제목</th>
						<td colspan="3">
							<%= b.getbTitle() %>
							<input type="hidden" name="bno" value="<%= b.getbId() %>">
							<input type="hidden" name="title" value="<%= b.getbTitle() %>">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= b.getbWriter() %>
						</td>
						<th>조회수</th>
						<td>
							<%= b.getbCount() %>
						</td>
						<th>작성일</th>
						<td>
							<%= b.getModifyDate() %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="6"><textarea cols="60" rows="15" name="content" style="resize:none;" readonly><%= b.getbContent() %></textarea></td>
					</tr>
				</table>
				
				<div align="center">
				<% if(loginUser != null && loginUser.getNickName().equals(b.getbWriter())){ %>
					<input type="submit" id="updateBtn" value="수정">
					<input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
				<% } %>
					<div onclick="location.href='<%= request.getContextPath() %>/list.bo'" id="menuBtn" >메뉴로</div>
				</div>
			</form>
			
			<script>
				function deleteBoard(){
					var bool = confirm('정말 삭제하시겠습니까?');
					
					if(bool){
						$('#detailForm').attr('action', '<%=request.getContextPath() %>/delete.bo');
						$('#detailForm').submit();
					}
				}
			</script>
		</div>
	
	<div class ="replyArea">
		<div class ="replyWriterArea">
			<table>
				<tr>
					<td>댓글 작성</td>
					<td><textarea rows="3" cols="80" id="replyContent" style="resize:none;"></textarea></td>
					<td><button id="addReply">댓글 등록</button>
				</tr>
			</table>
		</div>
		<div id="replySelectArea">
			<table id="replySelectTable">
				<% if(list.isEmpty()) { %>
					<tr><td colspan =3>댓글이 없습니다.</td></tr>
				<% } else { %>
					<% for(int i =0; i < list.size(); i++){ %>
					<tr>
						<td width ="100px"><%= list.get(i).getrWriter()%> </td>
						<td width ="400px"><%= list.get(i).getrContent() %> </td>
						<td width ="200px"><%= list.get(i).getCreateDate()%> </td>	
					</tr>
					<% } %>
				<% } %>
			</table>
		</div>
	</div>
	
	<script>
		$('#addReply').click(function(){
			var writer = '<%= loginUser.getUserId() %>';
			var bid = <%= b.getbId() %>;
			var content = $('#replyContent').val();
			
			$.ajax({
				url: 'insertReply.bo',
				data: {writer:writer, content:content, bid:bid},
				success: function(data){
					$replyTable = $('#replySelectTable');
					$replyTable.html("");
					
					for(var key in data){
						var $tr = $('<tr>');
						var $writerTd = $('<td>').text(data[key].rWriter).css('width','100px');
						var $contentTd = $('<td>').text(data[key].rContent).css('width','400px');
						var $dataTd = $('<td>').text(data[key.createDate]).css('width','200px');
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replyTable.append($tr);
					}
					$('#replyContent').val("");
				
					
					// 다르기 때문에 새로고침을 했을때 일치하지 않는 날짜 형식
					
				}
			});
		});
	</script>
	
	
	
	</div>
	
	
</body>
</html>