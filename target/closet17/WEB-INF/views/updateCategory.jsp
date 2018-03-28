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
	<c:url value="/categoryUpdate" var="catUp"></c:url>
	<form action="${pageContext.request.contextPath }/admin/categoryUpdate" method="post">
            
            <span id="reauth-email" class="reauth-email"></span>
            <input type="hidden" name="cat_id" value="${cat.cat_id }">
            
            
            <h4 class="input-title">Category Name</h4><br>
            <input value="${cat.cat_name }" type="text" name="cat_name" required/><br>
            
			<h4 class="input-title">Category Description</h4><br>
            <input value="${cat.cat_desc }" type="text" name="cat_desc" required/><br>
            
   
           
          	<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	    <a href="<c:url value="/admin/catAdminList"/>" id="cancel" class="btn btn-danger myBoldFont">Cancel</button>
        	     
        	</div>
        </form>
</div>
      
</body>
</html>