<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("bList");
	ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("fList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{width:1000px; height:700px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.thumbnailArea {width:760px; height:550px; margin-left:auto; margin-right:auto;}
	.searchArea {width:80px; margin-left:auto; margin-right:auto;}
	.thumb-list {width:220px; border:1px solid white; display:inline-block; margin:10px; align:center;}
	.thumb-list:hover {opacity:0.8; cursor:pointer;}
	#insertBtn{background: #B2CCFF; border-radius: 15px; color: white; width: 80px; height: 25px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<div class="thumbnailArea">
			<% for(int i = 0; i < blist.size(); i++){ 
				Board b = blist.get(i); %>
				
				<div class="thumb-list" align="center">
					<div>
						<input type="hidden" value="<%= b.getbId() %>">
						<% for(int j = 0; j < flist.size(); j++){
							Attachment a = flist.get(j);
							
							if(b.getbId() == a.getbId()){ %>
								<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName() %>" width="200px" height="150px">
							<% } %>
						<% } %>
					</div>
					<p>
						No. <%= b.getbId() %> <%= b.getbTitle() %> <br>
						조회수 : <%= b.getbCount() %>
					</p>
				</div>
			<% } %>
		</div>
		
		<div class="searchArea">
			<% if(loginUser != null) { %>
				<button onclick="location.href='views/thumbnail/thumbnailInsertForm.jsp'" id="insertBtn">작성하기</button>
			<% } %>
		</div>
	</div>
	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				var bid = $(this).children().children().eq(0).val();
				location.href="<%= request.getContextPath() %>/detail.th?bid=" + bid;
			});
		});
	</script>
</body>
</html>