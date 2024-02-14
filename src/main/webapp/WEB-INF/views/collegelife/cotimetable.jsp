<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
<link rel="stylesheet" href="style/css/collegelife/comain.css" />
<style>
  canvas {
      border: 1px solid black;
      font-size: 30px;
  }

  table {
      border-collapse: collapse;
      width: 100%;
  }
  th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
  }
  .hidden-cell {
      display: none;
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

    <canvas id="timetableCanvas" width="800" height="600"></canvas>

    <div>
        <label for="daySelect">요일:</label>
        <select id="daySelect">
            <option value="월">월</option>
            <option value="화">화</option>
            <option value="수">수</option>
            <option value="목">목</option>
            <option value="금">금</option>
        </select>
        <label for="startTimeSelect">시작 시간:</label>
        <select id="startTimeSelect">
            <option value="09:00">09:00</option>
            <option value="10:00">10:00</option>
            <option value="11:00">11:00</option>
            <option value="12:00">12:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>
        </select>
        <label for="endTimeSelect">종료 시간:</label>
        <select id="endTimeSelect">
            <option value="10:00">10:00</option>
            <option value="11:00">11:00</option>
            <option value="12:00">12:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>
            <option value="18:00">18:00</option>
        </select>
        <label for="courseNameInput">수업명:</label>
        <input type="text" id="courseNameInput">
        <label for="courseClassInput">강의실:</label>
        <input type="text" id="courseClassInput">
        <button id="addCourseBtn">수강 추가</button>
        <button id="resetBtn">초기화</button>
    </div>

    <script src="js/timetable/cotimetable.js"></script>
  </main>

</body>
</html>

</body>
</html>