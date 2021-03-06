<%@page import="vo.MemberVO"%>
<%@page import="vo.SupporterVO"%>
<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 국제화 -->
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/cmn/common.jsp" %>

<% 
    
	
	
   	ProjectVO vo = (ProjectVO)request.getAttribute("vo");
    MemberVO idVO= (MemberVO)session.getAttribute("memberInfo");
   	
	
	
    //out.print("vo:"+vo.toString());
    
    
    int s_p_seq= vo.getP_seq();
   	
  	String s_m_id="test";
    
  	String addr="";
  	
    if(idVO!=null){
    	s_m_id = idVO.getM_id();//Session id 값 받아오기
    }else{
     	s_m_id = "notSessionId";
    } 
    
    if(idVO!=null&&idVO.getM_addr()!=null){
    	addr=idVO.getM_addr();
    }else{
    	addr="";
    }
    
    
%> 


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/HAO/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/HAO/css/bootstrap.min.css">

<style>
	.header{
		text-align:center;
		margin:auto;
	}
	.middle{
		margin:auto;
		border-collapse: collapse;
		padding: 30px;
		text-align:center;
	}
	.middle2{
		margin:auto;
		border-collapse: collapse;
		padding: 30px;
		text-align:left;
	}
	#contents{
		width:600px;
		height:1200px;
		margin:auto;
	}
	#contentslabel{
		width:600px;
		height:200px;
		margin:auto;
		font-size:45px;
	}
	.centerfont{
		text-align:center;
	}
	.rightfont{
		text-align:right;
	}

