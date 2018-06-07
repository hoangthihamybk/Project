<%@page import="java.util.StringTokenizer"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.ExamDAO"%>
<%@page import="model.Exam"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String examID = request.getParameter("examID");
	StringTokenizer st = new StringTokenizer(examID,"-");
	st.nextToken();
  	String level = st.nextToken();
  	
%>
<%if(examID==null) response.sendRedirect("index.jsp"); %>
<%Exam e = ExamDAO.mapExam.get(examID); %>
<!DOCTYPE html >
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<jsp:include page="lib-css/css.jsp"></jsp:include>

	<style type="text/css">
		.tags {
			width: 79%;
			margin: 0 auto;
			padding: 15px;
			margin-top: 5px;
			text-align: left;
		}
		
		.form-tag {
			display: none;
			padding: 3px;
		}
	</style>
<jsp:include page="lib-js/js.jsp"></jsp:include>


<script  type="text/javascript" src="../js/theme/hoc/js/tag.js"></script>
<link rel="stylesheet" type="text/css" href="../css/theme/hoconline/jquery.tagsinput.css" />
<script type="text/javascript"
						src="../js/theme/hoconline/jquery.tagsinput.js"></script>
</head>
<body class="mod-quiz mod-quiz-view course-134 lang-vi_utf8"
	id="mod-quiz-view">
	<div id="fb-root"></div>
	<div id="page">
		<!--  -->
		<jsp:include page="../header/header1.jsp"></jsp:include>
		<!--  -->
		<script src="/theme/new2/js/quiz/script.js?v=1.0"
			type="text/javascript"></script>
		<div class="quiz-test" id="quiz-content">
			<div class="wrapper clearfix">
				<div id="breadcrumbs" class="breadcrumbs" style="margin-top: -10px;">
					<a class="home-1-icon" href="index.jsp">Trang chủ</a> > <a target="_top"
						href="index.jsp" ><%=e.getExamName() %></a> > 
						<a target="_top" href="index.jsp" > <%=e.getDescribe() %></a>
				</div>


				<div align="center"></div>
				<div class="box-wrapper">
					<div class="panel panel-primary panel-quiz-info">
						<div class="panel-heading text-center">
							<h3 class="panel-title"><%=e.getDescribe() %></h3>
						</div>
						<div class="panel-body text-center">
							<h3> Môn: <%=SubjectDAO.mapSubject.get(e.getSubjectID()).getSubjectName() %> <br /><%=e.getDescribe() %></h3>

							<p> <em>(Đề kiểm tra có: <%=e.getNumberOfQuestions() %> câu hỏi)</em> </p>
							<p> <em>Thời gian làm bài: <%=e.getTime() %> phút </em> </p>
							
							<div id="timer" style="display: none">
								<!--EDIT BELOW CODE TO YOUR OWN MENU-->
								<div class="timer-body">
									<form id="clock">
										<span class="clock-title">Thời gian hiện tại:</span> <input
											onfocus="blur()" type="text" id="time" class="time-clock"
											size="8" />  
									</form>
								<%if(level.equals("CB")){ %>
									<a href="examcontent.jsp?examID=<%=e.getExamID()%>&eval=DE">
										<button class="start-test btn btn-primary" >LÀM ĐỀ DỄ</button>
									</a>
									<a href="examcontent.jsp?examID=<%=e.getExamID()%>&eval=TB">
										<button class="start-test btn btn-primary" >LÀM ĐỀ TRUNG BÌNH</button>
									</a>
								<%} else{%>
									<a href="examcontent.jsp?examID=<%=e.getExamID()%>&eval=KHO">
										<button class="start-test btn btn-primary" >BẮT ĐẦU LÀM BÀI</button>
									</a>
								<%} %>
								</div>
								<!--END OF EDIT-->
							</div>
							
						</div>
					</div>

					<div class="panel panel-default panel-quiz-sum">
						<div class="panel-body clearfix">
							<div class="quiz_numberattempts">Số người làm bài: <%=e.getNumberOfPeople() %></div>
							<div class="social-follow">
								<div style="margin: 0 10px;" class="fb-like "
									data-href=""
									data-width="160" data-layout="button_count" data-action="like"
									data-show-faces="false" data-share="true"></div>
							</div>
						</div>
					</div>

					
					
					<div class="tags"></div>
				</div>


			</div>
		</div>


		<footer> <jsp:include page="../footer/footerlevel1.jsp"></jsp:include>
		</footer>

	</div>
	<jsp:include page="modal/modal-infoexam.jsp"></jsp:include>
	<div id="WapperPopupTestPenI"></div>
	<script type="text/javascript"
		src="https://hocmai.vn/php_javascript/popup-pen-m.php"></script>

	<!--<script type="text/javascript" src="/xac-nhan-chuyen-tien/warning.php"></script>-->
	<div style="position: absolute; z-index: -100; bottom: 0;"></div>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			var d = new Date();
			var time = d.getTime();
			$.ajax({
				url : "/settheme.php",
				type : "GET",
				data : {
					t : time
				}
			});
		});
	</script>
	<script language="javascript" type="text/javascript">
		var timesup = "Thời gian vượt quá !";
		//var quizclose = -1525330077; // in seconds
		var quizopen = 0; // in seconds
		//var quizTimerValue = ; // in seconds
		var curtime = 1525280400; // in seconds
		
		//parseInt(quizTimerValue);
		
		// @EC PF : client time when page was opened
		var ec_page_start = new Date().getTime();
		// @EC PF : client time when quiz should end
		var ec_quiz_finish = 49677000;
	</script>
<script language="javascript" type="text/javascript" src="https://hocmai.vn/mod/quiz/timer.js"></script>
<script language="javascript" type="text/javascript">
	 var timerbox = xGetElementById('timer');
	 var theTimer = xGetElementById('QuizTimer');
	 var theTop = 270;
	 var old = theTop;
	 //movecounter();
	 document.onload = countup_clock(theTimer);
	 timerbox.style.display = 'block';
 </script>

</body>
</html>