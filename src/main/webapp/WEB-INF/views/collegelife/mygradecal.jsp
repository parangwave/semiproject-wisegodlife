<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 학점계산기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<style type="text/css">
#mymain {
	display: flex;
	width: 100%;
}
#leftMenu tr th{
	text-align: left;
}
#lefteMenu {
	width: 10%;	
}
#rightContet {
	width: 90%;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>
  <script>
    $(document).ready( function() {
      $("#topnav").load("topnav.do");
      $("#leftMenu").load("collnav.do");
    });
  </script>
	<nav id="topnav"></nav>
	
	<header id="header">	
		<h1>학교생활 </h1>
	</header>
	
	<main id="mymain">
    <leftmenu id="leftMenu"></leftmenu>
		
		<table border="1">
			<thead>
				<tr>
					<th>
						<select id="changeAvg">
							<option value="firstAvg">4.5 만점</option>
							<option value="secondAvg">4.3 만점</option>
							<option value="threeAvg">4.0 만점</option>
							<option value="fourAvg">백분율 계산</option>
						</select>
					</th>
					<th colspan="2" style="text-align: left;"><input id="fcheck" type="checkbox">F학점 포함</th>
					<th><input type="button" value="과목추가" onclick="addSubject()"></th>		
				</tr>	
				<tr>
					<th>과목</th>
					<th>점수</th>
					<th>학점</th>
					<th>전공</th>
				</tr>
			</thead>		
			<tbody id="addSubject">
				<tr>
					<th><input name="subjectName" placeholder="과목을 입력해주세요"> </th>
					<th>
						<select name="myGrade">
							<option value="A+">A+</option>
							<option value="A">A</option>
							<option value="B+">B+</option>
							<option value="B">B</option>
							<option value="C+">C+</option>
							<option value="C">C</option>
							<option value="D+">D+</option>
							<option value="D">D</option>
							<option value="F">F</option>
						</select>
					</th>
					<th><input name="credit" placeholder="학점을 입력해주세요"></th>
					<th><input type="checkbox" name="major"></th>
				</tr>
			</tbody>
			<tfoot>
				<tr>
				 <th colspan="4">
				 	<button type="button" id="gradeCal">학점계산</button>
				 	<button type="submit">저장하기</button>
				 	<button type="submit">불러오기</button>
				 </th>
				</tr>
			</tfoot>
		</table>	
	</main>		
	<div align="center">
		<table border="1">
			<tr>
				<th id="totalName">총 평점</th>
				<td><input type="text" id="totalAvg" readonly="readonly"></td>
				<th id="majorName">전공평점</th>
				<td><input type="text" id="majorAvg" readonly="readonly"></td>
				<th>이수학점</th>
				<td><input type="text" id="creditAll" readonly="readonly"></td>
				<th>전공학점</th>
				<td><input type="text" id="creditMajor" readonly="readonly"></td>
			</tr>
		</table>
	</div>
	
	<script type="text/javascript">
		// 과목추가
		function addSubject() {
			let add = '<tr>'
				+ '<th><input name="subjectName" placeholder="과목을 입력해주세요"> </th>'
				+ '<th>'
				+ '<select name="myGrade">'
				+		'<option value="A+">A+</option>'
				+		'<option value="A">A</option>'
				+		'<option value="B+">B+</option>'
				+		'<option value="B">B</option>'
				+		'<option value="C+">C+</option>'
				+		'<option value="C">C</option>'
				+		'<option value="D+">D+</option>'
				+		'<option value="D">D</option>'
				+		'<option value="F">F</option>'
				+	'</select>'
				+	'</th>'
				+	'<th><input name="credit" placeholder="학점을 입력해주세요"></th>'
				+	'<th><input type="checkbox" name="major"></th>'
				+ '</tr>';	
			$("#addSubject").append(add);
		}
		
		$("#gradeCal").click(function () {
			// 변수
			let subjectNameList = document.getElementsByName("subjectName");	
			let myGradeList = document.getElementsByName("myGrade");
			let creditList = document.getElementsByName("credit");
			let majorList = document.getElementsByName("major");
			
			// 이수학점
			let credit = 0;
			let creditMajor = 0;
		
			// 학점 계산 내용
			let myGradeArr = gradeChange(myGradeList, creditList);
			let myGradeAll = 0;
			let myGradeMajor = 0;
			let Fcredit = 0;
			let myGradeMajorFcredit = 0;
			
			// 점수계산
			for (i = 0; i < myGradeList.length; i++) {
				if (myGradeArr[i] !== undefined) {
					myGradeAll = Number(myGradeAll) + Number(myGradeArr[i]);	
					
					if (majorList[i].checked === true && myGradeList[i].value !== "F") {
						myGradeMajor = Number(myGradeMajor) + Number(myGradeArr[i]);
					}
				}
		
			}
			
			// 학점계산
			for (i = 0; i < creditList.length; i++) {
				if ($("#fcheck").is(":checked") === true) {
					credit = Number(credit) + Number(creditList[i].value);
				}
				if ($("#fcheck").is(":checked") === false && myGradeList[i].value !== "F") {
					credit = Number(credit) + Number(creditList[i].value);
				}
				
				if (majorList[i].checked === true && $("#fcheck").is(":checked") === true) {
					creditMajor = Number(creditMajor) + Number(creditList[i].value);
				}		
				if (majorList[i].checked === true && $("#fcheck").is(":checked") === false && myGradeList[i].value !== "F") {
					creditMajor = Number(creditMajor) + Number(creditList[i].value);
				}
			}
			
			// 4.5학점을 백분위로 환산
			// 총이수 기준
			let allAvg = (Number(myGradeAll) / Number(credit)).toFixed(2);
			let changeAvgO = Number(allAvg) * 10 + 55;
			
			// 전공이수 기준
			let majorAvg = (Number(myGradeMajor) / Number(creditMajor)).toFixed(2);
			let changeAvgT = Number(majorAvg) * 10 + 55;
					
			// 변환기준에 맞게 대입
			let changeAvg = $("#changeAvg").val();
			if (changeAvg === "firstAvg") {
				allAvg = allAvg + " / 4.5";
				majorAvg = majorAvg + " / 4.5";
			} else if (changeAvg === "secondAvg") {
				allAvg = (Number(changeAvgO) - 57) / 10
				majorAvg = (Number(changeAvgT) - 57) / 10
				allAvg = allAvg + " / 4.3";
				majorAvg = majorAvg + " / 4.3";
				
			} else if (changeAvg === "threeAvg") {
				allAvg = (Number(changeAvgO) - 60) / 10
				majorAvg = (Number(changeAvgT) - 60) / 10
				allAvg = allAvg + " / 4.0";
				majorAvg = majorAvg + " / 4.0";		
			} else {
				allAvg = changeAvgO + "점";
				majorAvg = changeAvgT + "점";
				$("#totalName").text("총 백분율");
				$("#majorName").text("전공 백분율");
			}
			
			// 전공이수를 하지 않았을때 표시
			if (majorAvg == "NaN점" || majorAvg == "NaN / 4.0" || majorAvg == "NaN / 4.3" || majorAvg == "NaN / 4.5") {
				majorAvg = "전공이수 없음";
			}
		
			$("#totalAvg").val(allAvg);
			$("#majorAvg").val(majorAvg);
			$("#creditAll").val(credit);	
			$("#creditMajor").val(creditMajor);	
		});
		
		// 4.5 기준으로 학점을 계산
		function gradeChange(myGradeList, creditList) {
			  let myGradeArray = new Array();
				for (i = 0; i < myGradeList.length; i++) {
					if (myGradeList[i].value === "A+") {
						myGradeArray.push(Number(4.5) * creditList[i].value);
				    } else if (myGradeList[i].value === "A"){
				    	myGradeArray.push(Number(4) * creditList[i].value);
				    } else if (myGradeList[i].value === "B+"){
				    	myGradeArray.push(Number(3.5) * creditList[i].value);
				    } else if (myGradeList[i].value === "B"){
				    	myGradeArray.push(Number(3) * creditList[i].value);
				    } else if (myGradeList[i].value === "C+"){
				    	myGradeArray.push(Number(2.5) * creditList[i].value);
				    } else if (myGradeList[i].value === "C"){
				    	myGradeArray.push(Number(2) * creditList[i].value);
				    } else if (myGradeList[i].value === "D+"){
				    	myGradeArray.push(Number(1.5) * creditList[i].value);
				    } else if (myGradeList[i].value === "D"){
				    	myGradeArray.push(Number(1) * creditList[i].value);
				    } else {
				    	myGradeArray.push(0);
				    }
				}
				return myGradeArray;
			}
	</script>
</body>
</html>