</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- project/project.do?p_seq=208&work_div=doSelectOne -->
<meta charset="UTF-8">
<jsp:include page="/inc/css_boot.jsp"></jsp:include>
<title>프로젝트 상세 정보</title>
</head>
<body>
<jsp:include page="/inc/header.jsp"></jsp:include>

	
	
	<table class="header" border="0">
		<tr>
			<td height="80px">
				<%if(vo.getP_cate().equals("10")){ %>
				<h3>연극</h3>
				<%}else if(vo.getP_cate().equals("20")){ %>
				<h3>뮤지컬</h3>
				<%}else if(vo.getP_cate().equals("30")){ %>
				<h3>토크쇼</h3>
				<%}else if(vo.getP_cate().equals("40")){ %>
				<h3>음악 공연</h3>
				<%}else if(vo.getP_cate().equals("50")){ %>
				<h3>자기 PR</h3>
				<%} %>
			</td>
		</tr>
		<tr>
			<td>
				<h1><%=vo.getP_title() %></h1>
			</td>
		</tr>
		<tr>
			<td height="150px">
				<h4><%=vo.getP_m_id() %></h4>
			</td>
		</tr>
	</table>
	
	<table class="middle" border="0" width= "1200px" height="600px">
		<tr >
			<td rowspan="4" width= "600px" height="600px">
			 <image src="/<%= vo.getP_thumb()%>" alt="이미지가 없습니다" width= "600px" height="600px"></image>
			 </td>
			<td width="600px" height="150px">
				<label>모인 금액</label>
				<%if(vo.getRemainDate()<0&&vo.getSumFund()==0){ %>
					<h1>펀딩 실패</h1>
				<%}else{ %>
				<h1><%=vo.getSumFund() %>원</h1>
				<% }%>	
				<%if(vo.getRemainDate()<0&&vo.getSumFund()==0){ %>
					<h5>다음 기회에...</h5>
				<%}else{ %>
					<h4><%=vo.getPercent() %>%</h4>
				<% }%>										
			</td>											
		</tr>
		<tr>
			<!-- <td></td> -->
			<td class="centerfont" width= "600px" height="150px">
				<label>남은 시간</label>
				<%if(vo.getRemainDate()>=0){ %>
				<h1><%=vo.getRemainDate() %>일</h1>
				<%}else{ %>
				<h1>마감 된 프로젝트 입니다</h1>
				<%} %>
			</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td class="centerfont" width= "600px" height="150px">
				<label>후원자 수</label>
				<h1><%=vo.getSupporterNum() %>명</h1>
			</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td width= "200px" height="150px">
				<form action="<%=cPath %>/supporter/supporter.do" method="post" id="insertFrm" name="insertFrm" align="right">
					<input type="hidden" id="work_div" name="work_div" value="doInsert"/>
					<input type="hidden" id="p_minprice" name="p_minprice" value="<%=vo.getP_minprice() %>"/>
					<input type="hidden" id="remainDate" name="remainDate" value="<%=vo.getRemainDate() %>"/>
					
					
					<input type="text" align="right" id="s_fund" name="s_fund" maxlength="8" placeholder="<%=vo.getP_minprice() %>원이 최소 금액입니다"/>
					<input type="text" align="right" id="s_addr" name="s_addr" value="<%=addr %>" placeholder="주소"/>
					<input type="hidden" name="s_p_seq" id="s_p_seq" value="<%=s_p_seq %>" />
    	  			<input type="hidden" name="s_m_id" id="s_m_id" value="<%=s_m_id %>" />
    	 
					<!--<input type="submit" align="right" value="후원하기" id="doInsert"/>					   -->
				</form>
					<div>
					<input type="button" align="right" value="후원하기" onclick="doInsert();"/>
					</div>
			</td>
		</tr>
	
	</table>
	<table class="middle2" border="0" width= "800px" height="80px">
	<tr >
		<td width= "500px" height="80px">
		
		<label><h2>프로젝트 정보</h2></label>
		</td>
		<td class="rightfont"><h4>태그:<%=vo.getP_tag() %></h4></td>
	</tr>
	</table>
	<table  class="middle2" style="table-layout:fixed; word-break:break-all;" border="1" width= "1200px" height="900px">
	<tr >
		<td>
			<pre ><%=vo.getP_contents() %></pre>
			
		</td>
	</tr>
		
		
	
	
	</table>
    <!-- javascript -->
    <script type="text/javascript">
   
		 //jquery 객채생성이 완료
		 $(document).ready(function() {
			console.log("1.document:최초수행!");
	
		});//--document ready
		
		 $('#s_fund').keyup(function() {
		    	var inputVal = $(this).val();
		    	console.log("inputVal:"+inputVal);
		    	
		    	$(this).val((inputVal.replace(/[ㄱ-힣a-zA-Z~!@#$%^&*()_+|<>?:{}= ]/g,'')));
		    });//영문 숫자만 입력
		    
		    
	    function doInsert(){
	    	console.log("1.doInsert");
			
	    	var s_m_id = $("#s_m_id").val();
    		console.log("s_m_id:"+s_m_id);
    		
    		if(s_m_id=="notSessionId"){
	    		alert("로그인 하십시오")
	    		return;
	    		
	    	}
    		
    		var remainDate = $("#remainDate").val();
    		console.log("remainDate:"+remainDate);
    		
    		if(parseInt(remainDate)<0){
	    		alert("마감된 프로젝트 입니다")
	    		return;
	    		
	    	}
	    	
	    	
	    	var s_fund = $("#s_fund").val();
    		console.log("s_fund:"+s_fund);
    		
    		if(null === s_fund || s_fund.trim().length==0){
	    		document.getElementById("s_fund").focus();
	    		alert("금액이 비었습니다")
	    		return;
	    		
	    	}
	    		
	    	
    		var s_addr = $("#s_addr").val();
	    	
	    	
	    	console.log("s_addr:"+s_addr);
	    	
	    	if(null === s_addr || s_addr.trim().length==0){
	    		document.getElementById("s_addr").focus();
	    		alert("주소를 입력하세요");
	    		return;
	    	}
    		
	    	var p_minprice = $("#p_minprice").val();
	    	var vs_fund = $("#s_fund").val();
	    	
	    	
	    	
	    	
	    	console.log("p_minprice:"+p_minprice);
	    	
	    	console.log("s_fund:"+s_fund);
	    	
	    	 if(parseInt(vs_fund)<(p_minprice)){
	    		document.getElementById("s_fund").focus();
	    		alert("최소 금액은"+p_minprice+"원 입니다");
	    		return;
	    	} 
	    	
	    	if( false==confirm("후원 하시겠습니까?"))return;	    
	    	 $.ajax({
	    		type: "GET",
	    		url:"/HAO/supporter/supporter.do",
	    		asyn:"true",
	    		dataType:"html",
	    		data:{
	    			work_div:"doInsert",
	    			s_m_id: $("#s_m_id").val(),
	    			s_p_seq: $("#s_p_seq").val(),
	    			s_fund: $("#s_fund").val(),
	    			s_addr: $("#s_addr").val()    			
	    		},
	    		success:function(data){//통신 성공
	    			var jsonObj = JSON.parse(data)
	    			console.log("success data:"+data);
	    			//success data:{"msgId":"1","msgContents":"등록 성공","num":0,"totalCnt":0,"msgFlag":0}    		
	    		    if(null !=jsonObj && jsonObj.msgId=="1"){
	    		    	alert(jsonObj.msgContents);
	    		    	moveToList();
	    		    }else{
	    		    	alert(jsonObj.msgContents);
	    		    }
	    		},
	    		error:function(data){//실패시 처리
	    			console.log("error data:"+data);
	    		},
	    		complete:function(data){//성공/실패와 관계없이 수행!
	    			//console.log("data:"+data);
	    		}
	    		
	    	}); 
	
	    	//frm.submit(); */	
	
	    }
	
    	
	    function moveToList() {
	 	   var listUrl = "<%=cPath%>/project/project.do?p_seq=<%=s_p_seq %>&work_div=doSelectOne";
	 	   console.log("listUrl : " + listUrl);
	 	   
	 	   
	 	   
	 	   window.location.href = listUrl;
	    } // --- moveToList
  
    	
       
	    
        
        
        
    
    </script>
    <!--// javascript --> 
<jsp:include page="/inc/footer.jsp"></jsp:include> 	
</body>
</html>