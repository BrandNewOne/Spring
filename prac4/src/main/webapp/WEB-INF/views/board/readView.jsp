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

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
			
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/prac4/board/boardUpdateView");
			formObj.attr("method", "post");
			formObj.submit();				
		})
			
		// 삭제
		$(".delete_btn").on("click", function(){
			formObj.attr("action", "/prac4/board/boardDelete");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
	
/* 	//뎃글 작성완료
	$(".replyWriteBtn").on("click", function(){
 		var formObj = $("form[name='replyForm']");
  		formObj.attr("action", "/prac4/reply/replyWrite");
  		formObj.submit();
	});
*/
	
</script>
	
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
	<p></p>
	<!-- board -->
	<div class="container" id="container">
		<form name="readForm"role="form" method="post">
			<input type="text" id="title" name="title" class="form-control mt-4 mb-2" value="${boardRead.title}" autofocus="none" readonly >
			<h6>
				<input type="hidden" id="bno" name="bno" value="${boardRead.bno}"  />
				<input type="text" id="writer" name="writer" value="${boardRead.writer}" style="float:left; border:none; outline:none; font-weight:bold " readonly/>
				<div style="float:right;">[ <fmt:formatDate value="${boardRead.regdate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/> ]
				</div>
			</h6>
			<textarea class="form-control" rows="10" id="content" name="content" readonly><c:out value="${boardRead.content}" /></textarea>
			<c:if test="${sessionScope.loginUser.id == boardRead.writer}">
				<div>
					<ul></ul>
					<button type="submit" class="btn delete_btn btn-secondary mb-3" style="float: right">삭제</button>
					<button type="submit" class="btn update_btn btn-secondary mb-3"  style="float: right">수정</button>
				</div>
			</c:if>
		</form>
	</div>
	<br/>
	
	<!-- wirte comment -->
	
	<div class="container">
		<form name="replyForm" action="/prac4/reply/replyWrite" method="post">
			<input type="hidden" id="bno" name="bno" value="${boardRead.bno}" />
			<div>
    			<input type="hidden" id="writer" name="writer" value="${sessionScope.loginUser.id}" readonly/>
    			<br/>
    			<input type="text" id="content" name="content" />
    			<button type="submit" class="btn replyWriteBtn btn-success">작성</button>
  			</div>
		</form>
	</div>
	
	<!-- comment -->
	
	<div class="container" id="Reply">
	
  		<ol class="boardReply">
  		
    		<c:forEach items="${boardReply}" var="boardReply">
    			<div>
    				<div>
    					<table class='table'><h6><strong>${boardReply.writer} </strong> [ <fmt:formatDate value="${boardReply.regdate}" pattern="yyyy/MM/dd-HH:mm" /> ]</h6>
    						<tr><td>${boardReply.content}
    								<c:if test="${sessionScope.loginUser.id == boardReply.writer}">
    									<form action="/prac4/reply/replyDelete" method="post" style="float:right;">
    										<input type="hidden" id="bno" name="bno" value="${boardRead.bno}"/>
    										<input type="hidden" id="rno" name="rno" value="${boardReply.rno}"/>
    										<button type="submit" class="btn btn-danger">삭제</button>
    									</form>
    								</c:if>
    						</td></tr>
    						
    					</table>
    				</div>
    			</div>
    		</c:forEach>   
  		</ol>
	</div>
</body>
</html>
