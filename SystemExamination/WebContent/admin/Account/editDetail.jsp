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

<title>Sửa người dùng</title>

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
  		    }
  		    else {
  		        return false;
  		    }
  		}
  		function validateEmail(sEmail) {
  		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  		    if (filter.test(sEmail) ) {
  		        return true;
  		    }
  		    else {
  		        return false;
  		    }
  		}
  		$('#editDetail').bind({
  			'submit':function(){
  						if($('#fullname').val()==''){
  							$('#fullname').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-fullname').html('Bạn không được bỏ trống trường này!');
  							$('#icon-fullname').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						} 
                        if(!validatePhone($('#phoneNumber').val())){
  							$('#phoneNumber').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-phoneNumber').html('Số điện thoại bạn nhập không đúng!!! ');
  							$('#icon-phoneNumber').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#address').val()==''){
  							$('#address').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-address').html('Bạn không được bỏ trống trường này!');
  							$('#icon-address').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
                      
                       
  						
  						return true;	
  					 },
  			 'keyup':function(){
  						if($('#fullname').val().length>0){
  							$('#fullname').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-fullname').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-fullname').html(' ');
  						}  						
                        if($('#phoneNumber').val().length>0){
  							$('#phoneNumber').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-phoneNumber').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-phoneNumber').html(' ');
  						}
  						if($('#address').val().length>0){
  							$('#address').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-address').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-address').html(' ');
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
			<div class="row" style="margin-left:30px; margin-right:30px">
				<h2><strong>Sửa thông tin tài khoản</strong>
				<a href="infoUser.jsp?userID=<%=userID%>" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
			</div>
			<div class="noidungcon">
				<form id="editDetail"  class="form-horizontal form-label-left"  action="../../User?action=EDIT_USER_DETAIL&userID=<%=userID %>" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Full Name<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="fullname" name="fullname" class="form-control col-md-7 col-xs-12" value="<%=us.getFullName()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-fullname"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-fullname"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Gender <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                               	 <select class="form-control" id="gender" name="gender">
										<option value="Nam" selected="selected">Nam</option>
										<option value="Nu">Nữ</option>
										</select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-gender"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-gender"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Birthday <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="date" id="date"  name="birthday" class="form-control col-md-7 col-xs-12" value="<%=us.getBirthDay()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-date"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-date"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Phone Number <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="phoneNumber"  name="phoneNumber" class="form-control col-md-7 col-xs-12" value="<%=us.getPhoneNumber()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-phoneNumber"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-phoneNumber"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="address"  name="address" class="form-control col-md-7 col-xs-12" value="<%=us.getAddress()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-address"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-address"></p>	
							</div>
                        </div>
                      </div>
                     
                   
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Sửa tài khoản</button>
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
