<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴한 회원 복구란</title>
<link rel="icon" href="images/favicon.svg">
</head>
<body>

<form action="RestoreAf.do" method="post">
	<table>
		<tr>
			<th>탈퇴 회원의 화면창입니다.</th>
		</tr>
		<tr>
			<th>탈퇴한지 한달이 넘지 않았으면 복구 가능합니다.</th>
		</tr>
		<tr>
			<th>아이디를 입력하여 복구가 가능한지 탈퇴가 완료되었는지 확인 할 수 있습니다.</th>
		</tr>
		<tr>
			<% 
			String id = (String)request.getParameter("id");
			if (id != null) {
				%>
				<th><input type="text" name="id" value="<%=id %>" placeholder="아이디를 입력해주세요"></th>
				<%
			} else {
				%>
				<th><input type="text" name="id" placeholder="아이디를 입력해주세요"></th>
				<%
				
			}
			%>		
		</tr>
		<tr>
			<th><input type="button" onclick="canRestore()"  value="확인하기"></th>
			<th><input type="submit" value="복구하기"></th>
		</tr>		
	</table>
</form>
<script type="text/javascript">
function canRestore() {
	let id = document.getElementsByName("id");
	
	location.href = "canRestore.do?id=" + id[0].value;
}
</script>

</body>
</html>