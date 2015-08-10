<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Products</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
           <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Category <span class="caret"></span></a>
              <ul class="dropdown-menu">
              <c:forEach items="${categories}" var="category">
                <li><a href="<s:url value="/products?categoryId=${category.productCategoryId}&page=1"/>">${category.name}</a></li>
                </c:forEach>
              </ul>
              </li>
              </ul>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="user" class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-wrench"></i> Profile</a>
                    <p id="currentUser" style="display:none;">${currentUser}</p>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a id="accountId"></a></li>
                        <li><a id="accountEmail"></a></li>
                        <li><a id="accountPassword"></a></li>
                        <li><a id="accountIsActive"></a></li>
                        <li><a id="accountRole"></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="cart" class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-shopping-cart"></i> Cart <span class="badge badge-info">${shoppingCartItemsCount}</span></a>
                    <ul id="cartItems" class="dropdown-menu" role="menu">
            <c:forEach items="${cartItems}" var="item">
            <div class="list-group-item row-md-offset-5">
              <h5 class="list-group-item-heading">Product name: ${item[2]}</h5>
              <p class="list-group-item-text">Price : ${item[4]} UAH</p>
              <div class="action-buttons">
													<a href="<s:url value="/delete?cartItemId=${item[1]}"/>" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-trash"></i>Remove</a>
													<a href="#" data-toggle="modal" data-target="#Modal${item[0]}" class="btn btn-success btn-xs"> <i class="glyphicon glyphicon-ok-sign"></i>Buy</a>
												</div>
            </div>
            </c:forEach>
                    </ul>
                </li> 
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i> ${currentUser} <span class="caret"></span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="javascript:formSubmit()">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        </div><!--/.navbar-collapse -->
         <s:url value="/j_spring_security_logout" var="logoutUrl" />
    <form action="${logoutUrl}" method="post" id="logoutForm">
	  <input type="hidden" 
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
    
      </div>
    </nav>

    <div class="container">
           <c:forEach items="${productDetails}" var="detail">
      <div id="Modal${detail[0]}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Buy a product: ${detail[2]}</h4>
      </div>
      <div class="modal-body">
        <form role="form" method="post" action='buy.do?productId=${detail[0]}' >
  <div class="form-group">
    <label for="email">Name:</label>
    <input type="text" class="form-control" value="${detail[2]}" readonly name="name">
  </div>
  <div class="form-group">
    <label for="pwd">Price:</label>
    <input type="text" class="form-control" value="${detail[4]}" readonly name="price">
  </div>
  <div class="form-group">
    <label for="pwd">Color:</label>
    <input type="text" class="form-control" value="${detail[6]}" readonly name="Color">
  </div>
  <div class="form-group">
    <label for="pwd">Quantity:</label>
    <input type="number" class="form-control" required value="1" name="quantity" id="quantity">
    </div>
    <div class="form-group">
  <button type="submit" class="btn btn-primary">Buy</button>	
  </div>
</form>
      </div>
    </div>

  </div>
</div>	
</c:forEach>
    <div class="row">
    <div class="col-md-12">
            <hr>
             
             <div class="row">
      <!-- Example row of columns -->
      <div class="col-md-12">
       <c:forEach items="${products}" var="product">
      <div id="myModal${product[0]}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Buy a product: ${product[1]}</h4>
      </div>
      <div class="modal-body">
        <form role="form" method="post" action='buy.do?productId=${product[0]}' id="buyForm" >
  <div class="form-group">
    <label for="email">Name:</label>
    <input type="text" class="form-control" value="${product[1]}" readonly name="name">
  </div>
  <div class="form-group">
    <label for="pwd">Price:</label>
    <input type="text" class="form-control" value="${product[2]}" readonly name="price">
  </div>
  <div class="form-group">
    <label for="pwd">Color:</label>
    <input type="text" class="form-control" value="${product[5]}" readonly name="Color">
  </div>
  <div class="form-group">
    <label for="pwd">Quantity:</label>
    <input type="number" class="form-control" required value="1" name="quantity">
    </div>
    <div class="form-group">
  <button type="submit" class="btn btn-primary">Buy</button>	
  </div>
</form>
      </div>
    </div>

  </div>
</div>						<div class="item col-md-3">
										<div class="thumbnail">
											<img style="width:164px;height:150px" class="list-group-image" src="<s:url value="/photo/getPhoto?id=${product[6]}"/>" alt="" />
											<div class="caption">
												<h3 class="inner list-group-item-heading">${product[1]}</h3>
												<ul class="list-unstyled">
													<li><strong>Price:</strong> <em>${product[2]} UAH</em></li>
												</ul>
												<div class="action-buttons">
													<a href="<s:url value="/products?productId=${product[0]}"/>" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-zoom-in"></i> View</a>
													<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal${product[0]}"><i class="glyphicon glyphicon-ok-sign"></i> Buy</a>
													<a href="<s:url value="/add/cart?productId=${product[0]}"/>" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-shopping-cart"></i> Add to cart</a>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									
								</div>
								<c:url var="firstUrl" value="/products??page=1" />
<c:url var="lastUrl" value="/products?page=${page.totalPages}" />
<c:url var="prevUrl" value="/products?page=${currentIndex - 1}" />
<c:url var="nextUrl" value="/products?page=${currentIndex + 1}" />

<div align="center">
    <ul class="pagination">
        <c:choose>
            <c:when test="${currentIndex == 1}">
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${firstUrl}">&lt;&lt;</a></li>
                <li><a href="${prevUrl}">&lt;</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
            <c:url var="pageUrl" value="/products?page=${i}" />
            <c:choose>
                <c:when test="${i == currentIndex}">
                    <li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${currentIndex == page.totalPages}">
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${nextUrl}">&gt;</a></li>
                <li><a href="${lastUrl}">&gt;&gt;</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
								</div>
								</div>
								</div>
								

      <hr>
      <footer>
        <p align="center">&copy; Company 2015</p>
      </footer>
    </div> <!-- /container -->
    <script type="text/javascript">
    $( document ).ready(function() {
    	$( '#user' ).click(function() {
    		$('#accountId').text('Loading data ...');
    		var email = $('#currentUser').text();
    		$.getJSON('${pageContext.request.contextPath}/account/getAccountDetails?email='+email, function(account) {
    			  $('#accountId').text('Id :'+account.accountId);
    			  $('#accountEmail').text('Email :'+account.email);
    	          $('#accountPassword').text('Password :'+account.password);
    	          $('#accountIsActive').text('IsActive :'+account.isActive);
    	          $('#accountRole').text('Role :'+account.role.name);
    	        }); 
    		});
    });
 
    </script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>