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
    
       <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    
<style type="text/css">

/*
over-ride "Weak" message, show font in dark grey
*/

.progress-bar {
    color: #333;
} 

/*
Reference:
http://www.bootstrapzen.com/item/135/simple-login-form-logo/
*/

* {
    -webkit-box-sizing: border-box;
	   -moz-box-sizing: border-box;
	        box-sizing: border-box;
	outline: none;
}

    .form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

body {
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.login-form {
	margin-top: 60px;
}

form[role=login] {
	color: #5d5d5d;
	background: #f2f2f2;
	padding: 26px;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}
	form[role=login] img {
		display: block;
		margin: 0 auto;
		margin-bottom: 35px;
	}
	form[role=login] input,
	form[role=login] button {
		font-size: 18px;
		margin: 16px 0;
	}
	form[role=login] > div {
		text-align: center;
	}
	
.form-links {
	text-align: center;
	margin-top: 1em;
	margin-bottom: 50px;
}
	.form-links a {
		color: #fff;
	}

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
                            	로그인 <small>Login</small>
                        </h1>
     				</div>
     			</div>
     	<div class="row row-centered">
			<div class="col-lg-3"></div>
				<div class="col-lg-6">
     				<form class="well form-horizontal"  id="contact_form" name="login_form" method="post" action="/user/loginPost">
						<fieldset>
						<!-- Form Name -->
						<legend><center><h2><b id="companyName">Know Da G</b></h2></center></legend><br>
						
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
						
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Password</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="Password" required="">
						    </div>
						  </div>
						</div>

						
						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label"></label>
						  <div class="col-md-4" style="text-align: center"><br>
						     <button type="submit"id="login_btn" name="login_btn" class="btn btn-warning" ><span class="glyphicon glyphicon-send">&nbsp</span>로그인</button>
						  </div>
						</div>
						
						</fieldset>
					</form>
				</div>
            </div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</div>

<script>
$("#login_btn").on("click",function(){
	var u_id = $("#u_id").val();
	var u_pw = $("#u_pw").val();

	
	$.ajax({
		type:'put',
		url: '/user/login',
		headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"},
		data: JSON.stringify({
			  u_id : u_id
			, u_pw : u_pw
		}),
		dataType:'text',
		success:function(result){
			if(result == 0){
				alert("등록되지 않은 아이디 입니다.");
				$("#u_id").focus();
				return false;
			}else if(result == 1){
				alert("올바른 비밀번호를 입력해주세요.");
				$("#u_pw").focus();
				return false;
			}else{
				alert("환영합니다.");
				return true;
			}
			}
				


		});

})
</script>


</body>

</html>