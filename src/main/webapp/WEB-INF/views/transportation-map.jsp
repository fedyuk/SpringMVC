<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>Підрахунок витрати на паливо</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
                 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script>
        var geocoder;
        var map;
        var address1;
        var address2;
        var markers = [];
        var directionsDisplay;
        var directionsService;
        var poly;
        var path;
        function initialize() {
        	geocoder = new google.maps.Geocoder();
      	  var markers = [];
      	var opts = {
      		    center: new google.maps.LatLng(49.8546075, 23.9990071,12),
      		    zoom: 10
      		  };
      		  map = new google.maps.Map(document.getElementById('map-canvas'), opts);
      		directionsService = new google.maps.DirectionsService();
      		poly = new google.maps.Polyline({ map: map, strokeColor: '#4986E7' });
      		path = new google.maps.MVCArray();

      	  //var defaultBounds = new google.maps.LatLngBounds(
      	  //    new google.maps.LatLng(49.9099134,23.9598683,10));
      	 // map.fitBounds(defaultBounds);
      	  // Create the search box and link it to the UI element.
      	  var input = /** @type {HTMLInputElement} */(
      	      document.getElementById('input1'));
      	  var input2 = /** @type {HTMLInputElement} */(
          	  document.getElementById('input2'));
      	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
      	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input2);

      	  var searchBox = new google.maps.places.SearchBox(
      	    /** @type {HTMLInputElement} */(input));
      	  
      	var searchBox2 = new google.maps.places.SearchBox(
          	    /** @type {HTMLInputElement} */(input2));

      	  // [START region_getplaces]
      	  // Listen for the event fired when the user selects an item from the
      	  // pick list. Retrieve the matching places for that item.
      	  
      	  // [END region_getplaces]
      	  // Bias the SearchBox results towards places that are within the bounds of the
      	  // current map's viewport.
      	}
        
        function calculateDistances() {
        	poly.setMap(null);
        	 for (var i = 0; i < markers.length; i++ ) {
        		    markers[i].setMap(null);
        		  }
        		  markers.length = 0;
        	  var input1 = document.getElementById('input1').value;
        	  geocoder.geocode( { 'address': input1}, function(results, status) {
        	    if (status == google.maps.GeocoderStatus.OK) {
        	      //map.setCenter(results[0].geometry.location);
        	      var marker = new google.maps.Marker({
        	          map: map,
        	          position: results[0].geometry.location
        	      });
        	      markers.push(marker);
        	      address1 = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
        	    } else {
        	      alert('Виберіть адресу завантаження! ');
        	    }
        	  });
        	  
        	  var input2 = document.getElementById('input2').value;
        	  geocoder.geocode( { 'address': input2}, function(results, status) {
        	    if (status == google.maps.GeocoderStatus.OK) {
        	      //map.setCenter(results[0].geometry.location);
        	      var marker = new google.maps.Marker({
        	          map: map,
        	          position: results[0].geometry.location
        	      });
        	      markers.push(marker);
        	      address2 = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
        	    } else {
        	      alert('Виберіть адресу розвантаження! ');
        	    }
        	  });
        	  var service = new google.maps.DistanceMatrixService();
        	  service.getDistanceMatrix(
        	    {
        	      origins: [address1],
        	      destinations: [address2],
        	      travelMode: google.maps.TravelMode.DRIVING,
        	      unitSystem: google.maps.UnitSystem.METRIC,
        	      avoidHighways: false,
        	      avoidTolls: false
        	    }, callback);
        	  calcRoute();
        	  
        }
        
        function callback(response, status) {
        	  if (status != google.maps.DistanceMatrixStatus.OK) {
        	    alert('Error was: ' + status);
        	  } else {
        		  var origins = response.originAddresses;
        		    var destinations = response.destinationAddresses;
        		    var outputDiv = document.getElementById('distance');
        		    outputDiv.innerHTML = '';

        		    for (var i = 0; i < origins.length; i++) {
        		      var results = response.rows[i].elements;
        		      for (var j = 0; j < results.length; j++) {
        		        //outputDiv.innerHTML += 'Відстань від ' +origins[i] + ' до ' + destinations[j]
        		        //    + ': ' + results[j].distance.text + ' за '
        		        //    + results[j].duration.text + '<br>';
        		        outputDiv.innerHTML += results[j].distance.text + ' за ' + results[j].duration.text;
        		        var distanceText = results[j].distance.text;
        		        
        		        $("#distanceResult").text(distanceText.slice(0, -2));
        		      }
        		    }
        	  }
        	}
        
        function calcRoute() {
        	poly.setMap(null);
            var start = address1;
            //var end = new google.maps.LatLng(38.334818, -181.884886);
            var end = address2;
            var bounds = new google.maps.LatLngBounds();
            bounds.extend(start);
            bounds.extend(end);
            map.fitBounds(bounds);
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING
            };
            path = new google.maps.MVCArray();
            path.push(address1);
            poly.setPath(path);
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    //directionsDisplay.setDirections(response);
                    //directionsDisplay.setMap(map);
                    for (var i = 0, len = response.routes[0].overview_path.length; i < len; i++) {
                            path.push(response.routes[0].overview_path[i]);
                            
                        }
                } else {
                    alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
                }
            });
            poly.setPath(path);
            poly.setMap(map);
        }
        function calculatePetrol() {
        	//$("#result").text($( "input[name=petrol]").val());
        	var a = parseInt($("#distanceResult").text());
        	var b = parseInt($("#petrol").val());
        	var currency = $("#price").val()
        	var number = Number(currency.replace(/[^0-9\.]+/g,""));
        	var result = ((b * a)/100);
        	var resultPrice = ((result * number)*100)/100;
        	$("#result").text(result+" л.");
        	$("#resultPrice").text(resultPrice+" грн.");
        	//$("#result").text("123");
        }
      	google.maps.event.addDomListener(window, 'load', initialize);
        </script>








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
html, body, #map-canvas {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      .controls {
        margin-top: 16px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #input1 {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 340px;
      }

      #input1:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

        #input2 {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 22px 0 13px;
        text-overflow: ellipsis;
        width: 340px;
      }

      #input2:focus {
        border-color: #4d90fe;
      }
      
      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
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

           
            <strong><i class="glyphicon glyphicon-user"></i> Витрати палива:</strong>
            <hr>
            <div class="row">
        <div class="col-xs-10">
            <input id="input1" class="controls" type="text" placeholder="Введіть адресу завантаження">
            <input id="input2" class="controls" type="text" placeholder="Введіть адресу розвантаження">
            <div id="map-canvas" style="width:940px;height:400px;"></div>
        </div>
        <div class="col-xs-2">
        <div class="row">
        <div class="col-md-6">
        <button class="btn btn-success btn-xs" type="button" onclick="calculateDistances();">Маршрут</button>
        </div>
        <div class="col-md-6">
        <button class="btn btn-success btn-xs" type="button" onclick="calculateDistances();">Відстань</button>
        </div>
        </div>
        <div class="form-group">
        <label for="Categories" >Відстань і час:</label>
        <p id="distance"></p>
        </div>
        <div class="form-group">
        <label for="Categories" >Витрати на 100 км:</label>
        <input type="number" id="petrol" name="petrol" placeholder="Витрати на 100 км" autocomplete="off"></input>
        </div>
        <div class="form-group">
        <label for="Categories" >Ціна за 1 л.:</label>
        <input type="text" id="price" name="price" placeholder="Ціна за 1л." autocomplete="off"></input>
        </div>
        <div class="form-group">
        <button class="btn btn-success btn-xs" type="button" onclick="calculatePetrol();">Порахувати витрати</button>
        </div>
        <p id="distanceResult" style="display:none;"></p>
        <div class="form-group">
        <label for="Categories" >Витрата палива:</label>
        <p id="result"></p>
        </div>
         <div class="form-group">
        <label for="Categories" >Загальна вартість палива:</label>
        <p id="resultPrice"></p>
        </div>
        </div>
      </div>
            

            
        </div>
        <!--/col-span-9-->
    </div>
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
        });
        
        </script>
        
    </body>
</html>