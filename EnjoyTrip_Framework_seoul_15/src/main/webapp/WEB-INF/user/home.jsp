<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="/common/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${root}/css/main.css" />
<title>EnjoyTrip</title>
</head>

<body>

<%-- 	<header class="site-nav" style="background-color: #6998ab">
		<div class="container">
			<nav class="navbar navbar-expand-sm">
				<div class="container-fluid">
					<!-- Links -->
					<a href="${root}/user/home.jsp" class="navbar-brand headertitle">
						<img src="${root}/img/ssafy_logo.png" alt="" /> EnjoyTrip
					</a>

					<ul class="navbar-nav me-2" id="logoutul" style="display: flex">
						<li class="nav-item headerli"><a
							href="${root}/article?action=list&pgno=1&key=&word=">게시판</a></li>
						<li class="nav-item headerli"><a id="headerSearch"
							href="${root}/SearchTravel.jsp">관광지 정보 조회</a>
						</li>
						<li class="nav-item headerli"><a
							href="${root}/user?action=logout">로그아웃</a></li>
						<li class="nav-item headerli"><a
							href="${root}/user/modify.jsp">마이페이지</a></li>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</header> --%>
	
	<main> <!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="6"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="7"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active maincard">
				<img src="${root}/img/top_bg_1.png" alt="Los Angeles"
					class="d-block" style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>가문이오름</h3>
					<p>환상적인 용오름. 올라가용!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_2.png" alt="Chicago" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>가마소계곡</h3>
					<p>가마솥밥이 생각나는 멋진 계곡!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_3.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>각원사</h3>
					<p>각진 절을 보고싶으면 이곳으로!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_4.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>고복자연공원</h3>
					<p>일반 자연공원과는 차원이 다른 아름다움!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_5.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>가람초연재</h3>
					<p>연초가 생각나는 가람초연재!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_6.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>당사현대차오션캠프</h3>
					<p>현대의 광고를 원합니다!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_7.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>대구그랜드호텔</h3>
					<p>무지막지 큰 호텔!</p>
				</div>
			</div>
			<div class="carousel-item maincard">
				<img src="${root}/img/top_bg_2.png" alt="New York" class="d-block"
					style="width: 100%; height: 600px" />
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 justify-content-center">
				<div class="col-lg-6 text-center">
					<h2 class="section-title text-center mb-3 mt-5">국내의 수 많은 여행지와
						축제</h2>
					<h2 class="section-title text-center mb-3">EnjoyTrip과 함께 하세요</h2>
					<p>많은 사람들이 국내에 많은 여행들 다니고 있습니다. EnjoyTrip은 여러분들에게 다양한 문화재들을 탐방하고
						추억을 쌓을 수 있도록 정보를 제공 할 것입니다. 저희와 함께 국내 다양한 곳을 다니면서 여러 곳을 함께 탐방해봐요</p>
				</div>
			</div>
			<div class="row align-items-stretch mt-5"
				style="display: flex; justify-content: center">
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_1.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">가문이오름</h4>
						<p class="card-text">제주도</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_2.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">가마소계곡</h4>
						<p class="card-text">전라북도</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_3.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">각원사</h4>
						<p class="card-text">충청남도</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_4.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">고복자연공원</h4>
						<p class="card-text">세종특별자치시</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_5.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">대구그랜드호텔</h4>
						<p class="card-text">대구</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_6.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">강화평화빌리지</h4>
						<p class="card-text">인천</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
			</div>

			<div class="row mb-5 justify-content-center">
				<div class="col-lg-6 text-center">
					<h2 class="section-title text-center mb-3 mt-5">레포츠와 숙박, 쇼핑까지
					</h2>
					<h2 class="section-title text-center mb-3">이제는 여행에서 더 넓어졌습니다</h2>
					<p>관광지만 알아야했던 지난날은 잊으세요. 여러가지 레저스포츠와 숙박시설, 쇼핑까지. 여행에 전반적인 모든것들을
						제공해줌으로써 JungJaeo하나로 모든것을 할 수 있습니다.</p>
				</div>
			</div>
			<div class="row align-items-stretch mt-5"
				style="display: flex; justify-content: center">
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_7.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">대구그랜드호텔</h4>
						<p class="card-text">대구</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_8.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">게스트145</h4>
						<p class="card-text">광주</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_2.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">가람초연재</h4>
						<p class="card-text">경상북도</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_3.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">가우도카라반펜션</h4>
						<p class="card-text">전라남도</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_4.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">강화평화빌리지</h4>
						<p class="card-text">인천</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
				<div class="card m-3 p-3 maincard" style="width: 300px">
					<img class="card-img-top" src="${root}/img/top_bg_5.png"
						alt="Card image" />
					<div class="card-body">
						<h4 class="card-title">당사현대차오션캠프</h4>
						<p class="card-text">울산</p>
						<a href="#" class="btn btntheme">여행지 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>

	<div class="untree_co-section count-numbers py-5">
		<div class="container">
			<div class="row total_wrap">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="9313">0</span>
						</div>
						<span class="caption">총 여행객 수</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="8492">0</span>
						</div>
						<span class="caption">총 여행사 수</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="100">0</span>
						</div>
						<span class="caption">총 고용자 수</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="120">0</span>
						</div>
						<span class="caption">총 도시 수</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer></footer>

	<!-- 마이페이지 modal start -->
	<div class="modal fade" id="modifyModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<p class="modal-title font-weight-bold" style="font-size: 22px">
						회원정보수정</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="">
						<div class="row mb-3 mt-3">
							<div class="col-md-12 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-name" class="form-label">이름:</label> <input
									type="text" id="name" class="form-control" placeholder="이름" />
							</div>
							<div class="col-md-12 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-id" class="form-label">아이디:</label> <input
									type="text" id="id" class="form-control" placeholder="아이디" />
							</div>
							<div class="col-md-12 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-pass" class="form-label">비밀번호:</label> <input
									type="password" id="pw" class="form-control" placeholder="비밀번호" />
							</div>
							<div class="col-md-12 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage" class="form-label">비밀번호확인:</label> <input
									type="password" id="pw2" class="form-control"
									placeholder="비밀번호확인" />
							</div>
							<div class="col-md-6 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-email" class="form-label">이메일 :</label> <input
									type="text" id="email" class="form-control"
									placeholder="이메일아이디" />
							</div>
							<div class="col-md-6 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-address" class="form-label">주소</label> <input
									type="search" id="address" class="form-control"
									placeholder="이메일주소" />
							</div>
							<div class="col-md-6 mb-3 font-weight-bold">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="mypage-sido" class="form-label">지역
									시도 :</label> <select class="form-control" id="sido">
									<option value="1" selected>서울</option>
									<option value="2">인천</option>
									<option value="3">대전</option>
									<option value="4">대구</option>
									<option value="5">광주</option>
									<option value="6">부산</option>
									<option value="7">울산</option>
									<option value="8">세종특별자치시</option>
									<option value="9">경기도</option>
									<option value="10">강원특별자치</option>
									<option value="11">충청북도</option>
									<option value="12">충청남도</option>
									<option value="13">경상북도</option>
									<option value="14">경상남도</option>
									<option value="15">전라북도</option>
									<option value="16">전라남도</option>
									<option value="17">제주도</option>
								</select>
							</div>
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btn-poll-create"
						class="btn btn-primary btn-sm" onclick="modify()">
						회원정보수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 마이페이지 modal end -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8b4556bbe805677fba6b34c265f42f8&libraries=services,clusterer,drawing"></script>
	
<!--  	<script src=".${root}/tripjs/login.js"></script>
	<script src=".${root}/tripjs/poll.js"></script>
	<script src=".${root}/tripjs/key.js"></script>
	<script src=".${root}/tripjs/map.js"></script>
	<script src=".${root}/tripjs/checkLogin.js"></script>
-->

	<!-- <script>
            window.onload = function () {
                if (localStorage.getItem("login") == 1) {
                    document.getElementById("loginul").style.display = "none";
                    document.getElementById("logoutul").style.display = "flex";
                } else {
                    document.getElementById("loginul").style.display = "flex";
                    document.getElementById("logoutul").style.display = "none";
                }
            };
        </script> -->
</body>
</html>
