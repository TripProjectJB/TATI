<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
  <c:if test="${empty userinfo}">
	<script>
	alert("로그인이 필요한 페이지입니다.");
	location.href = "${root}/user?action=mvlogin";
	</script>
  </c:if>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link href="${root}/assets/css/app.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${root}/css/main.css" />
    <link rel="stylesheet" href="${root}/css/SearchTravel.css" />
<title>SSAFY</title>
</head>
<body>
	<header class="site-nav" style="background-color: #6998ab">
		<div class="container">
			<nav class="navbar navbar-expand-sm">
				<div class="container-fluid">
					<!-- Links -->
					<a href="${root}/user/home.jsp" class="navbar-brand headertitle">
						EnjoyTrip
					</a>

					<ul class="navbar-nav me-2" id="logoutul" style="display: flex">
						<li class="nav-item headerli"><a
							href="${root}/article?action=list&pgno=1&key=&word=">게시판</a></li>
						<li class="nav-item headerli"><a id="headerSearch"
							href="${root}/SearchTravel.jsp">관광지 정보 조회</a></li>
						<li class="nav-item headerli"><a
							href="${root}/user?action=logout">로그아웃</a></li>
						<li class="nav-item headerli"><a
							href="${root}/user/modify.jsp">마이페이지</a></li>
					</ul>
				</div>
			</nav>
		</div>	
	</header>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>