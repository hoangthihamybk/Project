<%@page import="dao.ExamDAO"%>
<%@page import="dao.SearchDAO"%>
<%@page import="model.Exam"%>
<%@page import="dao.ClassedDAO"%>
<%@page import="model.Classed"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Subject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String classID = request.getParameter("class");
   String subjectID = request.getParameter("subject"); %>
<% Map<String, Subject> mapSubject = SubjectDAO.mapSubject ;%>
<% Map<String, Classed> mapClass = ClassedDAO.mapClassed ;%>
<% Map<String, Exam> mapExam = SearchDAO.getMapExamByID(classID,subjectID); %>

<!DOCTYPE>
<html>
<head>
	<title>Hệ thống đề thi, bài kiểm tra, thi thử miễn phí (trắc nghiệm, tự luận) lớp 12, môn Ngữ văn, Kiểm tra học kỳ - HOCMAI</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<jsp:include page="lib-css/css.jsp" ></jsp:include>
    <jsp:include page="lib-js/js.jsp" ></jsp:include>
</head>
<body  class="kiem-tra-thi-thu course-1 lang-vi_utf8" id="kiem-tra-thi-thu-index">
<div id="fb-root"></div>
<div id="page">
            
<!--  -->
<jsp:include page="../header/header1.jsp"></jsp:include>
<!--  -->

<!-- css2/css1.css---------------------------------- -->    

    <div id="ktth-content">
        <div class="wrapper clearfix">
           <div id="breadcrumbs" class="breadcrumbs"><a class="home-1-icon" href="/">Trang chủ</a> > Tìm kiếm</div>
            <div class="tbl_search">
                <div class="left_search"></div>
                <div class="center_search">
                    <jsp:include page="form/form-search.jsp"></jsp:include>
                </div>
                <div class="right_search"></div>
            </div>
		<%if(!mapExam.isEmpty()){ %>
            <div class="btn_result_quiz">
            	<div class="order_result1"><%=SubjectDAO.mapSubject.get(subjectID).getSubjectName() %>,
            	<%=ClassedDAO.mapClassed.get(classID).getClassName() %>,
            	 (<%=mapExam.size() %> đề)</div>
            		<ul class="quiz-list">
            		<%for(Exam e: mapExam.values()){ %>
            		<li class="activity quiz clearfix">
	            		<div class="quiz-detail clearfix" >
				            <div class="classquiz" style="height: 25px;">
				            	 <img src="../images/homework.png" class="activityicon"  /> 
				           		 <a class="link_quiz"  href="infoexam.jsp?examID=<%=e.getExamID() %>"><%=e.getDescribe() %></a>
				           	</div>
				           	<div class="detail-right clearfix">
				           	<div class="summary_quiz" >&nbsp;Tổng số câu hỏi: <strong><%=e.getNumberOfQuestions() %></strong>&nbsp;</div>				         
				           	</div>
				        </div>
            	 	</li>
            	 	<%} %>
            	</ul>
            </div>
            <%} %>
            <!--</div>-->
            <div class="page_scorm"> </div>
        </div>
    </div>

<footer>
<jsp:include page="../footer/footerlevel1.jsp"></jsp:include>
</footer>

</div>
<jsp:include page="modal/modal-search.jsp"></jsp:include>
<div id="WapperPopupTestPenI"></div>
<script type="text/javascript" src="https://hocmai.vn/php_javascript/popup-pen-m.php"></script>

<!--<script type="text/javascript" src="/xac-nhan-chuyen-tien/warning.php"></script>-->
<div style="position: absolute; z-index: -100; bottom: 0;">
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
