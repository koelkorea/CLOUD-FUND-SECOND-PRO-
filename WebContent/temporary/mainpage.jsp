<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 국제화 -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>





<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>메인 페이지 레이아웃</title>

  <!-- Bootstrap core CSS -->
  <link href="/HAO/05.lsh/bootstrap.min_05lsh.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/HAO/05.lsh/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- 헤더쪽 Navigation 코드(어떤식으로 헤더가 구성될지 몰라서 일단 그냥 둠... -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">SNIPING CLOUD FUND</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">마이페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">프로젝트 만들기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">로그인</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- // 헤더쪽 Navigation 코드-->

  <!--  컨테이너 -->
  <div class="container">
	
	<!-- 줄  코드 -->
    <div class="row">
		
	  <!-- 싸이드쪽 Page 코드 -->
      <div class="col-lg-3">

	    <h3 class="my-4 text-center"><strong>검색어로 검색</strong></h3>
	    
	    <label class="checkbox-inline">
 		  <input type="checkbox" id="inlineCheckbox_title"> 제목
		  <input type="checkbox" id="inlineCheckbox_tag"> 태그
		</label>
		
		<div>

	        <input type = "text" size = "24" name = "search_word" id = "search_word" 
							placeholder = "검색어를 입력해주세요" value = ""/>
			
			<a href='<c:out value = "${not_decided}" />'><img src="/HAO/05.lsh/search.png" width = "15%" onclick = ""></a>
					
			<br/>
			<hr/>
		</div>
        <div class="list-group text-center">
          <h3 class="my-4 text-center"><strong>카테고리 보기</strong></h3>
          <a href="#" class="list-group-item"><strong>전체 프로젝트 보기</strong></a>
          <a href="#" class="list-group-item">연극</a>
          <a href="#" class="list-group-item">뮤지컬</a>
          <a href="#" class="list-group-item">토크쇼</a>
          <a href="#" class="list-group-item">음악공연</a>
          <a href="#" class="list-group-item">자기 PR</a>
        </div>

      </div>
      <!-- // 싸이드쪽 Page 코드 -->
	  
	  
	  <!-- 몸통(컨텐츠) -->
      <div class="col-lg-9">

		<!-- 슬라이드 페이지 -->
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <h4>프로젝트 1번</h4>
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <h4>프로젝트 2번</h4>
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <h4>프로젝트 3번</h4>
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
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

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
           <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
      
        </div>
        
        <div class="text-center">
			<input type = "button" class="btn btn-primary btn-sm" value = "더 보기" onclick = "" /><br/>
		</div>
        
        <hr/>
        <br/>
        <!-- // 메인)목표븜액 달성률 기준 프로젝트 정렬 -->
        
        <!-- 메인)마감일 임박 기준 프로젝트 정렬 -->
        <h4 class = "text-left">마감일 임박</h4><br/>
		
        <div class="row">

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
           <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
        </div>        
        
      	<div class="text-center">
			<input type = "button" class="btn btn-primary btn-sm" value = "더 보기" onclick = "" /><br/>
		</div>
		<hr/>
        <br/>
		<!-- // 메인)마감일 임박 기준 프로젝트 정렬 -->
		
        <!-- 메인)마감일 임박 기준 프로젝트 정렬 -->
        <h4 class = "text-left">모금액 총액 순위</h4><br/>
		
        <div class="row">

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
           <div class="col-lg-3 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><small>이미지 주소 투입</small><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="#">프로젝트 제목</a>
                </h5>
                <h6><small>카테고리 | 창작자 이름</small></h6>
              </div>
              <div class="card-footer">
                <small class="text-muted">프로젝트 달성률%</small>
              </div>
            </div>
          </div>
          
        </div>        
        
      	<div class="text-center">
			<input type = "button" class="btn btn-primary btn-sm" value = "더 보기" onclick = "" /><br/>
		</div> <br/>
		<!-- // 메인)모금액 총액 순위 기준 프로젝트 정렬 -->		
		
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
			frm.word_div.value = "doRetrieve";
			frm.page_num.value = num;
			
			console.log("frm.div.value : " + frm.div.value);
			
			frm.action = url;
			frm.submit();
			
		}
	
		//검색  Enter key
		//$("#whichkey").on("keydown", function(event){}
		$("#search_word").keypress(function(event){
			//event
			console.log("search_word : " + event.which);
			//Enter key 눌려졌으면
			if(13 == event.which){
				doRetrieve("1");
			}
		});
		
		
		// table 데이터 목록
		$("#listTable>tbody").on("click", "tr", function(event){
			console.log("listTable");
			console.log("this : " + $(this));
			
			var pTR = $(this);
			
			var tdArray = pTR.children();
			var seq 	= tdArray.eq(5).text();
			
			console.log("seq : " + seq);
			
			var frm = document.getElementById("searchFrm");
			frm.word_div.value = "doSelectOne";
			frm.seq.value = seq;
			
			console.log("frm.seq.value : " + frm.seq.value);
			console.log("frm.word_div.value : " + frm.word_div.value);
			frm.submit();
			
		});
	
		function doRetrieve(){
			console.log("doRetrieve");
			console.log("num" + num);
			var frm = document.getElementById("searchFrm");
			
			frm.word_div.value = "doRetrieve";
			frm.page_num.value = num;
			frm.div.value = "10";
			
			// console.log("workDiv : " + workDiv);
			console.log("frm.word_div.value : " + frm.word_div.value);
			console.log("frm.page_num.value : " + frm.page_num.value);
			console.log("frm.div.value : " + frm.div.value);
			// alert("doRetrieve");
			frm.submit();
		}
		
		$("#moveToReg").on("click", function(e){
			console.log("moveToReg")
			var frm = document.getElementById("searchFrm");
			frm.word_div.value = "moveToReg";
			console.log("frm.word_div.value : " + frm.word_div.value);
			console.log("frm.div.value : " + frm.div.value);
			frm.submit();
		});
	
	</script>
	<!-- // javascript -->

</body>

</html>
