<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	MemberVO MLS = (MemberVO)session.getAttribute("memberInfo");
	//세션 ID 값 받아오기
	String m_l_s_Id = "";
	if(null != MLS){
		m_l_s_Id = MLS.getM_id();
	}else {
		m_l_s_Id = "++++++";
	}
	
	//out.print(m_l_s_Id);
%>
</head>

<!-- //상단 버튼 이동용 스크립트 -->
<script type="text/javascript">
	//메인페이지로 이동
	function moveToProjectMainPage() {
		var listUrl ="/HAO/project/project.do?" 
		     + "work_div=doRetrieve" 
		     + "&search_div=40";
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}
	
	//프로젝트 등록 페이지로 이동
	function moveToProjectRegPage() {
		var sessionId = $("#sessionId").val();
		console.log("sessionId:"+sessionId);
    	if(sessionId=="++++++"){
    		alert("로그인 후 이용 가능합니다")
    		var listUrl ="/HAO/member/member_login.jsp?" 
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
			return;
    	}
		
		var listUrl ="/HAO/project/project.do?" 
		     + "work_div=moveToReg" ;
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}
	
	//프로젝트 등록 내역 페이지로 이동
	function moveToProjectMypage() {
		var sessionId = $("#sessionId").val();
		console.log("sessionId:"+sessionId);
    	if(sessionId=="++++++"){
    		alert("로그인 후 이용 가능합니다")
    		return;
    	}
		var listUrl ="/HAO/project/project.do?" 
		     + "work_div=doRetrieve" 
		     + "&p_m_id=<%=m_l_s_Id %>"
		     + "&search_div=30"
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}
	
	//후원 내역 페이지로 이동
	function moveToSupporterListPage() {
		var sessionId = $("#sessionId").val();
		console.log("sessionId:"+sessionId);
    	if(sessionId=="++++++"){
    		alert("로그인 후 이용 가능합니다")
    		return;
    	}
		var listUrl ="/HAO/supporter/supporter.do?" 
		     + "work_div=doRetrieveSp" 
		     + "&m_id=<%=m_l_s_Id %>";
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}
	
	//로그인 페이지로 이동
	function moveToMemberLoginPage() {
		var listUrl ="/HAO/member/member_login.jsp?" 
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}//로그아웃
	function moveToMemberLdgoutPage(){
		window.location.href="/HAO/member/logout.jsp";
	}
	
	//회원정보 수정 페이지로 이동
	function moveToMemberMyPage() {
		var sessionId = $("#sessionId").val();
		console.log("sessionId:"+sessionId);
    	if(sessionId=="++++++"){
    		alert("로그인 후 이용 가능합니다")
    		return;
    	}
		
		var listUrl ="/HAO/member/member_mod.jsp?"
			 + "work_div=doUpdate" ;
		console.log("listUrl:"+listUrl);
		window.location.href=listUrl;
	}
	

</script>
<!-- 상단 버튼 이동용 스크립트// -->

<header>
	<div class="container">
		<div class="gnb_inner">
			
			<!-- hidden -->
			<input type="hidden" id="sessionId" name="sessionId" value="<%=m_l_s_Id %>"/>
					
			
			
			
			
			<!-- hidden -->
			<!-- //메인페이지 -->
			<div class="gnb_gohome">			
				<a href="javascript:moveToProjectMainPage()">
					<span>HAO</span>
				</a>
			</div>
			<!-- 메인페이지//-->

		
			<div class="gnb_depth">
				<ul class="gnb_depth01_lst in-block">
					<!-- //프로젝트 등록 -->
					<li>
						<a href="javascript:moveToProjectRegPage()">
					 		<span>프로젝트등록</span>
						</a>
					</li>
					<!-- 프로젝트 등록// -->
	
					<!-- //프로젝트내역 -->
					<li>
						<a href="javascript:moveToProjectMypage()"> 
							<span>프로젝트 내역</span>
						</a>
					</li>
					<!-- 프로젝트내역// -->
	
					<!-- //후원내역 -->
					<li>
						<a href="javascript:moveToSupporterListPage()">
							<span>후원 내역</span>
						</a>
					</li>
					<!-- 후원내역// -->
				</ul>
			</div>
			<div class="gnb_tool_wrap">
				<ul class="gnb_toolbar_lst in-block">
	
					<!-- //로그인 -->
					<% if (m_l_s_Id.equals("++++++")){
						
					
					%>
					<li>
						<a href="javascript:moveToMemberLoginPage()">
							<span>로그인</span>
						</a>
					</li>
					<%
					}else{
						
					%>
					<li>
						<a href="javascript:moveToMemberLdgoutPage()">
							<span>로그아웃</span>
						</a>
					</li>
					<% }%>
					<!-- 로그인// -->
	
					<!-- //마이페이지 -->
					<li>
						<a href="javascript:moveToMemberMyPage()">
							<span>마이페이지</span>
						</a>
					</li>
					<!-- 마이페이지// -->
					
				</ul>
			</div>
		</div>
	</div>
</header>