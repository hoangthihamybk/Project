<%@page import="dao.RoleDAO"%>
<%@page import="model.Role"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Thêm người dùng</title>

<!-- Bootstrap core CSS -->
<link href="../../css/bootstrap.css" rel="stylesheet">
<!-- Add custom CSS here -->
 <link href="../../css/sb-admin.css" rel="stylesheet"> 
<link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
<!-- Page Specific CSS -->
<link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">

<!-- datatable bootstrap -->
    <!-- Custom Theme Style -->
    <!-- jQuery -->
	    <script src="../vendors/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap -->
	    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
  	$(document).ready(function(){
  		function validatePhone(txtPhone) {
  		    var filter = /^[0-9-+]+$/;
  		    if (filter.test(txtPhone+"") && txtPhone.length>=10 && txtPhone.length<12 ) {
  		        return true;
  		    }  else { return false; }
  		}
  		function validateEmail(sEmail) {
  		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  		    if (filter.test(sEmail) ) {
  		        return true;
  		    }  else { return false; }
  		}
  		$('#addUser').bind({
  			'submit':function(){
                        if($('#userID').val()==''){
  							$('#userID').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-userID').html('Bạn không được bỏ trống trường này!');
  							$('#icon-userID').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                        if(!validateEmail($('#email').val())){
  							$('#email').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-email').html(' Bạn nhập email sai định dạng!!! ');
  							$('#icon-email').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						
  						if($('#password').val()==''){
  							$('#password').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-password').html('Bạn không được bỏ trống trường này!');
  							$('#icon-password').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						
  						return true;	
  					 },
  			 'keyup':function(){
                        if($('#userID').val().length>0){
  							$('#userID').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-userID').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-userID').html(' ');
  						}
                        if($('#email').val().length>0){
  							$('#email').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-email').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-email').html(' ');
  						}
  						if($('#password').val().length>0){
  							$('#password').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-password').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-password').html(' ');
  						}
  						
  						
  			 		  },
  			}
  		);
  	});
  </script>
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<!-- datatable bootstrap -->

</head>

<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<!-- menu -->
		<jsp:include page="../menu/menuLevel2.jsp"></jsp:include>
		<!--  hết menu -->
		<div class="noidung">
			<!-- <div class="tieude">
				<h3> <i class="fa fa-edit fa-1x"></i>Danh sách học sinh </h3>
			</div> -->
			<div class="row" style="margin-left:30px; margin-right:30px">
				<h2><strong>Thêm tài khoản mới</strong>
				<a href="user.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
			</div>
			<div class="noidungcon">
				<form id="addUser" data-parsley-validate class="form-horizontal form-label-left"  action="../../User?action=ADD" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Mã tài khoản<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="userID" name="userID" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-userID"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-userID"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="email"  name="email" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-email"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-email"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="password" id="password"  name="password" class="form-control col-md-7 col-xs-12" value="">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-password"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-password"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Role <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                              	 <select class="form-control" id="role" name="role">
						             <%for(Role r: RoleDAO.mapRole.values()){ %>
										<option value="<%=r.getRoleID()%>"><%=r.getRoleName() %></option>
									<%} %>
								   </select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-role"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-role"></p>	
							</div>
                        </div>
                      </div>
                     
                   
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Thêm tài khoản</button>
                        </div>
                      </div>

                    </form>
				
				
			</div>
		</div>
		<!-- datatable bootstrap -->
	    <!-- FastClick -->
	    <script src="../vendors/fastclick/lib/fastclick.js"></script>
	    <!-- NProgress -->
	    <script src="../vendors/nprogress/nprogress.js"></script>
	    <!-- bootstrap-progressbar -->
	    <script src="../endors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	    <!-- iCheck -->
	    <script src="../vendors/iCheck/icheck.min.js"></script>
	    <!-- bootstrap-daterangepicker -->
	    <script src="../vendors/moment/min/moment.min.js"></script>
	    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	    <!-- bootstrap-wysiwyg -->
	    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
	    <!-- jQuery Tags Input -->
	    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	    <!-- Switchery -->
	    <script src="../vendors/switchery/dist/switchery.min.js"></script>
	    <!-- Select2 -->
	    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
	    <!-- Parsley -->
	    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
	    <!-- Autosize -->
	    <script src="../vendors/autosize/dist/autosize.min.js"></script>
	    <!-- jQuery autocomplete -->
	    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	    <!-- starrr -->
	    <script src="../vendors/starrr/dist/starrr.js"></script>
	    <!-- Custom Theme Scripts -->
	    <script src="../build/js/custom.min.js"></script>
		<!-- datatable bootstrap -->
</body>
</html>
