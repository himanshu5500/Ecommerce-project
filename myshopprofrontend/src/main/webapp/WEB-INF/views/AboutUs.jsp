<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
<style>
.backImg{
background-image: url('<c:url value="/resources/images/about.jpg"/>');
height:28vw;
background-size: 100%;
padding-top:4vw;
}
.contactBox{
color:#fff;
height:200px;width:250px;
box-shadow:0 0 10px grey;
}
</style>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="container-fluid backImg text-center">
<span style="color:#fff;font-family: Forte;font-size: 14vw;">About Us</span>
</div><br/>
<div class="container text-center">
<span style="font-family:Edwardian Script ITC;font-weight:900;font-size:3.5vw;">My Shop Pro is Leading Brand among E-Commerce Websites. Our company provide excellent services. Good Quality products, Faster Delivery, a variety of Products and replacement and refund options. Our Product come from a verified supplier with warranty.
</span></div><br/><br/><br/><br/>
<center><span style="font-family: Forte;font-size:7.5vw;">Contact Us</span>
  <div style="width:600px;border:2px solid red"></div></center><br/><br/>
<div class="row"><center>
<div class="col-sm-4" >
<div class="thumbnail contactBox" style="background-color:black;padding-top:2em;">
<span class="glyphicon glyphicon-map-marker" style="font-size:80px"></span><br/> <span style="font-size:20px">New Delhi, India</span>
</div></div>
<div class="col-sm-4" >
<div class="thumbnail contactBox" style="background-color:black;padding-top:2em;">
<span class="glyphicon glyphicon-envelope" style="font-size:80px"></span><br/> <span style="font-size:20px">myshoppro@example.com</span>
</div></div>
<div class="col-sm-4" >
<div class="thumbnail contactBox" style="background-color:black;padding-top:2em;">
<i class="fa fa-phone" style="color:white;font-size:80px"></i> <br/><span style="font-size:20px">+1234 567 890</span>
</div></center></div>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>			 
</body></html>