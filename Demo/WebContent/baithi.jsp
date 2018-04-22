<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Demo</title>
    <link href="css/bang.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    
    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
     <!-- menu -->
      <jsp:include page="menu.jsp"></jsp:include>
      <!--  hết menu -->
      
     <div class ="noidung">
      <h2>Danh sách bài thi</h2>
      </br>
      <a class="btn btn-default" href="#" role="button"><i class="fa fa-plus 4x"></i> Thêm bài thi</a>
      </br>
       <table class="zui-table zui-table-horizontal zui-table-highlight">
    <thead>
        <tr>
            <th>Tên bài thi</th>
            <th>Ngày tạo</th>
            <th>Bộ Môn</th>            
            <th>Tùy chọn</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            
            <td>Toán-THPT chuyên Bắc Ninh</td>
            <td>21/4/2018</td>
            <td>Toán</td>
            <td>
            <a href="#"><i class="fa fa-eye fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-edit fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-trash-o fa-2x fa-border"></i></a>
            </td>            
        </tr>
        <tr>
            
            <td>Toán-THPT chuyên Bắc Ninh</td>
            <td>21/4/2018</td>
            <td>Toán</td>
            <td>            
            <a href="#"><i class="fa fa-eye fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-edit fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-trash-o fa-2x fa-border"></i></a>
            </td>     
        </tr>
        <tr>
            <td>Toán-THPT chuyên Bắc Ninh</td>
            <td>21/4/2018</td>
            <td>Toán</td>
            <td>
            <a href="#"><i class="fa fa-eye fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-edit fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-trash-o fa-2x fa-border"></i></a>
            </td>  
        </tr>
        <tr>
            <td>Toán-THPT chuyên Bắc Ninh</td>
            <td>21/4/2018</td>
            <td>Toán</td>           
            <td>
           <a href="#"><i class="fa fa-eye fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-edit fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-trash-o fa-2x fa-border"></i></a>
            </td>            
        </tr>
        <tr>
            <td>Toán-THPT chuyên Bắc Ninh</td>
            <td>21/4/2018</td>
            <td>Toán</td>           
            <td>
            <a href="#"><i class="fa fa-eye fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-edit fa-2x fa-border" style="color: #2980b9"></i></a>
            <a href="#"><i class="fa fa-trash-o fa-2x fa-border"></i></a>
            </td>              
        </tr>
    </tbody>
</table>

    </div><!-- /#wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- Page Specific Plugins -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="js/morris/chart-data-morris.js"></script>
    <script src="js/tablesorter/jquery.tablesorter.js"></script>
    <script src="js/tablesorter/tables.js"></script>

  </body>
</html>
    
