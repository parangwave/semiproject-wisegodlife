<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  
  <!-- cookie -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  
  <style>
  	.center {
  		margin: 70px auto;
  		width: 400px;
  		padding: 10px;

  	}
  	
  	.loginNregi {
  	  	display: flex;
  		justify-content: space-between;
  	}
  </style>
</head>
<body>

<div class="center">
	<img style="width: 400px;" alt="슬갓생 로고" src="./images/lifegodlogo.png">
	<!-- <form action="loginAf.do" method="post"> -->
  <form id="login">
		<br />
		<table>
			<tr>
				<td>
					<input type="text" class="form-control" id="id" name="id" size="20" style="padding: 25px; margin-bottom: 10px" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" class="form-control" id="pw"	name="pw" size="20" style="padding: 25px; margin-bottom: 10px" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center" class="loginNregi">
						<span><input type="submit" id="login-btn" class="btn btn-primary" style="width: 100%; padding: 20px; border-radius: 15px; background-color: #F877B1; margin-bottom: 10px;" value="슬갓생 로그인"></span>&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="checkbox" id="chk_save_id">&nbsp;&nbsp;id 저장
						<span><a href="regi.do">회원가입</a></span>
						<span> / </span>
						<span><a href="assiregi.do">조교 회원가입</a></span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<hr/>
	<button type="button" style="width: 100%; padding: 20px; border-radius: 15px; background-color: #F6F5FF; margin-bottom: 10px;" onclick="location.href='${url}'">
		<b>네이버 로그인</b>
		<!-- <img alt="이미지 없음" src="./images/naver_logo.png" style="width: 360px; height: 80px" onclick="location.href='${url}'">  -->
	</button>
</div>


<script type="text/javascript">

$("#login-btn").click(function () {
  let id = $("#id").val();
  if (id == null || id.trim() == "") {
    alert('아이디란이 비어있습니다 다시 작성해주세요');
    return;
  } else {
    $("#login").attr("method", "post");
    $("#login").attr("action", "loginAf.do").submit();
  }
});
/*
	cookie : client저장, id저장, pw저장, String 자료형 저장
	session : server저장, login 정보
*/

let user_id = $.cookie("user_id");						// 쿠키에서 id를 산출
if(user_id != null){									// 쿠키에 저장한 id가 있다
	$("#id").val( user_id );
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function () {
	
	if( $("#chk_save_id").is(":checked") == true ){		// 체크가 되었을 때
		
		if( $("#id").val().trim() == "" ){				// 빈문자였을 때
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);	// 체크박스를 off
		}
		else{											// cookie에 저장
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'/' } );
		}		
	}
	else{
		$.removeCookie("user_id", { path:'/' });
	}	
	
});
</script>

</body>
</html>