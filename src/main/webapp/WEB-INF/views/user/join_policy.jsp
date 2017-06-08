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

		
		<form method="get" action="join" id="join_form">
        <div id="page-wrapper">

            <div class="container-fluid">

 					<!--  Page Heading -->
				                <div class="row">
				                    <div class="col-lg-12">
				                        <h1 class="page-header">
				                            	결제안내<small>Statistics Overview</small>
				                        </h1>
				                    </div>
				                </div>
               			 <!-- /.row -->
				                <div class="row">
				                	<div class="col-lg-12">
				                		<textarea class="form-control" rows="3" readonly="readonly">약관이 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고</textarea>
				                	</div>
				                </div>
                
				                <p class="text-center">
				                	<input type="checkbox" id="policy_agree" ><strong>약관에 동의합니다.</strong>
				                </p>
								<p class="text-center">
									<button type="submit" class="btn btn-primary btn-lg" id="agree_btn">동의</button>
				                	<button type="button" class="btn btn-danger btn-lg">취소</button>
								</p>
                            </div>
		<%@include file="../include/footer.jsp"%> 
                        </div>

                <!-- /.row -->
		</form>
            </div>
            
            <!-- /.container-fluid -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#agree_btn").click(function(){
				if($("#policy_agree").is(":checked") == false){
					alert("약관에 동의하셔야합니다.");
					$("#policy_agree").focus();
					return false;
				}else{
					$("#join_form").submit();
				}
			});
			
		});
	</script>

</body>

</html>