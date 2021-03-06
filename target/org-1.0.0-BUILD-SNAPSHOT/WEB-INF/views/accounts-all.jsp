<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Admin</title>
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
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="javascript:formSubmit()">Logout</a></li>
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
        <div class="col-sm-3">
            <!-- Left column -->
            <strong><i class="glyphicon glyphicon-wrench"></i> Control panel</strong>

            <hr>

            <ul class="nav nav-stacked">
                        <li><a href="<s:url value="/account/all?page=1"/>"><i class="glyphicon glyphicon-user"></i> All accounts</a></li>
                        <li><a href="<s:url value="/account/add"/>"><i class="glyphicon glyphicon-plus"></i> Add account</a></li>
                        <li><a href="<s:url value="/sale/new?page=1"/>"><i class="glyphicon glyphicon-envelope"></i> New sales <span class="badge badge-info">${notReviewedSales}</span></a></li>
                        <li><a href="<s:url value="/sale/all?page=1"/>"><i class="glyphicon glyphicon-book"></i> All sales</a></li>
                        <li><a href="<s:url value="/product/all?page=1"/>"><i class="glyphicon glyphicon-book"></i> All products</a></li>
                        <li><a href="<s:url value="/product/add"/>"><i class="glyphicon glyphicon-plus"></i> Add product</a></li>
            </ul>
        </div>
        <!-- /col-3 -->
        <div class="col-sm-9">

           
            <strong><i class="glyphicon glyphicon-user"></i> All accounts</strong>
            <hr>
            <div class="row">
        <div class="col-md-12">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Email</th>
                <th class="text-center">Password</th>
                <th class="text-center">Role</th>
                <th class="text-center">isActive</th>
                <th class="text-center">Remove</th>
                <th class="text-center">Ban/Unban</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${accounts}" var="account">
              <tr>
                <td class="text-center"><c:out value="${account.accountId}"/></td>
                <td class="text-center"><c:out value="${account.email}"/></td>
                <td class="text-center"><c:out value="${account.password}"/></td>
                <td class="text-center"><c:out value="${account.role.name}"/></td>
                <td class="text-center"><c:out value="${account.isActive}"/></td>
                <td class="text-center"><a href="<s:url value="/account/delete?accountId=${account.accountId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-trash"></i>delete</a></td>
                <c:if test="${account.isActive == 1}">
                <td class="text-center"><a href="<s:url value="/account/ban/?accountId=${account.accountId}&page=${currentIndex}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-lock"></i>ban</a></td>
                </c:if>
                <c:if test="${account.isActive == 0}">
                <td class="text-center"><a href="<s:url value="/account/ban/?accountId=${account.accountId}&page=${currentIndex}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-ok"></i>unban</a></td>
                </c:if>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <c:url var="firstUrl" value="/account/all?page=1" />
<c:url var="lastUrl" value="/account/all?page=${page.totalPages}" />
<c:url var="prevUrl" value="/account/all?page=${currentIndex - 1}" />
<c:url var="nextUrl" value="/account/all?page=${currentIndex + 1}" />

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
            <c:url var="pageUrl" value="/account/all?page=${i}" />
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