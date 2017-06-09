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
<script type="text/javascript">
$(document).ready(function(){
	  $.get('/joshadelic/pen/WvmePv.html', function(data){
	    $('#section-1').html(data);
	  });
	});

	$('[data-toggle="tab"]').on('click', function(){
	    var $this = $(this),
	        source = $this.attr('href'),
	        pane = $this.attr('data-target');
	  
	    if($(pane).is(':empty')) {  // check if pane is empty, if so get data
	      $.get(source, function(data) {
	          $(pane).html(data);
	      });

	      $(this).tab('show');
	      return false;
	    }
	}); 
</script>
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
			        <li role="presentation" class="active"><a href="" id="link-1" aria-controls="section-1" role="tab" data-target="#section-1" data-toggle="tab">Section 1</a></li>
			        <li role="presentation"><a href="/joshadelic/pen/LVabRL.html" id="link-2" aria-controls="section-2" role="tab" data-target="#section-2" data-toggle="tab">Section 2</a></li>
			        <li role="presentation"><a href="/joshadelic/pen/VLRmKr.html" id="link-3" aria-controls="section-3" role="tab" data-target="#section-3" data-toggle="tab">Section 3</a></li>
			      </ul>
			
			      <!-- Tab panes -->
			      <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="section-1">
			        	
			        </div>
			       <div role="tabpanel" class="tab-pane" id="section-2">
			        	<form action="/user/update">
			        	
			        	</form>
			        </div>
			        <div role="tabpanel" class="tab-pane" id="section-3">
			        	
			        </div>
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

</script>
</body>
</html>