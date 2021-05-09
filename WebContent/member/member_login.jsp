<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 국제화 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- cPath -->
<%@ include file="/cmn/common.jsp" %>

<%@page import="vo.MessageVO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- CSS BOOT -->
<jsp:include page="/inc/css_boot.jsp"></jsp:include>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>LOGIN</title>

</head>
<%
	MessageVO msg =(MessageVO)request.getAttribute("message");
	if(msg==null){
		
	}else if(msg.getMsgId().equals("10")){
		
%>
	<script> alert("아이디를 확인해주세요.")</script>
<% 	
	}else if(msg.getMsgId().equals("20")){
%>
	<script> alert("비밀번호를 확인해주세요.")</script>
<%	
	}
%>
<body>

<!-- header -->
	<jsp:include page="/inc/header.jsp"></jsp:include>
<!-- header -->



  <!--  컨테이너 -->
  <div class="container">
    <h1 class="h3 mb-3 fw-normal text-center">로그인</h1>
    <form class="needs-validation" novalidate action="<%=cPath%>/logincontroller/logincontroller.do" method="POST">
    	<label for="inputEmail" class="visually-hidden">ID</label>
    	<input type="email" id="inputEmail" class="form-control" placeholder="이메일 주소 입력" name ="id" required autofocus>
 	  	<label for="inputPassword" class="visually-hidden">Password</label>
   		<input type="password" id="inputPassword" class="form-control" placeholder="비밀번호 입력" name = "passwd" required>
	   	<p></p>
  		<button type= "button" id ="register_btn" class="w-100 btn btn-lg btn-dark">회원가입</button>
     <!-- 버튼 -->
               <div class="comn_btn_wrap">
                  <ul class="comn_btn_lst in-block">
                     <li>
                        <button type= "submit" class="btn_base btn_save" name="login" id="login">로그인</button>
                     </li>
                  </ul>
               </div>
               <!-- 버튼 -->
  </form>
    </div>
    <!-- //row -->

 
  <!--  // 컨테이너 -->

    <!-- footer -->
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<!-- footer -->
      
   <!-- JavaScript-->
   <script type="text/javascript">
   
   var regBtn =document.querySelector("#register_btn"); 
   init();

   function registerClickHandler(event){
   	moveToList();
   }
   function init(){
   
   	regBtn.addEventListener("click",registerClickHandler);
   }
   
   // 회원가입 페이지로 이동
   function moveToList() {
	   var listUrl = "<%=cPath%>/member/member_reg.jsp";
	   console.log("listUrl : " + listUrl);
	   
	   
	   
	   window.location.href = listUrl;
   } // --- moveToList
   </script>
   <!-- JavaScript-->
      

  <!-- Bootstrap core JavaScript -->
  <script src="/HAO/jquery/jquery.min.js"></script>
  <script src="/HAO/js/bootstrap.bundle.min.js"></script>

</body>

</html>
