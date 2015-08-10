<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Додавання перевезення</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
       <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  


        
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

           
            <strong><i class="glyphicon glyphicon-plus"></i> Додати нове перевезення</strong>
            <hr>
        <div class="col-md-12">
          <springForm:form class="form-horizontal" method="post" action='add.do' name="addForm" id="MyForm" commandName="transportation">
					<div class="form-group">
					<label for="itemAddresses1" >Адреса завантаження:</label>
					<select name="itemAddresses1" id="itemAddresses1" class="form-control input-sm" data-style="btn-success">
					<c:if test="${transportation.loadAddress.addressId!=null}">
					     <option value="${transportation.loadAddress.addressId}">${transportation.loadAddress.name}</option>
					     </c:if>
                         <c:forEach items="${addresses}" var="address">
                             <option value="${address.addressId}">${address.name}</option>
                         </c:forEach>
                    </select>
                    </div>
                   <div class="form-group">
					<label for="Categories" >Адреса розвантаження:</label>
					<select name="itemAddresses2" class="form-control input-sm" data-style="btn-success">
					<c:if test="${transportation.unloadAddress.addressId!=null}">
					     <option value="${transportation.unloadAddress.addressId}">${transportation.unloadAddress.name}</option>
					     </c:if>
                         <c:forEach items="${addresses}" var="address">
                             <option value="${address.addressId}">${address.name}</option>
                         </c:forEach>
                    </select>
                    </div>
                    <div class="form-group ${loadDateError}">
					<label for="Categories" >Дата завантаження:</label>
							<input class="form-control input-sm" type="text" name="date1" id="date1" title="loadDate" value="${transportation.loadDate}" required  autocomplete="off">
                    </div>
                    <div class="form-group ${unloadDateError}">
					<label for="Categories" >Дата розвантаження:</label>
							<input class="form-control input-sm" type="text" name="date2" id="date2" title="loadDate" value="${transportation.unloadDate}"  autocomplete="off">
							                    <div class="row">
                    </div>
                    </div>
                    <div class="form-group">
					<label for="Categories" >Номенклатура товару:</label>
					<select name="itemProducts" class="form-control input-sm" data-style="btn-success">
					<c:if test="${transportation.product.productId!=null}">
					     <option value="${transportation.product.productId}">${transportation.product.name}</option>
					     </c:if>
                         <c:forEach items="${products}" var="product">
                             <option value="${product.productId}">${product.name}</option>
                         </c:forEach>
                    </select>
                    </div>
                    <div class="form-group ${countOfUnitsError}">
					<label for="Categories" >Кількість штук:  <springForm:errors path="countOfUnits" class="text-danger" /></label>
							<input class="form-control input-sm" type="number" name="countOfUnits" id="countOfUnits" title="countOfUnits" value="${transportation.countOfUnits}" autocomplete="off">
							                    <div class="row">
                          
                    </div>
                    </div>
                    <div class="form-group ${weightError}">
					<label for="Categories" >Вага вантажу: <springForm:errors path="weight" class="text-danger" /></label>
							<input class="form-control input-sm" type="text" name="weight" id="weight" title="countOfUnits" value="${transportation.weight}"  autocomplete="off">
							                    <div class="row">
                           
                    </div>
                    </div>
                    <div class="form-group">
					<label for="Categories" >Водій:</label>
					<select name="itemDrivers" class="form-control input-sm" data-style="btn-success">
					<c:if test="${transportation.driver.driverId!=null}">
					     <option value="${transportation.driver.driverId}">${transportation.driver.firstName} ${transportation.driver.lastName} ${transportation.driver.middleName}</option>
					     </c:if>
                         <c:forEach items="${drivers}" var="driver">
                             <option value="${driver.driverId}">${driver.firstName} ${driver.lastName} ${driver.middleName}</option>
                         </c:forEach>
                    </select>
                    </div>
                    <div class="form-group">
					<label for="Categories" >Активність перевезення:</label>
					<select name="itemStatus" class="form-control input-sm" data-style="btn-success">
					<c:if test="${transportation.status!=null}">
					     <option value="${transportation.status}">${transportation.status}</option>
					     </c:if>
                         <c:forEach items="${status}" var="item">
                             <option value="${item}">${item}</option>
                         </c:forEach>
                    </select>
                    </div>
                    <div class="form-group ${totalPriceError}">
					<label for="Categories" >Вартість перевезення: <springForm:errors path="totalPrice" class="text-danger" /></label>
							<input class="form-control input-sm" type="text" name="totalPrice" id="totalPrice" title="totalPrice" value="${transportation.totalPrice}"  autocomplete="off">
							                    
                    </div>
                    <div class="form-group">
					<label for="Categories" >Нотатка до вартості:: <springForm:errors path="note" class="text-danger" /></label>
							<input class="form-control input-sm" type="text" name="note" id="note" title="note" value="${transportation.note}"  autocomplete="off">
							                    
                    </div>
                    <div class="form-group">
					</div>
                    <div class="form-group">
						<button type="submit" class="btn pull-right btn-primary"><span class="glyphicon glyphicon-plus"></span>Додати</button>
					</div>
				</springForm:form>

        </div>
      </div>
            

            
        </div>
        <!--/col-span-9-->
    </div>
<!-- /Main -->

<footer class="text-center">Company 2015</footer>


<!-- /.modal -->
        
        <!--<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>






        
        <!-- JavaScript jQuery code from Bootply.com editor  -->
        
        <script>
        $(document).ready(function() {
        	//$( "#dateRangePicker" ).click(function() {
        	//	  alert( "Handler for .click() called." );
        	//	});
        	$.datepicker.regional['fr'] = {clearText: 'Effacer', clearStatus: '',
    closeText: 'Fermer', closeStatus: 'Fermer sans modifier',
    prevText: '<Préc', prevStatus: 'Voir le mois précédent',
    nextText: 'Suiv>', nextStatus: 'Voir le mois suivant',
    currentText: 'Courant', currentStatus: 'Voir le mois courant',
    monthNames: ['Січень','Лютий','Березень','Квітень','Травень','Червень',
    'Липень','Серпень','Вересень','Жовтень','Листопад','Грудень'],
    monthNamesShort: ['Jan','Fév','Mar','Avr','Mai','Jun',
    'Jul','Aoû','Sep','Oct','Nov','Déc'],
    monthStatus: 'Voir un autre mois', yearStatus: 'Voir un autre année',
    weekHeader: 'Sm', weekStatus: '',
    dayNames: ['Неділя','Понеділок','Вівторок','Середа','Четвер','Пятниця','Субота'],
    dayNamesShort: ['Нед','Пон','Вів','Сер','Чет','Пят','Суб'],
    dayNamesMin: ['Нд','Пн','Вт','Ср','Чт','Пт','Сб'],
    dayStatus: 'Utiliser DD comme premier jour de la semaine', dateStatus: 'Choisir le DD, MM d',
    dateFormat: 'yy-mm-dd', firstDay: 0, 
    initStatus: 'Choisir la date', isRTL: false};
 $.datepicker.setDefaults($.datepicker.regional['fr']);
        	$('#date1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        	$('#date2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        });
        </script>
        
       
        
        
    </body>
</html>