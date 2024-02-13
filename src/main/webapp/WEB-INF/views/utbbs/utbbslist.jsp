<%@page import="ssg.com.a.dto.FriendDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.a.dto.UtBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<UtBbsDto> list = (List<UtBbsDto>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래게시판</title>
		<!-- bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
		<!-- css -->
		<link rel="stylesheet" href="./style/css/style.css">
		<!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<!-- pagination -->
		<script type="text/javascript" src="./js/jquery.twbsPagination.min.js"></script>
</head>
<style>
	.center {
		margin: 60px auto;
		width: 1000px;
		text-align: center;
	}

	th, td {
		border : 1px solid lightgray;
		text-align: center;
		vertical-align: middle;
	}

</style>
<body class="light-mode" data-bs-theme="light">
	<!-- nav-bar -->
	<div id="container__navBar">
		<!-- nav-bar -->
		<nav id="navBar" class="navbar">
			<div class="container-fluid">
				<!-- logo -->
				<a class="navbar-brand" href="#"> <img
					src="./images/full-logo.svg" id="navBar__logo-img" alt="슬갓생 logo"
					width="100" height="100">
				</a>

				<!-- link 목록 -->
				<div id="navBar__list">
					<!-- 게시판 dropdown -->
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="navBar__list__dropdown-post" data-mdb-toggle="dropdown"
							aria-expanded="false">게시판</button>
						<ul class="dropdown-menu"
							aria-labelledby="navBar__list__dropdown-post">
							<li><a class="dropdown-item" href="freebbslist.do">자유
									게시판</a></li>
							<li><a class="dropdown-item" href="#">메이트 구하기 게시판</a></li>
							<li><a class="dropdown-item" href="#">동아리 게시판</a></li>
							<li><a class="dropdown-item" href="utbbslist.do">중고거래
									게시판</a></li>
						</ul>
					</div>
					<!--  학교생활 dropdown -->
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="navBar__list__dropdown-school" data-mdb-toggle="dropdown"
							aria-expanded="false">학교생활</button>
						<ul class="dropdown-menu"
							aria-labelledby="navBar__list__dropdown-post">
							<li><a class="dropdown-item" href="#">학점 계산기</a></li>
							<li><a class="dropdown-item" href="#">수강 시간표</a></li>
							<li><a class="dropdown-item" href="#">학과 일정 달력</a></li>
						</ul>
					</div>
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="navBar__list__dropdown-mypage" data-mdb-toggle="dropdown"
							aria-expanded="false">마이페이지</button>
						<ul class="dropdown-menu"
							aria-labelledby="navBar__list__dropdown-post">
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
					<input type="checkbox" id="navbar__modeSwitchToggle"
						class="form-check-input p-2" role="switch" onclick="changeMode()" />
				</div>
			</div>
		</nav>
	</div>
	<!-- nav-bar end -->
	<!-- contents -->
	<br />
	<div class="center">
		<table class="table table-hover">
			<colgroup>
				<col width="70">
				<col width="100">
				<col width="120">
				<col width="500">
				<col width="100">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>썸네일</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
			if (list == null || list.size() == 0) {
				%>
				<tr>
					<td colspan="6">작성된 글이 없습니다</td>
				</tr>
				<%		
			} else {
				for(int i = 0; i < list.size(); i++){
						UtBbsDto dto = list.get(i);
			%>
				<tr>
					<td><%=(i + 1) %></td>
					<td><%=dto.getId() %></td>
					<% if(dto.getFilename().equals("") || dto.getFilename() == null){ %>
					<td><img src="./upload/none.PNG"></td>
					<%} else{ %>
					<td><img src="./upload/s_<%=dto.getNewfilename()%>"></td>
					<% } %>
					<td style="text-align: left"><a
						href="utbbsdetail.do?seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a>
					</td>
					<td><%=dto.getReadcount() %></td>
					<td><%=dto.getRegdate() %></td>
				</tr>
				<%
				}
			}
%>
			</tbody>
		</table>
		<br /> <a href="utbbswrite.do">글추가</a>
	</div>
</body>
</html>