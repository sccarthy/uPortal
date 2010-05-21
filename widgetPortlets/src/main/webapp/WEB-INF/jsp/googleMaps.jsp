<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ page contentType="text/html" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet" %>
<%@ taglib prefix="rs" uri="http://www.jasig.org/resource-server" %>
<c:set var="n"><portlet:namespace/></c:set>

<script src="http://www.google.com/jsapi?key=${key}" type="text/javascript"></script>
<script type="text/javascript">
    var ${n} = {};
    ${n}.setStartingLocation = function(geoc, map) {
        <c:choose>
        <c:when test="${startingLocation != null}">
            geoc.getLatLng("${startingLocation}", function(point) {
                if (!point) {
                    alert("${startingLocation}" + " not found");
                } else {
                    map.setCenter(point, ${startingZoom});
                }
            });
        </c:when>
        <c:otherwise>
            map.setCenter(new GLatLng(google.loader.ClientLocation.latitude, google.loader.ClientLocation.longitude), ${startingZoom});
        </c:otherwise>
        </c:choose>
    }
	${n}.initializeMap = function() {
        ${n}.geocoder = new google.maps.ClientGeocoder();
	    ${n}.map = new google.maps.Map2(document.getElementById("${n}map_canvas"));
	    ${n}.setStartingLocation(${n}.geocoder, ${n}.map);
	    ${n}.map.setUIToDefault();
        ${n}.trafficInfo = new google.maps.TrafficOverlay({incidents:true});
        ${n}.trafficEnabled = false;
	}
	${n}.toggleTraffic = function(input) {
	   ${n}.trafficEnabled = input.checked;
	   if (input.checked) {
           ${n}.map.addOverlay(${n}.trafficInfo);
	   } else {
           ${n}.map.removeOverlay(${n}.trafficInfo);
	   }
	}
	${n}.search = function(form) {
      if (${n}.geocoder) {
        ${n}.geocoder.getLatLng(
          form.location.value,
          function(point) {
            if (!point) {
              alert(form.location.value + " not found");
            } else {
              ${n}.map.setCenter(point, 13);
              var marker = new GMarker(point);
              ${n}.map.addOverlay(marker);
            }
          }
        );
      }
      return false;
	}
    google.load("maps", "2", {"callback" : ${n}.initializeMap});
</script>

<div id="${n}map_canvas" style="width: 100%; height: 300px"></div>

<p><input type="checkbox" value="traffic" onClick="${n}.toggleTraffic(this);"/> Show Traffic</p>
<form onsubmit="return ${n}.search(this);">
    <p>
        <label class="portlet-form-field-label" for="${n}location">Go to:</label>
        <input class="portlet-form-input-field" id="${n}location" name="location" size="35"/>
        <input class="portlet-form-button" type="submit" value="Go!"/>
    </p>
</form>

