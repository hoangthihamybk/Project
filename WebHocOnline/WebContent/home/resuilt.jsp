<%@page import="dao.ExamDAO"%>
<%@page import="model.Exam"%>
<%@page import="dao.SubjectDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String examID = request.getParameter("examID");
String numberOfRight = request.getParameter("number");
String score = request.getParameter("score");
String numberOfQuestions = ExamDAO.mapExam.get(examID).getNumberOfQuestions();
String subjectName= SubjectDAO.mapSubject.get(ExamDAO.mapExam.get(examID).getSubjectID()).getSubjectName();
String subjectID= ExamDAO.mapExam.get(examID).getSubjectID(); 
Exam e = ExamDAO.mapExam.get(examID);

%>

<!DOCTYPE>
<html>
<head>
	<title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<jsp:include page="lib-css/css.jsp" ></jsp:include>
    <jsp:include page="lib-js/js.jsp" ></jsp:include>
    
</head>
<body  class="mod-quiz course-134 lang-vi_utf8" id="mod-quiz-review">
<div id="fb-root"></div>
<div id="page">
            
<!--  -->
<jsp:include page="../header/header1.jsp"></jsp:include>
<!--  -->
            
<!-- css2/css1.css---------------------------------- -->
<script type="text/javascript" src="../plugins/icheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('[type="radio"]').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });
        $('[type="radio"]:checked').parents('span:not(.highlight)').addClass('wrong-answer').find('div').addClass('iradio_square-red');
    });
</script>

<!-- css2/css2.css---------------------------------- -->

<div id="quiz-review" class="quiz-test">
    <div class="wrapper clearfix">
        <div id="breadcrumbs" class="breadcrumbs" style="margin-top: -20px;"><a class="home-1-icon" href="index.jsp">Trang chủ</a> > 
        <a target="_top" href="infoexam?examID=<%=examID %>" ><%=subjectName %></a> > 
         <%=e.getDescribe() %> </div>
            <div class="review-title clearfix" style="margin-bottom: 15px;">
            <div class="quiz-name" style="color:#0072bc;"><%=e.getDescribe() %></div>
            <div class="pull-right social-follow">
                <div style="margin: 0 10px;" class="fb-like " data-href=""
                     data-width="160" data-layout="button_count" data-action="like" data-show-faces="false"
                     data-share="true"></div>
            </div>
            
        </div>
        <div class="quiz-review-content">
            <div class="panel panel-primary panel-result">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">Kết quả </h3>
                </div>
                <div class="panel-body">
                    <div class="body">
         			<!--main body --->
                        <div class="row">
                            <div class="col-md-12 center-block no-float">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center quiz-score">
                                     <%=score %>/100
                                        </div>
                                        <div class="text-center review">
                                            <div style="text-align: justify">Có lẽ bài học này là một thử thách thực sự với bạn rồi. Bạn cần học lại bài này trong <a title="Bài 2. Cực đại và cực tiểu" href="http://hocmai.vn/mod/ebook/view.php?id=2275&sec=1605" target="_blank">sách giáo khoa</a> hoặc liên hệ với tổng đài thông tin 19006933 của <a style="color: rgb(0,0,255)" href="http://www.hocmai.vn/">Hoconline.vn</a> để được tư vấn. <a style="color: rgb(0,0,255)" href="http://www.hocmai.vn/">Hoconline.vn</a> sẽ đồng hành cùng bạn để vượt qua thử thách này.<br /></div>                                        </div>
                                        <div class="hr-line" style="margin-top:20px;"></div>
                                        <ul class="other-info">
