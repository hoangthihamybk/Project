<%@page import="dao.UserDetailDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%UserAccount us =(UserAccount) session.getAttribute("loginadmin");
if(us==null){
	response.sendRedirect("../../index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<a class="navbar-brand" href="../index.jsp">Xin chào admin <%if(us!=null){out.print(UserDetailDAO.mapUserDetail.get(us.getUserID()).getFullname());} %>,</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class="active"><a href="index.jsp"><i
					class="fa fa-dashboard"></i> Dashboard</a></li>
			<li><a href="../Account/user.jsp"><i class="fa fa-users"></i> Quản lý tài khoản</a></li>
			<li><a href="../Role/role.jsp"><i class="fa fa-users"></i> Quản lý phân quyền</a></li>
			<li><a href="../Rank/rank.jsp"><i class="fa fa-users"></i> Quản lý xếp hạng</a></li>
			<li><a href="../Evaluation/evaluation.jsp"><i class="fa fa-users"></i> Quản lý đánh giá</a></li>
			<li><a href="../Exam/exam.jsp"><i class="fa fa-file-text-o"></i> Quản lý bài thi</a></li>
			<li><a href="../Classed/classed.jsp"><i class="fa fa-users"></i> Quản lý lớp học</a></li>
			<li><a href="../Subject/subject.jsp"><i class="fa fa-book"></i> Quản lý môn học</a></li>
			<li><a href="../ScoreBoard/score.jsp"><i class="fa fa-book"></i> Quản lý bảng điểm</a></li>
			<li><a href="../caidat.jsp"><i class="fa fa-cog"></i> Cài đặt</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i>
					Hướng dẫn <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Lưu ý về bộ môn</a></li>
					<li><a href="#">Quy định về bài thi</a></li>
					<li><a href="#">Trách nhiệm admin</a></li>
					<li><a href="#">Quy định chung</a></li>
				</ul></li>
		</ul>

		<ul class="nav navbar-nav navbar-right navbar-user">
<!-- 			<li class="dropdown messages-dropdown"><a href="#" -->
<!-- 				class="dropdown-toggle" data-toggle="dropdown"><i -->
<!-- 					class="fa fa-envelope"></i> Messages <span class="badge">7</span> <b -->
<!-- 					class="caret"></b></a> -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li class="dropdown-header">7 New Messages</li> -->
<!-- 					<li class="message-preview"><a href="#"> <span -->
<!-- 							class="avatar"><img src="http://placehold.it/50x50"></span> -->
<!-- 							<span class="name">John Smith:</span> <span class="message">Hey -->
<!-- 								there, I wanted to ask you something...</span> <span class="time"><i -->
<!-- 								class="fa fa-clock-o"></i> 4:34 PM</span> -->
<!-- 					</a></li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li class="message-preview"><a href="#"> <span -->
<!-- 							class="avatar"><img src="http://placehold.it/50x50"></span> -->
<!-- 							<span class="name">Admin:</span> <span class="message">Hey -->
<!-- 								there, I wanted to ask you something...</span> <span class="time"><i -->
<!-- 								class="fa fa-clock-o"></i> 4:34 PM</span> -->
<!-- 					</a></li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li class="message-preview"><a href="#"> <span -->
<!-- 							class="avatar"><img src="http://placehold.it/50x50"></span> -->
<!-- 							<span class="name">John Smith:</span> <span class="message">Hey -->
<!-- 								there, I wanted to ask you something...</span> <span class="time"><i -->
<!-- 								class="fa fa-clock-o"></i> 4:34 PM</span> -->
<!-- 					</a></li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li><a href="#">View Inbox <span class="badge">7</span></a></li> -->
<!-- 				</ul></li> -->
<!-- 			<li class="dropdown alerts-dropdown"><a href="#" -->
<!-- 				class="dropdown-toggle" data-toggle="dropdown"><i -->
<!-- 					class="fa fa-bell"></i> Alerts <span class="badge">3</span> <b -->
<!-- 					class="caret"></b></a> -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li><a href="#">Default <span class="label label-default">Default</span></a></li> -->
<!-- 					<li><a href="#">Primary <span class="label label-primary">Primary</span></a></li> -->
<!-- 					<li><a href="#">Success <span class="label label-success">Success</span></a></li> -->
<!-- 					<li><a href="#">Info <span class="label label-info">Info</span></a></li> -->
<!-- 					<li><a href="#">Warning <span class="label label-warning">Warning</span></a></li> -->
<!-- 					<li><a href="#">Danger <span class="label label-danger">Danger</span></a></li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li><a href="#">View All</a></li> -->
<!-- 				</ul></li> -->

<!-- Thay đổi style -->
           
<!-- Thay đổi style -->
			
			<li class="dropdown user-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-user"></i><%if(us!=null){out.print(UserDetailDAO.mapUserDetail.get(us.getUserID()).getFullname());} %><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="../Account/infoUser.jsp?UserID=<%=us.getUserID()%>"><i class="fa fa-user"></i> Thông tin</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> Tin nhắn <span
							class="badge">7</span></a></li>
					<li><a href="#"><i class="fa fa-gear"></i> Cài đặt</a></li>
					<li class="divider"></li>
					<li><a href="../../Login?action=SignOut"><i class="fa fa-power-off"></i> Đăng xuất</a></li>
				</ul></li>
				
		</ul>
	</div>
	<!-- /.navbar-collapse --> </nav>
</body>
</html>