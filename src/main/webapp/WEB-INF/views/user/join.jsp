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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    


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
     				 <input type="text" class="form-control" id="u_nm" name="u_nm" placeholder="Name">
    			</div>
  			</div>
  			
  			<div class="form-group">
   			   <label for="u_id" class="col-sm-2 control-label">ID :</label>
    			<div class="col-sm-10">
    			  <input type="text" class="form-control" id="u_id" name="u_id" placeholder="ID">
    			</div>
  			</div>
  			
  			  <div class="form-group">
   			   <label for="u_pw" class="col-sm-2 control-label">Password :</label>
    			<div class="col-sm-10">
    			  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="u_pw">
    			</div>
  			</div>
  			
  			<div class="form-group">
   			   <label for="passcheck" class="col-sm-2 control-label">PwCheck :</label>
    			<div class="col-sm-10">
    			  <input type="password" class="form-control" id="passcheck" placeholder="Password Check">
    			</div>
  			</div>
  			
  			
  			
  			<div class="form-group">
  				 <label for="email1" class="col-sm-2 control-label">E-mail :</label>
  					<div class="col-sm-4">
  						<input name="email1" type="text" class="form-control" id="email1" size="15"placeholder="E-mail"> 
  					</div>
  					<div class="col-sm-4">
  						<input name="email2" type="text" class="form-control" id="email2" size="20" readonly="readonly" placeholder="@">
  					</div>
					<div class="col-sm-2">
						<select name="email_select" class="form-control" id="email_select">
  						  <option value="" selected>-----</option>
    					  <option value="naver.com">Naver</option>
    					  <option value="hotmail.com">Outlook</option>
    					  <option value="hanmail.com">Hanmail</option>
    					  <option value="yahoo.co.kr">Yahoo</option>
   						  <option value="1">직접입력</option>
						</select>
					</div>
  			</div>
  			
  			 <div class="form-group">
   			   <label for="mobile1" class="col-sm-2 control-label">Phone :</label>
    			<div class="col-sm-2">
    			  <input name="mobile1" type="text" class="form-control" id="mobile1" readonly="readonly" value="010">
    			  </div>
    			 <div class="col-sm-4">
    			   <input name="mobile2" type="text" class="form-control" id="mobile2" placeholder="-" >
    			 </div>
    			 <div class="col-sm-4">
    			    <input name="mobile3" type="text" class="form-control" id="mobile3"  placeholder="-">
    			  </div>
    			</div>
  			</div>
  
 		 <input type="hidden" name="u_email" id="u_email" value="">
  		<input type="hidden" name="u_mobile" id="u_mobile" value="">
  		<div class="form-group" style="width:500">
    		<div class="col-sm-offset-2 col-sm-12">
    			<div class="center-block">
      			<button type="submit" class="btn btn-default" id="submit">Sign in</button>
    			</div>
    		</div>
 		 </div>
      </div>
		</form>

		<%@include file="../include/footer.jsp"%>
                <!-- /.row -->

            </div>
            </div>
            </div>
            <!-- /.container-fluid -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
    
            <!-- javaScript -->
<script>
$(function(){
	//e-mail 셀렉트박스 처리.
	$("#email_select").change(function(){
		if($("#email_select").val() == "1"){
			$("#email2").attr("readonly",false); 
			$("#email2").val("");
			$("#email2").focus();
		}else{
			$("#email2").attr("readonly",true); 
			$("#email2").val($("#email_select").val());
		}
	})
	//비밀번호 유효성 처리.
	 $("#submit").click(function(){
			
		 if($("#u_pw").val().length < 8 || $("#u_pw").val().length > 20){
				alert("비밀번호는 8~20자리여야 합니다.");
				return false;
			}else if($("#u_id").val() == null){
				alert("아이디를 입력해주세요");
				$("#u_id").focus();
				return false;
			}
			else if($("#email1").val()== null ||("#email2").val() == null){
				alert("이메일을 입력해주세요");
				$("#email1").focus();
				return false;
			}
			else{
				if($("#u_pw").val() != $("#passcheck").val()){
					alert("비밀번호가 다릅니다.");
					return false;
				}
				else{
					 
				 	mobile1 = $("#mobile1").val();
					mobile2 = $("#mobile2").val();
					mobile3 = $("#mobile3").val();
					
					
					email1 = $("#email1").val();
					email2 = $("#email2").val();
					
					u_email = email1 + "@" + email2;
					
					u_mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
					
					$("#u_mobile").val(u_mobile);
					
					$("#u_email").val(u_email);	
					alert(u_mobile,u_email);
					submit();
				}
			}

	});
 	
		

});

</script>

</body>

</html>