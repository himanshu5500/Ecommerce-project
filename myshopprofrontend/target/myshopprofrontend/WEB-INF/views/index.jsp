<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Shop Pro</title>
<style>
.thumbnail{height:380px;
box-shadow:0 0 10px grey;}
</style>
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
  <br/>

<center><h1>Trending Products</h1>
<div style="width:600px;border:2px solid red"></div></center>
<br/>
<div id="HomeACarousel" class="carousel slide" data-ride="carousel" data-interval="2400">
    <div class="carousel-inner">
    <div class="item active">
      <c:forEach items="${homeProducts}" var="homeProduct">
      <c:if test="${homeProduct.barNumber==101}">
	<div class="col-sm-3">
    <div class="thumbnail">
      <a href="productDetails?proid=${homeProduct.product.pro_id}">
        <img src='<c:url value="/resources/images/${homeProduct.product.pro_id}"/>.jpg' alt="${homeProduct.product.pro_name}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b>${homeProduct.product.pro_name}</b></h4></center>
          <span style="bottom:2em;position:absolute;"><h4><i class="fa fa-inr"></i>${homeProduct.product.pro_price}</h4>
          <h5>Cash on Delivery eligible</h5></span>
        </div>
      </a>
    </div>
</div></c:if>
  </c:forEach>
</div>
<div class="item">
      <c:forEach items="${homeProducts}" var="homeProduct">
      <c:if test="${homeProduct.barNumber==102}">
	<div class="col-sm-3">
    <div class="thumbnail">
      <a href="productDetails?proid=${homeProduct.product.pro_id}">
        <img src='<c:url value="/resources/images/${homeProduct.product.pro_id}"/>.jpg' alt="${homeProduct.product.pro_name}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b>${homeProduct.product.pro_name}</b></h4></center>
          <span style="bottom:2em;position:absolute;"><h4><i class="fa fa-inr"></i>${homeProduct.product.pro_price}</h4>
          <h5>Cash on Delivery eligible</h5></span>
        </div>
      </a>
    </div>
</div></c:if>
  </c:forEach>
</div>    
    </div>
 </div>
  <br/><br/><br/>
  <div class="container">
  <div class="col-sm-6">
  <img src="<c:url value="/resources/images/hdd1.jpg"/>" style="width:100%"/>
  </div>
  <div class="col-sm-6">
  <img src="<c:url value="/resources/images/hdd2.jpg"/>" style="width:100%"/>
  </div>
  </div>
  <br/><br/><br/>
  <center><h1>New Launched Products</h1>
  <div style="width:600px;border:2px solid red"></div></center>
<br/>
<div id="HomeBCarousel" class="carousel slide" data-ride="carousel" data-interval="2400">
    <div class="carousel-inner">
    <div class="item active">
      <c:forEach items="${homeProducts}" var="homeProduct">
      <c:if test="${homeProduct.barNumber==201}">
	<div class="col-sm-3">
    <div class="thumbnail">
      <a href="productDetails?proid=${homeProduct.product.pro_id}">
        <img src='<c:url value="/resources/images/${homeProduct.product.pro_id}"/>.jpg' alt="${homeProduct.product.pro_name}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b>${homeProduct.product.pro_name}</b></h4></center>
          <span style="bottom:2em;position:absolute;"><h4><i class="fa fa-inr"></i>${homeProduct.product.pro_price}</h4>
          <h5>Cash on Delivery eligible</h5></span>
        </div>
      </a>
    </div>
</div></c:if>
  </c:forEach>
</div>
<div class="item">
      <c:forEach items="${homeProducts}" var="homeProduct">
      <c:if test="${homeProduct.barNumber==202}">
	<div class="col-sm-3">
    <div class="thumbnail">
      <a href="productDetails?proid=${homeProduct.product.pro_id}">
        <img src='<c:url value="/resources/images/${homeProduct.product.pro_id}"/>.jpg' alt="${homeProduct.product.pro_name}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b>${homeProduct.product.pro_name}</b></h4></center>
          <span style="bottom:2em;position:absolute;"><h4><i class="fa fa-inr"></i>${homeProduct.product.pro_price}</h4>
          <h5>Cash on Delivery eligible</h5></span>
        </div>
      </a>
    </div>
</div></c:if>
  </c:forEach>
</div>    
    </div>
  </div>
<br/>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>