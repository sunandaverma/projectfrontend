<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
 

<style type="text/css">
.myrow , .mysubrow {
    height: 100%;
    padding-top: 22px;
    padding-bottom: 54px;
}  
  .myrow {
    display: table;
    margin: auto;
    width: 22%;
}  
.mysubrow {
    display: table-cell;
    vertical-align: middle;
}   
.margin {
  margin: 0 !important;
}

</style>
</head>
<body>

<jsp:include page="header.jsp"/>
 <div class = "myrow">
<div class = "mysubrow">
 
  <div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel" style="background-color:black">
      <form action="addUserDetails" method="post" class="form-horizontal">
							<div class="from-style" id="name">
							<input name="full_name" class="form-control" required="" maxlength="25" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/>
							<label>Enter Name</label>
							</div>
							<div class="from-style" id="email">
							<input type="email" name="email" class="form-control" required="" title="Enter a valid email address"/>
							<label>Enter Email</label>
							</div>
							<div class="from-style" id="mobile">
							<input type="text" name="mobile" class="form-control" required="" pattern="[0-9]{10}" title="Enter a 10 digit mobile number" maxlength="10"/>
							<label>Mobile Number</label>
							</div>
							<div class="from-style" id="username">
							<input name="username" class="form-control" required=""/>
							<label>Create Username</label>
							</div>
							<div class="from-style" id="password">
							<input type="password" name="password" class="form-control" required="" pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters or spaces are not allowed"/>
							<label>Create Password</label>
							</div>
							<div class="from-style" id="address">
							<textarea name="address" class="form-control" required="" rows="5" maxlength="255"></textarea>
							<label>Address</label>
							</div>
							<input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
							</form>
		  <div style="padding-left:18px">
        
        <div class="row">
          <div class="input-field col s12">
             <input type="submit" value="Sign In" class="btn btn-success btn-sm">
           </div>
           
      
          <div class="input-field col s12">
            <p class="margin center medium-small sign-up">Already have an account? <a href="${pageContext.request.contextPath }/goToLogin">Login</a></p>
          </div>
        </div>
        </div>
      
    </div>
  </div>
  </div>
  </div>
<jsp:include page="footer.jsp"/>

</body>
</html>