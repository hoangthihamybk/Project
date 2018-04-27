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
							<th>Tên bộ môn</th>
							<th>Tên lớp</th>
							<th>Mô tả</th>
							<th>Tùy chọn</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Toán học</td>
							<td>12</td>
							<td>Toán học gồm những bài thi thử với thời gian 90 phút. Bộ
								đề có 50 câu.</td>
							<td><a href="suabomon.jsp"><i class="fa fa-edit fa-2x fa-border"
									style="color: #2980b9"></i></a> <a href="#"><i
									class="fa fa-trash-o fa-2x fa-border"></i></a></td>
						</tr>
						<tr>
							<td>Hóa học</td>
							<td>10</td>
							<td>Hóa học gồm những bài thi thử với thời gian 90 phút. Bộ
								đề có 50 câu.</td>
							<td><a href="suabomon.jsp"><i class="fa fa-edit fa-2x fa-border"
									style="color: #2980b9"></i></a> <a href="#"><i
									class="fa fa-trash-o fa-2x fa-border"></i></a></td>
						</tr>
						<tr>
							<td>Vậy lý</td>
							<td>11</td>
							<td>Vậy lý gồm những bài thi thử với thời gian 90 phút. Bộ
								đề có 50 câu.</td>
							<td><a href="suabomon.jsp"><i class="fa fa-edit fa-2x fa-border"
									style="color: #2980b9"></i></a> <a href="#"><i
									class="fa fa-trash-o fa-2x fa-border"></i></a></td>
						</tr>
						<tr>
							<td>Sinh học</td>
							<td>12</td>
							<td>Sinh học gồm những bài thi thử với thời gian 90 phút. Bộ
								đề có 50 câu.</td>
							<td><a href="suabomon.jsp"><i class="fa fa-edit fa-2x fa-border"
									style="color: #2980b9"></i></a> <a href="#"><i
									class="fa fa-trash-o fa-2x fa-border"></i></a></td>
						</tr>
						<tr>
							<td>Tiếng anh</td>
							<td>12</td>
							<td>Tiếng anh học gồm những bài thi thử với thời gian 90
								phút. Bộ đề có 50 câu.</td>
							<td><a href="suabomon.jsp"><i class="fa fa-edit fa-2x fa-border"
									style="color: #2980b9"></i></a> <a href="#"><i
									class="fa fa-trash-o fa-2x fa-border"></i></a></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
 

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/bootstrap.js"></script>

    <!-- Page Specific Plugins -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="../js/morris/chart-data-morris.js"></script>
    <script src="../js/tablesorter/jquery.tablesorter.js"></script>
    <script src="../js/tablesorter/tables.js"></script>

  </body>
</html>
    
