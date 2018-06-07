<%@page import="dao.EvaluationDAO"%>
<%@page import="model.Evaluation"%>
<%@page import="model.ScoreBoard"%>
<%@page import="dao.ScoreBoardDAO"%>
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
<% String scoreBoardID = request.getParameter("scoreBoardID"); 
	ScoreBoard us = ScoreBoardDAO.mapScoreBoard.get(scoreBoardID);
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

<title>Sửa bảng điểm</title>

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
  		$('#editScoreBoard').bind({
  			'submit':function(){
  				 	if($('#ScoreBoardID').val()==''){
						$('#ScoreBoardID').css('box-shadow','0px 0px 2px 2px red');
						$('#error-ScoreBoardID').html('Bạn không được bỏ trống trường này!');
						$('#icon-ScoreBoardID').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
             		 if($('#timeEnd').val()==''){
						$('#timeEnd').css('box-shadow','0px 0px 2px 2px red');
						$('#error-timeEnd').html('Bạn không được bỏ trống trường này!');
						$('#icon-timeEnd').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					
					if($('#numberOfCorrect').val()==''){
						$('#numberOfCorrect').css('box-shadow','0px 0px 2px 2px red');
						$('#error-numberOfCorrect').html('Bạn không được bỏ trống trường này!');
						$('#icon-numberOfCorrect').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#score').val()==''){
						$('#score').css('box-shadow','0px 0px 2px 2px red');
						$('#error-score').html('Bạn không được bỏ trống trường này!');
						$('#icon-score').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#accumulatedPoints').val()==''){
						$('#accumulatedPoints').css('box-shadow','0px 0px 2px 2px red');
						$('#error-accumulatedPoints').html('Bạn không được bỏ trống trường này!');
						$('#icon-accumulatedPoints').html('<span class=" glyphicon glyphicon-remove"></span>');
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
	  					if($('#ScoreBoardID').val().length>0){
							$('#ScoreBoardID').css('box-shadow','0px 0px 1px 1px green');
							$('#icon-ScoreBoardID').html('<span class="glyphicon glyphicon-ok "></span>');
							$('#error-ScoreBoardID').html(' ');
						}
	               		 if($('#timeEnd').val().length>0){
							$('#timeEnd').css('box-shadow','0px 0px 1px 1px green');
							$('#icon-timeEnd').html('<span class="glyphicon glyphicon-ok "></span>');
							$('#error-timeEnd').html(' ');
						}
						if($('#numberOfCorrect').val().length>0){
							$('#numberOfCorrect').css('box-shadow','0px 0px 1px 1px green');
							$('#icon-numberOfCorrect').html('<span class="glyphicon glyphicon-ok "></span>');
							$('#error-numberOfCorrect').html(' ');
						}
						if($('#score').val().length>0){
							$('#score').css('box-shadow','0px 0px 1px 1px green');
							$('#icon-score').html('<span class="glyphicon glyphicon-ok "></span>');
							$('#error-score').html(' ');
						}
						if($('#accumulatedPoints').val().length>0){
							$('#accumulatedPoints').css('box-shadow','0px 0px 1px 1px green');
							$('#icon-accumulatedPoints').html('<span class="glyphicon glyphicon-ok "></span>');
							$('#error-accumulatedPoints').html(' ');
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
				<a href="score.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
				</h2>
				<hr>
			</div>
			<div class="noidungcon">
				<form id="editScoreBoard"  class="form-horizontal form-label-left"  action="../../ScoreBoard?action=EDIT&scoreBoardID=<%=scoreBoardID %>" method="post">
 					<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" id="">Mã bảng điểm<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                <input type="text" id="ScoreBoardID" name="ID" class="form-control col-md-7 col-xs-12" value="<%=us.getSBID()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-ScoreBoardID"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-ScoreBoardID"></p>	
							</div>
                        </div>
                      </div>
 						<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">User ID<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                              	<select class="form-control" name="userID" id="">
							       <%Map<String,UserAccount> mapUser= UserDAO.mapUser;
							       	for(UserAccount e : mapUser.values()){
							       %>
							        <option value="<%=e.getUserID()%>"><%=UserDetailDAO.mapUserDetail.get(e.getUserID()).getFullname() %></option>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Exam ID<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                               <div class="col-sm-8">
                              	<select class="form-control" name="examID" id="">
							       <%Map<String,Exam > mapExam = ExamDAO.mapExam;
							       	for(Exam e : mapExam.values()){
							       %>
							        <option value="<%=e.getExamID()%>"><%=e.getExamName() %></option>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Time end <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="timeEnd"  name="timeEnd" class="form-control col-md-7 col-xs-12" value="<%=us.getTimeEnd() %>" >
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-timeEnd"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-timeEnd"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Number of correct sentences <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="numberOfCorrect"  name="numberOfCorrect" class="form-control col-md-7 col-xs-12" value="<%=us.getNumberOfCorrectSentences()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-numberOfCorrect"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-numberOfCorrect"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Score <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <input type="number" id="score"  name="score" class="form-control col-md-7 col-xs-12" value="<%=us.getScoreBoard()%>">
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-score"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-score"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Evaluation ID <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                 <label for="sel2">List of evaluation </label>
							      <select  class="form-control" name="evaluationID" id="">
							       <%Map<String,Evaluation> mapEvaluation = EvaluationDAO.mapEvaluation;
							       	for(Evaluation e : mapEvaluation.values()){
							       %>
							        <option value="<%=e.getEvaluationID()%>"><%=e.getContent() %></option>
							       <%} %>
							      </select>
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-score"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-score"></p>	
							</div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Accumullate Points<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="row">
                               <div class="col-sm-8">
                                  <input type="number" id="accumulatedPoints"  name="accumulatedPoints" class="form-control col-md-7 col-xs-12" value="<%=us.getAccumulatedPoints()%>">
                              
                               </div>
                               <div class="col-sm-2">
                                <p id="icon-accumulatedPoints"></p>
                               </div>
							</div>
							<div class="row">
							    <p style="color: red" id="error-accumulatedPoints"></p>	
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
                          <button type="submit" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Sửa phân quyền</button>
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
