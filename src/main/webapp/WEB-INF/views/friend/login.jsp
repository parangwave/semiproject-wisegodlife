<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬갓생</title>
<link rel="icon" href="images/favicon.svg">
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
					<input type="text" class="form-control" id="id" name="id" style="padding: 25px; margin-bottom: 10px; width: 400px" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" class="form-control" id="pw"	name="pw" style="padding: 25px; margin-bottom: 10px" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td>
					<span><input type="submit" id="login-btn" class="btn btn-primary" style="width: 100%; padding: 20px; border-radius: 15px; background-color: #F877B1; margin-bottom: 10px;" value="슬갓생 로그인"></span>
					<div align="center" class="loginNregi">
						<span><input type="checkbox" id="chk_save_id">&nbsp;&nbsp;id 저장</span>
						<span><a href="regi.do">회원가입</a> / <a href="assiregi.do">조교 회원가입</a></span>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<hr style="width:400px"/>
	<button type="button" class="naver" style="width: 400px; padding: 20px; border: none; border-radius: 15px; background-color: #2DB400; margin-bottom: 10px; font-size: 25px;" onclick="location.href='${url}'">
		<b>네이버 로그인</b>
	</button>
</div>
<style>
  #login-btn {
    border: none;
    font-size: 25px;
    font-weight: 600;
  }
  #login-btn:hover {
    background-color: white;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);    
    color: black; 
  }
  .naver{
    color: white;
  }
  .naver:hover{
    color: black;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
  }
</style>

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