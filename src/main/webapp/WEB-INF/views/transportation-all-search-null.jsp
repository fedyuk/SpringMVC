<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Всі перевезення</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
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

           <div class="row">
           <div class="col-md-2">
            <strong><i class="glyphicon glyphicon-user"></i> Всі перевезення:</strong>
            </div>
            <div class="col-md-6">
            <form id="divLoadDate" action='searchLoadDate.do' method='POST' class="form-search" style="display:none;">
  <input type="text" class="input-medium search-query" name="date" id="date" placeholder="Введіть дату завантаження" style="width:450px;">
  <button type="submit" class="btn">Search</button>
</form>
<form id="divUnLoadDate" action='searchUnLoadDate.do' method='POST' class="form-search" style="display:none;">
  <input type="text" class="input-medium search-query" name="date" id="date2" placeholder="Введіть дату розвантаження" style="width:450px;">
  <button type="submit" class="btn">Search</button>
</form>
<form id="divStatus" action='searchStatus.do' method='POST' class="form-search" style="display:none;">
  <select class="input-sm" name="status" id="status" style="width:450px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
<form id="divCarNumber" action='searchCarNumber.do' method='POST' class="form-search" style="display:none;">
  <select class="input-sm" name="carNumber" id="carNumber" style="width:450px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
<form id="divPhoneNumber" action='searchPhoneNumber.do' method='POST' class="form-search" style="display:none;">
  <select class="input-sm" name="phoneNumber" id="phoneNumber" style="width:450px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
<form id="divProductName" action='searchProductName.do' method='POST' class="form-search" style="display:none;">
   <select class="input-sm" name="productName" id="productName" style="width:450px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
<form id="divRoute" action='searchRoute.do' method='POST' class="form-search" style="display:none;">
  <select class="input-sm" name="loadAddress" id="loadAddress" style="width:225px;"></select>
  <select class="input-sm" name="unloadAddress" id="unloadAddress" style="width:225px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
<form id="divLoadDateInterval" action='searchLoadDateInterval.do' method='POST' class="form-search" style="display:none;">
  <input type="text" class="input-medium search-query" name="loadDate1" id="loadDate1" placeholder="Введіть дату завантаження" style="width:225px;">
  <input type="text" class="input-medium search-query" name="loadDate2" id="loadDate2" placeholder="Введіть дату завантаження" style="width:225px;">
  <button type="submit" class="btn">Search</button>
</form>
<form id="divDriver" action='searchDriver.do' method='POST' class="form-search" style="display:none;">
  <select class="input-sm" name="driver" id="driver" style="width:450px;"></select>
  <button type="submit" class="btn">Search</button>
