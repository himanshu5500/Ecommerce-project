<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="container" style="margin-bottom:0px"></div>
<div id="myCarousel" class="carousel slide" data-ride="carousel" >
    <div class="carousel-inner">
      <div class="item active">
        <img src="<c:url value="/resources/images/Slide1.jpg"/>" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="<c:url value="/resources/images/Slide2.jpg"/>" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="<c:url value="/resources/images/Slide3.jpg"/>" alt="New York" style="width:100%;">
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <h2>
	
	</h2>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>