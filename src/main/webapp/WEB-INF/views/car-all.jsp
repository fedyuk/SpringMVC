<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Всі машини</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->










        <!-- CSS code from Bootply.com editor -->
        
        <style type="text/css">
            .navbar-static-top {
  margin-bottom:20px;
}

i {
  font-size:16px;
}

.nav > li > a {
  color:#787878;
}
  
footer {
  margin-top:20px;
  padding-top:20px;
  padding-bottom:20px;
  background-color:#efefef;
}

/* count indicator near icons */
.nav>li .count {
  position: absolute;
  bottom: 12px;
  right: 6px;
  font-size: 9px;
  background: rgba(51,200,51,0.55);
  color: rgba(255,255,255,0.9);
  line-height: 1em;
  padding: 2px 4px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -ms-border-radius: 10px;
  -o-border-radius: 10px;
  border-radius: 10px;
}

        </style>
    </head>
    
    <!-- HTML code from Bootply.com editor -->
    
    <body  >
        
        <!-- header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-usd"></i> Розрахунки <span class="caret"></span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li> <a href="<s:url value="/transportation/map"/>">Витрати палива</a></li>
                        <li><a href="<s:url value="/transportation/count"/>">Для звітності</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i> Адмін <span class="caret"></span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="javascript:formSubmit()">Вийти з системи</a></li>
                    </ul>
                </li>
            </ul>
        </div>
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
    
    <!-- /container -->
</div>
<!-- /Header -->

<!-- Main -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <!-- Left column -->
            <strong><i class="glyphicon glyphicon-wrench"></i> Панель керування</strong>

            <hr>

            <ul class="nav nav-stacked">
            <li><a href="<s:url value="/transportation/all?page=1"/>"><i class="glyphicon glyphicon-briefcase"></i> Перевезення</a></li>
            <li><a href="<s:url value="/transportation/add"/>"><i class="glyphicon glyphicon-plus"></i> Додати перевезення</a></li>
            <li><a href="<s:url value="/address/all?page=1"/>"><i class="glyphicon glyphicon-home"></i> Адреси</a></li>
            <li><a href="<s:url value="/address/add"/>"><i class="glyphicon glyphicon-plus"></i> Додати адресу</a></li>
            <li><a href="<s:url value="/car/all?page=1"/>"><i class="glyphicon glyphicon-road"></i> Машини</a></li>
            <li><a href="<s:url value="/car/add"/>"><i class="glyphicon glyphicon-plus"></i> Додати машину</a></li>
            <li><a href="<s:url value="/driver/all?page=1"/>"><i class="glyphicon glyphicon-user"></i> Водії</a></li>
            <li><a href="<s:url value="/driver/add"/>"><i class="glyphicon glyphicon-plus"></i> Додати водія</a></li>
            <li><a href="<s:url value="/product/all?page=1"/>"><i class="glyphicon glyphicon-shopping-cart"></i> Товари</a></li>
            <li><a href="<s:url value="/product/add"/>"><i class="glyphicon glyphicon-plus"></i> Додати товар</a></li>
            </ul>
        </div>
        <!-- /col-3 -->
        <div class="col-sm-10">

           
            <strong><i class="glyphicon glyphicon-user"></i> Всі машини</strong>
            <hr>
            <div class="row">
        <div class="col-md-12">
          <table class="table table-condensed table-striped table-bordered">
            <thead>
              <tr>
                <th class="text-center small">Номер</th>
                <th class="text-center small">Марка</th>
                <th class="text-center small">Номера</th>
                <th class="text-center small">Номера прицепа</th>
                <th class="text-center small">Телефон директора</th>
                <th class="text-center small">Редагувати</th>
                <th class="text-center small">Видалити</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${cars}" var="car">
              <tr>
                <td class="text-center small"><c:out value="${car.carId}"/></td>
                <td class="text-center small"><c:out value="${car.brand}"/></td>
                <td class="text-center small"><c:out value="${car.carNumber}"/></td>
                <td class="text-center small"><c:out value="${car.trailerNumber}"/></td>
                <td class="text-center small"><c:out value="${car.directorPhoneNumber}"/></td>
                <td class="text-center small"><a href="<s:url value="/car/edit?carId=${car.carId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-edit"></i>редагувати</a></td>
                <td class="text-center small"><a href="<s:url value="/car/delete?carId=${car.carId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-trash"></i>видалити</a></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <c:url var="firstUrl" value="/car/all?page=1" />
<c:url var="lastUrl" value="/car/all?page=${page.totalPages}" />
<c:url var="prevUrl" value="/car/all?page=${currentIndex - 1}" />
<c:url var="nextUrl" value="/car/all?page=${currentIndex + 1}" />

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
            <c:url var="pageUrl" value="/car/all?page=${i}" />
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
        <!--/col-span-9-->
    </div>
<!-- /Main -->

<footer class="text-center">Company 2015</footer>


<!-- /.modal -->
        
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


        <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>






        
        <!-- JavaScript jQuery code from Bootply.com editor  -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        
            $(".alert").addClass("in").fadeOut(4500);

/* swap open/close side menu icons */
$('[data-toggle=collapse]').click(function(){
  	// toggle icon
  	$(this).find("i").toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
});
        
        });
        
        </script>
        
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-40413119-1', 'bootply.com');
          ga('send', 'pageview');
        </script>
        
        
    </body>
</html>