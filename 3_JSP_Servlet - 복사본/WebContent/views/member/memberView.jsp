<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   Member member = (Member)request.getAttribute("member");

   String userId = member.getUserId();
   String userName = member.getUserPwd();
   String nickName = member.getNickName();
   String phone = member.getPhone() != null ? member.getPhone() : "-";
   String email = member.getEmail() != null ? member.getEmail() : "-";
   String address = member.getAddress() != null ? member.getAddress() : "-";
   String interest = member.getInterest() != null ? member.getInterest() : "-";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
   .outer{
      width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white; color: black;
      margin-left: auto; margin-right: auto; margin-top: 50px;
   }
   .outer label, .outer td{color: black;}
   input{margin-top: 2px;}
   #deleteBtn, #goMain, #updateBtn, #pwdUpdateBtn{
      background: #B2CCFF; color: white; border-radius: 5px; width: 110px; heigth: 25px; text-align: center; display:inline-block;
   }
   #deleteBtn:hover, #updateBtn:hover, #goMain:hover, #pwdUpdateBtn:hover {cursor:pointer;}
   #myInfoForm td {text-align: right;}
   #goMain {background: #FFD8D8;}
   #updateBtn {background: #D1B2FF;}
   #deleteBtn{background: #D5D5D5;}
</style>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <div class="outer">
      <br>
      <h2 align="center">내 정보 보기</h2>
      
      <form action="views/member/memberUpdateForm.jsp" method="post" id="myInfoForm" name="myInfoForm">
         <table>
            <tr>
               <td width="200px"> 아이디</td>
               <td width="250px">
                  <%= userId %>
                  <input type="hidden" name="userId" value ="<%= userId %>">
               
               <!-- <input type="text" maxlength="13" id="idid" name="joinUserId" required></td> -->
               </td>
            </tr>
            <tr>
               <td> 이름</td>
               <td>
                  <%= userName %>
                   <input type="hidden" name="userName" value ="<%= userName %>">
               
                  <!-- <input type="text" name="userName" required> -->
               </td>
            </tr>
            <tr>
               <td> 닉네임</td>
               <td>
                  <%= nickName %>
                   <input type="hidden" name="nickName" value ="<%= nickName %>">
               
                  <!-- <input type="text" maxlength="15" name="nickName" required> -->
               </td>
            </tr>
            <tr>
               <td>연락처</td>
               <td>
                  <%= phone %>
                   <input type="hidden" name="phone" value ="<%= phone %>">
               
                  <!-- <input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"> -->
               </td>
            </tr>
            <tr>
               <td>이메일</td>
               <td>
                  <%= email %>
                  <input type="hidden" name="email" value ="<%= email %>">
<!--                   <input type="email" name="email"> -->
               </td>
            </tr>
            <tr>
               <td>주소</td>
               <td>
                  <%= address %>
                  <input type="hidden" name="address" value ="<%= address %>">
<!--                <input type="text" name="address"> -->
               </td>
            </tr>
            <tr>
               <td>관심분야</td>
               <td>
                  <%= interest %>
                  <input type="hidden" name="interest" value ="<%= interest %>">
                  
<!--                   <input type="checkbox" id="sports" name="interest" value="운동"> -->
<!--                   <label for="sports">운동</label> -->
<!--                   <input type="checkbox" id="climbing" name="interest" value="등산"> -->
<!--                   <label for="climbing">등산</label> -->
<!--                   <input type="checkbox" id="fishing" name="interest" value="낚시"> -->
<!--                   <label for="fishing">낚시</label> -->
<!--                   <input type="checkbox" id="cooking" name="interest" value="요리"> -->
<!--                   <label for="cooking">요리</label> -->
<!--                   <input type="checkbox" id="game" name="interest" value="게임"> -->
<!--                   <label for="game">게임</label> -->
<!--                   <input type="checkbox" id="etc" name="interest" value="기타"> -->
<!--                   <label for="etc">기타</label> -->
               </td>
            </tr>
         </table>
         
         <br>
         
         <div class="btns" align="center">
            <div id="pwdUpdateBtn" onclick="location.href='views/member/pwdUpdateForm.jsp'">비밀번호 변경</div>
            <input type="submit" id="updateBtn" value="내 정보 수정"/>
            <hr width="70%">
            <div id="goMain" onclick="location.href='<%= request.getContextPath()%>/index.jsp'">메인으로</div>
            <input id="deleteBtn" onclick="deleteMember();" value="탈퇴하기">
         </div>
      </form>
   </div>
</body>
</html>