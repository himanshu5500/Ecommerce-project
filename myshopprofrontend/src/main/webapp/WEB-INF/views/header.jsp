<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
<script src='<c:url value="/resources/js/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>--> 
<link  rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'/>
</head>
<body>
<div class="container-fluid" style="background-color:#0d59af;color:#fff;height:150px;">
 <center> 
 <img src="<c:url value="/resources/images/Logo.png"/>" height="131" width="120"/>
  <!--<img src="<c:url value="/resources/images/Logo.png"/>" height="131" width="120"/>-->
 <span style="font-size:50px">MYSHOPPRO</span>
  <img src="<c:url value="/resources/images/Logo.png"/>" height="131" width="120"/>
  <!--<img src="<c:url value="/resources/images/Logo.png"/>" height="131" width="120"/>-->
</center></div>
<nav class="navbar navbar-inverse" style="margin-bottom:0px;border-radius:0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="home">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Mobiles
        <span class="caret"></span></a>
        <ul class="dropdown-menu"><c:forEach items="${catDetails}" var="homeCat">
        	<c:if test="${homeCat.home_cat=='Mobiles'}">
        	<li><a href="viewProducts?id=${homeCat.cat_id}">${homeCat.cat_name}</a></li>
        	</c:if></c:forEach>
        </ul></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Laptops
        <span class="caret"></span></a>
        <ul class="dropdown-menu"><c:forEach items="${catDetails}" var="homeCat">
        <c:if test="${homeCat.home_cat=='Laptops'}">
        	<li><a href="viewProducts?id=${homeCat.cat_id}">${homeCat.cat_name}</a></li>
        	</c:if>
        	</c:forEach>
        </ul></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Computer Accessories
        <span class="caret"></span></a>
        <ul class="dropdown-menu"><c:forEach items="${catDetails}" var="homeCat">
        <c:if test="${homeCat.home_cat=='Computer Accessories'}">
        	<li><a href="viewProducts?id=${homeCat.cat_id}">${homeCat.cat_name}</a></li>
        	</c:if>
        	</c:forEach>
        </ul></li> 
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Televisions
        <span class="caret"></span></a>
        <ul class="dropdown-menu"><c:forEach items="${catDetails}" var="homeCat">
        <c:if test="${homeCat.home_cat=='Televisions'}">
        	<li><a href="viewProducts?id=${homeCat.cat_id}">${homeCat.cat_name}</a></li>
        	</c:if>
        	</c:forEach>
        </ul></li> 
        <li><a href="Test">About Us</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
     
      <c:if test='<%=(Boolean)session.getAttribute("loggedIn")!=null&&(Boolean)session.getAttribute("loggedIn")==true%>'>
      <c:if test='<%=(String)session.getAttribute("user")!=null&&session.getAttribute("user").equals("user")%>'>
      <li><a href="<c:url value="/showCart"/>">
      <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;Cart</a>
      </li></c:if>
      <c:if test='<%=(String)session.getAttribute("user")==null%>'>
      <li class="dropdown">
      <a  class="dropdown-toggle" data-toggle="dropdown" href="#">Admin Operations <span class="caret"></span>
      <ul class="dropdown-menu">
      <li><a href="<c:url value="/Category"/>">Manage Category</a></li>
      <li><a href="<c:url value="/Product"/>">Manage Products</a></li>
      <li><a href="<c:url value="/Supplier"/>">Manage Supplier</a></li>
      </ul></a>
      </li></c:if>
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      <span class="img-circle"><%=session.getAttribute("usertitle")%></span> <%=session.getAttribute("username")%>
       <span class="caret"></span></a>
        <ul class="dropdown-menu">
         <li><a href="<c:url value="/myAccount"/>">My Account</a></li>
         <c:if test='<%=(String)session.getAttribute("user")!=null&&session.getAttribute("user").equals("user")%>'>
         <li><a href="<c:url value="/myOrders"/>">My Orders</a></li>
         </c:if>
         <li><a href="<c:url value="/perform_logout"/>">
         <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
       </li>
       </c:if>
       <c:if test='<%=(Boolean)session.getAttribute("loggedIn")==null%>'>
         <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:if>
      
      </ul>
      <form class="navbar-form navbar-right">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search"/>
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
    </div>
      
  </div>
</nav>