<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- Morris Charts CSS -->
<link href="../../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery -->
<script src="../../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>

<!-- Google Chart JavaScript -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- template JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr class="priceTr">
			<td>{{prettifyDate price_date}}</td>
			<td>{{price_open}}</td>
			<td>{{price_close}}</td>
			<td>{{price_high}}</td>
			<td>{{price_low}}</td>
			<td>{{volume}}</td>
		</tr>
	{{/each}}

</script>

<script type="text/javascript">
$(function(){

	var code = document.getElementById("code").value;
	var term = document.getElementById("");
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {

		var chartData = $.ajax({
			  url : '/stock/chartAjax'
			, dataType : 'json'
			, data : {	
				code : code
			  , term : 5
			}
			, async : false
		}).responseText;
		
		/* console.info(chartData) */
		
		var data = new google.visualization.DataTable(chartData, true);
		
		var options = {
			  width : 800
			, height : 500
			, legend : 'none'
			, candlestick: {
				  fallingColor: { strokeWidth: 1}
			   }
			, margin : 0
			, padding : 0
		};

		var chart = new google.visualization.CandlestickChart(document
				.getElementById("chartDiv"));

		chart.draw(data, options);
			
	}

	/* Handlebars 날짜 포맷 start */
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	/* Handlebars 날짜 포맷 end */
	
	/* Handlebars 숫자 포맷 start */
	Handlebars.registerHelper("prettifyNum", function(numberValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	/* Handlebars 숫자 포맷 end */

	/* Handlbars를 이용한 댓글 출력 함수 선언 start */
	var printData = function(priceArr, target, templateObject){
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = "<table class='table table-bordered table-hover'>"
				 + "<thead>"
				 + "<tr>"
				 + 		"<th>날짜</th>"
				 + 		"<th>시가</th>"
				 + 		"<th>종가</th>"
				 + 		"<th>고가</th>"
				 + 		"<th>저가</th>"
				 + 		"<th>거래량</th>"
				 + "</tr>"
				 + "</thead>"
				 + "<tbody id='priceTbody'>"
				 + template(priceArr)
				 + "</tbody>"
				 + "</table>";
		$("#priceTable").empty();
		target.html(html);
	}
	/* Handlbars를 이용한 댓글 출력 함수 선언  end */
	
	/* 페이징 출력 함수 start*/
	var printPaging = function(pageMaker, target){
		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"
				 + (pageMaker.startPage-1)
				 + "'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li "
				 + strClass
				 + "><a href='"
				 + i
				 + "'>"
				 + i
				 + "</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"
				 + (pageMaker.endPage + 1)
				 + "'> >> </a></li>";
		}
		
		target.html(str);
	}
	/* 페이징 출력 함수 end*/
	
	/* 페이지 처리 start*/
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData( data.price
					 , $("#priceTable")
					 , $('#template')
					 );
			printPaging( data.pageMaker
					   , $(".pagination")
					   );
		});
	}
	/* 페이지 처리 end*/

	/* 댓글 가져오기  start*/
	/* $("#repliesDiv").on("click", function(){
		
		if($(".timeline li").size() > 1){
			return;
		}
		getPage("/replies/" + bno + "/1");
	}); */
	/* 댓글 가져오기  end*/
	
	/* 페이지 링크 처리 start*/
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		pricePage = $(this).attr("href");
		
		getPage("/stock/" + code + "/" + pricePage);
	});
	/* 페이지 링크 처리 end*/
	
	console.info("/stock/" + code + "/1");
	getPage("/stock/" + code + "/1");
	
	
});
	
</script>

</head>
<body>

	<input type="hidden" id="code" value="${code.code }"/>

	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							상세보기<small>${code.company}<span>별</span></small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<!-- chart and history -->
				<div class="row">
					<!-- chart -->
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw" ></i> &nbsp;${code.company }
								</h3>
							</div>
							<div class="panel-body">
								<div id="chartDiv"></div>
							</div>
						</div>
					</div>
					<!-- col-leg-8 end -->
					
					<!-- history -->
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-fw fa-calendar" ></i> &nbsp;History
								</h3>
							</div>
							<div class="panel-body">
								<div class="list-group">
									<c:forEach items="${history }" var="history">
										<span class="list-group-item">
											<fmt:formatDate value="${history.r_recdt }"/>
											<span class="badge">
												<c:if test="${history.r_change > 0}">
													▲ ${history.r_change}
												</c:if>
												<c:if test="${history.r_change < 0}">
													▼ ${history.r_change}
												</c:if>
												<c:if test="${history.r_change == 0}">
													- ${history.r_change}
												</c:if>
											</span>
										</span>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- col-lg-4 end -->
				</div>
				<!-- row end -->
				
				<!-- price table -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-money fa-fw" ></i> &nbsp;Price
								</h3>
							</div>
							<div class="panel-body">
								<div class="table-responsive" id="priceTable">
								
								</div>
								<div class = "text-center">
									<ul id="pagination" class="pagination pagination-sm no-margin">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- col-lg-12 end -->
				</div>
				<!-- row end -->


				<%@include file="../include/footer.jsp"%>

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- page-wrapper -->
	</div>
	<!-- wrapper -->

</body>

</html>