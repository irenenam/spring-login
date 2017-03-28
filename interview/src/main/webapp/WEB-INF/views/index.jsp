<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link data-require="bootstrap@3.3.6" data-semver="3.3.6" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script data-require="bootstrap@3.3.6" data-semver="3.3.6" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">

function goLogin() {
	if ( isEmpty($('#userId').val()) )	{
		alert("Please enter the userId");
		$('#userId').focus();	
		return;
	} else if ( isEmpty($('#password').val()) )	{
		alert("Please enter the password");
		$('#password').focus();	
		return;
	}
	
	var form = document.getElementById("loginform");	
	form.action = "/users/login";
	form.submit();
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
	<c:choose>
	<c:when test="${not empty sessionScope.user}">
		<h1>Hello! ${sessionScope.user.userId}</h1>
		<div class="btn-group" role="group">
         	<button type="button" onclick="location.href='/users/logout'" class="btn btn-default">Logout</button>
        </div>
	</c:when>
	<c:otherwise>
		<h1>Login Page.</h1>
		<c:if test="${param.loginFailed}">
	    	<div><b>Wrong I.D or password. Please do it again.</b></div>
	    </c:if>
		<form name="loginform" id="loginform" method="post" action="javascript:goLogin();">
	        <div class="input-group">
			 	<input type="text" id="userId" name="userId" class="form-control" placeholder="UserId" aria-describedby="basic-addon1">
			</div>
		  	<div class="input-group">
			  <input type="password" id="password" name="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1"> 
			 </div>
	         <div class="btn-group" role="group">
	         	<button type="button" class="btn btn-default" onclick="javascript:goLogin();">login</button>
	         </div>
	     </form>
		<div class="input-group">
			If you don't have an account. Please <a href="join">join</a> our site.
		</div>
	</c:otherwise>
	</c:choose>
</body>
</html>  

