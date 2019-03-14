<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../../common/home/include/commons.jsp"/>
</head>
<body onload="initMap();">
<div id="map"></div>
<div id="right-panel">
    <div>
        <s:form  id="mapForm" cssClass="form-horizontal" method="POST" action="mapsearchAction">
            <div class="form-group">
                <s:label value="%{getText('map.label.origin')}" id="idoriginLabel" for="idoriginLabel"  labelposition="left">
                </s:label>
                <s:property value="mapLatLonCoordinates.origin.format"></s:property>
            </div>
            <div class="form-group">
                <s:label value="%{getText('map.label.lat')}" id="idoriginLat" for="idoriginLat"  labelposition="left">
                </s:label>
                <s:textfield   name="mapLatLonCoordinates.latOrigin" id="originIdLat"  value="%{mapLatLonCoordinates.latOrigin}" readonly="true" cssClass="form-control"/>
                <span class = "input-group-addon"></span>
                <s:label value="%{getText('map.label.lng')}" id="idoriginLng" for="idoriginLng"  labelposition="left"></s:label>
                <s:textfield   name="mapLatLonCoordinates.lonOrigin" id="originIdLng"  value="%{mapLatLonCoordinates.lonOrigin}" readonly="true" cssClass="form-control"/>
                <span class = "input-group-addon"></span>
            </div>
            <div class="form-group">
                <s:label value="%{getText('map.label.destination')}" id="iddestinationLabel" for="iddestinationLabel"  labelposition="left"></s:label>
                <s:property value="mapLatLonCoordinates.destination.format"></s:property>
            </div>
            <div class="form-group">
                <s:label value="%{getText('map.label.lat')}" id="iddestinationLat" for="iddestinationLat"  labelposition="left"></s:label>
                <s:textfield  name="mapLatLonCoordinates.latDestination"  id="destinationIdLat" value="%{mapLatLonCoordinates.latDestination}" readonly="true" cssClass="form-control"/>
                <span class = "input-group-addon"></span>
                <s:label value="%{getText('map.label.lng')}" id="iddestinationLng" for="iddestinationLng"  labelposition="left"></s:label>
                <s:textfield   name="mapLatLonCoordinates.lonDestination"  id="destinationIdLng" value="%{mapLatLonCoordinates.lonDestination}" readonly="true" cssClass="form-control"/>
                <s:hidden id="destinationId2" value="%{mapLatLonCoordinates.lonDestination}" name="mapLatLonCoordinates.lonDestination"/>
                <span class = "input-group-addon"></span>
            </div>
            <%--<div class="btn btn-group-md">
                <s:submit  type="button"   id="searchMapBtn" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-search" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.search"></s:text></i></s:submit>
            </div>--%>
</s:form>
    </div>
    <div id="directions-panel"></div>
   <%-- <div class="btn btn-group-md">
        <button type="button" class="btn  btn-primary btn-sm">
            <a href="<s:url action="gmapAction"/>"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;<s:text name="map.back.to.search"/></a>
        </button>
    </div>--%>
</div>
<script>
    function initMap() {

        var latOrigin=$('#originIdLat').val();
        var lonOrigin=$('#originIdLng').val();
        var latDestination=$('#destinationIdLat').val();
        var lonDestination=$('#destinationIdLng').val();

        console.log("latOrigine:" +latOrigin);
        console.log("lonOrigine:"+lonOrigin);
        console.log("latDestination:"+latDestination);
        console.log("lonDestination:"+lonDestination);
        var start = new google.maps.LatLng(latOrigin, lonOrigin);
        var end = new google.maps.LatLng(latDestination, lonDestination);

       /*var start = new google.maps.LatLng('37.7683909618184', '-122.51089453697205');
        var end = new google.maps.LatLng('41.850033', '-87.6500523');*/
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var myOptions = {
            zoom: 4,
            center: {lat: 44.77, lng: 10.27},
            mapTypeId: google.maps.MapTypeId.ROADMAP,
        }
        var map = new google.maps.Map(document.getElementById('map'), myOptions);
        directionsDisplay.setMap(map);
        var transitOptions=
        {
            departureTime: new Date(1337675679473),
            modes: ['BUS'],
            routingPreference: 'FEWER_TRANSFERS'

        }
        var request = {
            origin:start,
            destination:end,
            optimizeWaypoints: true,
            travelMode:"DRIVING",
            transitOptions: transitOptions
        };
        calculateAndDisplayRoute(request,directionsService, directionsDisplay);
       /* document.getElementById('searchMapBtn').addEventListener('click', function() {
        });*/
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
                console.log(JSON.stringify(route));
                var summaryPanel = document.getElementById('directions-panel');
                summaryPanel.innerHTML = '';
                // For each route, display summary information.
                for (var i = 0; i < route.legs.length; i++) {
                    var routeSegment = i + 1;
                    summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                        '</b><br>';
                    summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                    summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                    summaryPanel.innerHTML += route.legs[i].distance.text + ' in ';
                    summaryPanel.innerHTML += route.legs[i].duration.text + '<br><br>';
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
<%--<script src="<s:url value="/utils/google/js/prettify_188_0_0.js"/>"></script>
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
<script>
    MapManager.drawRoute()
</script>--%>
</html>