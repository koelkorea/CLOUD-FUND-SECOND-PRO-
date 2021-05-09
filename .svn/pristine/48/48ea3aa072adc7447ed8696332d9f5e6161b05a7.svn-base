<%@page import="vo.SupporterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/cmn/common.jsp" %>
<%
SupporterVO outVO = (SupporterVO) request.getAttribute("outVO");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<meta name="keywords" content="포탈, 유도, 검색어, 넣으면, 됨">
	<meta name="description" content="창의적인 시도를 함께 실현시키는 펀딩 커뮤니티 HAO에서 다양한 분야 크리에이터들의 프로젝트를 밀어주세요.">

	<!-- jQuery -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="../bootstrap/bootstrap.min.css"></script>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../css/projectnormalize.css">
	<link rel="stylesheet" type="text/css" href="../css/projectbase.css">

<title>HAO</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<!-- header -->

      <div id="content">
         <div class="cont_wrap">
            <div class="container">
            
               <!-- 페이지 제목 -->
               <h1 class="cont_form_ttl">후원 상세 내역</h1>
               <!-- 페이지 제목 -->
               
               <!-- form -->
               <form action="<%=cPath%>/supporter/supporter.do" method="post" id="detailSpFrm" name="detailSpFrm">
               	   <input type="hidden" name="m_id" id="m_id" value="${outVO.s_m_id}" />
               	   <input type="hidden" name="work_div" id="work_div" value="" />
               	   <input type="hidden" name="s_seq"    id="s_seq"    value="${outVO.s_seq}" />
	               <!-- 테이블 -->
	               <table class="comn_table seller_form">
	                  <tr>
	                     <th>프로젝트명</th>
	                     <td> <c:out value="${outVO.projectName}" /> </td>
	                  </tr>
	                  <tr>
	                     <th>후원금</th>
	                     <td> <c:out value="${outVO.s_fund}" /> </td>
	                  </tr>
	                  <tr>
	                     <th>배송지 주소</th>
	                     <td> <c:out value="${outVO.s_addr}" /> </td>
	                  </tr>
	                  <tr>
	                     <th>후원일 / 후원상태</th>
	                     <td> 
	                     	<c:out value="${outVO.s_date}" /> / <c:choose>
																	<c:when test="${outVO.s_status == 0}">
																		<c:out value="진행중" />
																	</c:when>
																	<c:when test="${outVO.s_status == 1}">
																		<c:out value="후원 성공" />
																	</c:when>
																	<c:otherwise>
																		<c:out value="후원 취소" />
																	</c:otherwise>
																</c:choose>   
						</td>
	                  </tr>
	                  <tr>
	                     <th>마감일 / 진행상태</th>
	                  	<td>
	                  		<c:out value="${outVO.projectClosedDate}" /> / <c:choose>
																			<c:when test="${outVO.projectStatus == 0}">
																				<c:out value="진행중" />
																			</c:when> 
																			<c:when test="${outVO.projectStatus == 1}">
																				<c:out value="펀딩 성공" />
																			</c:when>
																			<c:otherwise>
																				<c:out value="펀딩 실패" />
																			</c:otherwise>
																		   </c:choose>   
	                  	</td>
	                  </tr>
	               </table>
	               <!-- 테이블 -->
               </form>
               <!-- form -->
               
               <!-- 버튼 -->
               <div class="comn_btn_wrap">
                  <ul class="comn_btn_lst in-block">
                     <li>
                        <button class="btn_base btn_cancle" name="doDelete" id="doDelete">후원 취소</button>
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
</body>

<!-- JavaScript-->
<script type="text/javascript">
			//목록으로 이동
			function moveToList(){
				var listUrl ="<%=cPath%>/supporter/supporter.do?" 
						     + "work_div=doRetrieveSp" 
						     + "&m_id="+$("#m_id").val();
				console.log("listUrl:"+listUrl);
				window.location.href=listUrl;
			}
    		
        	//삭제
        	$("#doDelete").on("click",function(e){
        		console.log("doDelete");
        		
        		var s_seq = $("#s_seq").val();
        		var m_id = $("#m_id").val();
        		console.log("s_seq : " + s_seq);
        		console.log("m_id : " + m_id);
        		//삭제할건지 확인문장
        		if(false == confirm("삭제하시겠습니까?")) return;
        		
        		$.ajax({
    	    		type: "POST",
    	    		url:"<%=cPath%>/supporter/supporter.do",
    	    		asyn:"true",
    	    		dataType:"html",
    	    		data:{
    	    			work_div:"doDelete",
    	    			s_seq : $("#s_seq").val(),
    	    			m_id : $("#m_id").val()
    	    		},
    	    		success:function(data){//통신 성공
    	    			var jsonObj = JSON.parse(data)
    	    			console.log("success data:"+data);
    	    		
    	    		    if(null !=jsonObj && jsonObj.msgId=="1"){
    	    		    	alert(jsonObj.msgContents);
    	    		    	
    	    		    	moveToList();
    	    		    }else{//실패
    	    		    	alert(jsonObj.msgContents);
    	    		    	
    	    		    }
    	    		},
    	    		error:function(data){//실패시 처리
    	    			console.log("error data:"+data);
    	    		},
    	    		complete:function(data){//성공/실패와 관계없이 수행!
    	    			
    	    		}
    	    		
    	    	});
        		
        	});
</script>
<!-- JavaScript-->

</html>