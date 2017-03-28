<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
function goDel() {
	if (confirm('Do you want to delete your info?')) {
		location.href = "/users/delete";
	}
}

function goModify() {
	if(checkValidation()) {
		var form = document.getElementById("userinfo");	
		form.action = "/users/modify";
		form.submit();
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
<body>
	<h1>${users.userId} Profile</h1>
		<form name="userinfo" id="userinfo" method="post" action="javascript:goModify();">
		<input type="hidden" id="idx" name="idx" value="${users.idx}">
		<input type="hidden" id="userId" name="userId" value="${users.userId}">
			<div class="input-group">
			  <input type="text" id="userId" name="userId" class="form-control" placeholder="UserId" aria-describedby="basic-addon1" disabled value="${users.userId}">
			</div>
		  	<div class="input-group">
			  <input type="text" id="password" name="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1" value="${users.password}"> 
			</div>
			<div class="input-group">
		   		<input type="text" id="name" name="name" class="form-control" placeholder="Name" aria-describedby="basic-addon1" value="${users.name}"> 
		   		<span class="input-group-btn"></span> 
		   	</div>
			<div class="input-group">
				<input type="text" id="email" name="email" class="form-control" placeholder="Email" aria-describedby="basic-addon1" value="${users.email}">  
		   		<span class="input-group-btn"></span>
		   	</div>
		   	<div class="btn-group" role="group">
		   		<button type="button" onclick="location.href='/users/index'" class="btn btn-default">Home</button>
		   		<button type="button" onclick="location.href='/users/logout'" class="btn btn-default">Logout</button>
				<button type="button" class="btn btn-default" onclick="javscript:goModify();">Modify</button>
				<button type="button" class="btn btn-default" onclick="javascript:goDel();">Delete</button>
			</div>
		</form>
</body>
</html>
