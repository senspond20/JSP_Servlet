<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>


$('#firstBtn').click(function(url){
	location.href = url;
});


	onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=currentPage - 1%>&option=<%=option%>&search=<%=search%>'"
		
</script>

<body>
	<div class="pagingArea" align="center">
		<%
			if (!list.isEmpty()) {
		%>
		<!-- 맨 처음으로 -->
		<button id ="firstBtn">&lt;&lt;</button>

		<!-- 이전 페이지로 -->
		<button id="beforeBtn">&lt;</button>
		<script>
			if (
		<%=currentPage%>
			<= 1) {
				$('#beforeBtn').attr('disabled', 'true');
			}
		</script>

		<!-- 10개 페이지 목록 -->
		<%
			for (int p = startPage; p <= endPage; p++) {
		%>
		<%
			if (p == currentPage) {
		%>
		<button id="choosen" disabled><%=p%></button>
		<%
			} else {
		%>
		<button id="numBtn"
			onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=p%>&option=<%=option%>&search=<%=search%>'"><%=p%></button>
		<%
			}
		%>
		<%
			}
		%>

		<!-- 다음 페이지로 -->
		<button id="afterBtn"
			onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=currentPage + 1%>&option=<%=option%>&search=<%=search%>'">&gt;</button>
		<script>
			if (
		<%=currentPage%>
			>=
		<%=maxPage%>
			) {
				$('#afterBtn').attr('disabled', 'true');
			}
		</script>

		<!-- 맨 끝으로 -->
		<button
			onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=maxPage%>&option=<%=option%>&search=<%=search%>'
									
									">&gt;&gt;</button>
		<%
			}
		%>
	</div>
</body>
</html>