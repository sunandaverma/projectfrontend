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
<h2>Category List For Admin</h2>
<table class="table table-hover" id="api" class="display" border="2" width="80" align="center">
	<tr>
		<th>Sr. No.</th>
		<th>Category ID</th>
		<th>Category Name</th>
		<th>Category Description</th>
		<th class="span2">Action</th>
	</tr>
	
	<c:if test="${empty catlist }">
		<tr>
			<td colspan="10" align="center">No Record Exists !!</td>
		</tr>
	</c:if>
	
	
	<c:forEach var="c" varStatus="st" items="${catlist }">
		<tr>
			<td><c:out value="${st.count }"></c:out></td>
			<td><c:out value="${c.cat_id }"></c:out></td>
			<td><c:out value="${c.cat_name }"></c:out></td>
			<td><c:out value="${c.cat_desc }"></c:out></td>
			<td class="span4">
				<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
					<a href="<c:url value="updateCat?cat_id=${c.cat_id}"/>" id="update" class="btn btn-success myBoldFont">Update</a>
					<a href="<c:url value="/admin/deleteCat/${c.cat_id}"/>" id="delete" class="btn btn-danger myBoldFont">Delete</a>
				</td>
		</tr>
	</c:forEach>
	

</table>
</div>
</body>
</html>