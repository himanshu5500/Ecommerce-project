<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.backImg{
background-image: url('<c:url value="/resources/images/about.jpg"/>');
height:32em;
}
</style>
<%@include file="/WEB-INF/views/header.jsp"%>
<div class="container-fluid backImg">
<div style="background-color:rgba(0,0,0,0.5);height:100%" class="container-fluid"></div>
</div>
<div style="margin:auto;width:60%">

<div class="row">
<div class="col-sm-4">
    <div class="thumbnail">
        <img src="<c:url value="/resources/images/about.jpg"/>" alt="Fjords" class="img-circle" style="width:100%">
        <div class="caption text-center">
          <p>Lorem ipsum...</p>
        </div>
    </div>
  </div>
<div class="col-sm-4">
    <div class="thumbnail">
        <img src="<c:url value="/resources/images/about.jpg"/>" alt="Fjords" class="img-circle" style="width:100%">
        <div class="caption text-center">
          <p>Lorem ipsum...</p>
        </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div >
        <img src="<c:url value="/resources/images/about.jpg"/>" alt="Fjords" class="img-circle" style="width:100%">
        <div class="caption text-center">
          <p>Lorem ipsum...</p>
        </div>
    </div>
  </div>
  </div>
</div>

<%@include file="/WEB-INF/views/Footer.jsp"%>			 
</body></html>