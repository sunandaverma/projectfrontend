<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link  rel="stylesheet" href='<c:url value="/resources/css/style.css"/>'/>
	 <link rel="stylesheet" type="text/js" href='<c:url value="/resources/js/bootstrap.min.js"/>'/>
</head>

<body style="background-image:url(resources/img20.jpg);background-attachment:fixed;">
<nav class="navbar navbar-inverse">

  <div class="container-fluid">
  	<ul class="nav navbar-nav">
  	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse">
  	<span class="icon-bar"></span>
  	<span class="icon-bar"></span>
  	<span class="icon-bar"></span>
  	<span class="icon-bar"></span>
  	
  	</button>
  	</ul>
  </div>
  
  <div class="navbar-header">
  <a href="${pageContext.request.contextPath }/index" class="navbar-brand">SHOP</a>
  </div>
  
    <ul class="nav navbar-nav navbar-left">       
        <li><a href="${pageContext.request.contextPath }/About Us">About</a></li>
        <li><a href="${pageContext.request.contextPath }/Contact Us">Contact Us</a></li>
        
        <%-- <c:if test='<%=(Boolean)session.getAttribute("User")==null %>>'>
         --%><li><a href="${pageContext.request.contextPath }/admin/adding">Admin</a></li>
		
		<li class="dropdown">
      	<a href="#" class="dropdown-toggle" data-toggle="dropdown" >Admin List<span class="caret"></span></a>
      		<ul class="dropdown-menu">
		
				<li><a href="${pageContext.request.contextPath }/admin/productAdminList">Product</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/suppAdminList">Supplier</a></li>
				<li><a href="${pageContext.request.contextPath }/admin/catAdminList">Category</a></li>
			</ul>
		</li>
		<%-- </c:if> --%>
	
		<!-- <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		Category Choice <span class="caret"></span></a>
		<ul class="dropdown-menu"> -->
		  <li class="dropdown">
      	<a href="#" class="dropdown-toggle" data-toggle="dropdown" >Category List<span class="caret"></span></a>
      		<ul class="dropdown-menu">
        <c:forEach items="${catlist }" var="catVal">
        	
        	<li><a href="<c:url value="${pageContext.request.contextPath }/viewProducts/${catVal.cat_id }"/>" >${catVal.cat_name }</a></li>
        	</c:forEach>
        </ul></li>

		<li><a href="${pageContext.request.contextPath }/productCustList">Product Customer List</a></li>
	</ul>
        	
				    
     <ul class="nav navbar-nav navbar-right">
     
     <c:if test='<%=(Boolean)session.getAttribute("loggedIn")!=null&&(Boolean)session.getAttribute("loggedIn")==true %>'>
     
     <li><a>WELCOME <%=session.getAttribute("username") %></a></li>
     <li><a href="<c:url value="/perform_logout"/>">LOGOUT</a></li>
     
     </c:if>
     
     <c:if test='<%=(Boolean)session.getAttribute("loggedIn")==null%>'>
        <li><a href="${pageContext.request.contextPath }/goToLogin">Login</a></li>
        <li><a href="${pageContext.request.contextPath }/goToRegister">Registration</a></li>
        </c:if> 
    </ul>
    </div>
</div>
</nav>
</body>
</html>