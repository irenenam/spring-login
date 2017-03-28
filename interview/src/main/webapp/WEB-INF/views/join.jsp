<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Join</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link data-require="bootstrap@3.3.6" data-semver="3.3.6" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script data-require="bootstrap@3.3.6" data-semver="3.3.6" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script data-require="angularjs@1.6.2" data-semver="1.6.2" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.2/angular.js"></script>
<script type="text/javascript">
var checkFlag = false;
function checkId(){
	var userId = $('#userId').val();
	
	if (isEmpty(userId)) {
		alert("Please enter the userId.");
		$('#userId').focus();
		return;
	}
	
	var http = new XMLHttpRequest();
    var url = "/users/check?userId="+userId;
    http.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
        	readyIdCheck(JSON.parse(this.responseText));
        }
    }
    http.open("GET",url,true);
    http.send();
   
}

function readyIdCheck(text) {
	var isExist = text.exist;
	
	if (isExist) {
		alert("Somebody uses this id. Please try agin.");
		$('#userId').val("");
		$('#userId').focus();
	} else {
		alert("You can use this id.");	
		checkFlag = true;	
	}
}

function join() {
	if (checkFlag) {
		if ( checkValidation() ) {
			var form = document.getElementById("userinfo");	
			form.action = "/users/create";
			form.submit();
		}
	} else {
		alert("Please check your id.");		
	}
}

function checkValidation() {
	if ( isEmpty($('#userId').val()) )	{
		alert("Please enter the userId");
		$('#userId').focus();	
		return false;
	} else if ( isEmpty($('#password').val()) )	{
		alert("Please enter the password");
		$('#password').focus();	
		return false;
	}  else if ( isEmpty($('#name').val()) )	{
		alert("Please enter the name");
		$('#name').focus();	
		return false;
	}  else if ( isEmpty($('#email').val()) )	{
		alert("Please enter the email");
		$('#email').focus();	
		return false;
	}  else {
		return true;
	}
}

function isEmpty(value) {
	if ( value == null || value.trim().length < 1 ) {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
<form id="userinfo" name="userinfo" method="post">
	<div class="input-group">
	  <input type="text" id="userId" name="userId" class="form-control" placeholder="UserId" aria-describedby="basic-addon1">
	  <!-- <span class="input-group-btn"><button type="button" class="btn" onclick="javscript:checkId();">checkId</button></span>  -->
	</div>
	<div class="input-group">
	   <span class="input-group-btn"><button type="button" class="btn" onclick="javscript:checkId();">checkId</button></span>  
	</div>
  	<div class="input-group">
	  <input type="text" id="password" name="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1"> 
	</div>
	<div class="input-group">
   		<input type="text" id="name" name="name" class="form-control" placeholder="Name" aria-describedby="basic-addon1"> 
   		<span class="input-group-btn"></span> 
   	</div>
	<div class="input-group">
		<input type="text" id="email" name="email" class="form-control" placeholder="Email" aria-describedby="basic-addon1">  
   		<span class="input-group-btn"></span>
   	</div>
</form>	
<button type="button"  class="btn" onclick="javascript:join();">join us!</button>
</body>
</html>