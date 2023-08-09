<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>product_list</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon"
	href="/TimeForMaker/assets/img/TFM_icon.png">

<link rel="stylesheet" href="/TimeForMaker/assets/css/mypage_login.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">

<!-- 스타일 시트(슬기)-->
<link rel="stylesheet" href="/TimeForMaker/assets/css/user-header.css">
<link rel="stylesheet" href="/TimeForMaker/assets/css/product_list.css">



</head>

<body>
	<%@ include file="/views/common/user-header1.jsp" %>




	<!-- Start Content -->
	<br>
	<div class="container py-5 pl_class_all">
		<div class="row">
			<h1 class="h2 pl_class_all_title">T.F.M클래스</h1>
			<div class="col-12 mb-3">
				<div class="w-100 my-3 border-top border"></div>
			</div>
			<div class="pl_filter">
				<div class="pl_filter_area">
					<i class="fa fa-filter"></i>
					<button class="pl_key_btn" onclick="product_key_modal_open();">필터</button>
				</div>
				<div class="pl_search">
					<form action="" method="" class="pl_search_rap">
						<div class="input-group pl_search_area">
							<input type="text" class="pl_search_text" id="inputPLSeach"
								name="" placeholder="클래스 명으로 바로 검색~">
							<button type="submit" class="bg-success text-light pl_search_btn">
								<i class="fa fa-fw fa-search text-white"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="pl_key_check_result" id="pl_key_check_result_view">
					<p>검색 키워드 :</p>
					<ul>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
						<li>키워드</li>
					</ul>
				</div>
				<div class="pl_key_box">
					<div class="pl_key_modal">
						<form action="" method="post">
							<ul class="pl_filter_wrap">
								<h3>클래스 키워드 검색</h3>
								<h5 class="pl_key_title">전체체크</h5>
								<li><input type="checkbox"><label
									class="pl_filter01 all">ALL</label></li>
								<h5 class="pl_key_title">지역</h5>
								<li><input type="checkbox"><label
									class="pl_filter01">압구정/청담</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">이태원/한남</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">성수</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">역삼/강남</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">역삼/강남</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">역삼/강남</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">역삼/강남</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">역삼/강남</label></li>
								<h5 class="pl_key_title">키워드</h5>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">카테고리</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
								<li><input type="checkbox"><label
									class="pl_filter01">키워드</label></li>
							</ul>
							<div class="pl_key_check_result">
								<ul>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
									<li>키워드</li>
								</ul>
							</div>
							<div class="pl_keybox_btn">
								<input type="submit" value="검색"
									onclick="product_key_modal_search();"> <input
									type="button" value="닫기" onclick="product_key_modal_close();">
							</div>

						</form>

					</div>

				</div>

			</div>

			<div class="pl_class_card_wrap">
				<!--클래스 카드 전체부분-->
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
				<div class="pl_class_card_wrap_item">
					<!--카드 하나하나-->
					<div class="pl_class_card_img">
						<a href=""> <img class="pl_card-img rounded-0 img-fluid"
							src="/TimeForMaker/assets/img/클래스이미지/c_1_2.jpg">
						</a>
					</div>
					<div class="pl_class_card_body">
						<a href="" class="pl_class_card_name">클래스이름111</a>
						<ul class="pl_class_card_key">
							<li>키워드</li>
							<li>위치키워드</li>
						</ul>
						<p class="pl_class_card_price">50,000₩</p>
					</div>
				</div>
			</div>
			<!--페이징 바-->
			<nav id="notice-recept-board-navi" aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item notice-recept-page-clicked"><a
						class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<!--페이징 끝-->
		</div>
	</div>
	<!-- End Content -->
	<!-- Start Footer -->
	<footer class="main_footer" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> 서울특별시 강남구
							테헤란로14길6</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
						</li>
					</ul>
				</div>



			</div>


		</div>

		<div class="w-100 py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left">&copy; 2023 떡잎방범대 박수진 박지현 이아인 임재린 황슬기</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

	<script>//필터검색창 나와라
        function product_key_modal_open() {
            var modal = document.querySelector(".pl_key_box");
            modal.style.display= "block";
        }
        function product_key_modal_close(){
            var modal = document.querySelector(".pl_key_box");
            modal.style.display = "none";
        }
        function product_key_modal_search(){
            var modal = document.querySelector(".pl_key_box");
            modal.style.display = "none";
        }
    </script>
	<script>
        function chekced(obj){ //체크하기
            obj.parentNode.querySelector('input').checked = true;
        }
        function unChekced(obj){ //체크해제
            obj.parentNode.querySelector('input').checked = false;
        }
        
        
        const filter01 = document.querySelectorAll('.pl_filter01'); // 체크버튼
        const filterAll  = document.querySelector('.all'); // 'all' 체크버튼
        
        filter01.forEach(function(el){
            el.addEventListener('click', function(e){
                if(e.target == filterAll){
                    if(e.target.parentNode.querySelector('input').checked !== true){
                        filter01.forEach(function(obj){
                            chekced(obj); //모두체크
                        })
                    }else{
                        filter01.forEach(function(obj){
                            unChekced(obj); //모두해제
                        })
                    }
                }else{
                    if(e.target.parentNode.querySelector('input').checked !== true){
                        chekced(e.target);
                        const checked = document.querySelectorAll('.pl_filter_wrap input:checked');
                        if(filter01.length -1 == checked.length){ //모두 체크되어있다면 all도 체크
                        chekced(filterAll);
                        }
        
                    }else{
                        unChekced(e.target); 
                        unChekced(filterAll); //한개라도 체크 안되면 all버튼 체크 해제
                    }
                }
        
        
        
            })
        })

    </script>
</body>

</html>