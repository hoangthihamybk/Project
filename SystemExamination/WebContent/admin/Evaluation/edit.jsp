<%@page import="model.Evaluation"%>
<%@page import="dao.EvaluationDAO"%>
<%@page import="dao.RankDAO"%>
<%@page import="model.Rank"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Role"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="java.util.Map"%>
<% String evaluationID = request.getParameter("evaluationID"); 
	Evaluation us = EvaluationDAO.mapEvaluation.get(evaluationID);
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

<title>Sửa quyền người dùng</title>

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
  		$('#editEvaluation').bind({
  			'submit':function(){
	  				 if($('#evaluationID').val()==''){
							$('#evaluationID').css('box-shadow','0px 0px 2px 2px red');
							$('#error-evaluationID').html('Bạn không được bỏ trống trường này!');
							$('#icon-evaluationID').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
							return false;
						}
	                 if($('#title').val()==''){
							$('#title').css('box-shadow','0px 0px 2px 2px red');
							$('#error-title').html('Bạn không được bỏ trống trường này!');
							$('#icon-title').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
							return false;
						}
	                 if($('#content').val()==''){
							$('#content').css('box-shadow','0px 0px 2px 2px red');
							$('#error-content').html('Bạn không được bỏ trống trường này!');
							$('#icon-content').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
							return false;
						}
	                 if($('#pertence').val()==''){
							$('#pertence').css('box-shadow','0px 0px 2px 2px red');
							$('#error-pertence').html('Bạn không được bỏ trống trường này!');
							$('#icon-pertence').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
							return false;
						}
  						return true;	
  					 },
  			 'keyup':function(){
		  				if($('#evaluationID').val().length>0){
								$('#evaluationID').css('box-shadow','0px 0px 1px 1px green');
								$('#icon-evaluationID').html('<span class="glyphicon glyphicon-ok "></span>');
								$('#error-evaluationID').html(' ');
							}
		                if($('#title').val().length>0){
								$('#title').css('box-shadow','0px 0px 1px 1px green');
								$('#icon-title').html('<span class="glyphicon glyphicon-ok "></span>');
								$('#error-title').html(' ');
							}
		                if($('#content').val().length>0){
								$('#content').css('box-shadow','0px 0px 1px 1px green');
								$('#icon-content').html('<span class="glyphicon glyphicon-ok "></span>');
								$('#error-content').html(' ');
							}
		                if($('#pertence').val().length>0){
								$('#pertence').css('box-shadow','0px 0px 1px 1px green');
								$('#icon-pertence').html('<span class="glyphicon glyphicon-ok "></span>');
								$('#error-pertence').html(' ');
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
				<h2><strong>Sửa xếp hạng</strong>
				<a href="evaluation.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
			</div>
			<div class="noidungcon">
				<form id="editEvaluation"  class="form-horizontal form-label-left"  action="../../Evaluation?action=EDIT&evaluationID=<%=evaluationID %>" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Mã đánh giá<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="evaluationID" name="ID" class="form-control col-md-7 col-xs-12" value="<%=us.getEvaluationID()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-evaluationID"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-evaluationID"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Title<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12" value="<%=us.getTitle()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-title"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-title"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Content<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <textarea id="content" name="content" class="form-control col-md-7 col-xs-12" ><%=us.getContent() %></textarea> 
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-content"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-content"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Percentage of score<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="number" id="pertence" name="percentageOfPoint" class="form-control col-md-7 col-xs-12" value="<%=us.getPercentageOfPoint()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-pertence"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-pertence"></p>	
							</div>
                        </div>
                      </div>
 						
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Enable <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="row">
                               <div class="col-sm-8">
                              	 <select class="form-control" id="enable" name="enable">
										<option value="TRUE" selected="selected">TRUE</option>
										<option value="FALSE">FALSE</option>
								   </select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-enable"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-enable"></p>	
							</div>
                        </div>
                      </div>
                     
                   
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Sửa đánh giá</button>
                        </div>
                      </div>

                    </form>
				
				
			</div>
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
