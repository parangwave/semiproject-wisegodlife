<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" href="images/favicon.svg">

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/friend/regi.css" />
</head>
<body>
<div class="regi">
  <div class="banner">
    <img src="images/lifegodlogo.png" / id="logo">
  </div>

  <div class="center">
    <form action="regiAf.do" id="frm" method="post">
      <table class="table">
        <tr>
          <th>아이디</th>
          <td>
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디">
            <p id="idcheck" style="font-size: 17px"></p>
          </td>
          <td class="buttons">
            <input type="button" class="button" id="id_chk_btn" value="id확인">
          </td>
        </tr>
        <tr>
          <th>패스워드</th>
          <td>
            <input type="text" class="form-control" name="pw" placeholder="패스워드">
          </td>
        </tr>
        <tr>
          <th>애칭</th>
          <td>
            <input type="text" class="form-control" name="nickname" id="nickname" placeholder="애칭">
            <p id="nickname_check" style="font-size: 17px"></p>
          </td>
          <td  class="buttons">
            <input type="button" class="button" id="nickname_chk_btn" value="애칭확인">
          </td>
        </tr>
        <tr>
          <th>이름</th>
          <td>
            <input type="text" class="form-control" name="name" placeholder="이름">
          </td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td>
            <input type="text" class="form-control" name="tel" placeholder="전화번호">
          </td>
        </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type="text" class="form-control" name="email" placeholder="이메일">
          </td>
        </tr>
        <tr>
          <th>재학중인 대학교</th>
          <td>
            <input type="text" class="form-control" name="college" placeholder="재학중인 대학교">
          </td>
        </tr>
        <tr>
          <th>학과선택</th>
          <td>
            <select name="major" id="major">
              <option value="1">영어영문학과</option>
              <option value="2">재료공학과</option>
              <option value="3">화학공학과</option>
            </select>
          </td>
        </tr>

        <tr>
          <td colspan="2">
            <div align="center">
              <input type="button" id="regibtn" class="button" value="회원가입">
            </div>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('#id_chk_btn').click(function(){
		
		//빈칸검사
		if($("#id").val() === ""){
			alert("아이디를 기입해주세요.");
			return;
		}

		// id 글자의 갯수 > ? 
				
		// id 규칙 : 대소문자 포함 + 특수기호 로그인API - ( 카카오API, 구글API, 네이버API )
				
		// id 가 사용중? 
		$.ajax({
			url : "./idcheck.do",
			type : "get",
			data : { 
				"id" : $("#id").val()
			},
			success:function(str){
				// alert("success");
				if(str === "YES"){
			/* 		alert("가입이 가능한 아이디입니다."); */
					$("#idcheck").css("color","#0000ff");
					$("#idcheck").text("사용할수 있는 아이디입니다.");
					
				} else {
					/* alert("이미 가입이 되어있는 아이디입니다."); */
					$("#idcheck").css("color","#ff0000");
					$("#idcheck").text("사용중인 아이디입니다.");
					$("#id").val("");
				}
			},
			error:function(){
				alert("error");
			}
		});
	});

  $('#nickname_chk_btn').click(function(){
		
		//빈칸검사
		if($("#nickname").val() === ""){
			alert("별칭을 기입해주세요.");
			return;
		}

		// id 글자의 갯수 > ? 
				
		// id 규칙 : 대소문자 포함 + 특수기호 로그인API - ( 카카오API, 구글API, 네이버API )
				
		// id 가 사용중? 
		$.ajax({
			url : "./nicknamecheck.do",
			type : "get",
			data : { 
				"nickname" : $("#nickname").val()
			},
			success:function(str){
				// alert("success");
				if(str === "YES"){
					$("#nickname_check").css("color","#0000ff");
					$("#nickname_check").text("사용할수 있는 닉네임입니다.");
					
				} else {
					$("#nickname_check").css("color","#ff0000");
					$("#nickname_check").text("사용중인 애칭입니다.");
					$("#nickname").val("");
				}
			},
			error:function(){
				alert("error");
			}
		});
	});
	
	$("#regibtn").click(function(){
		
		// 빈칸검사
		// id, pw, name		
		$("#frm").submit();
		
	});
});
</script>
</body>
</html>