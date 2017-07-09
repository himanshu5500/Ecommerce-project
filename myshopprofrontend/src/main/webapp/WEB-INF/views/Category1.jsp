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
</div>

<%@include file="/WEB-INF/views/Footer.jsp"%>			 
</body></html>