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
    
    	<style type="text/css">

@font-face{
	font-family: blackChancery;
	src: url(../fonts/BLKCHCRY.ttf);
	font-weight: bold;
}

#companyName{
	font-family: blackChancery;
	font-size: 30px;
	text-align: center;
}
	</style>
</head>

<body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	회원가입 <small>Join</small>
                        </h1>
     
						 <form class="well form-horizontal"  id="contact_form" method="post" action="/user/join">
						<fieldset>
						
						<!-- Form Name -->
						<legend><center><h2><b id="companyName">Know Da G</b></h2></center></legend><br>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Name</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						   <input type="text" class="form-control" id="u_nm" name="u_nm" placeholder="Name" required="">
						    </div>
						  </div>
						</div>
						  
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label">ID</label>  
						  <div class="col-md-4 inputGroupContainer">
						  <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    <input type="text" class="form-control" id="u_id" name="u_id" placeholder="ID" required="">
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Password</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="u_pw" required="">
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Confirm Password</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						   <input type="password" class="form-control" id="passcheck" placeholder="Password Check" required="">
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						       <div class="form-group">
						  <label class="col-md-4 control-label">E-Mail</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						   <input type="text" id="u_email" name="u_email" class="form-control" required=""/>
						    </div>
						  </div>
						</div>
						
						
						<!-- Text input-->
						       
						<div class="form-group">
						  <label class="col-md-4 control-label">Contact No.</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
						  <input type="text" id="u_mobile" name="u_mobile" class="form-control" required="" size="12">
						    </div>
						  </div>
						</div>
						
						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label"></label>
						  <div class="col-md-4" style="text-align: center"><br>
						     <button type="submit"id="submit"class="btn btn-warning" ><span class="glyphicon glyphicon-send">&nbsp</span>Join</button>
						  </div>
						</div>
						
						</fieldset>
						</form>
						</div>
            </div>
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

</script>

</body>

</html>