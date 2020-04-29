<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd {background: #FFC;}
.even {	background: #FF9;}
.active {	width: 10px;	height: 10px;	background: #f60;	color: white;}
</style>

</head>
<body>

<table class="tbl paginated" id="tbl">
<thead>

	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
		<td>4</td>
	</tr>
</thead>
<tbody>
 	<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>

<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>v
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr><tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
<tr>
	<td>1</td>
	<td>124</td>
	<td>14</td>
	<td>12</td>
</tr>
</tbody>



</table>



<script>
$(function(){
	//page();
	loadData();
});

// ajax로 테이블리스트 생성
function loadData(code){
	$.ajax({
			url:"/test/api/url?test=" + test,
			type:"GET",
			cache: false,
			dataType: "json",
			headers: { "cache-control": "no-cache" },
			success:function (data){
			var lists = data.result;
			var temp = "<thead><tr><td class='listth' style='width:150px;' >등록번호</td>"+
			"<td class='listth' style='width:115px;' >이름</td>"+
			"<td class='listth' style='width:130px' >단말기명</td>"+
			"<td class='listth' style='width:150px' >전화번호</td>"+
			"<td class='listth' style='width:100px' >관리</td></tr></thead>";
		for (var i=0; i< lists.length; i++) {
			temp += '<tr><td class="listtd" >' + lists[i].udid +'</td>' +
			'<td class="listtd" >' + lists[i].owner +'</td>' +
			'<td class="listtd" >' + lists[i].product_name +'</td>' +
			'<td class="listtd" >' + lists[i].tel +'</td>' +
			'<td class="listtd" >수정</td></tr>';
		}
		$("#tbl").html(temp);
		page();
		}
	}); 
}
//만들어진 테이블에 페이지 처리
function page(){ 
	var reSortColors = function($table) {
	  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 $('table.paginated').each(function() {
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 10;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr').length;
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	   $("#remo").html("");
	   
	   if (numPages > 1) {     // 한페이지 이상이면
	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
	     nowp = 0;     // 1부터 
	     endp = pagesu;    // 10까지
	    }else{
	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
	     endp = nowp+pagesu;   // 10까지
	     pi = 1;
	    }
	    
	    if (numPages < endp) {   // 10페이지가 안되면
	     endp = numPages;   // 마지막페이지를 갯수 만큼
	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
	    }
	    if (nowp < 1) {     // 시작이 음수 or 0 이면
	     nowp = 0;     // 1페이지부터 시작
	    }
	   }else{       // 한페이지 이하이면
	    nowp = 0;      // 한번만 페이징 생성
	    endp = numPages;
	   }
	   // [처음]
	   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
	          currentPage = 0;   
	          $table.trigger('repaginate');  
	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
	      }).appendTo($pager).addClass('clickable');
	    // [이전]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	          if(currentPage == 0) return; 
	          currentPage = currentPage-1;
	    $table.trigger('repaginate'); 
	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [1,2,3,4,5,6,7,8]
	   for (var page = nowp ; page < endp; page++) {
	    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
	     currentPage = event.data['newPage'];
	     $table.trigger('repaginate');
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	     }).appendTo($pager).addClass('clickable');
	   } 
	    // [다음]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	    if(currentPage == numPages-1) return;
	        currentPage = currentPage+1;
	    $table.trigger('repaginate'); 
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [끝]
	   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
	           currentPage = numPages-1;
	           $table.trigger('repaginate');
	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	     
	     $($(".page-number")[2]).addClass('active');
	reSortColors($table);
	  });
	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
	   $pager.appendTo($table);
	   $table.trigger('repaginate');
	 });
}
</script>


</body>
</html>