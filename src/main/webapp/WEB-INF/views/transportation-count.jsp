<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Підрахунки</title>
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

           
            <strong><i class="glyphicon glyphicon-user"></i> Підрахунки:</strong>
            <hr>
            <div class="row">
        <div class="col-md-12">
         <ul class="nav nav-tabs">
           <li id="liCountUnload" class="active"><a id="countUnload" href="#">К-сть машин розв.</a></li>
           <li id="liCountLoad"><a id="countLoad" href="#">К-сть машин завант.</a></li>
           <li id="liSumUnload"><a id="sumUnload" href="#">К-сть цегли розв.</a></li>
           <li id="liSumLoad"><a id="sumLoad" href="#">К-сть цегли завант.</a></li>
        </ul>
        <div id="divCountUnload" style="display:visible;" class="form-group">
        <div class="form-group">
           <input type="text" class="input-medium search-query" name="unloadDate1" id="unloadDate1" placeholder="Введіть дату розвантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <input type="text" class="input-medium search-query" name="unloadDate2" id="unloadDate2" placeholder="Введіть дату розвантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <select class="input-sm" name="addressUnload" id="addressUnload" style="width:300px;"></select>
           </div>
           <div class="form-group">
           <button id="searchCountUnload" class="btn btn-success btn-xs">Порахувати</button>
           </div>
           <div class="form-group">
           <p id="resultCountUnload"></p>
           </div>
        </div>
        <div id="divCountLoad" style="display:none;" class="form-group">
        <div class="form-group">
           <input type="text" class="input-medium search-query" name="loadDate1" id="loadDate1" placeholder="Введіть дату завантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <input type="text" class="input-medium search-query" name="loadDate2" id="loadDate2" placeholder="Введіть дату завантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <select class="input-sm" name="addressLoad" id="addressLoad" style="width:300px;"></select>
           </div>
           <div class="form-group">
           <button id="searchCountLoad" class="btn btn-success btn-xs">Порахувати</button>
           </div>
           <div class="form-group">
           <p id="resultCountLoad"></p>
           </div>
        </div>
        <div id="divSumUnload" style="display:none;" class="form-group">
        <div class="form-group">
           <input type="text" class="input-medium search-query" name="sumunloadDate1" id="sumunloadDate1" placeholder="Введіть дату розвантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <input type="text" class="input-medium search-query" name="sumunloadDate2" id="sumunloadDate2" placeholder="Введіть дату розвантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <select class="input-sm" name="sumaddressUnload" id="sumaddressUnload" style="width:300px;"></select>
           </div>
           <div class="form-group">
           <button id="searchSumUnload" class="btn btn-success btn-xs">Порахувати</button>
           </div>
           <div class="form-group">
           <p id="resultSumUnload"></p>
           </div>
        </div>
        <div id="divSumLoad" style="display:none;" class="form-group">
        <div class="form-group">
           <input type="text" class="input-medium search-query" name="sumloadDate1" id="sumloadDate1" placeholder="Введіть дату завантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <input type="text" class="input-medium search-query" name="sumloadDate2" id="sumloadDate2" placeholder="Введіть дату завантаження" style="width:300px;">
           </div>
           <div class="form-group">
           <select class="input-sm" name="sumaddressLoad" id="sumaddressLoad" style="width:300px;"></select>
           </div>
           <div class="form-group">
           <button id="searchSumLoad" class="btn btn-success btn-xs">Порахувати</button>
           </div>
           <div class="form-group">
           <p id="resultSumLoad"></p>
           </div>
        </div>
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
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
            $( "#divCountLoad" ).hide();
            $( "#divSumLoad" ).hide();
            $( "#divSumUnload" ).hide();
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
        		  $('#unloadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
          		 $('#unloadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
         		 var address1 = '';
      		      $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
      			  $.each( address, function( key, val ) {
      				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
      			  });
      			  $("#addressUnload").append(address1);
      	        }); 
        		 $( "#countLoad" ).click(function() {
        	         $( "#divCountUnload" ).hide();
        	         $( "#divSumUnload" ).hide();
        	         $( "#divSumLoad" ).hide();
             		 $("form:visible").hide();
             		 $("#liCountUnload").attr("class","");
             		 $("#liSumLoad").attr("class","");
             		 $("#liSumUnload").attr("class","");
             		  $("#liCountLoad").attr("class","active");
             		  $("#divCountLoad").show("fast");
             		  $('#loadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		 $('#loadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		$( "select").empty();
             		 var address1 = '';
           		      $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
           			  $.each( address, function( key, val ) {
           				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
           			  });
           			  $("#addressLoad").append(address1);
           	        }); 
             		});
        		 $( "#countUnload" ).click(function() {
        	         $("#divCountLoad").hide();
        	         $( "#divSumUnload" ).hide();
        	         $( "#divSumLoad" ).hide();
             		 $("form:visible").hide();
             		 $("#liCountUnload").attr("class","active");
             		 $("#liSumLoad").attr("class","");
            		 $("#liSumUnload").attr("class","");
             		  $("#liCountLoad").attr("class","");
             		  $("#divCountUnload").show("fast");
             		  $('#unloadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		 $('#unloadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		$( "select").empty();
             		 var address1 = '';
           		      $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
           			  $.each( address, function( key, val ) {
           				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
           			  });
           			  $("#addressUnload").append(address1);
           	        }); 
             		});
        		 $( "#sumLoad" ).click(function() {
        	         $( "#divCountUnload" ).hide();
        	         $( "#divCountLoad" ).hide();
        	         $( "#divSumUnload" ).hide();
             		 $("form:visible").hide();
             		 $("#liCountUnload").attr("class","");
             		 $("#liSumLoad").attr("class","active");
             		 $("#liSumUnload").attr("class","");
             		  $("#liCountLoad").attr("class","");
             		  $("#divSumLoad").show("fast");
             		  $('#sumloadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		 $('#sumloadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		$( "select").empty();
             		 var address1 = '';
           		      $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
           			  $.each( address, function( key, val ) {
           				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
           			  });
           			  $("#sumaddressLoad").append(address1);
           	        }); 
             		});
        		 $( "#sumUnload" ).click(function() {
        	         $( "#divCountUnload" ).hide();
        	         $( "#divCountLoad" ).hide();
        	         $( "#divSumLoad" ).hide();
             		 $("form:visible").hide();
             		 $("#liCountUnload").attr("class","");
             		 $("#liSumLoad").attr("class","");
             		 $("#liSumUnload").attr("class","active");
             		  $("#liCountLoad").attr("class","");
             		  $("#divSumUnload").show("fast");
             		  $('#sumunloadDate1').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		 $('#sumunloadDate2').datepicker({ dateFormat: 'yy-mm-dd' }).val();
             		$( "select").empty();
             		 var address1 = '';
           		      $.getJSON('${pageContext.request.contextPath}/address/getAllAddresses', function(address) {
           			  $.each( address, function( key, val ) {
           				  address1+= '<option value="' + val.name + '">' + val.name + '</option>';
           			  });
           			  $("#sumaddressUnload").append(address1);
           	        }); 
             		});
        		 $( "#searchCountLoad" ).click(function() {
        			 $.getJSON('${pageContext.request.contextPath}/transportation/getTransportationCountByLoad?loadDate1=' + $( "input:text[name=loadDate1]" ).val() + '&loadDate2=' + $( "input:text[name=loadDate2]" ).val() + '&address=' + $( "select option:selected").val(), function(count) {
        				 $("#resultCountLoad").text("Кількість машин які завантажились в такій адресі як "+ $( "select option:selected").val() + ": "+count);
        			 });
        		 });
        		 
        		 $( "#searchCountUnload" ).click(function() {
        			 $.getJSON('${pageContext.request.contextPath}/transportation/getTransportationCountByUnload?unloadDate1=' + $( "input:text[name=unloadDate1]" ).val() + '&unloadDate2=' + $( "input:text[name=unloadDate2]" ).val() + '&address=' + $( "select option:selected").val(), function(count) {
        				 $("#resultCountUnload").text("Кількість машин які розвантажились в такій адресі як "+ $( "select option:selected").val() + ": "+count);
        			 });
        		 });
        		 
        		 $( "#searchSumLoad" ).click(function() {
        			 $.getJSON('${pageContext.request.contextPath}/transportation/getProductSumByLoad?loadDate1=' + $( "input:text[name=sumloadDate1]" ).val() + '&loadDate2=' + $( "input:text[name=sumloadDate2]" ).val() + '&address=' + $( "select option:selected").val(), function(count) {
        				 $("#resultSumLoad").text("Кількість цегли яка завантажилась в такій адресі як "+ $( "select option:selected").val() + ": "+count);
        			 });
        		 });
        		 
        		 $( "#searchSumUnload" ).click(function() {
        			 $.getJSON('${pageContext.request.contextPath}/transportation/getProductSumByUnload?unloadDate1=' + $( "input:text[name=sumunloadDate1]" ).val() + '&unloadDate2=' + $( "input:text[name=sumunloadDate2]" ).val() + '&address=' + $( "select option:selected").val(), function(count) {
        				 $("#resultSumUnload").text("Кількість цегли яка розвантажилась в такій адресі як "+ $( "select option:selected").val() + ": "+count);
        			 });
        		 });
        });
        
        </script>
        
    </body>
</html>