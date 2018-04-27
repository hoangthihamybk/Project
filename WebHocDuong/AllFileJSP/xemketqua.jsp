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
					<i class="fa fa-edit fa-2x"></i>Danh sách kết quả
				</h3>
			</div>
			<div class="noidungcon">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
				<table class="zui-table zui-table-horizontal zui-table-highlight">
				<thead>
					<tr>
						<th>Tên học sinh</th>
						<th>Tên bài thi</th>
						<th>Ngày thi</th>
						<th>Điểm cao nhất</th>
						<th>Số bài thi</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Nguyễn Thị A</td>
						<td>Toán - THPT Chuyên Bắc Ninh</td>
						<td>23/4/2018</td>
						<td>8,6</td>
						<td>3</td>
					</tr>
					<tr>
						<td>Nguyễn Thị A</td>
						<td>Toán - THPT Chuyên Bắc Ninh</td>
						<td>23/4/2018</td>
						<td>8,6</td>
						<td>3</td>
					</tr>
					<tr>
						<td>Nguyễn Thị A</td>
						<td>Toán - THPT Chuyên Bắc Ninh</td>
						<td>23/4/2018</td>
						<td>8,6</td>
						<td>3</td>
					</tr>
					<tr>
						<td>Nguyễn Thị A</td>
						<td>Toán - THPT Chuyên Bắc Ninh</td>
						<td>23/4/2018</td>
						<td>8,6</td>
						<td>3</td>
					</tr>
					<tr>
						<td>Nguyễn Thị A</td>
						<td>Toán - THPT Chuyên Bắc Ninh</td>
						<td>23/4/2018</td>
						<td>8,6</td>
						<td>3</td>
					</tr>
				</tbody>
			</table>

			</div>
		</div>
		<!-- /#wrapper -->

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