<!--                                             <li> <div class="row"> -->
<!--                                                     <div class="oi-title col-xs-6 col-md-6">Thời gian bắt đầu làm bài                                                        : -->
<!--                                                     </div> -->
<!--                                                     <div class="ot-detail col-xs-6 col-md-6">Thứ năm,  26 Tháng tư 2018, 10:26 AM</div> -->
<!--                                                 </div> -->
<!--                                             </li> -->
<!--                                             <li> <div class="row"> -->
<!--                                                     <div class="oi-title col-xs-6 col-md-6">Thời gian nộp bài                                                        : -->
<!--                                                     </div> -->
<!--                                                     <div class="ot-detail col-xs-6 col-md-6">Thứ năm,  26 Tháng tư 2018, 10:26 AM</div> -->
<!--                                                 </div> -->
<!--                                             </li> -->
                                            <li> <div class="row">
                                                    <div class="oi-title col-xs-6 col-md-6">Tổng thời gian làm bài                                                        :
                                                    </div>
                                                    <div class="ot-detail col-xs-6 col-md-6">30 giây</div>
                                                </div>
                                            </li>
                                            <li> <div class="row">
                                                    <div class="oi-title col-xs-6 col-md-6">Số đáp án đúng                                                        :
                                                    </div>
                                                    <div class="ot-detail col-xs-6 col-md-6">0<%=numberOfRight %>/<%=numberOfQuestions %></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                       <script>function fbs_click() {
                                u = "https://hocmai.vn/de-thi-truc-tuyen/2198/bai-2-cuc-tri-cua-ham-so.html";
                                t = "Bài 2. Cực trị của hàm số";
                                fb = "";
                                window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t) + '&message=' + encodeURIComponent(fb), 'sharer', 'toolbar=0,status=0,width=626,height=436');
                                return false;
                            }
                        </script>
                        
                         <div class="row">
                            <div class="col-md-6 col-xs-12 center-block">
                                <div class="panel panel-primary">
                                    <div class="panel-heading text-center">
                                        <h3 class="panel-title">Xem đáp án và lời giải</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="review-option-title">
                                            Nếu chưa hài lòng với kết quả, Bạn nên cố gắng tự kiểm tra lại bài làm trước khi xem đáp án hoặc lời giải!<br />                                        </div>
                                        <div class="review-option clearfix">
                                            <div class="review-option-form" style="text-align: center;width: 50%;float: left;margin-bottom: 20px;margin-top:20px;" >
                                                <form name="frm_option" method="post" action="">
                                                 <input class="submit btn btn-primary" type="submit" name="submitbutton"  value="Xem đáp án">
                                                </form>
                                            </div>
                                            <div class="review-option-form" style="text-align: center;width: 50%;float: left;margin-bottom: 20px;margin-top:20px;" >
                                                 <form name="frm_option" method="post" action="">
                                                    <input class="submit btn btn-primary" type="submit" name="submitbutton"  value="Xem lời giải">
                                                 </form>
                                            </div>    
                                       </div>
                                    </div>
                                </div>
                            </div>

                                                    
                            <div class="col-md-6 col-xs-12 center-block">
                                <div class="panel panel-primary">
                                    <div class="panel-heading text-center">
                                        <h3 class="panel-title">Các bài giảng liên quan</h3>
                                    </div>
                                    <div class="panel-body">
                                        <ol class="relate-quiz" type="1">
                                            <li><a href="https://hocmai.vn/bai-giang-truc-tuyen/1570/tinh-dong-bien-nghich-bien-cua-ham-so.html" target="_blank" title="Sự biến thiên của hàm số">Gen, mã di truyền</a></li><li><a href="https://hocmai.vn/bai-giang-truc-tuyen/1351/cac-dang-bai-tap-ve-ham-don-dieu.html" target="_blank" title="Các dạng bài tập về hàm đơn điệu">Quần thể sinh vật</a></li><li><a href="https://hocmai.vn/bai-giang-truc-tuyen/1314/phuong-phap-ham-so.html" target="_blank" title="Phương pháp hàm số"><b style="color: rgb(0, 0, 255);"><span title="Phương pháp hàm số">Đột biến gen</span></b></a></li><li><a href="https://hocmai.vn/bai-giang-truc-tuyen/1309/cac-dang-bai-tap-ve-dao-ham-phan-2.html" target="_blank" title="Các dạng bài tập về đạo hàm Phần 2">Các dạng bài tập về gen</a></li><li><a href="https://hocmai.vn/bai-giang-truc-tuyen/1308/cac-dang-bai-tap-ve-dao-ham-phan-1.html" target="_blank" title="Các dạng về đạo hàm Phần 1"><span style="color: rgb(0, 0, 255); font-weight: bold;" title="Các dạng bài tập về đạo hàm Phần 1">Các dạng về nguyên phân, giảm phân </span><span style="color: rgb(0, 0, 255);"> </span></a></li>                                        </ol>
                                    </div>
                                </div>
                            </div>
                                                    </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="quiz-attempt-content clearfix">
	    <div class="quiz-name">Bài làm của bạn</div></div>        
            <div class="quiz-attempt-content clearfix"><div class="review-action"><div><form action="https://hocmai.vn/mod/quiz/attempt.php" method="get" target="_self"><input type="hidden" name="q" value="2198" /><input type="hidden" name="forcenew" value="1" /><input class="singlebutton_m"  style=" " type="submit" value="LÀM LẠI BÀI" />&nbsp;&nbsp;</form></div></div></div>
   
</div>
</div>

<footer>
<jsp:include page="../footer/footerlevel1.jsp"></jsp:include>
</footer>

</div>
<jsp:include page="modal/modal-resuilt.jsp" ></jsp:include>
<div id="WapperPopupTestPenI"></div>

<div style="position: absolute; z-index: -100; bottom: 0;"> </div>
                 
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