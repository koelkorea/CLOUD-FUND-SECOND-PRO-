<%@page import="vo.MemberVO"%>
<%@page import="cmn.StringUtil"%>
<%@page import="vo.SearchVO"%>
<%@page import="vo.SupporterVO"%>
<%@page import="java.util.List"%>
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
	String m_id = "";
	if(null != member){
		m_id = member.getM_id();
	}else {
		m_id = "++++++";
	}
	
	//현재 페이지 출력 시 필요한 데이터
	String pageSize = "10"; //페이지 사이즈
	String pageNum = "1"; //페이지 num
	int currPageNo = 1; //현재 페이지
	int rowPerPage = 10; //페이지당 보여줄 글 수 
	int bottomCount = 10; // << < 1 2 3 ... 8 9 10 > >>
	
	//호출 url
	String url = cPath + "/supporter/supporter.do";
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
<title>SUPPORTER_LIST</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<!-- header -->

	<div id="content">
		<div class="cont_wrap">
			<div class="container">
				<h1 class="cont_form_ttl">후원 내역</h1>

				<!-- 테이블 상단 조회칸 : 조회버튼  + 출력 글 갯수 + 파라미터들 -->
				<div>
					<form action= "<%=cPath %>/supporter/supporter.do" id="RetrieveSPFrm" name="RetrieveSPFrm" method="post">
						<div> <!-- ${param.getSearchWord} -->
							<input type="hidden" name="work_div" value="" /> <!-- 검색조건 : 후원내역 -->
							<input type="hidden" name="m_id" id="m_id" value="<%= m_id %>" /> <!-- 아이디 : 파라미터로 아이디값 받아와야 함 -->
							<input type="hidden" name="page_num" value="" /> <!-- 페이지 번호 -->
							<input type="hidden" name="s_seq" value="" />
						</div>

						<div class="comn_rst_tool_wrap">
							<div class="comn_rst_cont">
								<label class="col-xs-4 col-sm-3 col-md-2 col-lg-2"> 
									<span class="comn_rst_cont_txt"><c:out value="${total_cnt}" /></span>건의 프로젝트를 후원했습니다.
								</label>
							</div>

							<div class="comn_rst_optn_outer_wrap in-block">
								<div class="comn_rst_optn_wrap">
									<select name="page_size" id="page_size">
										<option value="10" <% if(10 == param.getPageSize()) {out.print("selected");} %> >10</option>
										<option value="20" <% if(20 == param.getPageSize()) {out.print("selected");} %> >20</option>
										<option value="50" <% if(50 == param.getPageSize()) {out.print("selected");} %> >50</option>
									</select>
								</div>
								<div class="cont_rst_btn_wrap">
									<input type="button" value="조회" id="RetrieveSupporterList" >
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
								<th class="text-center">후원일</th>
								<th class="text-center">프로젝트명</th>
								<th class="text-center">마감일</th>
								<th class="text-center">후원상태</th>
								<th class="text-center">진행상태</th>
								<th style="display:none;">seq</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${list.size()>0}">
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="text-center">   <c:out value="${vo.s_date}" />             </td>
											<td class="text-right">    <c:out value="${vo.projectName}" />        </td>
											<td class="text-center">   <c:out value="${vo.projectClosedDate}" />  </td>
											<td class="text-right">          
												<c:choose>
													<c:when test="${vo.s_status == 0}">
														<c:out value="진행중" />
													</c:when>
													<c:when test="${vo.s_status == 1}">
														<c:out value="후원 성공" />
													</c:when>
													<c:otherwise>
														<c:out value="후원 취소" />
													</c:otherwise>
												</c:choose>   
											</td>
											<td class="text-right">  
												<c:choose>
													<c:when test="${vo.projectStatus == 0}">
														<c:out value="진행중" />
													</c:when> 
													<c:when test="${vo.projectStatus == 1}">
														<c:out value="펀딩 성공" />
													</c:when>
													<c:otherwise>
														<c:out value="펀딩 실패" />
													</c:otherwise>
												</c:choose>  
											</td>	
											<td style="display:none;"> <c:out value="${vo.s_seq}" /></td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="99">창의적인 시도를 함께 실현시키는 펀딩 커뮤니티 HAO에서 연극, 뮤지컬, 토크쇼, 음악 공연 까지 다양한 분야 크리에이터들의 프로젝트를 밀어주세요.</td>
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
	$("#RetrieveSupporterList").on("click", function(e) {
		var frm = document.getElementById("RetrieveSPFrm");
		frm.work_div.value = "doRetrieveSp";
		frm.m_id.value = $("#m_id").val();
		frm.page_size.value = $("#page_size option:selected").val();
		frm.page_num.value = "1";

		frm.submit();
	});
	
	//테이블 선택 -> 상세보기 
	$("#listTable>tbody").on("click","tr", function(event){	

		var pTR = $(this);
		
		var tdArray = pTR.children();
		var seq = tdArray.eq(5).text();
		
		if(null == seq || seq.length == 0){
			alert("선택된 값이 없습니다.");
			return;
		}
		
		var frm = document.getElementById("RetrieveSPFrm");
		frm.work_div.value = "doSelectOne";
		frm.s_seq.value = seq;

		frm.submit();
	});

	//page 이동
	function doSearchPage(url, num) {
		var frm = document.getElementById("RetrieveSPFrm");
		frm.work_div.value = "doRetrieveSp";
		frm.page_num.value = num;

		frm.action = url;
		frm.submit();
	}
	
</script>
<!--// javascript -->

</html>
