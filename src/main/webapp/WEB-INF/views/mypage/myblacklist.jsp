<%@page import="ssg.com.a.dto.MyblacklistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<MyblacklistDto> bllist = (List<MyblacklistDto>)request.getAttribute("bllist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="icon" href="images/favicon.svg">
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/mypage/mymain.css" />
<link rel="stylesheet" href="style/css/mypage/myblacklist.css" />

</head>
<body>	
  <script>
    $(document).ready( function() {
      $("#topnav").load("topnav.do");
      $("#leftMenu").load("mynav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
  <main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>

    <rightcontent id="rightContent">
      <h2 id="contentTitle">내정보</h2>
		
		<table>
			<tr>
				<!-- 닉네임 또는 아이디로 차단하기 -->
				<th colspan="3">아이디 차단리스트</th>
				<th>
          <div class="moreBtnContainer">
            <a class="btn" role="button" onclick="idBlockAdd()">아이디 추가</a>
          </div>
        </th>
			</tr>
				
			<tbody>
				<tr>
					<td>번호</td>
					<td>차단 아이디</td>
					<td class="title">차단 사유</td>
					<td>차단일</td>
				</tr>	
				<%
        if (bllist.size() == 0 || bllist == null) {
          %>
					<tr>
						<td colspan="4">차단한 사람이 없습니다.</td>
					</tr>	
          <%
        }
				for (int i = 0;i < bllist.size(); i++) {
					MyblacklistDto bl = bllist.get(i);
					if (bl.getBlockid() == null || bl.getBlockid().equals("")) {
	         			%>
		 					<tr>
								<td colspan="4">차단한 사람이 없습니다.</td>
							</tr>
	         			<%
						} else {
	         			%>
					<tr>
						<td class="num"><%=i + 1 %></td>
						<td class="num"><%=bl.getBlockid() %></td>
						<td style="text-align: left;"><%=bl.getReason() %></td>
						<td ><%=bl.getAdddate().substring(0, 10) %></td>
					</tr>	
					<%
					}
				}
				%>	
			</tbody>

      <tbody id="space">
        <tr><td colspan="4"></td></tr>
      </tbody>

      <tr>
        <th colspan="3">특정단어 차단리스트</th>
        <th>
          <div class="moreBtnContainer">
            <a class="btn" role="button" onclick="wordBlockAdd()">단어 추가</a>
          </div>
        </th>
      </tr>

      <tbody>
				<tr>
					<td>번호</td>
					<td>차단 단어</td>
					<td class="title">차단 사유</td>
					<td>차단일</td>
				</tr>	
        <%
        if (bllist.size() == 0 || bllist == null) {
          %>
					<tr>
						<td colspan="4">차단한 단어가 없습니다.</td>
					</tr>	
          <%
        }
				for (int i = 0;i < bllist.size(); i++) {
					MyblacklistDto bl = bllist.get(i);
					
					if (bl.getWord() == null || bl.getWord().equals("")) {
         			%>
	 					<tr>
							<td colspan="4">차단한 단어가 없습니다.</td>
						</tr>
         			<%
					} else {
         			%>
					<tr>
						<td class="num"><%=i + 1 %></td>
						<td class="num"><%=bl.getWord()%></td>
						<td style="text-align: left;"> <%=bl.getReason() %></td>
						<td><%=bl.getAdddate() %></td>
					</tr>	
					<%
     				}
        		}
				%>	
			</tbody>
		</table>	
	</main>
	
	<script type="text/javascript">
	function idBlockAdd() {
		location.href = "idlistadd.do";
	}
	function wordBlockAdd() {
		location.href = "wordlistadd.do";
	}
	</script>
</body>
</html>