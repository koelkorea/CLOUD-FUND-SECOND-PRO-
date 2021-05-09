<%@page import="vo.ProjectVO"%>
<%@page import="cmn.StringUtil"%>
<%@page import="vo.SearchVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.SupporterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 국제화 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- cPath -->
<%@ include file="/cmn/common.jsp" %>
<%
	LOG.debug("cPATH : " + cPath);


	// http://localhost:8080/HAO/project/project.do?work_div=doRetrieve&div=10
	// List<ProjectVO> resultList = (List<ProjectVO>)request.getAttribute("list");

	
	// String html = StringUtil.renderingPage(21, 1, 10, 10, "url", "scriptName");

	// out.print("total_cnt" + " : " + request.getAttribute("total_cnt"));

	

/* 	//로그인 정보
	MemberVO member = (MemberVO)session.getAttribute("memberInfo");
	
	//세션 ID 값 받아오기
	String m_id = "";
	if(null != member){
		m_id = member.getM_id();
	}else {
		m_id = "++++++";
	} */

	//현재 페이지 출력 시 필요한 데이터
/*  	String pageSize = "4"; //페이지 사이즈
	String pageNum = "1"; //페이지 num   */

	// 총글수
	int maxNum = 0;
	// 현재 페이지
	int currPageNo = 1;
	// 페이지당 보여줄 글수
	int rowPerPage = 4;	
	// 5
	int bottomCount = 10;	// << < 1 2 3 4 5 6 7 8 9 10 > >> 
		
	
	// 호출 URL
	String url = cPath + "/project/project.do";	// /HAO/project/project.do
	
	// javascript name
	String scriptName = "doSearchPage";
	
	// Param
	SearchVO param = (SearchVO)request.getAttribute("param");
	maxNum = Integer.parseInt(StringUtil.nvl(request.getAttribute("total_cnt").toString(), "0"));
	
	
	if(null != param){
		currPageNo = param.getPageNum();
		rowPerPage = param.getPageSize();
	}
	
	LOG.debug("-paging-----------------------");
	
	LOG.debug("maxNum : " + maxNum);
	LOG.debug("currPageNo : " + currPageNo);
	LOG.debug("rowPerPage : " + rowPerPage);
	LOG.debug("url : " + url);
	LOG.debug("scriptName : " + scriptName);
	
	LOG.debug("-paging-----------------------"); 
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>메인 페이지 레이아웃</title>

  <!-- Bootstrap core CSS -->
  <link href="/HAO/bootstrap/bootstrap_05lsh.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/HAO/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/HAO/css/normalize.css">
  <link rel="stylesheet" type="text/css" href="/HAO/css/base.css">
  
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="/HAO/js/bootstrap.min.js"></script>

</head>
<body>

