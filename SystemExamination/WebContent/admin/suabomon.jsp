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
<link rel="stylesheet"
	href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
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
					<i class="fa fa-edit fa-2x"></i>Sửa bộ môn
				</h3>
			</div>
			<div class="noidungcon">
            <div class = "suabomon">
				<form>
					<div class="form-group">
						<label for="exampleInputEmail1">Tên bộ môn</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							placeholder="Tên bộ môn">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Tên Lớp</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							placeholder="Tên bộ môn">
					</div>
					<div class="form-group" height = "30px">
						<label for="exampleInputPassword1">Mô tả</label> <textarea
							type="text" class="form-control" id="exampleInputPassword1"
							placeholder="Mô tả" ></textarea>
					</div>
					<button type="submit" class="btn btn-default">Lưu</button>
				</form>
			</div>
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
