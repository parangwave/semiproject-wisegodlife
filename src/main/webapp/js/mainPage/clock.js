
const clockContainer = document.querySelector("#mainContainer__leftTab__weather__clockSection"),
    clockTitle = clockContainer.querySelector("h1"),
    CalContainer = document.querySelector("#mainContainer__leftTab__weather__clockSection"),
    CalTitle = CalContainer.querySelector("h4");

function getTime(){
    const date = new Date();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    // const seconds = date.getSeconds();
    
    clockTitle.innerText = `${hours < 10 ? `0${hours}` : hours}:${
        minutes < 10 ? `0${minutes}` : minutes
    }`;
    // :${seconds < 10 ? `0${seconds}` : seconds
    // }`;

    return hours;
}

function getDateStr(){
    const date = new Date();
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const aDate = date.getDate();
    const day = date.getDay();
    const week = ['일', '월', '화', '수', '목', '금', '토'];
    console.log(year + " " + month + " " + aDate + " " + day);
    
    CalTitle.innerText = `${year}년 ${
        `${month}`}월 ${
        `${aDate}`}일 ${
            week[day]}요일
    `;
}

function init() {
    getTime();
    setInterval(getTime, 1000);
    getDateStr();
}

init();