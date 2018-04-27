<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel="stylesheet" href="css/styleLogin.css">

</head>

<body>

	<div class="form">

		<ul class="tab-group">
			<li class="tab active"><a href="#signup">Đăng Kí</a></li>
			<li class="tab"><a href="#login">Đăng Nhập</a></li>
		</ul>

		<div class="tab-content">
			<div id="signup">
				<h1>
					<span class="glyphicon glyphicon-pencil"></span> Đăng kí
				</h1>

				<form action="Login?action=SignUp" method="post">


					
					<div class="field-wrap">
						<label> Email<span class="req">*</span>
						</label> <input type="email" name="email" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Mật khẩu<span class="req">*</span>
						</label> <input type="password" name="password" required autocomplete="off" />
					</div>
					
					<div class="form-group">
					  <label for="sel1">Bạn là ai?:</label>
					  <select name="role" class="form-control" id="sel1">
					    <option value="Teacher">Teacher</option>
					    <option value="Student">Student</option>
					    <option value="None">Người lạ</option>
					  </select>
					</div>

					<button type="submit" class="button button-block" /> ĐĂNG KÝ </button>

				</form>

			</div>

			<div id="login">
				<h1>Chào mừng bạn đến với Học Online!</h1>

				<form action="Login?action=SignIn" method="post">

					<div class="field-wrap">
						<label> Email <span class="req">*</span>
						</label> <input type="email" name="email" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Mật khẩu<span class="req">*</span>
						</label> <input type="password" name="password" required autocomplete="off" />
					</div>

					<p class="forgot">
						<a href="#">Quên mật khẩu?</a>
					</p>
					</br>

					<button type="submit" class="button button-block" />
						<span class="glyphicon glyphicon-log-in"></span> ĐĂNG NHẬP
					</button>

				</form>

			</div>

		</div>
		<!-- tab-content -->

	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



	<script src="js/LoginSignup.js"></script>




</body>

</html>
