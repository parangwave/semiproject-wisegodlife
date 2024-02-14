$(document).ready(function () {
  let cal = [];
  
  // 과목추가
  $("#addSub").click(function () {
    let add = '<tr>'
      + '<th><input name="subjectName" class="subjectName" placeholder="과목 입력란"> </th>'
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
      +	'<th><input name="credit" class="credit" placeholder="학점"></th>'
      +	'<th>&nbsp;<input type="checkbox" name="major"></th>'
      + '</tr>';	
    $("#addSubject").append(add);
  });
  
  $("#gradeCal").click(function () {
    // 변수
    let subjectNameList = document.getElementsByName("subjectName");	
    let myGradeList = document.getElementsByName("myGrade");
    let creditList = document.getElementsByName("credit");
    let majorList = document.getElementsByName("major");

    console.log(subjectNameList.value);
    console.log(myGradeList.value);
    for (i = 0; i < myGradeList.length; i++) {
      cal.push({ subjectNameList : subjectNameList[i].value, myGradeList : myGradeList[i].value, creditList : creditList[i].value, majorList : majorList[i].checked });
    }
    
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

  $("#saveCal").click(function () {
      localStorage.setItem("cal", JSON.stringify(cal));
  });

  $("#loadCal").click(function () {
    if ($('input[name=subjectName]').val() != null || $('input[name=subjectName]').eq('0').val() != null) {
      alert('이미 과목들이 추가되어있거나 비어있는 상태에서 불러오기를 하지않았습니다.');
      return;
    }
    const storedCal = localStorage.getItem("cal");
    cal = JSON.parse(storedCal);
    console.log(storedCal);
    console.log(cal);

    for (i = 0; i < storedCal.length; i++) {
      let load = '<tr>'
      + '<th><input name="subjectName" class="subjectName" placeholder="과목 입력란" value="' + cal[i].subjectNameList + '"></th>'
      + '<th>'
      + '<select name="myGrade" id="myGrade' + i + '">'
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
      +	'<th><input name="credit" class="credit" placeholder="학점" value="' +  cal[i].creditList + '"></th>';
      if (cal[i].majorList === true) {
        load = load + '<th><input type="checkbox" name="major" checked="checked"></th>' + '</tr>'
      } else {
        load = load + '<th><input type="checkbox" name="major"></th>' + '</tr>'
      }
    $("#addSubject").append(load);
    $("#myGrade" + i).val(cal[i].myGradeList).prop("selected",true);
    }
  });

});
