$(document).ready(function () {
  let week = new Array('일', '월', '화', '수', '목', '금')
  let today = new Date().getDay();
  let dayOfWeek = week[today];

  const storedCourses = localStorage.getItem("courses");
  console.log(storedCourses);
  courses = JSON.parse(storedCourses);
  console.log(courses);

  for (let i = 0; i < 3; i++) {
    let tr = document.createElement('tr');

    // day, startTime, endTime, courseNameInput, courseClassInput, color
    // courses[i].key값
    if (dayOfWeek == courses[i].day) { // 1,3
      let td = document.createElement('td');
      td.innerHTML = courses[i].courseName + "<br/>" + courses[i].startTime + " ~ " + courses[i].endTime + "<br/>";
      tr.appendChild(td);
    }
    document.querySelector("tbody").appendChild(tr);
  }
});
