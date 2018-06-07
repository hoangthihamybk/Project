<%@page import="dao.MethodStringHandeling"%>
<%@page import="java.util.List"%>
<%@page import="model.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="model.DeThi"%>
<%@page import="model.Exam"%>
<%@page import="dao.ExamDAO"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.UserAccount"%>
<%@page import="dao.UserDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String examID = request.getParameter("examID");
  String subjectName= SubjectDAO.mapSubject.get(ExamDAO.mapExam.get(examID).getSubjectID()).getSubjectName();
  String subjectID= ExamDAO.mapExam.get(examID).getSubjectID();
  String pathLoadFile=request.getServletContext().getRealPath("/")+"/file/exam/"+subjectID+"/"+examID+".txt";
  String eval= request.getParameter("eval");
  DeThi dt = new QuestionDAO(pathLoadFile).createDeThi(eval, Integer.parseInt(ExamDAO.mapExam.get(examID).getNumberOfQuestions()));
  Exam e = ExamDAO.mapExam.get(examID);
  
  UserAccount us1 =(UserAccount) session.getAttribute("loginstudent");
  String userID = UserDetailDAO.mapUserDetail.get(us1.getUserID()).getUserID();
  
%>
<!DOCTYPE html >
<html>
<head>
	<title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../css/theme/new2/quiz/style.css" />
	<jsp:include page="lib-css/css.jsp" ></jsp:include>
    <jsp:include page="lib-js/js.jsp" ></jsp:include>
</head>
<body  class="mod-quiz course-134 lang-vi_utf8" id="mod-quiz-attempt">
<div id="fb-root"></div>
<div id="page">
            
<!--  -->
<jsp:include page="../header/header1.jsp"></jsp:include>
<!--  -->


<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<style>
    #mod-quiz-attempt #page #header {
        text-align: left;
    }
</style>
<script type="text/javascript" src="plugins/icheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('[type="radio"]').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });
    });
</script>
<div class="quiz-test" id="attempt-content">
    <div class="wrapper clearfix">
      <div id="breadcrumbs" class="breadcrumbs" style="margin-top: -10px;">
	    <a class="home-1-icon" href="index.jsp">Trang chủ</a> >
	    <a target="_top" href="infoexam?examID=<%=examID %>" title="<%=subjectName%>"><%=subjectName %></a> >
	    <a target="_top"><%=e.getDescribe() %></a>  
      </div>
     <div class="quiz-attempt-content clearfix">
		<div class="quiz-name" ><%=e.getDescribe() %> </div><div class="pagination"></div></div>
        
        <div class="form-wrapper" id="attempt-form-wrapper">
                <noscript>
                    <center><p><strong>JavaScript phải có khả năng tiếp tục !</strong></p></center>
                </noscript>
            <input type="hidden" name="q" value="2198" />
			<input type="hidden" name="attemptid" value="22989916" />
			<input type="hidden" id="changepage" name="changepage" value="false" />
			<input type="hidden" id="page" name="page" value="0" />
            <script language="javascript">
                function set_val(i, code, mn_name) {
                    var obj_select = document.getElementById("radio_" + i);
                    var print_select = document.getElementById("display_" + code);
                    var response_value = document.getElementById("menu" + mn_name);
                    var select_text = document.getElementById("info_" + i);
                    response_value.value = i;
                    print_select.innerHTML = select_text.value;
                    return cClick();	//	function cClick() defined on overlib_mini.js
                }
            </script>

            <!---manhhv is using css in fw_new.css--->
          <form action="${pageContext.request.contextPath}/score111?action=SCORE&maDeThi=<%=dt.getMaDeThiID() %>&examID=<%=examID%>" method ="post">
            <div class="boxstandard">
                <div class="boxcontent">
                    <div class="body">
					<%int count=0;for(Question q : dt.getListOfQuestion()){count++; %>
					<div id="<%=q.getQuestionID() %>" class="que multichoice clearfix">
					  <div class="info" style="margin-top: -2px;"> <span class="firstletter"><%=count %>.</span> </div>
					  <div class="content">
						 <div class="qtext">  <%=q.getContent() %></div>
					       <div class="ablock clearfix">
							 <div class="prompt"> </div>
							    
							    <table class="answer">
							        <%List<String> listOfAnswer = q.getListOfAnswer(); %>
							        <%int r=0;for(int i=0 ; i<listOfAnswer.size();i++){ %>
							       <tr class="r<%=r%>">
								      <td class="c0 control ">
								          <input  id="<%=q.getQuestionID()%>" name="<%=q.getQuestionID()%>"  type="radio" value="<%=new MethodStringHandeling().getNameAnswer(i) %>"  />
									  </td>
								       <td class="c1 text " style="padding-top:14px;">
								           <label for="<%=q.getQuestionID()%>"> <span class='under_an'><%=new MethodStringHandeling().getNameAnswer(i) %></span>. <%=listOfAnswer.get(i)%></label>
								       </td>
								        <td class="c0 feedback"> </td>
							        </tr>
							        	<%r++;} %>
							    </table>
							 </div>
						 </div>
						    
						  </div>
						  <%} %>
						<br />


                    </div>

                </div>
            </div>
            <div class="submitbtns mdl-align clearfix">
            	<input type="submit" class="attempt-btn replystop" name="finishattempt" value="NỘP BÀI CHẤM ĐIỂM" 
            	onclick="return confirm('Sau khi nộp bài bạn không thể sửa lại bài làm của mình. Bạn có chắc chắn muốn nộp bài hay xem lại bài làm?')" />
				<input type="hidden" name="timeup" value="0" /></div><br />
          </form>
            
