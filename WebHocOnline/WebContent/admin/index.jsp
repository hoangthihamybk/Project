<%@page import="model.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%UserAccount us =(UserAccount) session.getAttribute("loginadmin");
if(us==null){
	response.sendRedirect("../index.jsp");
}
%>
<!DOCTYPE html>

	<head lang="en">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Admin</title>
	<!-- Bootstrap core CSS -->
	<link href="../css/bootstrap.css" rel="stylesheet">
	<link href="../css/menu.css" rel="stylesheet">
	<!-- Add custom CSS here -->
	<link href="../css/sb-admin.css" rel="stylesheet">
	<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
	<!-- Page Specific CSS -->
	<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 	Change style menu -->
<!--     <link href="../controlcolor/charisma-app.css" rel="stylesheet"> -->
<!--     <link href="../controlcolor/bootstrap-cerulean.min.css" rel="stylesheet"> -->
	</head>

<body> 
	<div id="wrapper"> 
		<!-- Sidebar -->
		<!-- menu -->
		<jsp:include page="menu/menu.jsp"></jsp:include>
		<!--  hết menu --> 
		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<div class="tieude"><h1>
						Dashboard <small></small>
					</h1>
					</div>
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-users fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading"></br></p>
									<p class="announcement-text">Quản lý tài khoản</p>
								</div>
							</div>
						</div>
						<a href="Account/user.jsp">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Xem</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-address-card-o fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading"></br></p>
									<p class="announcement-text">Quản lý phân quyền</p>
								</div>
							</div>
						</div>
						<a href="Role/role.jsp">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Xem</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-line-chart fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading"></br></p>
									<p class="announcement-text">Quản lý xếp hạng</p>
								</div>
							</div>
						</div>
						<a href="Rank/rank.jsp">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Xem</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-pie-chart fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading"></br></p>
									<p class="announcement-text">Quản lý đánh giá</p>
								</div>
							</div>
						</div>
						<a href="Evaluation/evaluation.jsp">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Xem</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="col-lg-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-6">
									<i class="fa fa-sticky-note-o fa-5x"></i>
								</div>
								<div class="col-xs-6 text-right">
									<p class="announcement-heading"></br></p>
									<p class="announcement-text">Quản lý bài thi</p>
								</div>
							</div>
						</div>
						<a href="Exam/exam.jsp">
							<div class="panel-footer announcement-bottom">
								<div class="row">
									<div class="col-xs-6">Xem</div>
									<div class="col-xs-6 text-right">
										<i class="fa fa-arrow-circle-right"></i>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>

			<div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<i class="fa fa-calendar fa-5x"></i>
							</div>
							<div class="col-xs-6 text-right">
								<p class="announcement-heading"></br></p>
								<p class="announcement-text">Quản lý lớp học</p>
							</div>
						</div>

					</div>
					<a href="Classed/classed.jsp">
						<div class="panel-footer announcement-bottom">
							<div class="row">
								<div class="col-xs-6">Xem</div>
								<div class="col-xs-6 text-right">
									<i class="fa fa-arrow-circle-right"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>

            <div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<i class="fa fa-book fa-5x"></i>
							</div>
							<div class="col-xs-6 text-right">
								<p class="announcement-heading"></br></p>
								<p class="announcement-text">Quản lý môn học</p>
							</div>
						</div>

					</div>
					<a href="Subject/subject.jsp">
						<div class="panel-footer announcement-bottom">
							<div class="row">
								<div class="col-xs-6">Xem</div>
								<div class="col-xs-6 text-right">
									<i class="fa fa-arrow-circle-right"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			
			<div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<i class="fa fa-navicon fa-5x"></i>
							</div>
							<div class="col-xs-6 text-right">
								<p class="announcement-heading"></br></p>
								<p class="announcement-text">Quản lý bảng điểm</p>
							</div>
						</div>

					</div>
					<a href="ScoreBoard/score.jsp">
						<div class="panel-footer announcement-bottom">
							<div class="row">
								<div class="col-xs-6">Xem</div>
								<div class="col-xs-6 text-right">
									<i class="fa fa-arrow-circle-right"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

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
