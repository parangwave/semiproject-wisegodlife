<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 학점계산기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

<nav>
	<table border="1">
	<tr>
		<th><a href="">슬갓생 </a></th>
		<th><a href="">게시판</a></th>
		<th><a href="">학교생활</a></th>
		<th><a href="mymain.do">마이페이지</a></th>
		<th>
			<button>라이트모드</button>
		</th>
	</tr>
	</table>
</nav>

<h1>내정보 - 학점계산기</h1>

<main id="mymain">

<table id="leftMenu" border="1">
	<tr>
		<th><a href="mymain.do">기본정보</a></th>
	</tr>
	<tr>
		<th><a href="">수강 시간표 작성</a></th>
	</tr>	
	<tr>
		<th><a href="mycalendar.do">학과 일정달력</a></th>
	</tr>	
	<tr>
		<th><a href="mygradecal.do">학점 계산기</a></th>
	</tr>	
	<tr>
		<th><a href="">메시지</a></th>
	</tr>	
	<tr>
		<th><a href="">친구 정보</a></th>
	</tr>	
	<tr>
		<th><a href="mywrite.do">작성한 댓글 및 게시글</a></th>
	</tr>	
	<tr>
		<th><a href="">블랙리스트</a></th>
	</tr>	
	<tr>
		<th><a href="">개인정보 변경</a></th>
	</tr>	
	<tr>
		<th><a href="">학교 인증</a></th>
	</tr>
	<tr>
		<th><a href="">회원 탈퇴</a></th>
	</tr>
</table>

<table border="1">
<thead>
	<tr>
		<th>
			<select>
				<option value="normalAvg">4.5 만점</option>
				<option value="difAvg">4.3 만점</option>
			</select>
		</th>
		<th colspan="2" style="text-align: left;"><input type="checkbox">F학점 포함</th>
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
		<th>총 평점</th>
		<td><input type="text" id="totalAvg" readonly="readonly"></td>
		<th>전공평점</th>
		<td><input type="text" id="majorAvg" readonly="readonly"></td>
		<th>이수학점</th>
		<td><input type="text" id="creditAll" readonly="readonly"></td>
		<th>전공학점</th>
		<td><input type="text" id="creditMajor" readonly="readonly"></td>
	</tr>
</table>
</div>

<script type="text/javascript">

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
	let subjectNameList = document.getElementsByName("subjectName");	
	let myGradeList = document.getElementsByName("myGrade");
	let creditList = document.getElementsByName("credit");
	let majorList = document.getElementsByName("major");
	
	let credit = 0;
	let creditMajor = 0;
	
	let myGradeArr = gradeChange(myGradeList, creditList);
	let myGradeAll = 0;
	let myGradeMajor = 0;
	
	// alert(majorList[0].checked);
	for (i = 0; i < creditList.length; i++) {
		credit = Number(credit) + Number(creditList[i].value);
		myGradeAll = Number(myGradeAll) + Number(myGradeArr[i]);
		if (majorList[i].checked === true) {
			myGradeMajor = Number(myGradeMajor) + Number(myGradeArr[i]);
			creditMajor = Number(creditMajor) + Number(creditList[i].value);
		}
	}
	
	let allAvg = (myGradeAll / credit).toFixed(2);
	allAvg = allAvg + " / 4.5";
	let majorAvg = (myGradeMajor / creditMajor).toFixed(2);
	majorAvg = majorAvg + " / 4.5";
		
	$("#totalAvg").val(allAvg);
	$("#majorAvg").val(majorAvg);
	$("#creditAll").val(credit);	
	$("#creditMajor").val(creditMajor);	
});

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
		    }
		}
		console.log(myGradeArray);
		return myGradeArray;
	}

</script>
	

</body>
</html>