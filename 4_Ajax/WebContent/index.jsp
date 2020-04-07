<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src ="../js/jquery-3.4.1.min.js"></script>-->
<script src ="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
body {
   background: beige;
}

.test {
   width: 300px;
   min-height: 50px;
   border: 1px solid red;
}
</style>
</head>
<body>
 
   <h1>jQuery를 통한 Ajax 구현</h1>
   
   <h3>1. 버튼 선택 시 전송 값 서버에 출력</h3>
   이름 : <input type="text" id="myName" />
   <button id="nameBtn">이름 전송</button>
   
   <script>
      $('#nameBtn').click(function(){
         var name = $('#myName').val();
         console.log(name);
         
         // ajax 시작!!!
         $.ajax({
            url: 'jQueryTest1.do',
            data: {name:name},
//                뒤에 있는 것이 내가 보낼 값 // 앞에 있는 것이 포장
            type: 'post',
            success: function(data){
               console.log('서버 성공 시 호출되는 함수');
               console.log(data);
            },
            error: function(data) {
               console.log('서버 전송 실패시 호출되는 함수')
            },
            complate: function(data){
               console.log('성공 여부에 상관 없이 무조건 호출되는 함수')
            }
         });
      });
   </script>
   
   <br />
   <h3>2. 버튼 선택 시 서버에서 보낸 값 사용자가 수신</h3>
   <button id="getServerTextBtn">서버에서 보낸 값 확인</button>
   <p class="test" id="p1"></p>
   
   <script>
      $('#getServerTextBtn').click(function(){
         $.ajax({
            url: 'jQueryTest2.do',
            success: function(data){
               $('#p1').text(data)
               console.log(data);
            }
         })
      })
   </script>
   
   <br>
   
   <h3>3. 서버로 기본형 전송 값이 있고 결과로 문자열을 받아 처리</h3>
   <h4>두 개의 값을 더한 결과를 받아옴</h4>
   첫 번째 숫자 : <input type="text" id="firstNum" /> <br>
   두 번째 숫자 : <input type="text" id="secondNum" />
   <button id="plusBtn">더하기</button>
   <p class="test" id="p2"></p>

	<script>
		$('#plusBtn').click(function(){
			var firstNum = $('#firstNum').val();
			var secondNum = $('#secondNum').val();
			
			$.ajax({
				url: "jQueryTest3.do",
				data : {firstNum: firstNum, secondNum:secondNum},
				success: function(data){
					$('#p2').text(data);
				}
			});
		});
		
		// jQueryTest3.do에 위 두개의 값 전송
	</script>
	<br>
	
	<h3>4. Object형태의 데이터를 서버에 전송, 서버에서 처리 후 서버 console로 출력</h3>
	학생 1: <input type="text" id ="student1"><br>
	학생 2: <input type="text" id ="student2"><br>
	학생 3: <input type="text" id ="student3"><br>
	<button id="studentTest">결과 확인</button>
	
	<script>
		$('#studentTest').click(function(){
			var student1 = $('#student1').val();
			var student2 = $('#student2').val();
			var student3 = $('#student3').val();
			
			var students = {student1:student1, student2:student2, student3:student3};
			
			$.ajax({
				url: "jQueryTest4.do",
				data: students
			//	success: function(data){}
			});
		});
	</script>
	
</body>
</html>







