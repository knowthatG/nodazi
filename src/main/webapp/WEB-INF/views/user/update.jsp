<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>

<body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">

 <!--                Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	종목상세 <small>Statistics Overview</small>
                        </h1>
					</div>
				</div>
                <!-- /.row -->

                <!-- /.row -->
                <ul class="nav nav-tabs">
					 <li><a href="/user/info">회원정보</a></li>
					 <li class="active"><a href="/user/update">정보수정</a></li>
					 <li><a href="/user/withdraw">회원탈퇴</a></li>
				</ul>
					                

                            </div>
		<%@include file="../include/footer.jsp"%>
                        </div>

                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>


</body>

</html>