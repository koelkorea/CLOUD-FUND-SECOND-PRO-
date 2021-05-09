<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 국제화 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- cPath -->
<%@ include file="/cmn/common.jsp" %>

<!DOCTYPE html>
<html lang="en">
<%
	MemberVO idVO= (MemberVO)session.getAttribute("memberInfo");
	
%>

<head>
<!-- CSS BOOT -->
<jsp:include page="/inc/css_boot.jsp"></jsp:include>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>mod</title>

</head>

<body>
   <!-- div -->
   <div id="contents">

<!-- header -->
	<jsp:include page="/inc/header.jsp"></jsp:include>
<!-- header -->

  <!--  컨테이너 -->
  <div class="container">
        <div class="py-5 text-center">
            <h2>마이페이지</h2>
        </div>

        <div class="col-md-12 order-md-1">
            <h4 class="mb-3">회원정보</h4>
    <form id = "modForm" class="needs-validation" novalidate action="<%=cPath%>/member/member.do" method="POST">
		<input type ="hidden" name="work_div" value"" />

                <div class="mb-3">
                    <label for="username">아이디 (Email)</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                        </div>
                        <input type="email" class="form-control" id="m_id" value="<%=idVO.getM_id() %>" name="m_id" readonly>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="password">비밀번호</label> 
                    <input type="password" class="form-control" id="m_passwd"  value="<%=idVO.getM_passwd() %>" name="m_passwd">
                </div>


                <div class="mb-3">
                    <label for="firstName">이름</label> 
                    <input type="text" class="form-control" id="m_name"  value="<%=idVO.getM_name() %>" name="m_name">
                </div>

                <div class="mb-3">
                    <label for="email">전화번호</label>
                    <input type="email" class="form-control" id="m_phone"  value="<%=idVO.getM_phone() %>" name="m_phone">
                </div>

                <div class="mb-3">
                    <label for="address">주소</label> <input type="text" class="form-control" id="m_addr" value="<%=idVO.getM_addr() %>" name="m_addr">
                </div>
                
                <div class="mb-3">
                    <label for="card">카드정보</label> <input type="text" class="form-control" id="m_card" value="<%=idVO.getM_card() %>" required name="m_card">
                </div>

                <!-- 버튼 -->
               <div class="comn_btn_wrap">
                  <ul class="comn_btn_lst in-block">
                     <li>
                        <button type= "button" class="btn_base btn_save" name="doUpdate" id="doUpdate">수정하기</button>
                     </li>
                     <li>
                        <button type= "button" id = "register_cancle" class="btn_base btn_cancle">취소</button>
                     </li>
                  </ul>
               </div>
               <!-- 버튼 -->

                <footer th:replace="/fragments/semantic :: footer"></footer>
            </form>
        </div>

    </div>
    <!-- //row -->

 
  <!--  // 컨테이너 -->

    <!-- footer -->
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<!-- footer -->
   </div>
   <!-- div -->
   
    
   <!-- JavaScript-->
   <script type="text/javascript">
    
    var cancleBtn =document.querySelector("#register_cancle"); 
    init();
    
//    function submitHandler(event){
//    	event.preventDefault();
//    	
//    	alert('hi');
//    }
    function cancleClickHandler(event){
    	moveToList();
    }
    function init(){
    	//form.addEventListener("submit",submitHandler);
    	cancleBtn.addEventListener("click",cancleClickHandler);
    	
    }
      
    // 로그인 페이지로 이동
    function moveToList() {
    	
    	var listUrl ="/HAO/project/project.do?"
			+ "work_div=doRetrieve"
			+ "&search_div=40";
		console.log("listUrl:"+listUrl);
 	   
 	   if (confirm("취소하시겠습니까?") === false) {
 		   return;
 		   }
 	   
 	    window.location.href=listUrl;
 	  
    } // --- moveToList
    
    
    function moveToMain(){
    	var listUrl ="/HAO/project/project.do?"
			+ "work_div=doRetrieve"
			+ "&search_div=40";
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;

    }
    // jQuery 객체 생성 완료 되면 수행
    $(document).ready(function () {
 		console.log("document.ready");
 	});
    
    // 등록 버튼 클릭
    // Event 감지
    $("#doUpdate").on("click", function(event) {
 	  console.log("doUpdate");
 	 doUpdate();
    });
    
    //회원가입
    function doUpdate() {
 	   var frm = document.getElementById("modForm");
 	   frm.work_div.value = "doUpdate";
 	   
 	   // 아이디
 	   var m_id = $("#m_id").val();
 	   console.log("m_id : " + m_id);
 	   if (m_id === null || m_id.trim().length === 0) {
 		   document.getElementById("m_id").focus();
 		   alert("아이디를 입력해주세요");
 		   return;
 	   }
 	   
 	   // 비밀번호
 	   var m_passwd = $("#m_passwd").val();
 	   console.log("m_passwd : " + m_passwd);
 	   if (m_passwd === null || m_passwd.trim().length === 0) {
 		   document.getElementById("m_passwd").focus();
 		   alert("비밀번호를 입력해주세요");
 		   return;
 	   }
 	   
 	   // 이름
 	   var m_name = $("#m_name").val();
 	   console.log("m_name : " + m_name);
 	   if (m_name === null || m_name.trim().length === 0) {
 		   document.getElementById("m_name").focus();
 		   alert("이름을 입력해주세요");
 		   return;
 	   }
 	   
 	   // 전화번호
 	   var m_phone = $("#m_phone").val();
 	   console.log("m_phone : " + m_phone);
 	   if (m_phone === null || m_phone.trim().length == 0) {
 		   document.getElementById("m_phone").focus();
 		   alert("전화번호를 입력해주세요");
 		   return;
 	   }
 	   
 	   // 주소
 	   var m_addr = $("#m_addr").val();
 	   console.log("m_addr : " + m_addr);
 	   if (m_addr === null || m_addr.trim().length == 0) {
 		   document.getElementById("m_addr").focus();
 		   alert("주소를 입력해주세요");
 		   return;
 	   }
 	   
 	   // 카드
 	   var m_card = $("#m_card").val();
 	   console.log("m_card : " + m_card);
 	   if (m_card === null || m_card.trim().length == 0) {
 		   document.getElementById("m_card").focus();
 		   alert("카드정보를 입력해주세요");
 		   return;
 	   }
 	   
 	   if (confirm("회원 수정하시겠습니까?") == false) {
 		   return;
 	   }
 	   
 	   $.ajax({
 			type: "GET",
 			url:"<%=cPath%>/member/member.do",
 			asyn:"true",
 			dataType:"html",
 			data:{
 			work_div:"doUpdate",
 			m_id: $("#m_id").val(),
 			m_passwd: $("#m_passwd").val(),
 			m_name: $("#m_name").val(),
 			m_phone: $("#m_phone").val(),
 			m_addr: $("#m_addr").val(),
 			m_card: $("#m_card").val(),
 			
 			
 			},
 			//통신 성공
 			success:function(data){
 				var jsonObj = JSON.parse(data);
 				console.log("success data : " + data);
 			
 				if (jsonObj != null && jsonObj.msgId == "1") {
 					alert(jsonObj.msgContents);
 				
 					moveToMain();
 				}
 			},
 			//실패시 처리
 			error:function(data){
 				console.log("error data : " + data);
 			},
 			//성공/실패와 관계없이 수행!
 			complete:function(data){
 				//console.log("data : " + data);
 			}
 		
 		});
    }//회원가입
    
   </script>
   <!-- JavaScript-->
   
</body>

</html>
