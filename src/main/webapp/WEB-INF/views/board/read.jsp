<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript" src="../../js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class='popup back' style="display: none;"></div>
	<div id="popup_front" class='popup front' style="display: none;">
		<img id="popup_img">
	</div>

	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							게시판
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>Board</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<form role="form" action="modify" method="post">
					<input type='hidden' name='b_no' value="${boardDto.b_no}">
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<input type="text" name='b_title' class="form-control" value="${boardDto.b_title}" readonly="readonly">
						</div>
						<div class="form-group">
							<textarea class="form-control" name="b_content" rows="5" readonly="readonly">${boardDto.b_content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">작성자</label>
							<input type="text" name="u_id" class="form-control" value="${boardDto.u_id}" readonly="readonly">
						</div>
					</div>

					<div class="col-lg-12">
						<div>
							<hr>
						</div>
						<ul class="mailbox-attachments clearfix uploadedList"></ul>

						<c:if test="${login.u_id == boardDto.u_id}">
						<button type="submit" id="modifyBtn" class="btn btn-info">수정</button>
						<button type="submit" id="removeBtn" class="btn btn-warning">삭제</button>
						</c:if>
						<button type="submit" id="goListBtn" class="btn btn-success">목록</button>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="box box-success">
							<div class="box-header">
								<div class="box-title">댓글</div>
							</div>
							<c:if test="${not empty login}">
							<div class="box-body">
								<input class="form-control" type="text" id="newReplyText">
							</div>
							<input type="hidden" id="replywriter" value="${login.u_id}">
							<div class="box-footer">
								<button type="submit" class="btn btn-default" id="replyAddBtn">댓글 작성</button>
							</div>
							</c:if>
						</div>

						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<li class="time-label" id="repliesDiv">
								<span>
									댓글 목록 <small id='replycntSmall'>[${boardDto.r_cnt}]</small>
								</span>
							</li>
						</ul>

						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin "></ul>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				
				<!-- Modal -->
				<div id="modifyModal" class="modal modal-primary fade" role="dialog">
					<div class="modal-dialog">
						Modal content
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body" data-rno>
								<p>
									<input type="text" id="replytext" class="form-control">
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
								<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<!--/.container-fluid -->
		</div>
		<!-- /.page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<%@include file="../include/footer.jsp"%>

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="../js/plugins/morris/raphael.min.js"></script>
	<script src="../js/plugins/morris/morris.min.js"></script>
	<script src="../js/plugins/morris/morris-data.js"></script>
</body>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>
</script>  
          
<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<li class="replyLi" data-rno={{r_no}}>
    	<i class="fa fa-comments bg-blue"></i>
		<div class="timeline-item" >
			<span class="timeline-header">{{r_no}}</span>
			<span><strong>{{u_id}}</strong></span>
			<span class="time" id="tmp">
				<i class="fa fa-clock-o"></i>{{prettifyDate r_regdt}}
			</span>
			{{chkIDToDeleteReply u_id}}
			<div class="timeline-body">{{r_content}}</div>
		</div>
	</li>
{{/each}}    
</script>  

<script id="templateChk" type="text/x-handlebars-template">
	<span>|</span>
	<a href='#' id='replyModBtn'><span>수정</span></a>
	<span>|</span>
	<a href='#' id='replyDelBtn'><span>삭제</span></a>
</script>
 
<script>
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.u_id}') {
			accum += block.fn();
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year 	= dateObj.getFullYear();
		var month 	= dateObj.getMonth() + 1;
		var date 	= dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("chkIDToDeleteReply",function(u_id){
		var replyer 	 = $("#replywriter").val();
		if(replyer == u_id){
			return new Handlebars.SafeString(
					"<span>|</span>"+
					"<a href='#' id='replyModBtn'><span>수정</span></a>"+
					"<span>|</span>"+
					"<a href='#' id='replyDelBtn'><span>삭제</span></a>");

		}
	})
	
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var b_no = ${boardDto.b_no};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='"
				+ (pageMaker.startPage - 1)
				+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='"
				+ (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + b_no + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + b_no + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {
		var replytextObj = $("#newReplyText");
		var replyer 	 = $("#replywriter").val();
		var replytext 	 = replytextObj.val();
		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_no : b_no,
				u_id : replyer ,
				r_content : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + b_no + "/" + replyPage);
					replytextObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));

	});

	$("#replyModBtn").on("click", function() {

		var r_no = $(".modal-title").html();
		var r_content = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + r_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				r_content : r_content
			}),
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + b_no + "/" + replyPage);
				}
			}
		});
	});
	
	$("#replyDelBtn").on("click", function() {

		var r_no 	  = $(".modal-title").html();
		var r_content = $("#replytext").val();
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + r_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + b_no + "/" + replyPage);
				}
			}
		});
	});
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		var r_cnt =  $("#replycntSmall").html();
		
		if(r_cnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		console.log(arr);
	 	if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
				formObj.attr("action", "/board/remove");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/board/remove");
			formObj.submit();
		}
		
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/list");
		formObj.submit();
	});
	
	var b_no = ${boardDto.b_no};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/board/getAttach/" + b_no, function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
		});
	});

	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});
});


function goLogin(){
	self.location ="/user/login";
}

</script>

<style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
     
     .box-title{
     	font-size: 20px;
     	font-weight: bold;
     	margin: 5px;
     }
  	
</style>
