 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href='${pageContext.request.contextPath}/resources/css/core/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/css/daygrid/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/css/timegrid/main.css'
	rel='stylesheet' />
<script
	src='${pageContext.request.contextPath}/resources/css/core/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/css/interaction/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/css/daygrid/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/css/timegrid/main.js'></script>
<script>
	
	
	//console.log('id','${sessionScope.loginUser.name}');
	//console.log('결과값','${result}');
	//var ent = ${result};
	//console.log('변환값',ent);
	
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : new Date(),
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : 
				function(arg){
					var title = prompt('할 일');
					if (title) {
						$.ajax({
							
							type : 'POST',
							url : "/prac4/jquery/inputSchedule",
							data : { 
								
								id : '${sessionScope.loginUser.id}',
								title : title, 
								start : arg.start.format('yyyy-MM-dd HH:mm:ss'),
								end : arg.end.format('yyyy-MM-dd HH:mm:ss')
								
								//start : arg.start.toString(),
								//end : arg.end.toISOString()
							},
							success:function(data){
								if(data == 0){
									//alert("성공");
									location.reload();
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							} 
							
						})
					}
					calendar.unselect()
			},
				/* function(arg) {
					var title = prompt('Event Title:');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay
	
						//디비에 보내기
						})
					}
					calendar.unselect()
				} ,*/
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : ${result},
			timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
			
 			eventClick: function(arg) {
				if (confirm(arg.event.title+' 일정을 삭제하시겠습니까?')) {
					//DB쇼
					//arg.event.remove()
					
					$.ajax({
							
							type : 'POST',
							url : "/prac4/jquery/deleteSchedule",
							data : { 
								
								title : arg.event.title,
								start : arg.event.start.format('yyyy-MM-dd HH:mm:ss'),
								end : arg.event.end.format('yyyy-MM-dd HH:mm:ss')
								
							},
							success:function(data){
								if(data == 0){
									location.reload();
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							} 
							
						})
					
					console.log(arg.event);
			    }
			} 
			
		});

		calendar.render();
		
	});
	
	
	
	/* date format Function */
	Date.prototype.format = function (f) {
	    if (!this.valueOf()) return " ";



	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

	    var d = this;



	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

	        switch ($1) {

	            case "yyyy": return d.getFullYear(); // 년 (4자리)

	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

	            case "dd": return d.getDate().zf(2); // 일 (2자리)

	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)

	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)

	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

	            default: return $1;

	        }

	    });

	};



	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
	Number.prototype.zf = function (len) { return this.toString().zf(len); };
	
	
</script>
<style>
/* body {
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
} */

#calendar {
	margin-top : 15px;
	max-width: 900px;
}
</style>
</head>
<body>

<!-- header -->
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
				<li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
				<li class="nav-item"><a href="/prac4/view/calendar" class="nav-link">일정</a></li>
				<li class="nav-item"><a href="#" class="nav-link">멤버</a></li>
			</ul>
		</div>
	</nav>

	<div id='calendar'></div>


</body>
</html>