<script language="javascript" type="text/javascript">

var timesup = "Thời gian vượt quá !";
var quizclose = -1525333902; // in seconds
var quizTimerValue = 900; // in seconds
parseInt(quizTimerValue);

// @EC PF : client time when page was opened
var ec_page_start = new Date().getTime();
// @EC PF : client time when quiz should end
var ec_quiz_finish = ec_page_start + 900000;


</script>
<script language="javascript" type="text/javascript" src="https://hocmai.vn/mod/quiz/timer.js?v=1.1"></script>
<div id="timer" style="display:none;margin-left:20px;margin-left:20px;">
<!--EDIT BELOW CODE TO YOUR OWN MENU-->        
	<div class="form-clock">          
		<form id="clock">
			<span> Thời gian còn lại: </span>
			<input onfocus="blur()" type="text" id="time" class="time-clock" size="8" />
		</form>
	</div>
<!--END OF EDIT-->
</div>
<script language="javascript" type="text/javascript">

var timerbox = xGetElementById('timer');
var theTimer = xGetElementById('time');
var theTop = 270;
var old = theTop;

movecounter('', 150);

document.onload = countdown_clock(theTimer);

timerbox.style.display = 'block';

</script>
        </div>
    </div>
</div>
<div class="modal fade" id="modalReQuiez" data-backdrop="static" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document"  style="width: 460px">
        <div class="modal-content">
            <div class="modal-body" style="position: relative">
                <div class="buttom-close-modalReQuiez"><i class="fa fa-times" aria-hidden="true"></i></div>
                <div class="ava-popup text-center">
                    <img src="https://hocmai.vn/mod/quiz/nen-tang/assets/image/ava-popup.png">
                </div>
                <h4 class="text-center">Bạn không nhận được kết quả bài làm trước đó?</h4>
                <div class="content-modal text-center">Để nhận được kết quả bài làm, bạn cần phải nộp bài sau khi đã làm xong. Trong trường hợp bạn thoát ra khi đang làm bài và không quay trở lại, HOCMAI sẽ không ghi nhận kết quả cho bạn.</div>
                <div class="text-right close-popup-modalReQuiez">
                    <a href="javascript:void(0)">Tôi đã hiểu</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
<jsp:include page="../footer/footerlevel1.jsp"></jsp:include>
</footer>


</div>
<jsp:include page="modal/modal-exam.jsp"></jsp:include>
<div id="WapperPopupTestPenI"></div>
<script type="text/javascript" src="https://hocmai.vn/php_javascript/popup-pen-m.php"></script>

<!--<script type="text/javascript" src="/xac-nhan-chuyen-tien/warning.php"></script>-->
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