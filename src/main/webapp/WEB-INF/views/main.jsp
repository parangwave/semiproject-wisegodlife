<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>메인페이지</title>
    <!-- bootstrap -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <!-- css -->
    <link rel="stylesheet" href="./style/css/style.css" />
  <body class="light-mode" data-bs-theme="light">
    <!-- nav-bar start -->
    <div id="container__navBar">
      <!-- nav-bar -->
      <nav id="navBar" class="navbar">
        <div class="container-fluid">
          <!-- logo -->
          <a class="navbar-brand" href="#">
            <img
              src="./images/full-logo.svg"
              id="navBar__logo-img"
              alt="슬갓생 logo"
              width="100"
              height="100"
            />
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
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-post"
              >
                <li><a class="dropdown-item" href="#">자유 게시판</a></li>
                <li>
                  <a class="dropdown-item" href="#">메이트 구하기 게시판</a>
                </li>
                <li><a class="dropdown-item" href="#">동아리 게시판</a></li>
                <li><a class="dropdown-item" href="#">중고거래 게시판</a></li>
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
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-post"
              >
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
              <ul
                class="dropdown-menu"
                aria-labelledby="navBar__list__dropdown-post"
              >
                <li><a class="dropdown-item" href="#">내 프로필</a></li>

                <li><a class="dropdown-item" href="#">내가 쓴 댓글</a></li>
                <li><a class="dropdown-item" href="#">내가 쓴 게시물</a></li>
                <li>
                  <a class="dropdown-item" href="#">내가 좋아한 게시물</a>
                </li>
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

          <!-- 라이트/다크 모드 toggle -->
          <div class="form-check form-switch mx-4">
            <input
              type="checkbox"
              id="navbar__modeSwitchToggle"
              class="form-check-input p-2"
              role="switch"
              onclick="changeMode()"
              />
          </div>
          
        </div>
      </nav>
    </div>
    <!-- nav-bar end -->

    <!-- left-tab start -->
    <section id="leftTab" class="w-25">
      <!-- 프로필 -->
      <div id="leftTab__profile">
		    <div id="leftTab__profile__avatarContainer">
			    <!-- 프로필 사진 -->
			    <img src="./images/avatar.jpg" alt="프로필 이미지">

			    <!-- 자기소개란 -->
          <div id="leftTab__profile__avatarContainer__introduction">
            <div id="leftTab__profile__avatarContainer__introduction__idSection">
              <h3>닉네임</h3>
              <h5>@아이디</h5>
            </div>
            <p>hello world</p>
          </div>
		    </div>
        <div id="leftTab__profile__BtnContainer">
          <a class="btn btn-light" href="#" role="button">프로필 수정</a>
          <a class="btn btn-light" href="#" role="button">프로필 공유</a>
		    </div>
      </div>

      <!-- 날씨 -->
      <div id="leftTab__weather">
        <div id="leftTab__weather__clockSection">
          <h5>대한민국</h5>
          <h1>08:00</h1>
			    <h4>2024년 2월 6일</h4>
		    </div>
        <div id="leftTab__weather__celcius">
			    <i class="bi bi-cloud-hail-fill"></i>
			    <h2>18℃</h2>
		    </div>
      </div>

      <!-- 검색창 -->
      <div id="leftTab__search" class="input-group rounded">
        <input
          type="search"
		  id="leftTab__search-placeholder"
          class="form-control rounded"
          placeholder="찾고 싶은 글을 검색하세요"
          aria-label="Search"
          aria-describedby="search-addon"
        />
        <span class="input-group-text border-0" id="search-addon">
          <i class="bi bi-search"></i>
        </span>
      </div>

      <!-- 학교생활 -->
      <div id="leftTab__school">
        <h1>오늘의 학교생활</h1>

        <!-- 수강시간표 -->
        <ul id="leftTab__school__lectures">
          <!-- 수강 시간표에서 data import -->
        </ul>

        <ul id="leftTab__school__todoList">
          
        </ul>
      </div>

    </section>
    <!-- left-tab end -->

    <script>
      function changeMode() {
        const Body = document.body;
        Body.classList.toggle("dark-mode");

        const logoImg = document.getElementById("navBar__logo-img");
        logoImg.classList.toggle("navBar__logo-img-dark");
      }
    </script>
  </body>
</html>