<%--  "총글수 : " ${total_cnt} ${search }<br/>
	${list }  --%>
	
  <!-- header -->
  <jsp:include page="/inc/header.jsp"></jsp:include>
  <!--//header -->


  <!--  컨테이너 -->
  <div class="container">
	
	<!-- 줄  코드 -->
    <div class="row">
		
	  <!-- 싸이드쪽 Page 코드 --> 
      <form action = "/HAO/project/project.do" class="col-lg-3"  id = "searchFrm" name = "searchFrm" method = "post">

		<!-- hidden -->
		<input type = "hidden" name = "p_seq" 	 value = "" />
 		<input type = "hidden" name = "search_div" 	 value = "${param.search_div }" />
		<input type = "hidden" name = "p_category" value = "${param.p_category }" />
		<input type = "hidden" name = "page_num" value = "" />  
		<input type = "hidden" name = "work_div" value = "" /> 	<!-- work_div에 경우에 따라(버튼 클릭 등등) 값이 주어짐 -> 그 값이 url을 타고 컨트롤러로 이어짐.. -> 컨트롤러는 그거보고 케이스별 명령 수행 -->


		<!-- // hidden -->
		
	    <h3 class="my-4 text-center"><strong>검색어로 검색</strong></h3>
	
		<input type = "text" size = "20" name = "search_word" id = "search_word" placeholder = "검색어를 입력해주세요" 
				value = "${param.search_word }" />
		
		
		<img src="/HAO/search.png" width = "15%" id = "search_icon" name ="search_icon">
				
		<br/>
		<hr/>
        <div class="list-group text-center">
          <h3 class="my-4 text-center"><strong>카테고리 보기</strong></h3>
          <a href="javascript:moveToAllList()" id = "category_all" class="list-group-item">전체 프로젝트 보기</a>
		  <a href="javascript:moveToCategory_10()" id = "category_10"  class="list-group-item">연극</a>
		  <a href="javascript:moveToCategory_20()" id = "category_20"  class="list-group-item">뮤지컬</a>
		  <a href="javascript:moveToCategory_30()" id = "category_30"  class="list-group-item">토크쇼</a>
		  <a href="javascript:moveToCategory_40()" id = "category_40"  class="list-group-item">음악공연</a>
		  <a href="javascript:moveToCategory_50()" id = "category_50"  class="list-group-item">자기PR</a>
        </div>

		<br/>
		<br/>
      </form>
      <!-- // 싸이드쪽 Page 코드 -->
	  
	  
	  <!-- 몸통(컨텐츠) -->
      <div class="col-lg-9">

		  <!-- 슬라이드 페이지 -->
		  <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
		      <ol class="carousel-indicators">
		      	 <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
		      	  	<c:if test = "${list.size() > 0 }">
						<c:forEach var = "vo" items = "${list }"> 
		           		   	<li data-target="#carouselExampleIndicators" data-slide-to="${vo.num }" ></li>
		           	   </c:forEach>
	       		   </c:if>
		      </ol>
	      <div class="carousel-inner " role="listbox" >
	       	<div class="carousel-item active" >
	       		<h4> 그림으로 보는 프로젝트들</h4>
	       		<img class="d-block img-fluid" src="/HAO/empty.jpg" >
	        </div>			
	       		<c:if test = "${list.size() > 0 }">
				  <c:forEach var = "vo" items = "${list }"> 
									
			       	<div class="carousel-item listBigImage" >
	        		   <h4><c:out value = "${vo.p_title}" /></h4>	        		    
	        		    <small class = "yeah" style = "display:none;">
	        		    	<c:out value = "${vo.p_seq}" />
	        		    </small>
				        <img class="d-block img-fluid" src="/${vo.p_thumb}" >
					</div>
								        
			      </c:forEach>
		    	</c:if>
	      </div>

          
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          
        </div> 
        <hr/> 
          
          			
        
		<!-- // 슬라이드 페이지 -->


		<!-- 메인)목표븜액 달성률 기준 프로젝트 정렬 -->
	   <h4>프로젝트 달성률 기준 순위</h4><br/>
		
       <div class="row">
       
           <c:choose>
			<c:when test = "${list.size() > 0 }">
				<c:forEach var = "vo" items = "${list }"> 
					<div class="col-lg-3 col-md-6 mb-4 listSmallImage">
			            <div class="card h-100">
			              <a href="#"><img class="card-img-top" src="/${vo.p_thumb}" alt=""></a>
			              
			              <div class="card-body">
			              
			              	<small class="text-muted"> 
					          <c:if test = "${vo.p_cate == '10' }">연극	  </c:if>
						      <c:if test = "${vo.p_cate == '20' }">뮤지컬  </c:if>
						      <c:if test = "${vo.p_cate == '30' }">토크쇼  </c:if>
						      <c:if test = "${vo.p_cate == '40' }">음악공연</c:if>
						      <c:if test = "${vo.p_cate == '50' }">자기PR  </c:if>
				            </small>
				            
			                <h6 class="card-title">
			                  <a href="#"><c:out value = "${vo.p_title }" /></a>
			                </h6>
			                
			              </div>
			              <div class="card-footer text-center">
			                <small class="text-muted">
			                	현재 
			                	<c:if test = "${vo.percent >= 100 }">
			                		<strong>
			                			<c:out value = "${vo.percent}%" />
			                		</strong>
			                	</c:if>
			                	<c:if test = "${vo.percent < 100 }">
			                		<c:out value = "${vo.percent}%" />
			                	</c:if>
			                	달성 중! 
			                </small>
			                <small class = "gotta" style = "display:none;"><c:out value = "${vo.p_seq}" /></small>
			              </div>
			            </div>
			          </div>
				</c:forEach>
			 </c:when>
				
			<c:otherwise>
				<h6>데이터가 없습니다.</h6><br/>
			</c:otherwise>
			            		
          </c:choose>  
         
           		
          </div>

		<!-- pagenation -->
		<div class="text-center">
			<%= StringUtil.renderingPage(maxNum, currPageNo, rowPerPage, bottomCount, url, scriptName) %>
		</div>
	    <!--// pagenation -->
		
		<br/>
		
      </div>
      <!-- // 몸통(컨텐츠) -->

    </div>
    <!-- //row -->


  </div>
  <!--  // 컨테이너 -->



  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/HAO/jquery/jquery.min.js"></script>
  <script src="/HAO/js/bootstrap.bundle.min.js"></script>

	<!-- javascript -->
	<script type="text/javascript">
	
		// paging 이동
		function doSearchPage(url, num){
		
			console.log("url : " + url);
			console.log("num : " + num);
			
			var frm = document.getElementById("searchFrm");
			frm.work_div.value = "doRetrieve";
			frm.page_num.value = num;
			
			console.log("frm.search_div.value : " + frm.search_div.value);
			
			
			console.log("frm.page_num.value : " + frm.page_num.value);
			
			frm.action = url;
			frm.submit();	
		} 
	
	
	
	
		//검색  Enter key
		//$("#whichkey").on("keydown", function(event){}
		$("#search_word").keypress(function(event){
			//Enter key 눌려졌으면
			if(13 == event.which){
				var searchWord = document.getElementById('search_word').value;
				
				var frm = document.getElementById("searchFrm");
				
				frm.work_div.value = "doRetrieve";
				frm.search_div.value = "10";
				frm.search_word.value = searchWord;
				
				//안넣으면 오류나요
				frm.p_seq.value = "+++";
				frm.p_category.value = "+++";
				frm.page_num.value = "1";
				
				frm.submit();
			}
		});
		
				
		// 검색 아이콘 클릭시
		$("#search_icon").on("click", function(e){
			console.log("search_icon");
			var searchWord = document.getElementById('search_word').value;
			
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=10"
				+ "&search_word=" + searchWord;
			
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		});
		
		
		// 프로젝트 상세조회로 연결
 	    $(".listSmallImage").on("click",function(e){
		   console.log("listSmallImage");
		   console.log("this : " + $(this));
		   
		   var pTR = $(this);
			//Returns a collection of child elements of the given element.
			var tdArray = pTR.find(".gotta");
			var p_seq 	= tdArray.eq(0).text();
			
			console.log("p_seq : " + p_seq);
			
			var frm = document.getElementById("searchFrm");
			frm.work_div.value = "doSelectOne";
			frm.p_seq.value = p_seq;
			
			console.log("frm.p_seq.value : " + frm.p_seq.value);
			console.log("frm.work_div.value : " + frm.work_div.value);
			frm.submit(); 
			
	    });
		
		
		// 그림 클릭으로 이동(이쪽은 또 어떤 그림을 눌러도 반드시 첫번째 자료로만 링크된다... 강사님꼐 묻는다면 어떤 부분에서 코딩이 선별적으로 작동하는지를 물어봐야..)
		$(".listBigImage").on("click", function(event){
			console.log("listBigImage");
			console.log("this : " + $(this));
			
			var pTR = $(this);
			//Returns a collection of child elements of the given element.
			var tdArray = pTR.find(".yeah");
			var p_seq 	= tdArray.eq(0).text();
			
			console.log("p_seq : " + p_seq);
			
			var frm = document.getElementById("searchFrm");
			frm.work_div.value = "doSelectOne";
			frm.p_seq.value = p_seq;
			
			console.log("frm.p_seq.value : " + frm.p_seq.value);
			console.log("frm.work_div.value : " + frm.work_div.value);
			frm.submit();
			
		});
		
		// 연극 카테고리 클릭시
		function moveToCategory_10() {
			var listUrl ="/HAO/project/project.do?"
						+ "work_div=doRetrieve"
						+ "&search_div=20"
						+ "&p_category=10";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
		
		// 뮤지컬 카테고리 클릭시
		function moveToCategory_20() {
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=20"
				+ "&p_category=20";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
		
		// 토크쇼 카테고리 클릭시
		function moveToCategory_30() {
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=20"
				+ "&p_category=30";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
		
		// 음악공연 카테고리 클릭시
		function moveToCategory_40() {
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=20"
				+ "&p_category=40";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
		
		// 자기PR 카테고리 클릭시
		function moveToCategory_50() {
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=20"
				+ "&p_category=50";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
		
		// 모든 게시물 클릭시
		function moveToAllList() {
			var listUrl ="/HAO/project/project.do?"
				+ "work_div=doRetrieve"
				+ "&search_div=40";
			console.log("listUrl:"+listUrl);
			window.location.href=listUrl;
		}
	
		
		
/* 		// 자바스크립트의 목록조회 메서드
		function doRetrieve(){
			console.log("doRetrieve");
			var frm = document.getElementById("searchFrm");
			
			frm.work_div.value = "doRetrieve";
			
			// console.log("workDiv : " + workDiv);
			console.log("frm.work_div.value : " + frm.work_div.value);
			console.log("frm.p_category.value : " + frm.p_category.value);
			// alert("doRetrieve");
			frm.submit();
		} */
		

	</script>
	<!-- // javascript -->


</body>

</html>
