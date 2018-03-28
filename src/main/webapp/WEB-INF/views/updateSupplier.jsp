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
	<c:url value="/supplierUpdate" var="catUp"></c:url>
	<form action="${pageContext.request.contextPath }/admin/supplierUpdate" method="post">
            
            <span id="reauth-email" class="reauth-email"></span>
            <input type="hidden" name="supp_id" value="${supp.supp_id }">
            
            
            <h4 class="input-title">Supplier Name</h4><br>
            <input value="${supp.supp_name }" type="text" name="supp_name" required/><br>
            
			<h4 class="input-title">Supplier Address</h4><br>
            <input value="${supp.supp_address }" type="text" name="supp_address" required/><br>
            
   
           
          	<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	   <a href="<c:url value="/admin/suppAdminList"/>" id="cancel" class="btn btn-danger myBoldFont">Cancel</a> 
        	</div>
        </form>
</div>
      
</body>
</html>