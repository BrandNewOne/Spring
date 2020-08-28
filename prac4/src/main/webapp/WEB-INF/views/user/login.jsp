<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
/* .signUp {
	position: relative;
	margin: 50px auto;
	width: 280px;
	padding: 33px 25px 29px;
	background: #FFFFFF;
	border-bottom: 1px solid #C4C4C4;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
} */
.signUp {
  background-color: #FFFF;
  margin: 50px auto;
  color: white;
  padding: 33px 25px 29px;
  border-bottom: 1px solid #C4C4C4;
  border-radius: 5px;
  cursor: pointer;
  opacity: 0.8;
  position: relative;
  bottom: 23px;
  right: 28px;
  width: 280px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUpTitle {
	margin: -25px -25px 25px;
	padding: 15px 25px;
	line-height: 35px;
	font-size: 26px;
	font-weight: 300;
	color: #777;
	text-align: center;
	text-shadow: 0 1px rgba(255, 255, 255, 0.75);
	background: #F7F7F7;
}
.signUpTitle:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 8px;
	background: #C4E17F;
	border-radius: 5px 5px 0 0;
}

.signUpInput {
	width: 100%;
	height: 50px;
	margin-bottom: 25px;
	padding: 0 15px 2px;
	font-size: 17px;
	background: white;
	border: 2px solid #EBEBEB;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 -2px #EBEBEB;
	box-shadow: inset 0 -2px #EBEBEB;
}
.signUpInput:focus {
	border-color: #62C2E4;
	outline: none;
	-webkit-box-shadow: inset 0 -2px #62C2E4;
	box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
	line-height: 48px;
}
.loginButton {
	position: relative;
	vertical-align: top;
	width: 100%;
	height: 54px;
	padding: 0;
	font-size: 22px;
	color: white;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: #C4E17F;
	border: 0;
	border-bottom: 2px solid #C4E17F;
	border-radius: 5px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 -2px #F7F7F7;
	box-shadow: inset 0 -2px #F7F7F7;
}
.loginButton:active {
	top: 1px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
.signUpButton {
	position: relative;
	vertical-align: top;
	width: 100%;
	height: 54px;
	padding: 0;
	font-size: 18px;
	color: white;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: #F0776C;
	border: 0;
	border-bottom: 2px solid #D76B60;
	border-radius: 5px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 -2px #D76B60;
	box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
	top: 1px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
:-moz-placeholder {
	color: #AAAAAA;
	font-weight: 300;
}

::-moz-placeholder {
	color: #AAAAAA;
	opacity: 1;
	font-weight: 300;
}

::-webkit-input-placeholder {
	color: #AAAAAA;
	font-weight: 300;
}

:-ms-input-placeholder {
	color: #AAAAAA;
	font-weight: 300;
}

::-moz-focus-inner {
	border: 0;
	padding: 0;
}


}
</style>

<script type="text/javascript">

function loginValidation(){
	
	var id = $("#id").val();
	var password = $("#pw").val();
	
	if(!id){
		alert("아이디를 입력하세요.");
		$("#id").focus();
		return false;
	}else if(!password){
		alert("비밀번호를 입력하세요.");
		$("#pw").focus();
		return false;
	}else {
		login(id,pw);
	}
	
}

function login(userId,password){
	
	$.ajax({
		
		type : 'POST',
		url : "/prac4/jquery/login",
		data : { id : $('#id').val(), 
				pw : $('#pw').val()
		},
		success:function(data){
			if(data == 2){
				alert("아이디 혹은 비밀번호가 맞지 않습니다.");
				return false;
			}else if(data == 3){
				location.href="/prac4/view/home";
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	})
	
}

function enterKeyCheck(){
	
 if(event.keyCode == 13)
	  {
	 loginValidation();
	  }
	
	
}

</script>

</head>
<body>

	<form class="signUp" id="signupForm">
		<h1 class="signUpTitle">로그인</h1>
		
		<input 
			type="text" 
			id="id" 
			class="signUpInput"
			placeholder="ID"
			autofocus onkeyup="enterKeyCheck()"> 
		
		<input 
			type="password"
			id="pw" 
			class="signUpInput" 
			placeholder="Password"
			onkeyup="enterKeyCheck()"> 
		
		<input 
			type="button"
			value="로그인"
			onclick="loginValidation()" 
			class="loginButton"> 
		
		<input
			type="button"
			value="회원가입" 
			onclick="location.href='/prac4/user/signUp'"
			class="signUpButton">
	</form>

</body>
</html>