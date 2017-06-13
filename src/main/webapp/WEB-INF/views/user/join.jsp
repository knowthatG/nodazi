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
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	    <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
    
    <!-- javascript -->
    <script src="../../js/User.js"></script>
</head>

<body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">

 			<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	회원가입 <small>Register</small>
                        </h1>
                </div>
                <!-- /.row -->
	      <div class="center-block clearfx" style="width:800px">
			<form class="form-horizontal" method="post">
	 			 <div class="form-group">
	    			<label for="u_nm" class="col-sm-2 control-label">Name :</label>
	    			<div class="col-sm-10">
	     				 <input type="text" class="form-control" id="u_nm" name="u_nm" placeholder="Name" required="">
	    			</div>
	  			</div>
	  			
	  			<div class="form-group">
	   			   <label for="u_id" class="col-sm-2 control-label">ID :</label>
	    			<div class="col-sm-10">
	    			  <input type="text" class="form-control" id="u_id" name="u_id" placeholder="ID" required="">
	    			</div>
	  			</div>
	  			
	  			  <div class="form-group">
	   			   <label for="u_pw" class="col-sm-2 control-label">Password :</label>
	    			<div class="col-sm-10">
	    			  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="u_pw" required="">
	    			</div>
	  			</div>
	  			
	  			<div class="form-group">
	   			   <label for="passcheck" class="col-sm-2 control-label">PwCheck :</label>
	    			<div class="col-sm-10">
	    			  <input type="password" class="form-control" id="passcheck" placeholder="Password Check" required="">
	    			</div>
	  			</div>
	  			
	  			<div class="form-group">
	  				<label for="u_email" class="col-sm-2 control-label">E-mail :</label>
	  				<div class="col-sm-10">
	  				<input type="text" id="u_email" name="u_email" class="form-control" required=""/>
	  				</div>
	  				
	  			</div>
  			
	  			<div class="form-group">
	  				<label for="u_mobile" class="col-sm-2 control-label">Tel :</label>
	  				<div class="col-sm-10">
	  				<input type="text" id="u_mobile" name="u_mobile" class="form-control" required=""/ size="12">
	  				</div>
	  			</div>
  
		  		<div class="form-group" style="width:500">
		    		<div class="col-sm-offset-2 col-sm-12">
		    			<div class="center-block">
		      			<button type="submit" class="btn btn-default" id="submit">Sign in</button>
		    			</div>
		    		</div>
		 		 </div>
		      </div>

		<%@include file="../include/footer.jsp"%>
                <!-- /.row -->

						</form>
            </div>
            </div>
            </div>
            <!-- /.container-fluid -->
    <!-- /#wrapper -->


    
            <!-- javaScript -->
<script>
$(function(){
	 $("#submit").click(function(){

			return idCheck();
			});
});

$("#update_btn").on("click",function(){
	var u_id = $("#u_id").val();
	$.ajax({
		type:'put',
		url: '/user/'+u_id,
		headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"},
		data:JSON.stringify({u_id:u_id}),
		dataType:'text',
		success:function(result){
			console.log("result:" +result);
			if(result == 'success'){
				alert("성공");
				getInfo();		
			}
		}
		
	});
})

</script>

</body>

</html>