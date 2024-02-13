<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="style/css/style.css">
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

    <form action="addCourse" method="post">
        <label for="courseName">과목명:</label>
        <input type="text" id="courseName" name="courseName"><br><br>
        <label for="room">강의실:</label>
        <input type="text" id="room" name="room"><br><br>
        <label for="day">요일:</label>
        <select id="day" name="day">
            <option value="mon">월요일</option>
            <option value="tue">화요일</option>
            <option value="wed">수요일</option>
            <option value="thu">목요일</option>
            <option value="fri">금요일</option>
        </select><br><br>
        <label for="time">시간:</label>
        <input type="text" id="time" name="time" placeholder="예: 09:00 - 10:00"><br><br>
        <input type="submit" value="추가">
    </form>
  </main>

</body>
</html>