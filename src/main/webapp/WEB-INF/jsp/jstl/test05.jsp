<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합문제 1</title>
<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>

<style type="text/css">
	#wrap {
		width:1200px;
		height:800px;
		margin:auto;
	
		background-color:yellow;
	}
	
	header {
		height:80px;
		background-color:red;
	}
	
	.main-logo {
		width:250px;
		height:80px;
		background-color:green;
	}
	
	.sub-logo {
		width:950px;
		height:80px;
		background-color:black;
	}

</style>
<body>

	<div id="wrap">
		<header class="d-flex">
			<div class="main-logo">기상청</div>
			<div class="sub-logo"></div>
		</header>
		<div class="d-flex">
			<nav class="main-menu"></nav>
			<section class="main-content"></section>
		</div>
		<footer id="footer"></footer>
	
	
	</div>	


</body>
</html>