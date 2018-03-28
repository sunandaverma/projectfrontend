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
<h2>Supplier List For Admin</h2>
<table class="table table-hover" id="api" class="display" border="2" width="80" align="center">
	<tr>
		<th>Sr. No.</th>
		<th>Supplier ID</th>
		<th>Supplier Name</th>
		<th>Supplier Address</th>
		<th class="span2">Action</th>
	</tr>
	
	<c:if test="${empty supplist }">
		<tr>
			<td colspan="10" align="center">No Record Exists !!</td>
		</tr>
	</c:if>
	
	
	<c:forEach var="s" varStatus="st" items="${supplist }">
		<tr>
			<td><c:out value="${st.count }"></c:out></td>
			<td><c:out value="${s.supp_id }"></c:out></td>
			<td><c:out value="${s.supp_name }"></c:out></td>
			<td><c:out value="${s.supp_address }"></c:out></td>
			<td class="span4">
				<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
					<a href="<c:url value="updateSupp?supp_id=${s.supp_id}"/>" id="update" class="btn btn-success myBoldFont">Update</a>
					<a href="<c:url value="/admin/deleteSupp/${s.supp_id}"/>" id="delete" class="btn btn-danger myBoldFont">Delete</a>
				</td>
		</tr>
	</c:forEach>
	

</table>
</div>
</body>
</html>