<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./style/css/style.css">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>메인입니당</h1>
						<div class="form-check form-switch mx-4">
							<input type="checkbox" 
								id="navbar__modeSwitchToggle" 
								class="form-check-input p-2" 
								role="switch"
								onclick="changeMode()"
							/>
						</div>


		<script>
			function changeMode () {
				const Body = document.body;
				Body.classList.toggle("dark-mode");

				const logoImg = document.getElementById("navBar__logo-img");
				logoImg.classList.toggle("navBar__logo-img-dark");
				console.log(logoImg.classList);
				console.log(logoImg.src);
			}
		</script>
	</body>
</html>