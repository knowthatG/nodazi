<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
			<div class="container">
			  <div class="row">
			    <div class="col-sm-6 col-sm-offset-2">
			
			      <!-- Nav tabs -->
			      <ul class="nav nav-tabs" role="tablist">
			        <li role="presentation" class="active"><a href="" id="link-1" aria-controls="section-1" role="tab" data-target="#section-1" data-toggle="tab">사용자 정보</a></li>
			        <li role="presentation"><a href="" id="link-2" aria-controls="section-2" role="tab" data-target="#section-2" data-toggle="tab">정보 수정</a></li>
			        <li role="presentation"><a href="" id="link-3" aria-controls="section-3" role="tab" data-target="#section-3" data-toggle="tab">회원 탈퇴</a></li>
			      </ul>
			
			      <!-- Tab panes -->
			      <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="section-1">
			        	  <div class="center-block clearfx">
				 			 <div class="form-group">
				    			<label for="u_nm" class="col-sm-2 control-label">Name :</label>
				    			<div class="col-sm-10">
				     				 <input type="text" class="form-control" value="${udto.u_nm }" readonly="readonly">
				    			</div>
				  			
				  			
				  		
				   			   <label for="u_id" class="col-sm-2 control-label">ID :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control"  value="${udto.u_id }" readonly="readonly">
				    			</div>
				  		
				  			
				
				   			   <label for="u_pw" class="col-sm-2 control-label">email :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control" id="f_u_email" value="${udto.u_email }" readonly="readonly">
				    			</div>
				  			
			
				   			   <label for="passcheck" class="col-sm-2 control-label">Mobile :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control"  id="f_u_mobile" value="${udto.u_mobile }" readonly="readonly">
				    			</div>
				  			</div>
						</div>
					</div>
			      
			      <!-- section 2 -->
			       <div role="tabpanel" class="tab-pane" id="section-2">
			        	<form action="/user/update">
			        					        	  <div class="center-block clearfx">
				 			 <div class="form-group">
				    			<label for="u_nm" class="col-sm-2 control-label">Name :</label>
				    			<div class="col-sm-10">
				     				 <input type="text" class="form-control" id="u_nm" name="u_nm" value="${udto.u_nm }" readonly="readonly">
				    			</div>
				  			
				  			
				  		
				   			   <label for="u_id" class="col-sm-2 control-label">ID :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control"  value="${udto.u_id }" readonly="readonly">
				    			</div>
				  				
				 				<label for="u_id" class="col-sm-2 control-label">PW :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control" id="u_pw" name="u_pw" value="${udto.u_pw }" >
				    			</div>
				  		
				  			
				
				   			   <label for="u_pw" class="col-sm-2 control-label">email :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control" id="u_email" name="u_email" value="${udto.u_email }" >
				    			</div>
				  			
				  			

				   			   <label for="passcheck" class="col-sm-2 control-label">Mobile :</label>
				    			<div class="col-sm-10">
				    			  <input type="text" class="form-control" id="u_mobile" value="${udto.u_mobile }">
				    			</div>
				    			
				    			<input type="button" id="update_btn" class="btn btn-default" value="update">
				  			</div>
						</div>
			        	</form>
			        </div>
			        
			        <!-- section 3 -->
			        <div role="tabpanel" class="tab-pane" id="section-3">
			        	<form action="/user/withdraw" method="post">
			        	<input type="hidden" id="u_id" name="u_id" value="${udto.u_id }">
			        	<input type="submit" id="withdraw_btn" class="btn btn-default" value="withdraw">
			        	</form>
			        </div>
			        <!-- section end -->
			      </div>
			    </div>
			  </div>
			</div>		
		</div>
		<%@include file="../include/footer.jsp"%>
                <!-- /.row -->

            </div>
            </div>
            </div>
<script>
$("#update_btn").on("click",function(){
	var u_id = $("#u_id").val();
	var u_pw = $("#u_pw").val();
	var u_email = $("#u_email").val();
	var u_mobile = $("#u_mobile").val();
	
	$.ajax({
		type:'put',
		url: '/user/'+u_id,
		headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"},
		data:JSON.stringify({u_pw:u_pw,u_email:u_email,u_mobile:u_mobile}),
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
function getInfo(){
	{
		alert("info");
		$("#f_u_email").val($("#u_email").val());
		$("#f_u_mobile").val($("#u_mobile").val());
		
	}
}

</script>
</body>
</html>