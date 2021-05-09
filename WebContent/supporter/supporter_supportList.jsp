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
	
	if(param.getSearchWord()==null){
		String p_seq="++++";
		
		param.setSearchWord(p_seq);
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
				<h1 class="cont_form_ttl">후원자 내역</h1>

				<!-- 테이블 상단 조회칸 : 조회버튼  + 출력 글 갯수 + 파라미터들 -->
				<div>
					<form action="<%=cPath %>/supporter/supporter.do" id="retrieveFrm" name="retrieveFrm" method="get">
						<div><!-- ${param.getSearchWord} -->
							<input type="hidden" name="work_div" value="" /> <!-- 검색조건 : 후원내역 -->
							<input type="hidden" name="p_seq" id="p_seq" value="<%=param.getSearchWord() %>" /> <!-- 아이디 : 파라미터로 아이디값 받아와야 함 -->
							<input type="hidden" name="page_num" value="" /> <!-- 페이지 번호 -->
						</div>

						<div class="comn_rst_tool_wrap">
							<div class="comn_rst_cont">
								<label class="col-xs-4 col-sm-3 col-md-2 col-lg-2"> 
									<span class="comn_rst_cont_txt"><c:out value="${total_cnt}" /></span>건의 후원을 받았습니다
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
					<table class="comn_table supt_form">
						<thead>
							<tr>
								<th class="text-center">후원 날짜</th>
								<th class="text-center">후원자 id</th>
								<th class="text-center">후원자 주소</th>
								<th class="text-center">후원 금액</th>
								<th class="text-center">후원 상태</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${list.size()>0}">
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="text-center"> <c:out value="${vo.s_date}" />            </td>
											<td class="text-right">  <c:out value="${vo.s_m_id}" />       </td>
											<td class="text-center"> <c:out value="${vo.s_addr}" /> </td>
											<td class="text-left">   <c:out value="${vo.s_fund}" />          </td>
											<td class="text-left">   
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
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="99">후원을 기다리고 있습니다.</td>
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
		console.log("Retrieve Supporter List");
		
		var frm = document.getElementById("retrieveFrm");
		frm.work_div.value = "doRetrieve";
		frm.search_word.value = $("#search_word").val();
		frm.page_size.value = $("#page_size option:selected").val();
		frm.page_num.value = "1";

		console.log("frm.work_div.value:"  + frm.work_div.value);
		console.log("frm.search_word.value:" + frm.search_word.value);
		console.log("frm.page_size.value:" + frm.page_size.value);
		console.log("frm.page_num.value:"  + frm.page_num.value);
		
		frm.submit();
	});
	
	//page 이동
	function doSearchPage(url, num) {
		console.log("url : " + url);
		console.log("num : " + num);
		
		var frm = document.getElementById("retrieveFrm");
		frm.work_div.value = "doRetrieve";
		frm.page_num.value = num;
		
		console.log("work_div : " + frm.work_div.value);
		console.log("frm.page_num.value : " + frm.page_num.value);
		
		frm.action = url;
		frm.submit();
	}
	
</script>
<!--// javascript -->

</html>
