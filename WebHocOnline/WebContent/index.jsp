<%@page import="model.UserAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%UserAccount us =(UserAccount) session.getAttribute("loginindex");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Website luyện thi online</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Graduate Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- gallery -->
<link rel="stylesheet" href="css/lightGallery.css" type="text/css"
	media="all" />
<!-- //gallery -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<link
	href="//fonts.googleapis.com/css?family=Cabin+Condensed:400,500,600,700"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

</head>

<body>
	<!-- banner -->
	<div class="banner">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1>
						<a class="navbar-brand" href="index.html"><span>H</span>ọc
							Online</a>
					</h1>
				</div>
				<div class="navbar-header navbar-right">
					<h5>
						<a class="navbar-brand" href="Login?action=SignOut"><%if(us!=null){%>
								<li style="margin-left:670px">Xin chào,<%=us.getEmail() %></li>
								<%} %></a>
					</h5>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<nav class="link-effect-3" id="link-effect-3">
						<ul class="nav navbar-nav w3-agileits_home_nav">
							<li class="active"><a class="link link--yaku"
								href="index.jsp"> <span>Trang</span><span>chủ</span>

							</a></li>
							<li><a class="link link--yaku scroll" href="#services">
									<span>Tại</span><span>đây</span><span>có</span><span>gì?</span>
							</a></li>
							<li><a class="link link--yaku scroll" href="#about"> <span>Về</span><span>Chúng</span><span>Tôi</span>
							</a></li>
							<li><a class="link link--yaku scroll" href="#gallery"> <span>Lớp</span><span>Học</span>
							</a></li>
							<%if(us==null){ %>
							<li><a class="link link--yaku scroll" href="#mail"> <span
									data-toggle='modal' data-target='#LoginModal'> Đăng Nhập</span>
							</a>
								<div class="modal fade" id="LoginModal" role="dialog">
									<jsp:include page="admin/login-signup.jsp"></jsp:include>
								</div> </li>
								<%} %>
							</ul>
							</nav>
				</div>
				</nav>
		</div>
		<div class="w3layouts_banner_info">
			<section class="wrapper agileits-w3layouts_wrapper_home">
				<h2>Hãy tham gia cùng lớp học ngay thôi</h2>
				<div class="sentence">
					<div class="popEffect">
						<span>Đăng kí</span> <span>Đăng kí</span> <span>Đăng kí</span> <span>Đăng
							kí</span>
					</div>
				</div>
			</section>
			<div class="w3layouts_banner_info_agileits_w3layouts">
				<div class="w3layouts_banner_info_left">
					<ul>
						<li>Hỗ trợ <span>Lời khuyên</span></li>
						<li>Luyện thi<span>Kho đề thi hấp dẫn</span></li>
						<li>Đội ngũ admin <span>Tâm huyết</span></li>
					</ul>
				</div>
				<div class="w3layouts_banner_info_right">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i
								class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i
								class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i
								class="fa fa-google" aria-hidden="true"></i></a></li>

					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<!-- //banner -->
	<!-- banner-bottom -->
	<div id="about" class="banner-bottom">
		<div class="container">
			<div class="col-md-7 w3_agileits_banner_bottom_left">
				<img src="images/anh14.jpg" alt=" " class="img-responsive"
					width="1000px" />
			</div>
			<div class="col-md-3 w3_agileits_banner_bottom_right">
				<div class="w3_agileits_banner_bottom_right_pos">
					<h3>Về chúng tôi</h3>
					<h4>Hệ thống tuyệt vời đồng hành cùng sĩ tử</h4>
					<p>
						Đến với hệ thống bạn sẽ trang bị cho mình lượng kiến thức tốt nhất
						cho kì thi sắp tới. HỌC ONLINE - bầu trời kiến thức.
					</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //banner-bottom -->
	<!-- banner-text -->
	<div class="banner-text w3-agile-banner-text">
		<div class="container">
			<h3>Học online nơi chắp cánh những ước mơ</h3>
		</div>
	</div>
	<!-- //banner-text -->
	<!-- services -->
	<div class="services" id="services">
		<div class="container">
			<h3 class="wthree_head">
				<i class="fa fa-book" aria-hidden="true"></i><span>Học Online</span>Đồng
				hành
			</h3>
			<div class="agileinfo_services_grids">
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Thông tin bổ ích</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>01.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Cung cấp thông tin bổ ích cho các bạn chuẩn bị thi kì thi
						THPT quốc gia: trường, điểm sàn, điểm chuẩn,...</p>
				</div>
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Luyện thi</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>02.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Thử sức với những bài thi giúp các bạn làm chủ thời gian
						hơn. Đăng kí ngay để thử sức nào.</p>
				</div>
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Kho tài liệu</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>03.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Kho tài liệu phong phú với chất lượng hay được tuyển chọn bở
						đội ngũ admin tâm huyết.</p>
				</div>
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Hỏi-Đáp</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>04.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Ngôi nhà chung nơi các bạn học sinh có thể trao đổi cũng như
						giải đáp các thắc mắc của mình và các bạn.</p>
				</div>
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Test IQ</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>05.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Cùng tham gia đố vui sau những giờ học tập nào.</p>
				</div>
				<div class="col-md-4 agileinfo_services_grid">
					<div class="agileinfo_services_grid_left">
						<h4>Học Online</h4>
					</div>
					<div class="agileinfo_services_grid_right">
						<h4>06.</h4>
					</div>
					<div class="clearfix"></div>
					<p>Vậy còn chần chờ gì nữa. Hãy ĐĂNG KÝ để tham gia cùng chúng
						mình.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //services -->
	<!-- team -->
	<div class="team">
		<div class="container">
			<h3 class="wthree_head wthree_head1">
				<i class="fa fa-users" aria-hidden="true"></i><span>Học
					Online</span>Team Admin
			</h3>
			<div class="agileits_team_grids">
				<div class="col-md-4 agileits_team_grid">
					<div class="agileits_team_grid_figure">
						<img src="images/anh1.jpg" alt=" " class="img-responsive" />
					</div>
					<div class="agileits_team_grid_figure_social">
						<ul class="w3ls_social">
							<li><a href="#" class="w3_agile_facebook"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i
									class="fa fa-google" aria-hidden="true"></i></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<h4>
						Ngáo <span>Mrs</span>
					</h4>
					<p>------------------------------</p>
				</div>
				<div class="col-md-4 agileits_team_grid">
					<div class="agileits_team_grid_figure">
						<img src="images/anh2.jpg" alt=" " class="img-responsive" />
					</div>
					<div class="agileits_team_grid_figure_social">
						<ul class="w3ls_social">
							<li><a href="#" class="w3_agile_facebook"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i
									class="fa fa-google" aria-hidden="true"></i></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<h4>
						Bư <span>Mr</span>
					</h4>
					<p>---------------------------------</p>
				</div>
				<div class="col-md-4 agileits_team_grid">
					<div class="agileits_team_grid_figure">
						<img src="images/anh3.jpg" alt=" " class="img-responsive" />
					</div>
					<div class="agileits_team_grid_figure_social">
						<ul class="w3ls_social">
							<li><a href="#" class="w3_agile_facebook"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i
									class="fa fa-google" aria-hidden="true"></i></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<h4>
						Meo Meo <span>Mrs</span>
					</h4>
					<p>-------------------------------------</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //team -->
	<!-- gallery -->
	<div id="gallery" class="gallery_main">
		<div class="container">
			<h3 class="wthree_head">
				<i class="fa fa-picture-o" aria-hidden="true"></i><span>Học
					online</span>Khoảnh khắc
			</h3>
			<div class="w3l_gallery_grids">
				<ul class="w3l_gallery_grid gallery" id="lightGallery">
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/1.jpg" data-responsive-src="images/1.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh7.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/7.jpg" data-responsive-src="images/7.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh8.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/5.jpg" data-responsive-src="images/5.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/5.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/6.jpg" data-responsive-src="images/6.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh9.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/8.jpg" data-responsive-src="images/8.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/8.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/9.jpg" data-responsive-src="images/9.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh10.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/10.jpg" data-responsive-src="images/10.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/10.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/11.jpg" data-responsive-src="images/11.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh11.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
					<li data-title="Graduate"
						data-desc="Lorem Ipsum is simply dummy text of the printing."
						data-src="images/12.jpg" data-responsive-src="images/12.jpg">
						<div class="w3_w3l_gallery_grid box">
							<a href="#"> <img src="images/anh12.jpg" alt=" "
								class="img-responsive" />
								<div class="caption scale-caption">
									<h3>Học online</h3>
									<p></p>
								</div>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script src="js/lightGallery.js"></script>
	<script>
		$(document).ready(function() {
			$("#lightGallery").lightGallery({
				mode : "fade",
				speed : 800,
				caption : true,
				desc : true,
				mobileSrc : true
			});
		});
	</script>
	<!-- //gallery -->
	<!-- testimonials -->
	<div class="testimonials">
		<div class="container">
			<h3 class="wthree_head wthree_head1">
				<i class="fa fa-quote-right" aria-hidden="true"></i>Học sinh nói gì?
			</h3>
			<div class="w3_testimonials_grids">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="col-md-7 w3_testimonials_grid_left">
									<p>" Hệ thống rất tuyệt. Em có thể tham gia thử sức với
										những đề thi và trao đổi kiến thức với nhiều bạn khác</p>
								</div>
								<div class="col-md-5 w3_testimonials_grid_right">
									<img src="images/anh5.jpg" alt=" " class="img-responsive" />
								</div>
								<div class="clearfix"></div>
							</li>
							<li>
								<div class="col-md-7 w3_testimonials_grid_left">
									<p>"Em đã đạt 27 điểm. Em rất cám ơn các anh chị và các bạn
										cùng hệ thống Học Online.</p>
								</div>
								<div class="col-md-5 w3_testimonials_grid_right">
									<img src="images/anh6.jpg" alt=" " class="img-responsive" />
								</div>
								<div class="clearfix"></div>
							</li>
						</ul>
					</div>
				</section>
				<!-- flexSlider -->
				<script defer src="js/jquery.flexslider.js"></script>
				<script type="text/javascript">
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation : "slide",
							start : function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<!-- //flexSlider -->
			</div>
		</div>
	</div>
	<!-- //testimonials -->
	<!-- contact -->

	<!-- //contact -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="agileits_w3layouts_footer_grids">
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>Gọi chúng tôi ngay:</h3>
					<ul>
						<li><span>Số điện thoại :</span> (+123) 2302 232</li>
						<li><span>Fax :</span> (+123) 123 456 455</li>
					</ul>
				</div>
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>Địa chỉ</h3>
					<p>
						Đống Đa <i>Hà Nội.</i>
					</p>
				</div>
				<div class="col-md-4 agileits_w3layouts_footer_grid">
					<h3>Gửi tin nhắn</h3>
					<ul>
						<li><span>Email :</span> <a href="mailto:info@example.com">info@example1.com</a></li>
						<li><span>Enquiry :</span> <a href="mailto:info@enquiry.com">info@enquiry.com</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="w3_agileits_footer_grids">
				<div class="col-md-4 w3_agileits_footer_grid">
					<p>Học online đồng hành cùng sĩ tử Việt.</p>
				</div>
				<div class="col-md-4 w3_agileits_footer_grid">
					<h3>Giờ làm việc</h3>
					<ul>
						<li><span>Thứ 2 - Thứ 6 : </span> 9:00 AM - 5:00PM</li>
						<li><span>Thứ 7 : </span> 10:00 AM - 3:00PM</li>
					</ul>
				</div>
				<div class="col-md-4 w3_agileits_footer_grid">
					<h3>Đăng ký ngay</h3>
					<form action="#" method="post">
						<input type="email" name="Email" placeholder="Email" required="">
						<input type="submit" value=" ">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="wthree_copy_right">
		<div class="container">
			<p>Hãy tham gia lớp học cùng chúng mình nhé.</p>
		</div>
	</div>
	<!-- //footer -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
</body>
</html>