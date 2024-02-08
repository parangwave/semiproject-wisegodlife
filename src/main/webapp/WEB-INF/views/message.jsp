<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 회원가입
String regiMsg = (String)request.getAttribute("regiMsg");
if(regiMsg != null && regiMsg.equals("") == false){
	if(regiMsg.equals("FRIEND_YES")){
		%>
		<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "./login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">	
		alert("다시 가입해 주십시오");
		location.href = "./regi.do";
		</script>
		<%
	}
}

// 로그인
String loginMsg = (String)request.getAttribute("loginMsg");
if(loginMsg != null && loginMsg.equals("") == false){
	if(loginMsg.equals("LOGIN_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("로그인되었습니다");
		location.href = "./main.do";
		</script>
		<%		
	} else if(loginMsg.equals("LOGIN_DEL")){
		%>
		<script type="text/javascript">
		alert("탈퇴한 회원입니다.");
		location.href = "./restore.do"; 
		</script>
		<%	
	}	else{
		%>
		<script type="text/javascript">
		alert("아이디나 패스워드를 확인해 주세요");
		location.href = "./login.do";
		</script>
		<%		
	}	
}

//네이버 로그인
String loginNaverMsg = (String)request.getAttribute("loginNaverMsg");
if(loginNaverMsg != null && loginNaverMsg.equals("") == false){
	if(loginNaverMsg.equals("NAVER_LOGIN_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("네이버 아이디로 로그인되었습니다");
		location.href = "./main.do";
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("네이버 아이디를 확인해 주세요");
		location.href = "./login.do";
		</script>
		<%		
	}	
}

// 게시판 글추가
String freebbswriteMsg = (String)request.getAttribute("freebbswriteMsg");
if(freebbswriteMsg != null && freebbswriteMsg.equals("") == false){
	if(freebbswriteMsg.equals("FREEBBSWRITE_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("성공적으로 추가되었습니다");
		location.href = "./freebbslist.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "./freebbswrite.do";
		</script>
		<%
	}
}

// 답글
String answerMsg = (String)request.getAttribute("answerMsg");
if(answerMsg != null && answerMsg.equals("") == false){
	if(answerMsg.equals("ANSWER_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("답글이 성공적으로 추가되었습니다");
		location.href = "bbslist.do";
		</script>
		<%
	}else{
		Integer seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("답글을 다시 작성해 주십시오");
		location.href = "answer.do?seq=" + seq;
		</script>
		<%
	}
}

// 글수정
String freebbsupdateMsg = (String)request.getAttribute("freebbsupdateMsg");
if(freebbsupdateMsg != null && freebbsupdateMsg.equals("") == false){
	if(freebbsupdateMsg.equals("FREEBBS_UPDATE_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("글이 성공적으로 수정되었습니다");
		location.href = "freebbslist.do";
		</script>
		<%
	}else{
		Integer seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("글을 다시 수정해 주십시오");
		location.href = "freebbsupdate.do?seq=" + <%=seq %>;
		</script>
		<%
	}
}


//글 삭제
String freebbsdeleteMsg = (String)request.getAttribute("freebbsdeleteMsg");
if(freebbsdeleteMsg != null && freebbsdeleteMsg.equals("") == false){
	if(freebbsdeleteMsg.equals("FREEBBS_DELETE_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("글이 성공적으로 삭제되었습니다");
		location.href = "freebbslist.do";
		</script>
		<%
	}else{
		Integer seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("글이 삭제되지 않았습니다");
		location.href = "freebbslist.do?seq=" + <%=seq %>;
		</script>
		<%
	}	
}

String calwrite = (String)request.getAttribute("calwrite");
if(calwrite != null && !calwrite.equals("")){
	if(calwrite.equals("CAL_WRITE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 추가되었습니다");
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("추가되지 않았습니다");		
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}	
}

String calupdate = (String)request.getAttribute("calupdate");
if(calupdate != null && !calupdate.equals("")){
	if(calupdate.equals("CAL_UPDATE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("수정되지 않았습니다");		
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}	
}

String caldelete = (String)request.getAttribute("caldelete");
if(caldelete != null && !caldelete.equals("")){
	if(caldelete.equals("CAL_DELETE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 삭제되었습니다");
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("삭제되지 않았습니다");		
		location.href = "calendar?param=calendarList";
		</script>
		<%
	}	
}

// 개인정보 수정
String changeMsg  = (String)request.getAttribute("changeMsg");
if(changeMsg != null && changeMsg.equals("") == false){
	if(changeMsg.equals("CHANGE_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("개인정보 수정이 완료되었습니다");
		location.href = "./mymain.do"; 
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("개인정보 수정에 실패하였습니다");
		location.href = "./mychange.do";
		</script>
		<%		
	}	
}

// 회원탈퇴
String closeMsg  = (String)request.getAttribute("closeMsg");
if(closeMsg != null && closeMsg.equals("") == false){
	if(closeMsg.equals("CLOSE_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("회원탈퇴가 완료되었습니다.");
		location.href = "./login.do"; 
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("회원탈퇴과정중 문제가 발생했습니다");
		location.href = "./myclose.do";
		</script>
		<%		
	}	
}

//회원복구 확인
String restoreMsg  = (String)request.getAttribute("restoreMsg");
if(restoreMsg != null && restoreMsg.equals("") == false){
	if(restoreMsg.equals("RESTORE_SUCCESS")){
		String id  = (String)request.getAttribute("id");
		%>
		<script type="text/javascript">
		alert("회원복구가 가능합니다");
		location.href = "./restore.do?id=<%=id%>"; 
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("이미 탈퇴처리가 완료되었습니다");
		location.href = "./login.do";
		</script>
		<%		
	}	
}

//회원복구
String reMsg  = (String)request.getAttribute("reMsg");
if(reMsg != null && reMsg.equals("") == false){
	if(reMsg.equals("RESTOREAF_SUCCESS")){
		%>
		<script type="text/javascript">
		alert("회원복구가 완료되었습니다");
		location.href = "./login.do"; 
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("회원복구에 실패했습니다.");
		location.href = "./restore.do";
		</script>
		<%		
	}	
}
%>








