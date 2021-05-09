<%@page import="vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 코어 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 국제화 -->
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- cPath -->
<%@ include file="/cmn/common.jsp" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");

%>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

	<!-- jQuery -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- datepicker -->
  	<link rel="stylesheet" href="/HAO/jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="/HAO/js/bootstrap.min.js"></script>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/HAO/css/projectnormalize.css">
	<link rel="stylesheet" type="text/css" href="/HAO/css/projectbase.css">
	
	<meta name="keywords" content="포탈, 유도, 검색어, 넣으면, 됨">
	<meta name="description" content="창의적인 시도를 함께 실현시키는 펀딩 커뮤니티 HAO에서 다양한 분야 크리에이터들의 프로젝트를 밀어주세요.">

<title>HAO</title>
</head>

<body>
   <!-- div -->
   <div id="contents">
      
      <!-- header -->
      <jsp:include page="/inc/header.jsp"></jsp:include>
      <!-- header -->
       
      <div id="content">
         <div class="cont_wrap">
            <div class="container">
            
               <!-- 페이지 제목 -->
               <h1 class="cont_form_ttl">프로젝트 등록</h1>
               <!-- 페이지 제목 -->
               
               <!-- form -->
               <form action="${cPath }/project/project.do" name="regFrm" id="regFrm" method="post" enctype="multipart/form-data">
               	<input type="hidden" name="work_div" value="" />
	               <!-- 테이블 -->
	               <table class="comn_table seller_form">
	                  <tr>
	                     <th>프로젝트 제목</th>
	                     <td>
	                     	<input type="text" maxlength="100" name="p_title" id="p_title" placeholder="프로젝트 제목을 입력해주세요(최대 100글자)">
	                     </td>
	                  </tr>
	                  <tr>
	                     <th>프로젝트 대표 이미지</th>
	                     <td>
	                     	<input type="file" maxlength="100" name="p_thumb" id="p_thumb" value="" placeholder="프로젝트 대표 이미지"/>
	                     	<input type="button" value="업로드" name="file_upload" id="file_upload" />
	                     </td>
	                     
	                  </tr>
	                  <tr>
	                     <th>이름</th>
	                     <td><input type="text" maxlength="30" name="p_name" id="p_name" placeholder="이름을 입력해주세요(최대 30글자)"></td>
	                  </tr>
	                  <tr>
	                     <th>프로젝트 내용</th>
	                     <td><textarea class="comn_textarea" name="p_contents" id="p_contents"></textarea></td>
	                  </tr>
	                  <tr>
	                     <th>프로젝트 카테고리</th>
	                     <td>
		                     <select name="p_cate" id="p_cate">
		                     	   <option value="" selected disabled hidden>프로젝트 카테고리를 선택해주세요</option>
		                           <option value="10">연극</option>
		                           <option value="20">뮤지컬</option>
		                           <option value="30">토크쇼</option>
		                           <option value="40">음악 공연</option>
		                           <option value="50">자기 PR</option>
		                     </select>
	                     </td>
	                  </tr>
	                  <tr>
	                     <th>검색용 태그</th>
	                     <td><input type="text" maxlength="1000" name="p_tag" id="p_tag" placeholder="예시: 연극, 뮤지컬, 토크쇼, 웹툰, 강아지(최대 1000글자)"></td>
	                  </tr>
	                  <tr>
	                  	 <th>프로젝트 마감일</th>
	                     <td><input type="text" name="p_closedate" id="p_closedate" placeholder="프로젝트 마감일을 선택해주세요"></td>
	                  </tr>
	                  <tr>
	                     <th>프로젝트 최소 선물 금액</th>
	                     <td><input type="text" maxlength="8" name="p_minprice" id="p_minprice" placeholder="최소 선물 금액을 입력해주세요(숫자로만 입력해주세요, 최대 99999999원)"></td>
	                  </tr>
	                  <tr>
	                     <th>입금 계좌</th>
	                     <td><input type="text" maxlength="20" name="p_account" id="p_account" placeholder="후원금을 수령할 은행 계좌를 등록해 주세요(숫자로만 입력해주세요)"></td>
	                  </tr>
	                  <tr>
	                     <th>프로젝트 목표 금액</th>
	                     <td><input type="text" maxlength="10" name="p_goalfund" id="p_goalfund" placeholder="프로젝트 목표 금액을 입력해주세요(숫자로만 입력해주세요, 최대 9999999999원)"></td>
	                  </tr>
	               </table>
	               <!-- 테이블 -->
               </form>
               <!-- form -->
               
               <!-- 버튼 -->
               <div class="comn_btn_wrap">
                  <ul class="comn_btn_lst in-block">
                     <li>
                        <button class="btn_base btn_save" name="doInsert" id="doInsert">등록</button>
                     </li>
                     <li>
                        <button class="btn_base btn_cancle" name="move_to_list" id="move_to_list">취소</button>
                     </li>
                  </ul>
               </div>
               <!-- 버튼 -->
               
            </div>
         </div>
      </div>
         
      <!-- footer -->
      <jsp:include page="/inc/footer.jsp"></jsp:include>
      <!-- footer -->
      
   </div>
   <!-- div -->
   
   <!-- datepicker -->
   <script>
		var date = new Date();
		date.setDate(date.getDate() + 1);
		
			$(function() {
			  $( "#p_closedate" ).datepicker({
			    dateFormat: 'yy.mm.dd',
			    prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    showMonthAfterYear: true,
			    changeMonth: true,
			    changeYear: true,
			    yearSuffix: '년',
			    minDate: date
			  });
			});
	</script>
   <!-- datepicker -->
   
   <!-- JavaScript-->
   <script type="text/javascript">
   // jQuery 객체 생성 완료 되면 수행
   $(document).ready(function () {
		console.log("document.ready");
	});
  
   // 프로젝트 등록자 ID
   var p_m_id = "<%=memberVO.getM_id() %>";
   
   // 프로젝트 대표 이미지 경로 + 이름
   var p_thumb = "";
   
   // 파일 업로드
   // Event 감지
   $("#file_upload").on("click", function(event) {
    		console.log("file_upload");
    		
    		if (confirm("파일을 업로드 하시겠습니까?") == false) {
        		return;
        	}
    		
    		var form = new FormData(document.getElementById("regFrm"));
    		$.ajax(
        			{   url: "${cPath}/upload/upload.do", 
        				data: form, 
        				dataType: 'text', 
        				type: 'POST', 
        				processData: false, 
        				contentType: false, 
        				success: function (data) {
        					alert("업로드에 성공하였습니다")
        					console.log("업로드에 성공했습니다");
        					
        					console.log("success data : " + data);
        					
        					var jsonObj = JSON.parse(data);
        					console.log("jsonObj : " + jsonObj);
        					
        					$.each(jsonObj, function(k, v) {
        						console.log(k + ", " + v.p_thumb);
        						p_thumb = v.p_thumb;
        					});
        					console.log("p_thumb : " + p_thumb);
        					
        				}, 
        				error: function (jqXHR) { 
        					alert("업로드에 실패했습니다")
        					console.log("업로드에 실패했습니다"); 
        				} 
        			}
        	);
    	});
   
   // 등록 버튼 클릭
   // Event 감지
   $("#doInsert").on("click", function(event) {
	  console.log("doInsert");
	  doInsert();
   });
   
   // 프로젝트 등록
   function doInsert() {
	   var frm = document.getElementById("regFrm");
	   frm.work_div.value = "doInsert";
	   
	   // 프로젝트 등록자 ID
	   
	   // 프로젝트 제목
	   var p_title = $("#p_title").val();
	   console.log("p_title : " + p_title);
	   if (p_title === null || p_title.trim().length == 0) {
		   document.getElementById("p_title").focus();
		   alert("제목을 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 대표 이미지
	   console.log("p_thumb : " + p_thumb);
	   if (p_thumb === null || p_thumb.trim().length == 0) {
		   document.getElementById("p_thumb").focus();
		   alert("프로젝트 대표 이미지를 업로드해주세요");
		   return;
	   }
	   
	   // 프로젝트 등록자 이름
	   var p_name = $("#p_name").val();
	   console.log("p_name : " + p_name);
	   if (p_name === null || p_name.trim().length == 0) {
		   document.getElementById("p_name").focus();
		   alert("이름을 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 내용
	   var p_contents = $("#p_contents").val();
	   console.log("p_contents : " + p_contents);
	   if (p_contents === null || p_contents.trim().length == 0) {
		   document.getElementById("p_contents").focus();
		   alert("프로젝트 내용을 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 카테고리
	   var p_cate = $("#p_cate").val();
	   console.log("p_cate : " + p_cate);
	   if (p_cate === null || p_cate.trim().length == 0) {
		   document.getElementById("p_cate").focus();
		   alert("프로젝트 카테고리를 선택해주세요");
		   return;
	   }
	   
	   // 프로젝트 검색 태그
	   var p_tag = $("#p_tag").val();
	   console.log("p_tag : " + p_tag);
	   if (p_tag === null || p_tag.trim().length == 0) {
		   document.getElementById("p_tag").focus();
		   alert("프로젝트 검색 태그를 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 마감일
	   var p_closedate = $("#p_closedate").val();
	   console.log("p_closedate : " + p_closedate);
	   if (p_closedate === null || p_closedate.trim().length == 0) {
		   document.getElementById("p_closedate").focus();
		   alert("프로젝트 마감 일을 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 선물 최소 금액
	   var p_minprice = $("#p_minprice").val();
	   console.log("p_minprice : " + p_minprice);
	   if (p_minprice === null || p_minprice.trim().length == 0) {
		   document.getElementById("p_minprice").focus();
		   alert("프로젝트 선물 최소 선물 금액을 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 모금 계좌
	   var p_account = $("#p_account").val();
	   console.log("p_account : " + p_account);
	   if (p_account === null || p_account.trim().length == 0) {
		   document.getElementById("p_account").focus();
		   alert("프로젝트 모금 계좌를 입력해주세요");
		   return;
	   }
	   
	   // 프로젝트 목표 모금 금액
	   var p_goalfund = $("#p_goalfund").val();
	   console.log("p_goalfund : " + p_goalfund);
	   if (p_goalfund === null || p_goalfund.trim().length == 0) {
		   document.getElementById("p_goalfund").focus();
		   alert("프로젝트 목표 금액을 입력해주세요");
		   return;
	   }
	   
	   if (confirm("프로젝트를 등록하시겠습니까?") == false) {
		   return;
	   }
	   
	   $.ajax({
			type: "post",
			url:"${cPath}/project/project.do",
			asyn:"true",
			dataType:"html",
			data:{
			work_div:"doInsert",
			p_m_id: p_m_id,
			p_title: $("#p_title").val(),
			p_thumb: p_thumb,
			p_name: $("#p_name").val(),
			p_contents: $("#p_contents").val(),
			p_cate: $("#p_cate").val(),
			p_tag: $("#p_tag").val(),
			p_closedate: $("#p_closedate").val(),
			p_minprice: $("#p_minprice").val(),
			p_account: $("#p_account").val(),
			p_goalfund: $("#p_goalfund").val(),
			mod_id: p_m_id
			
			},
			//통신 성공
			success:function(data){
				var jsonObj = JSON.parse(data);
				console.log("success data : " + data);
			
				if (jsonObj != null && jsonObj.msgId == "1") {
					alert(jsonObj.msgContents);
					moveToList();
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
   } // --- doInsert
   
   // 취소 버튼 클릭
   // Event 감지
   $("#move_to_list").on("click", function(event) {
	  console.log("move_to_list");
	  
	  if (confirm("프로젝트 등록을 취소하시겠습니까?") == false) {
		   return;
		   }
	  
	  moveToList();
   });
   
   // 메인 페이지로 이동
   function moveToList() {
	   var listUrl ="/HAO/project/project.do?"
			+ "work_div=doRetrieve"
			+ "&search_div=40";
		
	   console.log("listUrl : " + listUrl);
	   window.location.href = listUrl;
   } // --- moveToList
   
   </script>
   <!-- JavaScript-->
</body>

</html>