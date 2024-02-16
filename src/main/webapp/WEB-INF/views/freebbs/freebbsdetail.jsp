<%@ page import="ssg.com.a.dto.FriendDto" %>
<%@ page import="ssg.com.a.dto.FreeBbsDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FreeBbsDto dto = (FreeBbsDto) request.getAttribute("dto");
	int likecount = (Integer) request.getAttribute("likecount");

%>
<%
	FriendDto login = (FriendDto)session.getAttribute("login");
    if(login == null || login.getId().isEmpty()){
        session.setAttribute("prevView", "freebbsdetail");
        session.setAttribute("seq", dto.getSeq());
%>
<script>
    alert("로그인해 주십시오");
    location.href = "./login.do";
</script>
<%
    }
%>

<html>
<head>
    <title>글 자세히보기</title>
    <link rel="icon" href="images/favicon.svg">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Jquery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- 섬머노트 추가 -->
    <script src="./js/summernote-lite.js"></script>
	<script src="./js/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="./style/css/summernote-lite.css">

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
img {
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
</head>
<body>

<br/>

<div align="center">
    <table class="table mytable">
        <col width="200"/>
        <col width="400"/>
        <tr>
            <th>작성자</th>
            <td>
                <%=dto.getId()%>
            </td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%=dto.getWdate()%>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%=dto.getReadcount()%>
            </td>
        </tr>
        <tr>
            <!-- <th>제목</th> -->
            <td colspan="2"><%=dto.getTitle()%>
            </td>
        </tr>
        <tr>
            <!-- <th>내용</th> -->
            <td colspan="2"><textarea id="summernote" name="content" class="form-control" cols="50" rows="10" contenteditable="false"
                          readonly><%=dto.getContent()%></textarea>
            </td>
        </tr>
        
        
    </table>

   	<br/>
    <%
        if (login != null && login.getId().equals(dto.getId())) {
    %>
    <button type="button" onclick="updateBbs(<%=dto.getSeq()%>)" class="btn btn-primary">글수정</button>
    <button type="button" onclick="deleteBbs(<%=dto.getSeq()%>)" class="btn btn-primary">글삭제</button>
    <%
        }
    %>
    <%-- 답글 기능 안넣어서 일단 주석처리 --%>
    <%-- <button type="button" onclick="answerBbs(<%=dto.getSeq()%>)" class="btn btn-primary">답글작성</button> --%>
<%--     <button type="button" onclick="commentBbs(<%=dto.getSeq()%>)" class="btn btn-primary">댓글작성</button> --%>
	<button type="button" class="btn btn-primary" onclick="returnlist()">글목록으로</button>
	<%
	if ( likecount == 0 ){
		%>
			<button type="button" id="like" class="btn btn-primary" onclick="likeBbs()">좋아요</button>
		<%
	} else {
		%>
			<button type="button" id="like" class="btn btn-primary" onclick="likeBbs()">좋아요 취소</button>
		<%
	}
	%>
</div>

	<%-- 댓글 --%>
	<div id="app" class="container">

		<form action="commentwriteaf.do" method="post">
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>"> 
			<input type="hidden" name="id" value="<%=login.getId()%>">

			<table>
				<col width="1500px" />
				<col width="150px" />

				<tr>
					<td>comment</td>
					<td style="padding-left: 30px;">올리기</td>
				</tr>
				<tr>
					<td><textarea rows="3" class="form-control" name="content"></textarea>
					</td>
					<td style="padding-left: 30px">
						<button type="submit" class='btn btn-primary btn-block p-4'>작성완료</button>
					</td>
				</tr>
			</table>
		</form>
		
		<br/><br/>
		
		<table class="table table-sm">
		<col width="500"/><col width="500"/>
		
		<tbody id="tbody"></tbody>
		</table>
		
	</div>

	<br/>

<br/>

<script>
$(document).ready(function(){
	
	$('#summernote').summernote('disable');
	$('.note-editable').css('background-color','white');
	$('.note-toolbar').remove();
	
	$.ajax({
		url : "commentlist.do",
		type : "get",
		data : { seq : <%=dto.getSeq()%> },
		success : function( data ){
			//alert("ok");
			$.each(data, function (i, item){
				let str = "<tr class='table-info'>"
					str +=	 "<td>작성자:" + item.id + "</td>";
					str +=	 "<td>작성일:" + item.wdate + "</td>";
					str += "</tr>";
					str += "<tr>";
					str += 	"<td colspan='2'>" + item.content + "</td>";
					str += "</tr>";
					str += "<tr>";
					str += 	"<td colspan='2'>&nbsp;</td>";
					str += "</tr>";
					
					$('#tbody').append(str);
			});
		},
		error : function(){
			//alert("TT");
		}
	});
});
</script>

<script type="text/javascript">

	let id = "<%=login.getId()%>";
	let fbseq = <%=dto.getSeq()%>;

	function likeBbs(){
		$.ajax({
			url : "likes.do",
			type : "get",
			data : { 
				id : id,
				fbseq : fbseq
			},
			success : function( str ){
				if (str == "LIKE_DEL") {
					alert("좋아요 취소했습니다.");
					$("#like").html('좋아요');
				} else {
					alert("좋아요 했습니다.");
					$("#like").html('좋아요 취소');
				}
			},
			error : function(){
				//alert("TT");
			}
		});
	}
</script>

<script>
    function updateBbs(seq){
        location.href = "freebbsupdate.do?seq=" + seq;
    }

    function deleteBbs(seq){
        let Yn = confirm("정말 글을 삭제하시겠습니까?");
        if(!Yn){
            alert("삭제를 취소합니다");
            return;
        }
        location.href = "freebbsdelete.do?seq=" + seq;
    }

    //답글 아직
    function answerBbs(seq) {
        location.href = "answer.do?seq=" + seq;
    }
    
    function commentBbs(seq){
    	alert("commentBbs");
    }
    
	function returnlist() {
		location.href = "freebbslist.do";
	}
</script>
</body>
</html>
