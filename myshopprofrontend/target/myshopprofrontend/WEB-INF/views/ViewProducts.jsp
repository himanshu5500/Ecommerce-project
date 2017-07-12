<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>
var app = angular.module('productApp', []);
app.controller('myCtrl', function($scope) {
    $scope.products=${proDetails}
});
</script>
<style>
.container{margin-top: 4em;}
.thumbnail{height:380px;
box-shadow:0 0 10px grey;}
</style>
<%@include file="header.jsp" %>
<div class="container" ng-app="productApp" ng-controller="myCtrl">
<input type="text" ng-model="searchProduct" placeholder="Search"/>
<div class="col-sm-3" ng-repeat="product in products | filter:searchProduct">
    <div class="thumbnail">
      <a href="productDetails?proid={{product.pro_id}}">
        <img src='<c:url value="/resources/images/{{product.pro_id}}.jpg"/>' alt="{{product.pro_name}}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b>{{product.pro_name}}</b></h4></center>
          <span style="bottom:2em;position:absolute;"><h4><i class="fa fa-inr"></i>{{product.pro_price}}</h4>
          <h5>Cash on Delivery eligible</h5></span>
        </div>
      </a>
    </div>
</div>

</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>