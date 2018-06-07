<%@page import="model.UserDetail"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Role"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="java.util.Map"%>
<% String userID = request.getParameter("userID"); 
	UserDetail us = UserDetailDAO.mapUserDetail.get(userID);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Thông tin người dùng</title>

<!-- datatable bootstrap -->
  	<!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  
    <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<!-- datatable bootstrap -->

<!-- Bootstrap core CSS -->
<link href="../../css/bootstrap.css" rel="stylesheet">
<!-- Add custom CSS here -->
 <link href="../../css/sb-admin.css" rel="stylesheet"> 
<link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
<!-- Page Specific CSS -->
<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
<!-- datatable bootstrap -->

</head>

<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<!-- menu -->
		<jsp:include page="../menu/menuLevel2.jsp"></jsp:include>
		<!--  hết menu -->
		<div class="noidung" style="margin-left:20px">
			<div class="row" style="margin-left:30px; margin-right:30px">
				<h2><strong>Thông tin tài khoản</strong>
					<a href="user.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
				
			</div>
			<div class="noidungcon">
			<div class=row>
				<div class= col-sm-11>
				<div class=row >
					<div  style="float:right;margin-left:20px">
						<a href="editDetail.jsp?userID=<%=userID%>"><button class="btn btn-lg glyphicon glyphicon-edit btn-success"></button></a>
					</div>
					<div style="float:right">
	                    <a href="../../User?action=DEL&userID=<%=userID%>"><button class=" btn btn-lg glyphicon glyphicon-trash btn-danger"></button></a>
					</div>
				</div>
				<table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Title</th>
                          <th>Describe</th>
                        </tr>
                      </thead>
                      <tbody>
	                      <tr>
	                      	<td>Name</td>
	                       	<td><%=us.getFullName() %></td>
	                      </tr>
	                      <tr>
	                      	<td>Gender</td>
	                       	 <td><%=us.getGender() %></td>
	                      </tr>
	                      <tr>
	                      	<td>Birthday</td>
	                       	<td><%=us.getBirthDay() %></td>
	                      </tr>
	                      <tr>
	                      	<td>PhoneNumber</td>
	                        <td><%=us.getPhoneNumber() %></td>
	                      </tr>
	                      <tr>
	                      	<td>Address</td>
	                     	 <td><%=us.getAddress() %></td>
	                      </tr>
	                      <tr>
	                      	<td>Avatar</td>
	                       	<td><img src="<%=us.getLinkImage() %>" width="50px" height="50px"></td>
	                      </tr>
	                      	
                      </tbody>
                    </table>
				</div>
			</div>
				
			</div>
		</div>
		</div>
		<!-- JavaScript -->
		<!-- <script src="../../js/jquery-1.10.2.js"></script>
		<script src="../../js/bootstrap.js"></script> -->

		<!-- Page Specific Plugins -->
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
		<script src="../../js/morris/chart-data-morris.js"></script>
		<script src="../../js/tablesorter/jquery.tablesorter.js"></script>
		<script src="../../js/tablesorter/tables.js"></script>
		
		<!-- datatable bootstrap -->
		 <!-- jQuery -->
	    <script src="../vendors/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap -->
	    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	    <!-- FastClick -->
	    
	    <!-- Datatables -->
	    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	
	    <!-- Custom Theme Scripts -->
	    <script src="../build/js/custom.min.js"></script>
		<!-- datatable bootstrap -->
</body>
</html>
