<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-sm-4 item-photo ">
			<img alt="" src="/resources/${prod.pro_imagename }" style="">
			
			<div class="col-sm-5" style="border:0px solid gray;">
			<h3>${prod.pro_image}</h3>
			<h4>${prod.pro_description}</h4>
			<h4>prod.pro_price</h4>
			<h4>${prod.pro_supplier.supp_name}</h4>	
				<div class="section" style="padding-bottom:20px;">
					<form action="${pageContext.request.contextPath }/addToCart" method="post">
					<input type="hidden" value="${prod.pro_id }" name="pro_id"/>
					<input type="hidden" value="${prod.pro_name }" name="pro_name"/>
					
					<input type="hidden" value="${prod.pro_price }" name="pro_price"/>
					<input type="hidden" value="${prod.pro_imagename }" name="pro_imagename"/>
					<input type="number" class="form-control" name="pQty" required/><br><br>
					<input class="btn btn-warning btn-lg" type="submit" value="Add To Cart"/>
					<h6><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span>Wish List</h6>
				   </form>
				</div>
			</div>
		<hr>
		<div class="col-sm-8">
		<h3>Product Details</h3>
		<ul class="menu-items">
		<li>All Land Properties Sanctioned by BLRO of India </li>
		<li>All Housing Complex Properties are Sanctioned by Corporation.</li>
		<li>All Office Complex properties need to be purchased only by Trade Licence Holder</li>
		</ul>
		</div>
		<br><hr>
		<h6>We are Authorized Company by Indian Govt.</h6>
		</div>
	</div>
	