<%@page import="ssg.com.a.dto.FriendDto"%>
<%@page import="ssg.com.a.dto.UtBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	UtBbsDto dto = (UtBbsDto)request.getAttribute("dto");
    %>
    <%
	FriendDto login = (FriendDto)session.getAttribute("login");
    if(login == null || login.getId().isEmpty()){
        session.setAttribute("prevView", "utbbsdetail");
        session.setAttribute("seq", dto.getSeq());
%>
<script>
    alert("로그인해 주십시오");
    location.href = "./login.do";
</script>
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Jquery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- 섬머노트 추가 -->
    <script src="./js/summernote-lite.js"></script>
	<script src="./js/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="./style/css/summernote-lite.css">
</head>

<style>
.mytable {
	margin: auto;
	width: 800px;
	border: 1px solid lightgray;
}

th {
	border: 1px solid lightgray;
	text-align: center;
	vertical-align: middle;
	--bs-table-color: white;
	--bs-table-bg: royalblue;
}

button {
	align: right;
	/* margin: 0 80px; */
}

/* 이미지 드래그 무한 증식 막음. */
table, img {
	/* 선택불가 */
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
	/* 드래그 불가 */
	-webkit-user-drag: none;
	-khtml-user-drag: none;
	-moz-user-drag: none;
	-o-user-drag: none;
	user-drag: none;
}

#summernote {
	border: 1px solid #eee;
	color: #000;
}
</style>

<body>

	<h2>상세정보</h2>
	<br />

	<div align="center">
		<table class="table mytable">
			<col width="150">
			<col width="500">

			<tr>
				<th>아이디</th>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getReadcount()%></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
	        <tr>
            <!-- <th>내용</th> -->
            <td colspan="2"><textarea id="summernote" name="content" class="form-control" cols="50" rows="10" contenteditable="false"
                          readonly><%=dto.getContent()%></textarea>
            </td>
        </tr>
		</table>
		<br/>
		<button type="button" id="tradesuccess" class="btn btn-primary">중고거래완료</button>
		<button type="button" class="btn btn-primary" onclick="returnlist()">글목록으로</button>
	</div>
	
<script>
$(document).ready(function(){
	$('#summernote').summernote('disable');
	$('.note-editable').css('background-color','white');
	$('.note-toolbar').remove();
});
</script>

<script type="text/javascript">
	$('#tradesuccess').click(function(){
	 	$.ajax({
			url : "tradesuccess.do",
			type : "get",
			data : {
				"seq" : <%=dto.getSeq()%>
			},
			success:function(){
				//alert("ok");
				location.href = "utbbslist.do";
			},
			error:function(){
				//alert("error");
			}
		}); 
	});
</script>

<script type="text/javascript">
function returnlist() {
	location.href = "utbbslist.do";
}
</script>
</body>
</html>