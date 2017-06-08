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
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
/* $(function) start */
$(document).ready(function(){
  $.get('/user/info', function(data){
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
				 			<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	회원가입 <small>Register</small>
                        </h1>
                </div>

				<div class="container">
				  <div class="row">
				    <div class="col-sm-6 col-sm-offset-2">
				
				      <!-- Nav tabs -->
				      <ul class="nav nav-tabs" role="tablist">
				        <li role="presentation" class="active"><a href="/user/info" id="link-1" aria-controls="section-1" role="tab" data-target="#section-1" data-toggle="tab">정보조회</a></li>
				        <li role="presentation"><a href="/user/update" id="link-2" aria-controls="section-2" role="tab" data-target="#section-2" data-toggle="tab">정보수정</a></li>
				        <li role="presentation"><a href="/user/withdraw" id="link-3" aria-controls="section-3" role="tab" data-target="#section-3" data-toggle="tab">회원탈퇴</a></li>
				      </ul>
				
				      <!-- Tab panes -->
				      <div class="tab-content">
				        <div role="tabpanel" class="tab-pane active" id="section-1">
				          <label for="email1" class="col-sm-2 control-label">E-mail :</label>
  						<input name="email1" type="text" class="form-control" id="email1" size="15"placeholder="E-mail" readonly="readonly";> ${udto.u_email }
				        </div>
				        <div role="tabpanel" class="tab-pane" id="section-2">
				         <input type="text">
				          <input type="text">
				        </div>
				        <div role="tabpanel" class="tab-pane" id="section-3">
				         <input type="text">
				           <input type="text">
				           <input type="text">
				        </div>
				         
				        
				        <div role="tabpanel" class="tab-pane" id="section-4">
				         <input type="text">
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				<%@include file="../include/footer.jsp"%>
			</div>
		</div>

</body>
</html>
