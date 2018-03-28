<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>

<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
          <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           
<title>PizzaVala</title>

</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container-fluid">

<div id="myCarousel" class="carousel slide" data-ride="carousel" style=bottom:21px>
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"> </li>
    <li data-target="#myCarousel" data-slide-to="2"> </li>
    <li data-target="#myCarousel" data-slide-to="3"> </li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="resources/men.jpg" alt="pizza" style="width:100%;height:80%" >
    </div>

    <div class="item">
      <img src="resources/kids.jpg" alt="pizza" style="width:100%;height:80%">
    </div>

    <div class="item">
      <img src="resources/walk.jpg" alt="pizza" style="width:100%;height:80%">
    </div>
    
    <div class="item">
      <img src="resources/bgimg.jpg" alt="pizza" style="width:100%;height:80%">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<%-- 
			<div class="container">
 <c:forEach items="${prodList }" var="prod">
						 <img alt="" src="resources/${prod.pro_imagename }" style="">
			
			<div class="col-sm-5" style="border:0px solid gray;">
			<h3>${prod.pro_image}</h3>
			<h4>${prod.pro_name}</h4>
			<h4>${prod.pro_price }</h4>
			<h4>${prod.pro_supplier.supp_name}</h4>	
				<div class="section" style="padding-bottom:20px;">
					<form action="${pageContext.request.contextPath }/addToCart" method="post">
					<input type="hidden" value="${prod.pro_id }" name="pro_id"/>
					<input type="hidden" value="${prod.pro_price }" name="pro_price"/>
					<input type="hidden" value="${prod.pro_imagename }" name="pro_imagename"/>
					<input type="number" class="form-control" name="pQty" required/><br><br>
					<input class="btn btn-warning btn-lg" type="submit" value="Add To Cart"/>
					<h6><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer;"></span>Wish List</h6>
				   </form>
				</div>
			</div>
						 </c:forEach>
						 </div>
						 --%> 
						 
						 
			<div class="container">
<div class="row">
  <div class="col-sm-4">
  <h2>Margherita</h2>
  <img src="resources/men.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Funghi</h2>
  <img src="resources/group.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Capricciosa</h2>
  <img src="resources/i3.jpg" alt="pizza" style="width:100%;height:40%"></div>
</div>


<div class="row">
  <div class="col-sm-4">
  <h2>Quattro Stagioni</h2>
  <img src="resources/white.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Vegetariana</h2>
  <img src="resources/walk.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Quattro Formaggi</h2>
  <img src="resources/back.jpg" alt="pizza" style="width:100%;height:40%"></div>
</div>

<div class="row">
  <div class="col-sm-4">
  <h2>Marinara</h2>
  <img src="resources/paint.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Napolitana</h2>
  <img src="resources/i4.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Hawaii</h2>
  <img src="resources/bw.jpg" alt="pizza" style="width:100%;height:40%"></div>
</div>

<div class="row">
  <div class="col-sm-4">
  <h2>Rucola</h2>
  <img src="resources/i2.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Bolognese</h2>
  <img src="resources/kids.jpg" alt="pizza" style="width:100%;height:40%"></div>
  <div class="col-sm-4">
  <h2>Meat Feast</h2>
  <img src="resources/men.jpg" alt="pizza" style="width:100%;height:40%"></div>
</div>





</div>
</div>
						 
						 
        
						
			
 
 <%-- <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<div class="col-sm-3">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="resources/i1.jpg"  alt="" />
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="${pageContext.request.contextPath }/prodDetails" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="col-sm-3">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="resources/kids.jpg"  alt="" />
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="resources/style.jpg"  alt="" />
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="resources/i2.jpg"  alt="" />
											<h2>$56</h2>
											<p>Easy Polo Black Edition</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
					
					
					
<jsp:include page="footer.jsp"/>
 
 
</body>
</html>
