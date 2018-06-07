<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<title>Demo</title>
<link href="../css/bang.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="../css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
<!-- Page Specific CSS -->
<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<!-- menu -->
		<jsp:include page="menu/menu.jsp"></jsp:include>
		<!--  hết menu -->
		<div class="noidung">
			<div class="tieude">
				<h3>
					<i class="fa fa-edit fa-2x"></i>Danh sách học sinh
				</h3>
			</div>
			<div class="noidungcon">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Nhập thông tin cần tìm..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Tìm kiếm</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
				<h5><i>Chú ý: Admin có thể xóa tài khoản của học sinh nào vi phạm nghiêm trọng nội quy của hệ thống</i></h5>
				</br>
				<table class="zui-table zui-table-horizontal zui-table-highlight">
					<thead>
						<tr>
							<th>Số thứ tự</th>
							<th>Họ tên</th>
							<th>Giới tính</th>
							<th>Ngày sinh</th>
							<th>Số điện thoại</th>
							<th>Địa chỉ</th>							
							<th>Email</th>
							<th>Mật khẩu</th>
							<th>Xóa</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Nguyễn Thị A</td>
							<td>a@gmail.com</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>							
							<td><a href="#"><i class="fa fa-trash-o fa-2x fa-border"></td>
						</tr>
						<tr>
							<td>1</td>
							<td>Nguyễn Thị A</td>
							<td>a@gmail.com</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>							
							<td><i class="fa fa-eye fa-2x fa-border"><a href="#"><i class="fa fa-trash-o fa-2x fa-border"></td>
						</tr>
						<tr>
							<td>1</td>
							<td>Nguyễn Thị A</td>
							<td>a@gmail.com</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>
							<td>12345678</td>							
							<td><a href="#"><i class="fa fa-eye fa-2x fa-border"><i class="fa fa-trash-o fa-2x fa-border"></td>
						</tr>					
					</tbody>
				</table>

			</div>
		</div>
		<!-- /#wrapper -->

		<!-- JavaScript -->
		<script src="../js/jquery-1.10.2.js"></script>
		<script src="../js/bootstrap.js"></script>

		<!-- Page Specific Plugins -->
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
		<script src="../js/morris/chart-data-morris.js"></script>
		<script src="../js/tablesorter/jquery.tablesorter.js"></script>
		<script src="../js/tablesorter/tables.js"></script>
</body>
</html>
