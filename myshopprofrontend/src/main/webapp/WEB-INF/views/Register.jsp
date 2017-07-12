<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
<style>
.loginback{
  background:url("<c:url value="/resources/images/bg.jpg"/>");
  }
</style>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="container-fluid loginback">
<div class="container col-sm-4 col-sm-offset-4 loginform">
							<c:if test="${userExist!=null}"><br/><br/>
							<span style="border:1px solid white;padding:10px;font-size: 25px;">${userExist}</span>
							</c:if>
							<h1>Sign Up</h1>
							<form action="addUserDetails" method="post" class="form-horizontal">
							<div class="from-style">
							<input name="full_name" class="form-control" required=""/>
							<label>Enter Name</label>
							</div>
							<div class="from-style">
							<input type="email" name="email" class="form-control" required=""/>
							<label>Enter Email</label>
							</div>
							<div class="from-style">
							<input type="text" name="mobile" class="form-control" required="" maxlength="10"/>
							<label>Mobile Number</label>
							</div>
							<div class="from-style">
							<input name="username" class="form-control" required=""/>
							<label>Create Username</label>
							</div>
							<div class="from-style">
							<input type="password" name="password" class="form-control" required=""/>
							<label>Create Password</label>
							</div>
							<div class="from-style">
							<textarea name="address" class="form-control" required="" rows="5"></textarea>
							<label>Address</label>
							</div>
							<input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
							</form>
							<div class="from-style">
							<span>Already have an account?</span>&nbsp;&nbsp;&nbsp;<a href="login">Sign In</a>
							</div>
							</div>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>