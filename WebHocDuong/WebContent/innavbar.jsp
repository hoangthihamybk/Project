<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						src="Template/image/anh1.jpg" alt="" height="70px" width="100px">
						<p>Lớp Học Online</p>
					</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">

						<li><a href="#" data-toggle='modal'
							data-target='#SignUpModal'>ĐĂNG KÝ</a></li>
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
											placeholder="Sô điện thoại"></br> <input type="text"
											class="form-control" placeholder="Họ và tên"></br> <input
											type="text" class="form-control" placeholder="Mật khẩu"></br>
										<input type="text" class="form-control"
											placeholder="Năm sinh (VD:1999)"></br>
										<button type="submit"
											class="btn btn-default btn-success btn-block">ĐĂNG
											KÝ</button>
									</div>
								</div>
							</div>
						</div>
						<li><a href="#" data-toggle='modal' data-target='#LoginModal'>ĐĂNG
								NHẬP</a></li>
						<!-- Modal -->
						<div class="modal fade" id="LoginModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 style="color: red;">
											<span class="glyphicon glyphicon-lock"></span> ĐĂNG NHẬP
										</h4>
									</div>
									<div class="modal-body">
										<form role="form">
											<div class="form-group">
												<label for="usrname"><span
													class="glyphicon glyphicon-user"></span> Tên Đăng Nhập/ Số
													điện thoại</label> <input type="text" class="form-control"
													id="usrname" placeholder="Nhập email">
											</div>
											<div class="form-group">
												<label for="psw"><span
													class="glyphicon glyphicon-eye-open"></span> Mật Khẩu</label> <input
													type="text" class="form-control" id="psw"
													placeholder="Nhập password">
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

						<!-- Modal -->

					</ul>
				</div>
			</div>
			<!-- /.navbar-collapse -->


			<!--menu -------------------------------------------------------------- -->
			<div id="wrapper">
				<div id="head" class="clearfix">


					<div class="container" id="main" role="main">
						<ul class="menu">
							<li><a href="#">Ôn Thi THPT Quốc Gia</a></li>
							<li><a href="#s1">Thông Tin Trường </a>
								<ul class="submenu">
									<li><a href="#">Khu vực Miền Bắc</a></li>
									<li><a href="#">Khu vực Miền Trung</a></li>
									<li><a href="#">Khu vực miền Nam</a></li>
								</ul></li>
							<li class="active"><a href="#s2">Luyện Thi</a>
								<ul class="submenu">
									<li><a href="#">Toán Học</a></li>
									<li><a href="#">Vật Lý</a></li>
									<li><a href="#">Hóa Học</a></li>
									<li><a href="#">Tiếng Anh</a></li>
								</ul></li>
							<li><a href="#">Đề Thi</a>
								<ul class="submenu">
									<li><a href="#">Toán Học</a></li>
									<li><a href="#">Vật Lý</a></li>
									<li><a href="#">Hóa Học</a></li>
									<li><a href="#">Tiếng Anh</a></li>
								</ul></li>
							<li><a href="#">Hỏi - Đáp</a></li>
							<li><a href="#">Test IQ</a></li>

						</ul>
					</div>


				</div>
			</div>