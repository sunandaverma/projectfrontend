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
	<div class="col-sm-6 jumbotron"> 
		<div class="head">
		<label>Customer Shipping Details</label>
		</div>
		<div class="outer">
		<div class="well" style="width:100%">
		<form action="${pageContext.request.contextPath }/invoiceprocess" method="post">
		<c:set var="gtot" value="0"></c:set>
		<c:forEach var="c" items="${cart }">
		<c:set var="gtot" value="${gtot + c.price * c.qty }"></c:set>
		</c:forEach>
		<div class="well">
	<table>
		<tr>
		<td colspan="3">Name</td><td>${user.name }</td>
		</tr>
		<tr>
		<td colspan="3"></td>Email<td>${user.email }</td>
		</tr>
		<tr>
		<td colspan="3"></td>Address<td>${user.address }</td>
		</tr>
		<tr>
		<td colspan="3"></td>Phone<td>${user.phone }</td>
		</tr>
	</table>
	<div class="outer">
	<h3>Enter Payment Details</h3>
	<br>
	<label>Select Payment</label>
	<select name=="payment">
	<option value="COD">Cash on delivery</option>
	<option value="Net">Net Banking</option>
	</select>
	<br><br>
	<div>
	Name:<input type="text" name="name on card"><br>
	Card Number:<input type="number" name="card number"> 
	</div>
	
	</div>	
	<input type="submit" value="PROCEED" style="width:75%" class="btn btn-danger">	
		</div>
		
		
		
		
		
		
		</form>
		</div>
		</div>
	</div>
</div>
</div>
</body>
</html>