<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Template</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>

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
            
              </ul>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" method="post" action="<c:url value='/j_spring_security_check' />">
          <div class="form-group">
          <c:if test="${not empty error}">
        <p class="text-warning">${ error}</p>
        </c:if>
          </div>
            <div class="form-group">
              <input type="text" placeholder="Email" name="username" id="username" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" name="password" id="password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
      <div class="row">
      <div class="col-md-8 col-md-offset-3">
        <springForm:form class="form-signing"  method="post" action="registration.do" commandName="account">
        <h2 class="form-signin-heading">Registration form</h2>
        <div class="row">
        <div class="col-md-8">
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="text" id="email" name="email" class="form-control" placeholder="Your email" required autofocus autocomplete="off" value="${account.email}">
        </div>
        <div class="row">
        <springForm:errors path="email" class="text-danger" />
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
        <div class="row">
        <div class="col-md-8">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Your password" required autocomplete="off" value="${account.password}">
        </div>
        <div class="row">
        <springForm:errors path="password" class="text-danger" />
        </div>
        </div>
        
        <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
         <div class="row">
        <div class="col-md-4 col-sm-5">
        </div>
        </div>
        <div class="row">
        <div class="col-md-8">
        <button class="btn btn-primary pull-right" type="submit">Create account</button>
        </div>
        </div>
        </springForm:form>
      </div>
      </div>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
    <div class="col-md-12">
            <hr>
             
             <div class="row">
      <!-- Example row of columns -->
      <div class="col-md-12">
       <c:forEach items="${photos}" var="photo">
       						<div class="item col-md-3">
										<div class="thumbnail">
											<img style="width:164px;height:150px" class="list-group-image" src="<s:url value="/photo/getPhoto?id=${photo.productPhotoId}"/>" alt="" />
										</div>
									</div>
									</c:forEach>
									
								</div>
								
								</div>
								</div>
								</div>

      <hr>

      <footer>
        <p align="center">&copy; Company 2015</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>