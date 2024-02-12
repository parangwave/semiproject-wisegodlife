<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<header id="navBar-container">
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
            id="navBar__list__dropdown-board"
            data-mdb-toggle="dropdown"
            aria-expanded="false"
          >
            게시판
          </button>
          <ul
            class="dropdown-menu"
            aria-labelledby="navBar__list__dropdown-board"
          >
            <li><a class="dropdown-item" href="freebbslist.do">자유 게시판</a></li>
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
            aria-labelledby="navBar__list__dropdown-board"
          >
            <li><a class="dropdown-item" href="mygradecal.do">학점 계산기</a></li>
            <li><a class="dropdown-item" href="cotimetable.do">수강 시간표</a></li>
            <li><a class="dropdown-item" href="mycalendar.do">학과 일정 달력</a></li>
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
            aria-labelledby="navBar__list__dropdown-board"
          >
            <li><a class="dropdown-item" href="mymain.do">내 프로필</a></li>
            <li><a class="dropdown-item" href="mywrite.do">내가 쓴 댓글 및 게시글</a></li>
            <li><a class="dropdown-item" href="mylike.do">내가 좋아한 게시물</a></li>
            <li><a class="dropdown-item" href="myblacklist.do">차단리스트</a></li>
            <li><a class="dropdown-item" href="mychange.do">개인정보 변경</a></li>
            <li><a class="dropdown-item" href="#">메시지</a></li>
            <li><a class="dropdown-item" href="#">친구정보</a></li>
            <li><a class="dropdown-item" href="#">학교 인증</a></li>
            <li><a class="dropdown-item" href="myclose.do">회원탈퇴</a></li>
          </ul>
        </div>
      </div>

      <!-- 라이트/다크 모드 toggle -->
      <div class="form-check form-switch mx-8">
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
</header>

<script>
  function changeMode() {
    const Body = document.body;
    Body.classList.toggle("dark-mode");

    const logoImg = document.getElementById("navBar__logo-img");
    logoImg.classList.toggle("navBar__logo-img-dark");
  }
</script>