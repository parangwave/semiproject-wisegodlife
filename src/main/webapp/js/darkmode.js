
function changeMode () {
	const Body = document.body;
	Body.classList.toggle("dark-mode");
	const logoImg = document.getElementById("navBar__logo-img");
	logoImg.classList.toggle("navBar__logo-img-dark");
}