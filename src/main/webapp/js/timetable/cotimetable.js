document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("timetableCanvas");
  const ctx = canvas.getContext("2d");

  const days = ["월", "화", "수", "목", "금"];
  const times = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"];
  const cellWidth = canvas.width / (days.length + 1);
  const cellHeight = canvas.height / (times.length + 1);

  let courses = [];

  // 초기 시간표 그리기
  drawTimetable();

  // 이전에 추가된 수업 불러오기
  loadCourses();

  // 수강 추가 버튼 클릭 이벤트
  document.getElementById("addCourseBtn").addEventListener("click", function() {
      const day = document.getElementById("daySelect").value;
      const startTime = document.getElementById("startTimeSelect").value;
      const endTime = document.getElementById("endTimeSelect").value;
      // console.log(document.getElementById("courseNameInput").value);
      
      const storedCourses = localStorage.getItem("courses");
      if (storedCourses) {
        courses = JSON.parse(storedCourses);
      }
      for (i = 0; i < courses.length; i++) {
        if (courses[i].day === day && courses[i].startTime === startTime ) {
          alert('작성하신 강의가 중복되어 작성이 불가능합니다.');
          return;
        }        
      }

      if (startTime >= endTime) {
        alert('시작시간과 종료시간이 잘못되었습니다');
        return;
      }

      if (document.getElementById("courseNameInput").value === "" || document.getElementById("courseClassInput").value === "") {
        alert('수업명 또는 강의실을 제대로 작성해주세요');
        return;
      } else {
        const courseName = document.getElementById("courseNameInput").value + " (" + document.getElementById("courseClassInput").value + ")";
        // console.log(courseName);

        // 새로운 수업을 추가할 때 밝은 색상을 랜덤 생성
        const randomColor = getRandomBrightColor();
        courses.push({ day: day, startTime: startTime, endTime: endTime, courseName: courseName, color: randomColor });

        drawCourses();
        saveCourses();
      }
  });

  // 시간표 리셋 버튼 클릭 이벤트
  document.getElementById("resetBtn").addEventListener("click", function() {
      courses = [];
      drawCourses();
      saveCourses();
  });

  // 초기 시간표 그리기 함수
  function drawTimetable() {
      // 그리드 그리기
      ctx.strokeStyle = "lightgray";
      ctx.lineWidth = 1;
      ctx.beginPath();
      for (let i = 1; i <= days.length; i++) {
          ctx.moveTo(cellWidth * i, 0);
          ctx.lineTo(cellWidth * i, canvas.height);
      }
      for (let i = 1; i <= times.length; i++) {
          ctx.moveTo(0, cellHeight * i);
          ctx.lineTo(canvas.width, cellHeight * i);
      }
      ctx.stroke();

      // 요일과 시간 텍스트 그리기 (중앙 정렬)
      ctx.fillStyle = "black";
      ctx.textAlign = "center"; // 텍스트 중앙 정렬
      ctx.textBaseline = "middle"; // 텍스트 세로 중앙 정렬
      for (let i = 0; i < days.length; i++) {
          ctx.fillText(days[i], cellWidth * (i + 1) + cellWidth / 2, cellHeight / 2);
      }
      for (let i = 0; i < times.length; i++) {
          ctx.fillText(times[i], cellWidth / 2, cellHeight * (i + 2) - cellHeight / 2);
      }
  }

  // 저장된 수업들을 캔버스에 그리는 함수
  function drawCourses() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      drawTimetable();

      courses.forEach(function(course) {
          const dayIndex = days.indexOf(course.day);
          const startTimeIndex = times.indexOf(course.startTime);
          const endTimeIndex = times.indexOf(course.endTime);

          // 수업 영역 그리기
          ctx.fillStyle = course.color;
          ctx.fillRect(cellWidth * (dayIndex + 1), cellHeight * (startTimeIndex + 1), cellWidth, cellHeight * (endTimeIndex - startTimeIndex));

          // 수업 정보 텍스트 그리기 (글자 색상은 항상 검정색)
          ctx.fillStyle = "black";
          ctx.fillText(course.courseName, cellWidth * (dayIndex + 1) + cellWidth / 2, cellHeight * (startTimeIndex + 1) + (cellHeight * (endTimeIndex - startTimeIndex)) / 2);
      });
  }

  // 저장된 수업들을 로컬 스토리지에 저장하는 함수
  function saveCourses() {
      localStorage.setItem("courses", JSON.stringify(courses));
  }

  // 이전에 추가된 수업들을 로컬 스토리지에서 불러오는 함수
  function loadCourses() {
      const storedCourses = localStorage.getItem("courses");
      if (storedCourses) {
          courses = JSON.parse(storedCourses);
          drawCourses();
      }
  }

  // 밝은 색상을 랜덤하게 생성하는 함수
  function getRandomBrightColor() {
      // 적당한 밝은 색상 생성 (밝기가 128 이상인 색상)
      let color = '#' + Math.floor(Math.random() * 16777215).toString(16);
      let r = parseInt(color.substr(1, 2), 16);
      let g = parseInt(color.substr(3, 2), 16);
      let b = parseInt(color.substr(5, 2), 16);
      let brightness = Math.sqrt(0.299 * r * r + 0.587 * g * g + 0.114 * b * b);
      while (brightness < 128) {
          color = '#' + Math.floor(Math.random() * 16777215).toString(16);
          r = parseInt(color.substr(1, 2), 16);
          g = parseInt(color.substr(3, 2), 16);
          b = parseInt(color.substr(5, 2), 16);
          brightness = Math.sqrt(0.299 * r * r + 0.587 * g * g + 0.114 * b * b);
      }
      return color;
  }
});
