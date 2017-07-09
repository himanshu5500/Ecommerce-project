<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>

.styled-input {
    width: 100%;
    position: relative;
    margin: 0 0 1.6em;
    //color: #fff;
}

.styled-input input:focus ~ label, .styled-input input:valid ~ label{
    font-size: .9em;
    color: #fff;
    top: -1.5em;
    -webkit-transition: all 0.125s;
    -moz-transition: all 0.125s;
    -o-transition: all 0.125s;
    -ms-transition: all 0.125s;
    transition: all 0.125s;
}
.styled-input label {
   	color: #8c8c8c;
    color: #bfbfbf;
    padding: 0.5em .9em;
    position: absolute;
    top: 0;
    left: 0;
    -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
    transition: all 0.3s;
   	font-weight: 400;
    font-size: .9em;
    display: block;
    line-height: 1em;
}/*
label {
    margin: 0;
    letter-spacing: 1px;
}
label {
    cursor: default;
}
.styled-input input ~ span, .styled-input textarea ~ span {
    display: block;
    width: 0;
    height: 2px;
    background: #fff;
    position: absolute;
    bottom: 0;
    left: 0;
    -webkit-transition: all 0.125s;
    -moz-transition: all 0.125s;
    transition: all 0.125s;
}*/
.body{background-color: black;}
</style>
<%@include file="header.jsp" %>


<div class="styled-input body">
		<input type="text" name="Your name" required=""> 
								<label>Patients Name</label>
								<span></span>
							</div>
							
							<div class="container col-sm-4 col-sm-offset-4">
							<form action="addCategory" method="post" class="form-horizontal">
							<div class="styled-input body">
							<input type="text" name="name" class="form-control" required=""/>
							<label>Patients Name</label>
								<span></span>
							</div>
							<div class="styled-input body">
							<input type="password" class="form-control" required=""/>
							<label>Patients Name</label>
								<span></span>
							</div>
							<input type="submit" value="save" class="btn btn-success btn-block tt"/>
							</form></div>
							 
</body></html>