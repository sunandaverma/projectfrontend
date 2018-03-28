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
	<c:url value="/productUpdate" var="proUp"></c:url>
		<form action="${pageContext.request.contextPath }/admin/productUpdate" method="post" enctype="multipart/form-data">
            
            <span id="reauth-email" class="reauth-email"></span>
            <input type="hidden" name="pro_id" value="${prod.pro_id }">
            
            <h4 class="input-title">Product Name</h4><br>
            <input value="${prod.pro_name }" type="text" name="pro_name" required/><br>
            
            <h4 class="input-title">Product Description</h4><br>
            <input value="${prod.pro_description }" type="text" name="pro_writer" required/><br>
            
            <h4 class="input-title">Product Stock</h4><br>
            <input value="${prod.pro_stock }" type="number" name="pro_stock" required/><br>
             
            <h4 class="input-title">Product price</h4><br>
            <input value="${prod.pro_price }" type="number" name="pro_price" required/><br>
             
             <div class="form-group">
            <table>
            	<tr>
            		<td>Select Supplier</td>
            		<td><br>
        				<select name="pro_supplier" id="suppName" class="form-control" required="required">
						<option value="" label="----------- Select Supplier -----------" disabled="true" selected/>
						<c:forEach items="${supplist }" var="sup">
							<option value="${sup.supp_id }">${sup.supp_name }</option>
						</c:forEach>
						</select>
    				</td>
    			</tr>
    		</table>
    		</div>  
            <div class="form-group">
            <table>
            	<tr>
            		<td>Select Category</td>
            		<td>
        				<select name="pro_category" id="catName" class="form-control" required="required">
						<option value="" label="----------- Select Category -----------" disabled="true" selected/>
						<c:forEach items="${catlist}" var="cat">
							<option value="${cat.cat_id }">${cat.cat_name }</option>
						</c:forEach> 
						</select>
    				</td>
    			</tr>
    		</table>
    		</div>
    		   		
    		<div class="fileinput fileinput-new" data-provides="fileinput">
    			<table>
    				<tr>
    					<td>Product Image</td>
    					<td><input class="form-control" type="file" name="pro_image" accept="image/*"/></td>
    				</tr>
    			</table>
    		</div>
    		
    		<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	     <a href="<c:url value="/admin/productAdminList"/>" id="cancel" class="btn btn-danger myBoldFont">Cancel</a> 
        	</div>
        </form>

      </div>
     
  <jsp:include page="footer.jsp"/>
  
</body>
</html>