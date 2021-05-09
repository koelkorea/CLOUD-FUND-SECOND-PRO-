<%@page import="vo.MemberVO"%>
<%@page import="cmn.StringUtil"%>
<%@page import="vo.SearchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/cmn/common.jsp" %>
<!-- java code part -->
<%
	//param 받기(1.form에서 설정한 데이터 2.총 글 수)
	SearchVO param = (SearchVO) request.getAttribute("param");
	int maxNum = Integer.parseInt(StringUtil.nvl(request.getAttribute("total_cnt").toString(), "0"));
	
	//로그인 정보
	MemberVO member = (MemberVO)session.getAttribute("memberInfo");
	//세션 ID 값 받아오기
	String p_m_id = "";
	if(null != member){
		p_m_id = member.getM_id();
	}else {
		p_m_id = "++++++";
	}
	
	//현재 페이지 출력 시 필요한 데이터
	String pageSize = "10"; //페이지 사이즈
	String pageNum = "1"; //페이지 num
	int currPageNo = 1; //현재 페이지
	int rowPerPage = 10; //페이지당 보여줄 글 수 
	int bottomCount = 10; // << < 1 2 3 ... 8 9 10 > >>
	
	//호출 url
	String url = cPath + "/project/project.do";
	//javascript name
	String scriptName = "doSearchPage";
	
	if (null != param) {
		currPageNo = param.getPageNum();
		rowPerPage = param.getPageSize();
	}
%>
<!-- java code part -->

<!DOCTYPE html>
<html>
<head>
<!-- CSS BOOT -->
<jsp:include page="/inc/css_boot.jsp"></jsp:include>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>PROJECT_LIST</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<!-- header -->

	<div id="content">
		<div class="cont_wrap">
			<div class="container">
				<h1 class="cont_form_ttl">프로젝트 내역</h1>

				<!-- 테이블 상단 조회칸 : 조회버튼  + 출력 글 갯수 + 파라미터들 -->
				<div>
					<form action="<%=cPath %>/project/project.do" id="RetrievePJFrm" name="RetrievePJFrm" method="post">
						<div>
							<input type="hidden" name="work_div" value="" /> 
							<input type="hidden" name="p_m_id" id="p_m_id" value="<%= p_m_id %>" />
							<input type="hidden" name="page_num" value="" />
							<input type="hidden" name="search_div" value="30" />
							<input type="hidden" name="seq" value="" />
							<input type="hidden" name="search_word" value="" />
						</div>

						<div class="comn_rst_tool_wrap">
							<div class="comn_rst_cont">
								<label class="col-xs-4 col-sm-3 col-md-2 col-lg-2">
									<span class="comn_rst_cont_txt"><c:out value="${total_cnt}" /></span>건의 프로젝트를 등록했습니다.
								</label>
							</div>

							<div class="comn_rst_optn_outer_wrap in-block">
								<div class="comn_rst_optn_wrap">
									<select name="page_size" id="page_size">
										<option value="10" <%if (10 == param.getPageSize()) {out.print("selected");}%> >10</option>
										<option value="20" <%if (20 == param.getPageSize()) {out.print("selected");}%> >20</option>
										<option value="50" <%if (50 == param.getPageSize()) {out.print("selected");}%> >50</option>
									</select>
								</div>
								<div class="cont_rst_btn_wrap">
									<input type="button" value="조회" id="RetrieveProjectList" >
								</div>
							</div>
						</div>

					</form>
				</div>
				<!-- 테이블 상단 조회칸 -->

				<!-- 테이블 -->
				<div class="table-responsive">
					<table class="comn_table supt_form" id="listTable">
						<thead>
							<tr>
								<th class="text-center">프로젝트명</th>
								<th class="text-center">목표금액</th>
								<th class="text-center">등록일</th>
								<th class="text-center">마감일</th>
								<th class="text-center">진행상태</th>
								<th style="display:none;">seq</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${list.size()>0}">
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="text-center">   <c:out value="${vo.p_title}" />      </td>
											<td class="text-right">    <c:out value="${vo.p_goalfund}" />   </td>
											<td class="text-left">     <c:out value="${vo.p_opendate}" />   </td>
											<td class="text-right">    <c:out value="${vo.p_closedate}" />  </td>
											<td class="text-center">  
												<c:choose>
													<c:when test="${vo.p_status == 0}">
														<c:out value="진행중" />
													</c:when>
													<c:when test="${vo.p_status == 1}">
														<c:out value="펀딩 성공" />
													</c:when>
													<c:otherwise>
														<c:out value="펀딩 실패" />
													</c:otherwise>
												</c:choose>   
											</td>
											<td style="display:none;"> <c:out value="${vo.p_seq}" />        </td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="99">작성된 프로젝트가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
				</div>
				<!-- 테이블 -->

				<!-- //pagenation -->
				<div style="margin-top: 50px; text-align: center;">
					<%=StringUtil.renderingPage(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName)%>
				</div>
				<!-- pagenation// -->
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>

<!-- javascript -->
<script type="text/javascript">
	//조회버튼
	$("#RetrieveProjectList").on("click", function(e) {		
		var frm = document.getElementById("RetrievePJFrm");
		frm.work_div.value = "doRetrieve";
		frm.p_m_id.value = $("#p_m_id").val();
		frm.page_size.value = $("#page_size option:selected").val();
		frm.page_num.value = "1";
		frm.search_div.value = "30";
		
		frm.submit();
	});
	
	//테이블 클릭 : 상세보기
	$("#listTable>tbody").on("click","tr", function(event){

		var pTR = $(this);
		
		var tdArray = pTR.children();
		var p_seq = tdArray.eq(5).text();
		
		if(null == p_seq || p_seq.length == 0){
			alert("선택된 값이 없습니다.");
			return;
		}
		
		console.log("p_seq : " + p_seq);

		var listUrl ="<%=cPath%>/supporter/supporter.do?" 
					+ "work_div=doRetrieve" 
					+ "&p_seq="+ tdArray.eq(5).text();
    	window.location.href=listUrl;

    	//frm.submit();
	});
	
	//page 이동
	function doSearchPage(url, num) {
		var frm = document.getElementById("RetrievePJFrm");
		frm.work_div.value = "doRetrieve";
		frm.page_num.value = num;
		
		frm.action = url;
		frm.submit();
	}
	
</script>
<!--// javascript -->

</html>
