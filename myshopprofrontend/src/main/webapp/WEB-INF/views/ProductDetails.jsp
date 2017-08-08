<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${product.pro_name}</title>
<style>
#proImg{
    height:490px;
}
#proImg img{
    -webkit-transition: all 1s;
    -moz-transition: all 1s;
    -o-transition: all 1s;
    -ms-transition: all 1s;
    transition: all 1s;
    height:67%;
}
#proImg:HOVER img{height:72%;
    -webkit-transition: all 1s;
    -moz-transition: all 1s;
    -o-transition: all 1s;
    -ms-transition: all 1s;
    transition: all 1s;
}
.caption{
bottom: 0;position:absolute;width:98%;
}
.proTitle{color:blue;}
</style>
<%@include file="header.jsp" %>
<br/>
<div class="container">
<div class="col-sm-4 thumbnail" id="proImg">
<img src='<c:url value="/resources/images/${product.pro_id}"/>.jpg' alt="${product.pro_name}" />
 <div class="caption">
          <a href="addToCart?proid=${product.pro_id}" class="btn btn-danger btn-block myBoldFont"><h4><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</h4></a>
          <a href="BuyNow?proid=${product.pro_id}" class="btn btn-warning btn-block myBoldFont"><h4>Buy Now</h4></a>
        </div>
</div>
<div class="col-sm-8">
<div class="panel panel-default">
  <div class="panel-heading proTitle"><h2><b>${product.pro_name}</b></h2></div>
  <div class="panel-body"><h2><i class="fa fa-inr"></i><b>${product.pro_price}</b></h2><br/>
  <h4><b>Seller : </b>${product.supplier.sup_name}</h4>
  </div>
</div>
  
  <div class="panel panel-default">
  <div class="panel-heading"><h3>Product Description</h3></div>
  <div class="panel-body"><h4>${product.pro_desc}</h4></div>
</div>
  
  </div>
</div>
<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>