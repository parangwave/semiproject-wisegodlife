

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>메인페이지</title>
			<!-- bootstrap -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
			<!-- css -->
			<link rel="stylesheet" href="./style/css/style.css">
		</head>
	
	<body class="light-mode" data-bs-theme="light">
		<!-- nav-bar -->
		<div id="container__navBar">
				<!-- nav-bar -->
				<nav id="navBar" class="navbar fixed-top">
					<div class="container-fluid">
						<!-- logo -->
						<a class="navbar-brand" href="#">
							<img src="./images/full-logo.svg" id="navBar__logo-img" alt="슬갓생 logo" width="100" height="100">
						</a>
	
						<!-- link 목록 -->
						<div id="navBar__list">
							<!-- 게시판 dropdown -->
							<div class="dropdown">
								<button
								  class="btn dropdown-toggle"
								  type="button"
								  id="navBar__list__dropdown-post"
								  data-mdb-toggle="dropdown"
								  aria-expanded="false"
								>
								게시판
								</button>
								<ul class="dropdown-menu" aria-labelledby="navBar__list__dropdown-post">
									<li><a class="dropdown-item" href="freebbslist.do">자유 게시판</a></li>
									<li><a class="dropdown-item" href="#">메이트 구하기 게시판</a></li>
									<li><a class="dropdown-item" href="#">동아리 게시판</a></li>
									<li><a class="dropdown-item" href="utbbslist.do">중고거래 게시판</a></li>
								</ul>
							</div>
							<!--  학교생활 dropdown -->
							<div class="dropdown">
								<button
								  class="btn dropdown-toggle"
								  type="button"
								  id="navBar__list__dropdown-school"
								  data-mdb-toggle="dropdown"
								  aria-expanded="false"
								> 
								  학교생활
								</button>
								<ul class="dropdown-menu" aria-labelledby="navBar__list__dropdown-post">
									<li><a class="dropdown-item" href="#">학점 계산기</a></li>
									<li><a class="dropdown-item" href="#">수강 시간표</a></li>
									<li><a class="dropdown-item" href="#">학과 일정 달력</a></li>
								</ul>
							</div>
							<div class="dropdown">
								<button
								  class="btn dropdown-toggle"
								  type="button"
								  id="navBar__list__dropdown-mypage"
								  data-mdb-toggle="dropdown"
								  aria-expanded="false"
								>
								  마이페이지 
								</button>
								<ul class="dropdown-menu" aria-labelledby="navBar__list__dropdown-post">
									<li><a class="dropdown-item" href="#">내 프로필</a></li>
									
									<li><a class="dropdown-item" href="#">내가 쓴 댓글</a></li>
									<li><a class="dropdown-item" href="#">내가 쓴 게시물</a></li>
									<li><a class="dropdown-item" href="#">내가 좋아한 게시물</a></li>
									<li><a class="dropdown-item" href="#">차단리스트</a></li>
								</ul>
							</div>
							
						</div>
						
						<!-- 메뉴 토글 Button; reposponsive 대응 -->
						<!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon">
								<img src="./images/favicon.svg" alt="슬갓생 축약 logo" width="30" height="30">
							</span>
						</button> -->

            <div class="form-check form-switch mx-4">
							<input type="checkbox" 
								id="navbar__modeSwitchToggle" 
								class="form-check-input p-2" 
								role="switch"
								onclick="changeMode()"
							/>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<!-- nav-bar end -->
    
    <script>
			function changeMode () {
				const Body = document.body;
				Body.classList.toggle("dark-mode");

				const logoImg = document.getElementById("navBar__logo-img");
				logoImg.classList.toggle("navBar__logo-img-dark");
				console.log(logoImg.classList);
				console.log(logoImg.src);
			}
		</script>
	</body>
</html>