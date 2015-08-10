<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Логінування</title>

    <link href="http://twbs.docs.org.ua/dist/css/bootstrap.min.css" rel="stylesheet">


    <link href="http://twbs.docs.org.ua/examples/signin/signin.css" rel="stylesheet">

  

    <script src="http://twbs.docs.org.ua/assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>

    <div class="container">
      <form class="form-signin"  method="post" action="<c:url value='/j_spring_security_check' />" >
        <h2 class="form-signin-heading">Вхід у систему:</h2>
        <label for="inputEmail" class="sr-only">Email</label>
        <input type="text" name="username" id="username" class="form-control" placeholder="Ваш логін" required autofocus autocomplete="off">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="Ваш пароль" required autocomplete="off">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Увійти</button>
        <c:if test="${not empty error}">
        <div class="alert alert-danger">${ error}</div>
        </c:if>
        <c:if test="${not empty msg}">
			<div class="alert alert-danger">${msg}</div>
		</c:if>
        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
        <!-- <p align="right">Registration is <a href="<s:url value="registration"/>" >here</a></p>-->
      </form>

    </div> <!-- /container -->
    <footer class="text-center">2015</footer>
    <script src="http://twbs.docs.org.ua/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>