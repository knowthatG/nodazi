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
                            	결제 <small>Payment</small>
                        </h1>
                </div>
                <!-- /.row -->
               <div class="row">
			   		<div class="col-lg-3"></div>
				    <div class="col-lg-6">
				        <textarea class="form-control" rows="10" readonly="readonly" style="resize:none; ">약관이 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고</textarea>
				    </div>
				    <div class="col-lg-3"></div>
			   </div>
				<form class="form-horizontal" method="post">
	    			<div class="form-group">
	    				<div class="row">
	    					<div class="col-lg-6"></div>
	    					<label for="p_dep_nm" class="col-lg-2 control-label">Name :</label>
	     					<div class="col-lg-2">
	     					<input type="text" class="form-control" id="p_dep_nm" name="p_dep_nm" placeholder="Name" value= ${login.u_nm }>
	     					</div>
	    				</div>
	    			</div>
	    			
	    			<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-6"></div>
	  						<label for="p_account" class="col-lg-2 control-label">E-mail :</label>
	  						<div class= "col-lg-2">
	  							<input name="p_account" type="text" class="form-control" id="email2">
								<select name="p_dep_bank" class="form-control" id="bank_select">
		  						  <option value="" selected>-----</option>
		    					  <option value="하나">하나</option>
		    					  <option value="우리">우리</option>
		    					  <option value="농협">농협</option>
		    					  <option value="신한">신한</option>
								</select>
		  					</div>
	    				</div>
	    			</div>
    			<div class="col-sm-offset-9 col-sm-1">
    				<div class="center-block">
      					<button type="submit" class="btn btn-default" id="submit">admit</button>
    				</div>
    			</div>
    			<input type="hidden" name="u_id" value=${login.u_id }>
			</form>
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
    
            <!-- javaScript -->

</body>

</html>