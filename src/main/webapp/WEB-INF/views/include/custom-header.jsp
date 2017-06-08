<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="main_tag" href="/user/main">Know Da G</a>
            </div>
            <!-- Top Menu Items -->
          
          <c:if test="${empty login }">
          	<div class="navbar-right top-right-nav">
          		<form method="get" action="join_policy">
	          	<button type="submit" id="join_policy" class="btn btn-default">회원가입</button>
          		</form>
          		<form method="get" action="login">
    	      	<button type="submit" id="login_form" class="btn btn-default">로그인</button>
          		</form>
          	</div>
   		  </c:if>
         
          <c:if test="${!empty login }">
<%--             <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a id="drop1"href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${login.u_nm }<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="/user/info"><i class="fa fa-fw fa-user"></i> 개인정보조회</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> 개인정보수정</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/user/logout"><i class="fa fa-fw fa-power-off"></i> 로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul> --%>
             <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${login.u_nm }<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="/user/info"><i class="fa fa-fw fa-user"></i> 개인정보조회</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> 개인정보수정</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/user/logout"><i class="fa fa-fw fa-power-off"></i> 로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul>
          </c:if> 
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="blank.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> 추천종목</a>
                    </li>
                    <li>
                        <a href="blank2.jsp"><i class="fa fa-fw fa-star"></i> 관심종목</a>
                    </li>
                    <li>
                        <a href="blank3.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> 종목상세</a>
                    </li>
                    <li>
                        <a href="blank4.jsp"><i class="fa fa-fw fa-table"></i> 부가정보</a>
                    </li>
                    <li>
                        <a href="blank5.jsp"><i class="fa fa-fw fa-desktop"></i> 히스토리</a>
                    </li>
                    <li>
                        <a href="blank6.jsp"><i class="fa fa-fw fa-edit"></i> 게시판</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-shopping-cart"></i> 결제 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="/user/payment_policy">결제안내</a>
                            </li>
                            <li>
                                <a href="blank8.jsp">결제내역</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
            <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    
        
        <script>
        $('.dropdown-toggle').dropdown()
		$(function(){
			$("#main_tag").click(function(){
				$("#main_tag").attr("method","get");

			});
			
		});
        </script>
</body>
</html>