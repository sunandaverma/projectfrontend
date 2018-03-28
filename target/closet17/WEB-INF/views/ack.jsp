<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
<br/><center>
<div class="col-sm-offset-3 col-sm-6" style="box-shadow:0 0 10px grey;padding:16px;margin-bottom:25px;">
<img src="<c:url value="/resources/images/ordersuccess.png"/>" height=200 width=200/>
<h1><b>Order Placed Successfully</b></h1><br/>
<h2><b>Order ID :</b> ${orderId}</h2><br/>
<i><h2>Thank You For Choosing us</h2></i> <br/>
<div class="col-sm-5">
<a href="index" class="btn btn-success btn-block">Continue Shopping....</a>
</div>
<div class="col-sm-offset-2 col-sm-5">
<a href="myOrders" class="btn btn-success btn-block">View Orders</a>
</div>
</div>
</center>
</div>
<%@include file="footer.jsp"%>

</body>
</html>