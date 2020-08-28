<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- header -->
	<div class="jumbotron text-center mb-0">
		<h1>개발중</h1>
		<p>'${sessionScope.loginUser.name}'님 Intelligent Netwoek LAB에 오신걸 환영합니다</p>
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<a href="/prac4/view/home" class="navbar-brand"> <img src="/prac4/resources/image/inlab.png" height="39" width="39"/></a>
		<!-- Toggle Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="/prac4/user/logout" class="nav-link">로그아웃</a></li>
				<!-- <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li> -->
				<li class="nav-item"><a href="/prac4/view/calendar" class="nav-link">일정</a></li>
				<!-- <li class="nav-item"><a href="/prac4/view/myCalendar" class="nav-link">내 일정</a></li>  -->
				<li class="nav-item"><a href="#" class="nav-link">멤버</a></li>
			</ul>
		</div>
	</nav>
	<!-- content -->
	<div class="container" id="container">
		<form action="/prac4/board/boardUpdate" role="form" method="post">
			<input type="hidden" id="bno" name="bno" value="${boardUpdate.bno}"/>
			<input type="text" id="title" name="title" class="form-control mt-4 mb-2" value="${boardUpdate.title}" >
			
			<h6>
				<input id="writer" name="writer" value="${boardUpdate.writer}" style="float: left; border:none; outline:none; font-weight:bold " readonly/>
				<div style="float:right;">
					[ <fmt:formatDate value="${boardUpdate.regdate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/> ] 
				</div>
			</h6>
			
			<textarea class="form-control" rows="10" id="content" name="content"><c:out value="${boardUpdate.content}" /></textarea>

			<c:if test="${sessionScope.loginUser.id == boardUpdate.writer}">
				<ul></ul>
				<button type="submit" class="btn btn-secondary mb-3" style="float: right">수정하기</button>
			</c:if>
		</form>
	</div>
	
</body>
</html>
