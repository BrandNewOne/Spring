<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<script type="text/javascript">

function signUpValidation(){
	
	var id = $("#id").val();
	var pw = $("#pw").val();
	var pwCheck = $("#pwCheck").val();
	var name = $("#name").val();
	var email = $("#email").val();
	
	if(!id){
		alert("아이디 입력은 필수입니다.");
		$("#id").focus();
	}else if(!pw){
		alert("비밀번호 입력은 필수입니다.");
		$("#pw").focus();
	}else if(!pwCheck){
		alert("비밀번호 확인 입력은 필수입니다.");
		$("#pwCheck").focus();
	}else if(pw != pwCheck){
		alert("비밀번호가 맞지 않습니다.");
		$("#pwCheck").focus();		
	}else if(!name){
		alert("닉네임 입력은 필수입니다.");
		$("#name").focus();
	}else if(!email){
		alert("이메일 입력은 필수입니다.");
		$("#email").focus();
	}else {
		signUp();
	}
	
}

function signUp(){
	
	$.ajax({
		
		url : "/prac4/jquery/signUp",
		type:'POST',
		data :  $("#registerform").serialize(),
		success:function(data){
			if(data == 1){
				alert("회원가입이 완료됐습니다.^^");
				location.href = "/prac4/user/login"
			}else if(data == 2){
				alert("이미 존재하는 아이디입니다.");
				return false;
			}
		}
		
	})
}

</script>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.btnfield {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btnfield:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>

<form  id="registerform">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <div class="fieldlabel">
    	<label for="id"><b>ID</b></label>
    </div>
    <div class="formfield">
    	<input type="text" placeholder="Enter ID" id="id" name="id" required>
	</div>
	
	<div class="fieldlabel">
    	<label for="pw"><b>Password</b></label>
    </div>
    <div class="formfield">
   		<input type="password" placeholder="Enter Password" id="pw" name="pw" required>
	</div>
	
	<div class="fieldlabel">
    	<label for="pwCheck"><b>Repeat Password</b></label>
    </div>
    <div class="formfield">
    	<input type="password" placeholder="Repeat Password" id="pwCheck" name="pwCheck" required>
    </div>
    
    <div class="fieldlabel">
    	<label for="name"><b>Name</b></label>
    </div>
    <div class="formfield">
    	<input type="text" placeholder="Enter Name" id="name" name="name" required>
    </div>
    
    <div class="fieldlabel">
    	<label for="email"><b>Email</b></label>
    </div>
    <div class="formfield">
    	<input type="text" placeholder="Enter Email" id="email" name="email" required>
    </div>
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    
    <input type="button" onclick="signUpValidation()" value="회원가입" class="btnfield">

	
    <!-- <button type="submit" class="registerbtn">Register</button> -->
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>

</body>
</html>