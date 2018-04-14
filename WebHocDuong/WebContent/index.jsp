<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title>
<!-- Latest compiled and minified CSS & JS -->
<link rel="stylesheet" href="Template/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="Template/css/webstyle.css" />
<script src="Template/jquery/jquery.js"></script>
<script src="Template/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="Template/css/login.css" />

<!-- Trở về đầu trang -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Import thư viện JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
	// kéo xuống khoảng cách 500px thì xuất hiện nút Top-up
	var offset = 500;
	// thời gian di trượt 0.75s ( 1000 = 1s )
	var duration = 150;
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > offset)
				$('#top-up').fadeIn(duration);
			else
				$('#top-up').fadeOut(duration);
		});
		$('#top-up').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, duration);
		});
	});
</script>
<div title="Về đầu trang" onmouseover="this.style.color='#590059'"
	onmouseout="this.style.color='#004993'" id="top-up">
	<i class="fa fa-space-shuttle fa-rotate-270"></i>
</div>
</head>
<!--Header-->
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default">
		
			<%@ include file="innavbar.jsp"%>
			
			<!--Carousel--------------------------------------------------------------------------- -->

			<div id="carousel-id" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-id" data-slide-to="0" class=""></li>
					<li data-target="#carousel-id" data-slide-to="1" class=""></li>
					<li data-target="#carousel-id" data-slide-to="2" class="active"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="First slide" src="Template/image/anh4.jpg">
					</div>
					<div class="item">
						<img alt="Second slide" src="Template/image/anh7.jpg">

					</div>
					<div class="item active">
						<img alt="Third slide" src="Template/image/anh2.png">
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-id"
					data-slide="prev"><span
					class="glyphicon glyphicon-chevron-left"></span></a> <a
					class="right carousel-control" href="#carousel-id"
					data-slide="next"><span
					class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
						
			<div class="content">Đây là nội dung</div>
			
			<%@ include file="footer.jsp"%>
		</nav>
	</div>
</body>
</html>