<%@page import="dao.ExamDAO"%>
<%@page import="model.Exam"%>
<%@page import="dao.ClassedDAO"%>
<%@page import="model.Classed"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Subject"%>
<%@page import="java.util.Map"%>
<%@page import="model.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%		Map<String, Subject> mapSubject = SubjectDAO.mapSubject ;%>
<%		Map<String, Classed> mapClass = ClassedDAO.mapClassed ;%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Hệ thống đề thi, bài kiểm tra, thi thử miễn phí (trắc nghiệm, tự luận) </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<jsp:include page="lib-css/css.jsp" ></jsp:include>
    <jsp:include page="lib-js/js.jsp" ></jsp:include> 
</head>
<body  class="kiem-tra-thi-thu course-1 lang-vi_utf8" id="kiem-tra-thi-thu-index">
<div id="fb-root"></div>
<div id="page">

<!-- header  -->
<jsp:include page="../header/header1.jsp"></jsp:include>
<!-- header -->
            
    <div id="ktth-content">
        <div class="wrapper clearfix">
        <div id="breadcrumbs" class="breadcrumbs" style="margin-top: -10px;"><a class="home-1-icon" href="../index.jsp">Trang chủ</a> > Hệ thống đề thi, bài kiểm tra, thi thử miễn phí (trắc nghiệm, tự luận)</div>
            <div class="tbl_search" style="margin-top:-40px;">
                <div class="left_search"></div>
                <div class="center_search">
                   <jsp:include page="form/form-search.jsp"></jsp:include>
                </div>
                <div class="right_search"></div>
            </div>
		<!-- nội dung theo từng môn--------------- -->
				<div class="test-container clearfix">
					<%for(Subject sb : mapSubject.values()){ %>
					<%if(!new ExamDAO().getMapExamBySubjectID(sb.getSubjectID(), null).isEmpty()){%>
					<div class="test-item">
						<div class="item-wrapper clearfix">
							<div class="order_result" style="text-align: center; font-weight: bold;"><%=sb.getSubjectName() %></div>
								
								<div class="test-item-list">
									<div class="labelcontest">
										<img src="../images/testcoban.png" class="activityicon"/> Cơ bản
									</div>
									<ul class="quiz-list">
								<%Map<String,Exam> mapExam = new ExamDAO().getMapExamBySubjectID(sb.getSubjectID(),"CB") ;%>
									<%for(Exam e : mapExam.values()){ %>
									 <li>
										<div class="activity quiz clearfix">
											 <div class="classquiz">
												 <img src="../images/note.png" class="activityicon"  />
												 <a class="link_quiz" href="infoexam.jsp?examID=<%=e.getExamID() %>" title="<%=e.getDescribe()%>"><%=e.getDescribe() %></a>
											 </div>
											</div>
									</li>
									<%} %>
									</ul>
								</div>
								
								<div class="test-item-list">
									<div class="labelcontest">
										<img src="../images/testnangcao.png" class="activityicon"/> Nâng cao
									</div>
									<ul class="quiz-list">
									<%mapExam= new ExamDAO().getMapExamBySubjectID(sb.getSubjectID(),"NC"); %>
									<%for(Exam e : mapExam.values()){ %>
									 <li>
										<div class="activity quiz clearfix">
											 <div class="classquiz">
												 <img src="../images/note.png" class="activityicon"  />
												 <a class="link_quiz" href="infoexam.jsp?examID=<%=e.getExamID() %>" title="<%=e.getDescribe()%>"><%=e.getDescribe() %></a>
											 </div>
											</div>
									</li>
									<%} %>
									</ul>
								</div>
						</div>
					</div>
					<%} }%>
					
				</div>
				
				<div class="page_scorm"></div>
                            
        </div>
    </div>
<!-- nội dung theo từng môn----------------------------------------------------------------------- -->
    
	<footer>
		<jsp:include page="../footer/footerlevel1.jsp"></jsp:include>
	</footer>

</div>
<jsp:include page="modal/modal-index.jsp"></jsp:include>
<div style="position: absolute; z-index: -100; bottom: 0;">
	
	<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
	</script>
	 </div>
                   
                
<script type="text/javascript">
    jQuery(document).ready(function($){
        var d = new Date();
        var time = d.getTime();
        $.ajax({
            url: "/settheme.php",
            type: "GET",
            data: {t: time}
        });
    });
</script>
</body>
</html>
