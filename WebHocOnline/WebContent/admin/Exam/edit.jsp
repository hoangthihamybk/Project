<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.ClassedDAO"%>
<%@page import="model.Classed"%>
<%@page import="dao.ExamDAO"%>
<%@page import="model.Exam"%>
<%@page import="dao.ExamDAO"%>
<%@page import="model.Exam"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="java.util.Map"%>
<% String examID = request.getParameter("examID"); 
	Exam us = ExamDAO.mapExam.get(examID);
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

<title>Sửa bài thi</title>

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
  		$('#editExam').bind({
  			'submit':function(){
  				if($('#examID').val()==''){
					$('#examID').css('box-shadow','0px 0px 2px 2px red');
					$('#error-examID').html('Bạn không được bỏ trống trường này!');
					$('#icon-examID').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
             	if($('#examName').val()==''){
					$('#examName').css('box-shadow','0px 0px 2px 2px red');
					$('#error-examName').html('Bạn không được bỏ trống trường này!');
					$('#icon-examName').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				
				if($('#describe').val()==''){
					$('#describe').css('box-shadow','0px 0px 2px 2px red');
					$('#error-describe').html('Bạn không được bỏ trống trường này!');
					$('#icon-describe').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#numberOfQuestion').val()==''){
					$('#numberOfQuestion').css('box-shadow','0px 0px 2px 2px red');
					$('#error-numberOfQuestion').html('Bạn không được bỏ trống trường này!');
					$('#icon-numberOfQuestion').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#time').val()==''){
					$('#time').css('box-shadow','0px 0px 2px 2px red');
					$('#error-time').html('Bạn không được bỏ trống trường này!');
					$('#icon-time').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#numberOfPeople').val()==''){
					$('#numberOfPeople').css('box-shadow','0px 0px 2px 2px red');
					$('#error-numberOfPeople').html('Bạn không được bỏ trống trường này!');
					$('#icon-numberOfPeople').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#linkContent').val()==''){
					$('#linkContent').css('box-shadow','0px 0px 2px 2px red');
					$('#error-linkContent').html('Bạn không được bỏ trống trường này!');
					$('#icon-linkContent').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#dateCreate').val()==''){
					$('#dateCreate').css('box-shadow','0px 0px 2px 2px red');
					$('#error-dateCreate').html('Bạn không được bỏ trống trường này!');
					$('#icon-dateCreate').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
				if($('#enable').val()==''){
					$('#enable').css('box-shadow','0px 0px 2px 2px red');
					$('#error-enable').html('Bạn không được bỏ trống trường này!');
					$('#icon-enable').html('<span class=" glyphicon glyphicon-remove"></span>');
					return false;
				}
			
					
					return true;	
				 },
		 'keyup':function(){
  					if($('#examID').val().length>0){
						$('#examID').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-examID').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-examID').html(' ');
					}
                	if($('#examName').val().length>0){
						$('#examName').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-examName').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-examName').html(' ');
					}
					if($('#describe').val().length>0){
						$('#describe').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-describe').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-describe').html(' ');
					}
					if($('#numberOfQuestion').val().length>0){
						$('#numberOfQuestion').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-numberOfQuestion').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-numberOfQuestion').html(' ');
					}
					if($('#time').val().length>0){
						$('#time').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-time').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-time').html(' ');
					}
					if($('#numberOfPeople').val().length>0){
						$('#numberOfPeople').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-numberOfPeople').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-numberOfPeople').html(' ');
					}
					if($('#linkContent').val().length>0){
						$('#linkContent').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-linkContent').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-linkContent').html(' ');
					}
					if($('#dateCreate').val().length>0){
						$('#dateCreate').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-dateCreate').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-dateCreate').html(' ');
					}
					if($('#enable').val().length>0){
						$('#enable').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-enable').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-enable').html(' ');
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
				<h2><strong>Sửa thông tin bài thi</strong>
				<a href="exam.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
			</div>
			<div class="noidungcon">
				<form id="editExam" data-parsley-validate class="form-horizontal form-label-left"  action="../../Examination?action=EDIT&examID=<%=examID %>" method="post">
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Mã bài thi<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="examID" name="ID" class="form-control col-md-7 col-xs-12" value="<%=us.getExamID()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-examID"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-examID"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mã lớp học<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                              	<select class="form-control" name="classID" id="">
							       <%Map<String,Classed> mapClass= ClassedDAO.mapClassed;
							       	for(Classed e : mapClass.values()){
							       %>
							        <option value="<%=e.getClassID()%>"><%=e.getClassName() %></option>
							       <%} %>
							      </select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-examName"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-examName"></p>	
							</div>
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Môn học <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <label for="sel2">Danh sách môn học:</label>
							      <select  class="form-control" name="subjectID" id="">
							       <%Map<String,Subject> mapSubject = SubjectDAO.mapSubject;
							       	for(Subject e : mapSubject.values()){
							       %>
							        <option value="<%=e.getSubjectID()%>"><%=e.getSubjectName() %></option>
							       <%} %>
							      </select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-listOfExamination"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-listOfExamination"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên bài thi <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="examName"  name="examName" class="form-control col-md-7 col-xs-12" value="<%=us.getExamName()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-examName"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-examName"></p>	
							</div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mô tả <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <textarea id="describe"  name="describe" class="form-control col-md-7 col-xs-12" ><%=us.getDescribe() %></textarea>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-describe"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-describe"></p>	
							</div>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Số câu hỏi <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="numberOfQuestion"  name="numberOfQuestion" class="form-control col-md-7 col-xs-12" value=<%=us.getNumberOfQuestions() %>>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-numberOfQuestion"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-numberOfQuestion"></p>	
							</div>
                        </div>
                      </div>
                      
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Thời gian làm bài <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
<%--                                  <input type="time" id="time"  name="time" class="form-control col-md-7 col-xs-12" value="<%=us.getTime()%>"> --%>
                                 <input type="number" id="time"  name="time" class="form-control col-md-7 col-xs-12" value=<%=us.getTime() %>>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-time"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-time"></p>	
							</div>
                        </div>
                      </div>
                      
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Number of people<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="numberOfPeople"  name="numberOfPeople" class="form-control col-md-7 col-xs-12" value="<%=us.getNumberOfPeople()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-numberOfPeople"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-numberOfPeople"></p>	
							</div>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Link nội dung<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="text" id="linkContent"  name="linkContent" class="form-control col-md-7 col-xs-12" value="<%=us.getLinkContent()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-linkContent"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-linkContent"></p>	
							</div>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Ngày tạo<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="date" id="dateCreate"  name="dateCreate" class="form-control col-md-7 col-xs-12" value="<%=us.getDateCreate()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-dateCreate"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-dateCreate"></p>	
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
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Sửa bài thi</button>
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
