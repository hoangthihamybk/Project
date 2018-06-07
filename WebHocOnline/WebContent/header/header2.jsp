<%@page import="dao.UserDetailDAO"%>
<%@page import="model.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%UserAccount us =(UserAccount) session.getAttribute("loginadmin");
UserAccount us1 =(UserAccount) session.getAttribute("loginstudent");
if(us1==null || us==null){
	response.sendRedirect("../../index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/header.css" rel="stylesheet">
<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
<title>Insert title here</title>

<!-- import icon font awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Import thư viện JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
// kéo xuống khoảng cách 500px thì xuất hiện nút Top-up
var offset = 200;
// thời gian di trượt 0.75s ( 1000 = 1s )
var duration = 750;
$(function(){
$(window).scroll(function () {
if ($(this).scrollTop() > offset)
$('#top-up').fadeIn(duration);else
$('#top-up').fadeOut(duration);
});
$('#top-up').click(function () {
$('body,html').animate({scrollTop: 0}, duration);
});
});
</script>
<div title="Về đầu trang" onmouseover="this.style.color='#590059'" onmouseout="this.style.color='#004993'" id="top-up">
<i class="fa fa-caret-square-o-up"></i></div>
<style>
#top-up {
background:none;
font-size: 3em;
text-shadow:0px 0px 5px #c0c0c0;
cursor: pointer;
position: fixed;
z-index: 9999;
color:#004993;
bottom: 20px;
right: 15px;
display: none;
}
</style>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.jsp">Xin chào bạn <%if(us1!=null){out.print(UserDetailDAO.mapUserDetail.get(us1.getUserID()).getFullname());} %>,</a> 
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-cosllapse">
	<ul class="nav navbar-nav navbar-right navbar-user">
			
			
			<li class="dropdown user-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-user"></i><%if(us1!=null){out.print(UserDetailDAO.mapUserDetail.get(us1.getUserID()).getFullname());} %><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="../home/infouser.jsp?UserID=<%=us1.getUserID()%>"><i class="fa fa-user"></i> Thông tin</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> Tin nhắn <span
							class="badge">7</span></a></li>
					<li><a href="#"><i class="fa fa-gear"></i> Cài đặt</a></li>
					<li class="divider"></li>
					<li><a href="../Login?action=SignOut"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
				</ul>
				
		  </li>
		</ul>
	</div>
	<!-- /.navbar-collapse --> </nav>
	<ul class="nav nav-tabs" style="margin-top: 63px;">
  <li role="presentation" class="active"><a href="index.jsp">Trang chủ</a></li>
  <li role="presentation"><a href="#">Xem thông tin</a></li>
  <li role="presentation"><a href="#">Hỏi - Đáp</a></li>
  </ul>
</body>
</html>