</form>
            </div>
            <div class="col-md-2">
            <strong></strong>
            </div>
            <div class="col-md-2"> 
                 <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> Пошук за критерієм
                     <span class="caret"></span> 
                 </button> 
                      <ul class="dropdown-menu" role="menu"> 
                          <li ><a id="searchLoadDate" href="#">Дата завантаження</a></li> 
                          <li ><a id="searchUnLoadDate" href="#">Дата розвантаження</a></li> 
                          <li ><a id="searchCarNumber" href="#">Номера машини</a></li> 
                          <li ><a id="searchStatus" href="#">Статус</a></li> 
                          <li ><a id="searchProductName" href="#">Номенклатура</a></li> 
                          <li ><a id="searchPhoneNumber" href="#">Телефон водія</a></li>
                          <li ><a id="searchRoute" href="#">Маршрут</a></li>
                          <li ><a id="searchLoadDateInterval" href="#">Інтервал завантаження</a></li>
                          <li ><a id="searchDriver" href="#">Водій</a></li>
                          <li ><a href="<s:url value="/transportation/search?page=${currentIndex}"/>">Невідома дата розв.</a></li>
                       </ul>
               </div>
            </div>
            <hr>
            <div class="row">
        <div class="col-md-12">
          <table class="table table-bordered table-condensed">
            <thead>
              <tr>
                <th class="text-center small">Машина</th>
                <th class="text-center small">П.І.П. водія</th>
                <th class="text-center small">Телефон</th>
                <th class="text-center small">Дата завант.</th>
                <th class="text-center small">Дата розв.</th>
                <th class="text-center small">К-сть</th>
                <th class="text-center small">Місце завант.</th>
                <th class="text-center small">Місце розв.</th>
                <th class="text-center small">Вартість</th>
                <th class="text-center small">Статус</th>
                <th class="text-center small" style="display:none;"></th>
                <th class="text-center small"></th>
              </tr>
            </thead>
            <tbody data-link="row" class="rowlink">
             <c:forEach items="${transportations}" var="transportation">
             <c:if test="${transportation.status == 'agree'}">
              <tr>
                <td class="text-center small"><p>${transportation.driver.car.brand}</p><p>${transportation.driver.car.carNumber}</p><p>${transportation.driver.car.trailerNumber}</p></td>
                <td class="text-center small"><p>${transportation.driver.lastName} ${transportation.driver.firstName}</p><p>${transportation.driver.middleName}</p></td>
                <td class="text-center small"><p>${transportation.driver.phoneNumber}</p><p>${transportation.driver.car.directorPhoneNumber}</p></td>
                <td class="text-center small"><c:out value="${dateFormat.format(transportation.loadDate)}"/></td>
                <td class="text-center small">
                <c:if test="${transportation.unloadDate != null}">
                <c:out value="${dateFormat.format(transportation.unloadDate)}"/>
                </c:if>
                </td>
                <td class="text-center small"><c:out value="${transportation.countOfUnits}"/></td>
                <td class="text-center small"><c:out value="${transportation.loadAddress.name}"/></td>
                <td class="text-center small"><c:out value="${transportation.unloadAddress.name}"/></td>
                <td class="text-center small"><p>${transportation.totalPrice}</p><p>${transportation.note}</p></td>
                <td class="text-center small"><c:out value="${transportation.status}"/></td>

			   
                <td class="text-center small" style="display:none;"><a href="<s:url value="/transportation/edit?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-edit"></i></a></td>
                <td class="text-center small"><a href="<s:url value="/transportation/delete?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-trash"></i></a></td>
              </tr>
              </c:if>
              <c:if test="${transportation.status == 'unload'}">
              <tr class="success">
                <td class="text-center small"><p>${transportation.driver.car.brand}</p><p>${transportation.driver.car.carNumber}</p><p>${transportation.driver.car.trailerNumber}</p></td>
                <td class="text-center small"><p>${transportation.driver.lastName} ${transportation.driver.firstName}</p><p>${transportation.driver.middleName}</p></td>
                <td class="text-center small"><p>${transportation.driver.phoneNumber}</p><p>${transportation.driver.car.directorPhoneNumber}</p></td>
                <td class="text-center small"><c:out value="${dateFormat.format(transportation.loadDate)}"/></td>
                <td class="text-center small">
                <c:if test="${transportation.unloadDate != null}">
                <c:out value="${dateFormat.format(transportation.unloadDate)}"/>
                </c:if>
                </td>
                <td class="text-center small"><c:out value="${transportation.countOfUnits}"/></td>
                <td class="text-center small"><c:out value="${transportation.loadAddress.name}"/></td>
                <td class="text-center small"><c:out value="${transportation.unloadAddress.name}"/></td>
                <td class="text-center small"><p>${transportation.totalPrice}</p><p>${transportation.note}</p></td>
                <td class="text-center small"><c:out value="${transportation.status}"/></td>

			   
                <td class="text-center small" style="display:none;"><a href="<s:url value="/transportation/edit?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-edit"></i></a></td>
                <td class="text-center small"><a href="<s:url value="/transportation/delete?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-trash"></i></a></td>
              </tr>
              </c:if>
               <c:if test="${transportation.status == 'load'}">
              <tr class="danger">
                <td class="text-center small"><p>${transportation.driver.car.brand}</p><p>${transportation.driver.car.carNumber}</p><p>${transportation.driver.car.trailerNumber}</p></td>
                <td class="text-center small"><p>${transportation.driver.lastName} ${transportation.driver.firstName}</p><p>${transportation.driver.middleName}</p></td>
                <td class="text-center small"><p>${transportation.driver.phoneNumber}</p><p>${transportation.driver.car.directorPhoneNumber}</p></td>
                <td class="text-center small"><c:out value="${dateFormat.format(transportation.loadDate)}"/></td>
                <td class="text-center small">
                <c:if test="${transportation.unloadDate != null}">
                <c:out value="${dateFormat.format(transportation.unloadDate)}"/>
                </c:if>
                </td>
                <td class="text-center small"><c:out value="${transportation.countOfUnits}"/></td>
                <td class="text-center small"><c:out value="${transportation.loadAddress.name}"/></td>
                <td class="text-center small"><c:out value="${transportation.unloadAddress.name}"/></td>
                <td class="text-center small"><p>${transportation.totalPrice}</p><p>${transportation.note}</p></td>
                <td class="text-center small"><c:out value="${transportation.status}"/></td>
                <td class="text-center small" style="display:none;"><a href="<s:url value="/transportation/edit?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-edit"></i></a></td>
                <td class="text-center small"><a href="<s:url value="/transportation/delete?transportationId=${transportation.transportationId}"/>" role="button" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-trash"></i></a></td>
              </tr>
              </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="col-md-offset-11">
        <button onclick="printPage()" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-print" aria-hidden="true"></span>Print page</button>
        </div>
        <c:url var="firstUrl" value="/transportation/search?page=1" />
