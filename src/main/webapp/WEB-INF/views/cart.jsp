<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="container">
<h2>Product List For Customer</h2>
<table class="table table-hover" id="api" class="display" border="2" width="80" align="center">
	<tr>
		
		<th>Product Name</th>
		<th>Product Quantity</th>
		<th>Product Price</th>
		<th>Product Image</th>
		<th>Sub Total</th>
		<th>Action</th>
		
	</tr>
	
	<c:if test="${empty cartInfo }">
		<tr>
			<td colspan="10" align="center">No Record Exists !!</td>
		</tr>
	</c:if>
	
	
	<c:forEach var="p" varStatus="st" items="${cartInfo}">
		<tr>
			<td><c:out value="${p.cartProductName }"></c:out></td>
			<td><c:out value="${p.cartStock }"></c:out></td>
			<td><c:out value="${p.cartPrice }"></c:out></td>
			<td><img src="${pageContext.request.contextPath }/resources/${p.cartImage }" width="50px" height="50px"></td>
			<td><c:out value="${p.cartStock * p.cartPrice}"></c:out></td>		
			<td class="span4">
				<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
				<a href="<c:url value="${contextRoot }/deletePCart/${p.cartId}"/>" class="btn btn-danger" role="button">Delete</a>		
			</td>
		</tr>
	</c:forEach>
	
	<td>
	<c:set var="gtot" value="${gtot + p.cartPrice*p.cartStock }"></c:set>
	<span class="col-lg-9" align="right"><label>Grand Total : </label><c:out value="${gtot }"></c:out></span>
	</td>
	
	<tfoot>
	<td>
	<a class="btn btn-warning btn-lg" href="${pageContext.request.contextPath }/index">Continue Shopping</a>
	</td>
	<td>
	<a class="btn btn-success btn-lg" href="${pageContext.request.contextPath }/checkout">Checkout</a>
	</td>
	</tfoot>
	

</table>
</div>
</body>
</html>