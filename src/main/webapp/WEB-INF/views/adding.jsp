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
    <ul class="nav nav-tabs">
      <li class="active"><a href="#category" data-toggle="tab">Category</a></li>
      <li><a href="#supplier" data-toggle="tab">Supplier</a></li>
      <li><a href="#product" data-toggle="tab">Product</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="category">
        <form:form modelAttribute="category" action="saveCategory" id="tab">
            <label>ID</label>
            <form:input path="cat_id" type="number" class="input-xlarge"/>
            <label>Name</label>
            <form:input path="cat_name" type="text" class="input-xlarge"/>
            <label>Description</label>
            <form:input path="cat_desc" type="text" class="input-xlarge"/>
            
           
          	<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	    <button class="btn btn-warning" type="reset" >Cancel</button>
        	</div>
        </form:form>
      </div>
      <div class="tab-pane fade" id="supplier">
    	<form:form modelAttribute="supplier" action="saveSupplier" id="tab2">
            <label>ID</label>
            <form:input path="supp_id" type="number" class="input-xlarge"/>
            <label>Name</label>
            <form:input path="supp_name" type="text" class="input-xlarge"/>
            <label>Address</label>
            <form:input path="supp_address" type="text" class="input-xlarge"/>
            
           
          	<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	    <button class="btn btn-warning" type="reset" >Cancel</button>
        	</div>
        </form:form>

      </div>
      <div class="tab-pane fade" id="product">
    	<form:form modelAttribute="product" action="${pageContext.request.contextPath }/admin/saveProduct" id="tab3" enctype="multipart/form-data">
            <label>ID</label>
            <form:input path="pro_id" type="number" class="input-xlarge"/>
            <label>Name</label>
            <form:input path="pro_name" type="text" class="input-xlarge"/>
            <label>Writer Name</label>
            <form:input path="pro_description" type="text" class="input-xlarge"/>
            <label>Stock</label>
            <form:input path="pro_stock" type="number" class="input-xlarge"/>
            <label>Price</label>
            <form:input path="pro_price" type="number" class="input-xlarge"/>
            
            <table>
            	<tr>
            		<td>Select Category</td>
            		<td>
        				<form:select path="pro_category.cat_id" id="catName" class="form-control" required="required">
						<option value="" label="----------- Select Category -----------" disabled="true" selected/>
						<c:forEach items="${catlist }" var="cat">
							<option value="${cat.cat_id }">${cat.cat_name }</option>
						</c:forEach>
						</form:select>
    				</td>
    			</tr>
    		</table>
    		
    		<table>
            	<tr>
            		<td>Select Supplier</td>
            		<td>
        				<form:select path="pro_supplier.supp_id" id="suppName" class="form-control" required="required">
						<option value="" label="----------- Select Supplier -----------" disabled="true" selected/>
						<c:forEach items="${supplist }" var="supp">
							<option value="${supp.supp_id }">${supp.supp_name }</option>
						</c:forEach>
						
						</form:select>
    				</td>
    			</tr>
    		</table>
    		
    		<div class="fileinput fileinput-new" >
    			<table>
    				<tr>
    					<td>Product Image</td>
    					<td><form:input class="form-control" type="file" path="pro_image" required="required"/></td>
    				</tr>
    			</table>
    		</div>
    		
    		<div>
        	    <button class="btn btn-primary" type="submit" >Update</button>
        	    <button class="btn btn-warning" type="reset" >Cancel</button>
        	</div>
        </form:form>

      </div>
      </div>
  </div>
  </div>
  <jsp:include page="footer.jsp"/>
  
</body>
</html>