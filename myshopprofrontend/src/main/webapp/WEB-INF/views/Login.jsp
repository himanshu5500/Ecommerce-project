<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
<style>
.loginback{
  background:url("<c:url value="/resources/images/bg.jpg"/>");
  }
 .msg{border:1px solid white;padding:10px;font-size: 25px;}
</style>
<%@include file="/WEB-INF/views/header.jsp"%>
<script type="text/javascript" src="<c:url value="/resources/js/regform.js"/>"></script>
<div class="container-fluid loginback">
<div class="container col-sm-4 col-sm-offset-4 loginform">
							<c:if test="${userCreate!=null||msg!=null}"><br/><br/>
							<span class="msg">${userCreate}${msg}</span>
							</c:if>
							<h1>Sign In</h1>
							<form action="perform_login" method="post" class="form-horizontal">
							<div class="from-style" id="username">
							<input type="text" name="username" class="form-control" required="" maxlength="25"/>
							<label>Username</label>
							</div>
							<div class="from-style" id="password">
							<input type="password" name="password" class="form-control" required="" pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters are not allowed"/>
							<label>Password</label>
							</div>
							<input type="submit" value="Sign in" class="btn btn-primary btn-block submitBut"/>
							</form>
							<div class="from-style">
							<span>Don't have an account?</span>&nbsp;&nbsp;&nbsp;<a href="register">Sign Up</a>
							</div>
							</div>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>				
</body>
</html>