<c:url var="lastUrl" value="/transportation/search?page=${page.totalPages}" />
<c:url var="prevUrl" value="/transportation/search?page=${currentIndex - 1}" />
<c:url var="nextUrl" value="/transportation/search?page=${currentIndex + 1}" />

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
            <c:url var="pageUrl" value="/transportation/search?page=${i}" />
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
        


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                <script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>






        
        <!-- JavaScript jQuery code from Bootply.com editor  -->
        
        <script>
        function printPage() {
        	$("a").hide();
        	window.print();
        	$("a").show();
        }
        (function ($) {
            $.fn.extend({
                tableAddCounter: function (options) {

                    // set up default options 
                    var defaults = {
                        title: '#',
                        start: ((${currentIndex}-1)*10)+1,
                        id: false,
                        cssClass: false
                    };

                    // Overwrite default options with user provided
                    var options = $.extend({}, defaults, options);

                    return $(this).each(function () {
                        // Make sure this is a table tag
                        if ($(this).is('table')) {

                            // Add column title unless set to 'false'
                            if (!options.title) options.title = '';
                            $('th:first-child, thead td:first-child', this).each(function () {
                                var tagName = $(this).prop('tagName');
                                $(this).before('<' + tagName + ' rowspan="' + $('thead tr').length + '" class="' + options.cssClass + '" id="' + options.id + '">' + options.title + '</' + tagName + '>');
                            });

                            // Add counter starting counter from 'start'
                            $('tbody td:first-child', this).each(function (i) {
                                $(this).before('<td>' + (options.start + i) + '</td>');
                            });

                        }
                    });
                }
            });
        })(jQuery);
        	$(document).ready(function() {
               
          
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
        	$( "#searchLoadDate" ).click(function() {
        		$("form:visible").hide();
        		  $("#divLoadDate").show("fast");
        		  $('#date').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        		});
        	$( "#searchUnLoadDate" ).click(function() {
        		$("form:visible").hide();
      		  $("#divUnLoadDate").show("fast");
      		$('#date2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
      		});
        	$( "#searchStatus" ).click(function() {
        		$("form:visible").hide();
      		  $("#divStatus").show("fast");
      		 var status1 = '';
   		  $.getJSON('${pageContext.request.contextPath}/transportation/getAllStatus', function(status) {
   			  $.each( status, function( key, val ) {
   				  status1+= '<option value="' + val + '">' + val + '</option>';
   			  });
   			  $("#status").append(status1);
   	        }); 
      		});
        	$( "#searchCarNumber" ).click(function() {
        		$("form:visible").hide();
        		  $("#divCarNumber").show("fast");
        		  var carNumber1 = '';
        		  $.getJSON('${pageContext.request.contextPath}/car/getAllCarNumbers', function(carNumber) {
        			  $.each( carNumber, function( key, val ) {
        				  carNumber1+= '<option value="' + val + '">' + val + '</option>';
        			  });
        			  $("#carNumber").append(carNumber1);
        	        }); 
        		});
        	$( "#searchPhoneNumber" ).click(function() {
        		$("form:visible").hide();
      		  $("#divPhoneNumber").show("fast");
      		var phoneNumber1 = '';
  		  $.getJSON('${pageContext.request.contextPath}/driver/getAllPhoneNumbers', function(phoneNumber) {
  			  $.each( phoneNumber, function( key, val ) {
  				  phoneNumber1+= '<option value="' + val.phoneNumber + '">' + val.phoneNumber + '</option>';
  			  });
  			  $("#phoneNumber").append(phoneNumber1);
  	        }); 
      		});
        	$( "#searchProductName" ).click(function() {
        		$("form:visible").hide();
        		  $("#divProductName").show("fast");
        		  var product1 = '';
        		  $.getJSON('${pageContext.request.contextPath}/product/getAllProducts', function(product) {
        			  $.each( product, function( key, val ) {
        				  product1+= '<option value="' + val.name + '">' + val.name + '</option>';
        			  });
        			  $("#productName").append(product1);
        	        }); 
        		});
        	$( "#searchRoute" ).click(function() {
        		$("form:visible").hide();
        		  $("#divRoute").show("fast");
        		  var address1 = '';
        		  $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
        			  $.each( address, function( key, val ) {
        				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
        			  });
        			  $("#loadAddress").append(address1);
        			  $("#unloadAddress").append(address1);
        	        }); 
        		});
        	$( "#searchDriver" ).click(function() {
        		$("form:visible").hide();
        		  $("#divDriver").show("fast");
        		  var driver1 = '';
        		  $.getJSON('${pageContext.request.contextPath}/driver/getAllDrivers', function(driver) {
        			  $.each( driver, function( key, val ) {
        				  driver1+= '<option value="' + val[0] + '">' + val[1]+ " " + val[2] + " " + val[3] +'</option>';
        			  });
        			  $("#driver").append(driver1);
        	        }); 
        		});
        	$( "#searchLoadDateInterval" ).click(function() {
        		$("form:visible").hide();
        		  $("#divLoadDateInterval").show("fast");
        		  $('#loadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
		        	$('#loadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
        		});
        	
        	 $('.table').tableAddCounter();
             $.done(function (script, textStatus) { $('tbody').sortable();$(".alert-info").alert('close');$(".alert-success").show(); });
        });

        </script>
        
        
    </body>
</html>