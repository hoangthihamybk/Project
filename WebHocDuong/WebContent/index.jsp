
<%@page import="model.HocSinh"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img
						src="Template/image/anh1.jpg" alt="" height="80px" width="120px">
						<p>
							Lớp Học Online</br>
							</br> Xin chào,
						</p>

					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="#" data-toggle='modal'
							data-target='#SignUpModal'><span
								class="glyphicon glyphicon-user"></span> ĐĂNG KÝ </a></li>
						<!-- Modal -->
						<div class="modal fade" id="SignUpModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">
											<span class="glyphicon glyphicon-pencil"></span> ĐĂNG KÍ
										</h4>
									</div>
									<div class="modal-body">

										<input type="text" class="form-control"
											placeholder="Họ và tên"></br> <input type="text"
											class="form-control" placeholder="Mật khẩu"></br> <input
											type="text" class="form-control" placeholder="Số điện thoại"></br>
										<input type="text" class="form-control"
											placeholder="Năm sinh (VD:1999)"></br>
										<button type="submit"
											class="btn btn-default btn-success btn-block">ĐĂNG
											KÝ</button>
									</div>
								</div>
							</div>
						</div>						
						<li><a href="#" data-toggle='modal' data-target='#LoginModal'><span
						
								class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP</a></li>
						<!-- Modal -->
						
						<div class="modal fade" id="LoginModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 style="color: red;">
											<span class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP
										</h4>
									</div>
									<div class="modal-body">
										<form role="form" action="XuLyDangNhap" method="post">
											<div class="form-group">
												<label for="usrname"><span
													class="glyphicon glyphicon-user"></span> Tài khoản</label> <input type="text" class="form-control"
													id="email" name="username" placeholder="Nhập email...">
											</div>
											<div class="form-group">
												<label for="psw"><span
													class="glyphicon glyphicon-eye-open"></span> Mật Khẩu</label> <input
													type="text" class="form-control" id="pwd" name="pass"
													placeholder="Nhập password...">
											</div>
											<div class="checkbox">
												<label><input type="checkbox" value="" checked>Nhớ
													mật khẩu</label>
											</div>
											<button type="submit"
												class="btn btn-default btn-success btn-block">
												<span class="glyphicon glyphicon-off"></span> ĐĂNG NHẬP
											</button>
										</form>
									</div>
									<div class="modal-footer">
										<p>
											Không có tài khoản? <a href="#">Đăng Kí</a>
										</p>
										<p>
											Quên <a href="#">Mật khẩu?</a>
										</p>
									</div>
								</div>
								
							</div>
						</div>
</form>
						<!-- Modal -->

					</ul>
				</div>
			</div>

			<!--Carousel--------------------------------------------------------------------------- -->

			<div id="carousel-id" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-id" data-slide-to="0" class=""></li>
					<li data-target="#carousel-id" data-slide-to="1" class=""></li>
					<li data-target="#carousel-id" data-slide-to="2" class="active"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="First slide" src="Template/image/anh9.png">
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