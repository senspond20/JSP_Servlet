<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.outer {
	width: 800px;
	height: 500px;
	background: rgba(255, 255, 255, 0.4);
	border: 5px solid white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#listArea {
	text-align: center;
}

.tableArea {
	width: 650px;
	height: 350px;
	margin: auto;
}

th {
	border-bottom: 1px solid grey;
}

#writeNoBtn {
	background: #B2CCFF;
	color: white;
	border-radius: 10px;
	width: 80px;
	height: 25px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<div class="tableArea">
			<table id="listArea">
				<tr>
					<th>글번호</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th>조회수</th>
					<th width="100px">작성일</th>
				</tr>

				<%
					if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="5">존재하는 공지사항이 없습니다.</td>
				</tr>
				<%
					} else {
						for (Notice n : list) {
				%>
				<tr>
					<td><%=n.getnNo()%></td>
					<td><%=n.getnTitle()%></td>
					<td><%=n.getnWriter()%></td>
					<td><%=n.getnCount()%></td>
					<td><%=n.getnDate()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>

		<div class="searchArea" align="center">

			<%
				if (loginUser != null && loginUser.getUserId().equals("admin")) {
			%>
			<button onclick="location.href ='views/notice/noticeInsertForm.jsp'"
				id="writeNoNtn">글쓰기</button>
			<%
				}
			%>

		</div>
	</div>

	<script type="text/javascript">
      $(function(){
         $('#listArea td').mouseenter(function(){
            $(this).parent().css({'background' : 'darkgray', 'cusor' : 'pointer'})
         }).mouseout(function(){
            $(this).parent().css({'background' : 'none'})
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
            location.href="<%=request.getContextPath()%>/detail.no?no=" + num;
         })
      })
   </script>

</body>
</html>