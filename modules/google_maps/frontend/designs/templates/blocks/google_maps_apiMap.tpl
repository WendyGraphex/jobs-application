 <style>
      #google-map-container {
        height: 100%;     
        padding: 0px
      }
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key={$settings->get('key')}&sensor=false"></script>
<script>
var map;
var geocoder;

function initialize() {
  geocoder = new google.maps.Geocoder(); 
  map = new google.maps.Map(document.getElementById('google-map-container'),{
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  });
  codeAddress();
}

function codeAddress() { 
  geocoder.geocode( { 'address': "{$address}" }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
       $("#google-map-error").show();
    }
  });
}


google.maps.event.addDomListener(window, 'load', initialize);

</script>
===={$address}====
<div id="google-map-error" style="display:none">{__('address has not been found.')}</div>
<div id="google-map-container" style="width:{$width};height:{$height};"></div>

