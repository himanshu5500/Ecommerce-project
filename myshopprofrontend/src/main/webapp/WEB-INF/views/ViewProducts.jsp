<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html ng-app="productApp" ng-controller="myCtrl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${catName}</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<style>
.container{margin-top: 4em;}
.thumbnail{height:380px;
box-shadow:0 0 10px grey;
position:relative;}
#cart {
position:absolute;
    bottom:5px;
    display:none;
    margin-left:21%;
}
.see{visibility: hidden;}
</style>
<%@include file="header.jsp" %>
<br/>
<center><h1><b>${catName}</b></h1></center>
<div class="col-sm-offset-3 col-sm-6" style="border:2px solid red"></div>
<div class="col-sm-1">&nbsp;</div>
<div class="dropdown col-sm-2" style="width:0">
    <button class="btn btn-success myBoldFont"><span class="fa fa-sort"></span> Sort
    </button>
    <ul class="dropdown-menu" style="margin-top: -0.5px;">
      <li><a ng-click="orderByMe('pro_name')">Name</a></li>
      <li><a ng-click="orderByMe('+pro_price')">Price : Low to High</a></li>
      <li><a ng-click="orderByMe('-pro_price')">Price : High to Low</a></li>
    </ul>
  </div>

<div class="container"> 
<div class="col-sm-6 col-md-3" ng-repeat="product in products | filter:searchProduct | orderBy:myOrderBy">
    <div class="thumbnail">
      <a href="productDetails?proid={{product.pro_id}}">
        <img src='<c:url value="/resources/images/{{product.pro_id}}.jpg"/>' alt="{{product.pro_name}}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b style="color:black;">{{product.pro_name}}</b></h4></center>
          <span style="bottom:5px;color:black;position: absolute;"><h4><i class="fa fa-inr"></i>{{product.pro_price}}</h4>
          <h5>Cash on Delivery eligible</h5></span>
          <a href="addToCart?proid={{product.pro_id}}" class="btn btn-primary" id="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</a>          
        </div>
      </a>
    </div>
</div>

</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
<script>
var app = angular.module('productApp', []);
app.controller('myCtrl', function($scope) {
    $scope.products=${proDetails}
    $scope.orderByMe = function(x) {
        $scope.myOrderBy = x;
    }
});
$(document).ready(function(){

    $(".thumbnail").hover(function(){
    	$(this).find("#cart").slideToggle(100)
    	$(this).find("h5").toggleClass("see");
    });
});
</script>
</body>
</html>