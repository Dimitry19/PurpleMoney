<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
</head>
<body>
<div id="map"></div>
<div id="right-panel">
    <div>
        <s:form  id="mapForm" cssClass="form-horizontal" action="mapsearchAction">
            <div class="form-group">
                <s:label value="%{getText('map.label.origin')}" id="idname" for="idname"  labelposition="left"></s:label>
                <s:textfield   name="origin.format" id="originId" placeholder="%{getText('map.placeholder.input')}" cssClass="form-control"/>
                <span class = "input-group-addon"></span>
            </div>
            <div class="form-group">
                <s:label value="%{getText('map.label.destination')}" id="idsurname" for="idsurname"  labelposition="left"></s:label>
                <s:textfield   name="destination.format"  id="destinationId"  placeholder="%{getText('map.placeholder.input')}" cssClass="form-control"/>
                <span class = "input-group-addon"></span>
            </div>
            <div class="btn btn-group-md">
                <s:submit  type="button"   id="searchMapBtn" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.search"></s:text></i></s:submit>
            </div>
        </s:form>
    </div>
    <div id="directions-panel"></div>
</div>
<script>
    function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var myOptions = {
            zoom: 4,
            center: {lat: 44.77, lng: 10.27},
            mapTypeId: google.maps.MapTypeId.ROADMAP,
        }
        var map = new google.maps.Map(document.getElementById('map'), myOptions);
        directionsDisplay.setMap(map);
        var start = new google.maps.LatLng('37.7683909618184', '-122.51089453697205');
        var end = new google.maps.LatLng('41.850033', '-87.6500523');
        var request = {
            origin:start,
            destination:end,
            optimizeWaypoints: true,
            travelMode:"DRIVING"
        };
        document.getElementById('searchMapBtn').addEventListener('click', function() {
            calculateAndDisplayRoute(request,directionsService, directionsDisplay);
        });
    }

    function calculateAndDisplayRoute(request,directionsService, directionsDisplay) {
       /* var waypts = [];
        var checkboxArray = document.getElementById('waypoints');
        for (var i = 0; i < checkboxArray.length; i++) {
            if (checkboxArray.options[i].selected) {
                waypts.push({
                    location: checkboxArray[i].value,
                    stopover: true
                });
            }
        }*/

        directionsService.route(request, function(response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
                var route = response.routes[0];
                var summaryPanel = document.getElementById('directions-panel');
                summaryPanel.innerHTML = '';
                // For each route, display summary information.
                for (var i = 0; i < route.legs.length; i++) {
                    var routeSegment = i + 1;
                    summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                        '</b><br>';
                    summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                    summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                    summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                }
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    }
</script>
<script async defer    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbqWY9UOtRQwVYOxv-VfTn93F-nGLwWW8&callback=initMap">
</script>
</body>
<script src="<s:url value="/utils/google/js/prettify_188_0_0.js"/>"></script>
<script src="<s:url value="/utils/google/js/jeoquery.js"/>"></script>
<script src="<s:url value="/utils/google/js/tracking.js"/>"></script>
<script src="<s:url value="/utils/google/js/map.js"/>"></script>
<script>
    $(function () {
        jeoquery.defaultData.userName = 'dimitridevelopper';

        $("#destinationId").jeoCityAutoComplete({
            callback: function(city) {
                if (console) console.log(city);
            }
        });

        $("#originId").jeoCityAutoComplete({
            callback: function(city) {
                if (console) console.log(city);
            }
        });
        prettyPrint();
    });

</script>
</html>