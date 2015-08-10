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
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-shopping-cart"></i> Cart <span class="badge badge-info">${shoppingCartItemsCount}</span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
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
        </div><!--/.navbar-collapse -->
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
    <input type="number" class="form-control" required value="1" name="quantity">
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
            <strong><i class="glyphicon glyphicon-picture"></i> Product details:</strong>
            <div class="row">
        <div class="col-md-12">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Product number</th>
                <th class="text-center">Price</th>
                <th class="text-center">Color</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-center"><c:out value="${product.productId}"/></td>
                <td class="text-center"><c:out value="${product.name}"/></td>
                <td class="text-center"><c:out value="${product.productNumber}"/></td>
                <td class="text-center"><c:out value="${product.price}"/></td>
                <td class="text-center"><c:out value="${product.color}"/></td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>
    </div>
    <div class="col-md-12">
    <strong><i class="glyphicon glyphicon-picture"></i> Photos:</strong>
            <hr>
      <!-- Example row of columns -->
       <c:forEach items="${productPhotos}" var="productPhoto">
									<div class="item col-md-3">
										<div class="thumbnail">
											<img style="width:164px;height:150px" class="list-group-image" src="<s:url value="/photo/getPhoto?id=${productPhoto.productPhotoId}"/>" alt="" />
										</div>
									</div>
									</c:forEach>
									
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>