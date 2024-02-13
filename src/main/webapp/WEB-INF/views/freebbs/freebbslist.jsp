<%@page import="ssg.com.a.dto.FreeBbsDto"%>
<%@page import="ssg.com.a.dto.FreeBbsParam"%>
<%@page import="ssg.com.a.util.BbsUtil"%>
<%@page import="ssg.com.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    	List<FreeBbsDto> list = (List<FreeBbsDto>)request.getAttribute("list");
    	int pageBbs = (Integer)request.getAttribute("pageBbs");
    	FreeBbsParam param = (FreeBbsParam) request.getAttribute("param");
    	
    	int pageNumber = param.getPageNumber();
    	
    	String choice = param.getChoice();
    	String search = param.getSearch();
    	
    	if(search == null || search.isEmpty()){
    		search = "";
    		choice = "start";
    	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판</title>
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
    <!-- contents -->

<div class="center">

		<table class="table table-hover">
			<col width="70" />
			<col width="600" />
			<col width="100" />
			<col width="150" />
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (list == null || list.size() == 0) {
				%>
				<tr>
					<td colspan="4">작성된 글이 없습니다</td>
				</tr>
				<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						FreeBbsDto freebbs = list.get(i);
				%>
				<tr>
					<td><%=i + 1%></td>
					<td style="text-align: left;">
					<%=BbsUtil.arrow(freebbs.getDepth())%>
					<%
						if(freebbs.getDel() == 0){
					%>
						<a href="freebbsdetail.do?seq=<%=freebbs.getSeq()%>">
								<%=BbsUtil.dot3(freebbs.getTitle())%>
					<%
						} else {
					%>
						<font color="red"> ***** 이 글은 작성자의 의해서 삭제된 글 입니다. *****</font>
					<%
						}
					%>
						</a>
					</td>
					<td><%=freebbs.getReadcount()%></td>
					<td><%=freebbs.getId()%></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>

		<br />

		<div class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination"
					style="justify-content: center"></ul>
			</nav>
		</div>

		<br />
		
		<div class="form-row align-items-center d-flex justify-content-center align-items-center container">
			<select id="choice" class="form-control" style="width: auto;">
				<option value="start">검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>

			<div class="col-sm-3 my-1" style="width: auto;">
				<input type="text" class="form-control" id="search"	value="<%=search%>">
			</div>

			<button type="button" class="btn btn-primary" onclick="searchBtn()">검색</button>
		</div>
		
		<br />
		 
		<a href="freebbswrite.do" style="">글쓰기</a>
	</div>

	<script type="text/javascript">
	
	let search = "<%=search%>";
	
	if(search != null){
		let choice = document.getElementById("choice");
		choice.value = "<%=choice%>";
			choice.setAttribute("selected", "selected");
		}

		function searchBtn() {
			let choice = document.getElementById("choice").value;
			let search = document.getElementById("search").value;

			location.href = "freebbslist.do?choice=" + choice + "&search=" + search;
		}

		$("#pagination").twbsPagination({
			startPage :	<%=pageNumber + 1%>,
			totalPages : <%=pageBbs%>,
			visiblePages : 10,
			first : '<span sris-hidden="true">«</span>',
			prev : "이전",
			next : "다음",
			last : '<span sris-hidden="true">»</span>',
			initiateStartPageClick : false, //처음 실행시에 자동실행이 되지 않도록 하는 옵션
			onPageClick : function(event, page) {
				/* alert(page); */
				let choice = document.getElementById("choice").value;
				let search = document.getElementById("search").value;
				
				location.href = "freebbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
				/* location.href = "bbslist.do?pageNumber=" + (page - 1); */
			}
		});
	</script>
    
    <!-- contents end -->
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