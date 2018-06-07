<%@page import="dao.RankDAO"%>
<%@page import="model.Rank"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%UserAccount us =(UserAccount) session.getAttribute("loginadmin");
if(us==null){
	response.sendRedirect("../../index.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<title>Quản lý bảng xếp hạng</title>

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

 <link href="../../css/bang.css" rel="stylesheet"> 
<!-- Bootstrap core CSS -->
<link href="../../css/bootstrap.css" rel="stylesheet">
<!-- Add custom CSS here -->
 <link href="../../css/sb-admin.css" rel="stylesheet"> 
<link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
<!-- Page Specific CSS -->
<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
</head>

<body>

	<div id="wrapper">
		<!-- Sidebar -->
		<!-- menu -->
		<jsp:include page="../menu/menuLevel2.jsp"></jsp:include>
		<!--  hết menu -->
		<div class="noidung">
			<div class="tieude">
				<h3> <i class="fa fa-edit fa-1x"></i>Danh sách xếp hạng các thành viên</h3>
			</div>
			<div class="noidungcon">
				<div class="row">
					<div class="col-sm-11">
					 <div class="row" style="float:right;margin-top:30px;">    
                     <a href="add.jsp"> 
                         <button type="button" class="btn btn-sm btn-success" aria-label="Right Align">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"> </span>   Thêm Rank
				        </button></a>
				          <a href="../../Rank?action=DelAll"><button class="btn btn-sm btn-danger" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a>
                     <%if(!RankDAO.mapUndo.isEmpty()){ 
                    	 UndoDAO.undoRank.clear();
                     %>
		                    <a href="../../Rank?action=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
		                    <%} %>
		                  <%if(!UndoDAO.undoRank.isEmpty()){ %>
		                     <a href="../../Rank?action=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
		                   <%} %>
                    </div>
                    
					<table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>RankID</th>
                          <th>Full Name</th>
                          <th>Rank</th>
                          <th>Enable</th>
                          <th>Edit</th>
                          <th>Delete</th>
                        </tr>
                      </thead>
                      <tbody>
					<%Map<String,Rank> mapRank = RankDAO.mapRank;
						for(Rank u : mapRank.values()){
					%>
                        <tr>
                          <td><%=u.getRankID() %></td>
                          <td><%=UserDetailDAO.mapUserDetail.get(u.getUserID()).getFullname() %></td>
                          <td><%=u.getRank() %></td>
                          <td><%=u.getEnable() %></td>
                          <td><center><a href="edit.jsp?rankID=<%=u.getRankID()%>"><button class="btn btn-sm glyphicon glyphicon-edit btn-success"></button></a></center></td>
                          <td><center><a href="../../Rank?action=DEL&rankID=<%=u.getRankID()%>"><button class=" btn btn-sm glyphicon glyphicon-trash btn-danger"></button></a></center></td>
                        </tr>
                       <%} %>
                     
                      </tbody>
                    </table>
						
					</div>
				</div>
				
			</div>
		</div>
		<!-- /#wrapper -->

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
