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

 <!--                Page Heading -->
 				
 				
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	로그인 <small>Log in</small>
                        </h1>
                        
                        <div class="row" id="pwd-container">
						    <div class="col-md-4"></div>
						    
						    <div class="col-md-4">
						      <section class="login-form">
						        <form method="post" action="#" role="login">
						          <span id="companyName">Know Da Zi</span>
						          <input type="email" name="email" placeholder="Email" required class="form-control input-lg" />
						          
						          <input type="password" class="form-control input-lg" id="password" placeholder="Password" required="" />
						          
						          <div class="pwstrength_viewport_progress"></div>
						          
						          <button type="submit" name="go" class="btn btn-lg btn-primary btn-block">로그인</button>
						          <div>
						            <a href="#">계정 등록</a> or <a href="#">비밀번호 찾기</a>
						          </div>
						          
						        </form>
						        
						      </section>  
						      </div>
						  </div>
                    </div>
		<%@include file="../include/footer.jsp"%>
                <!-- /.row -->

            </div>
          </div>
         </div>
            <!-- /.container-fluid -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

</body>

</html>