 <style>
      #google-map-container-{$key} {
        height: 100%;     
        padding: 0px
      }
</style>
<script>
    
    var map;
    var geocoder;
    
    function initialize(key,address)
    {
        geocoder = new google.maps.Geocoder(); 
        map = new google.maps.Map(document.getElementById('google-map-container-'+key),{
          zoom: 14,
          center: new google.maps.LatLng(-34.397, 150.644)
        });
        codeAddress(key,address);
    }

    if (typeof google == "undefined")
    {    
        window.mapapiloaded = function () {  initialize("{$key}","{$address}");  };
        $.ajax({  url: 'http://maps.google.com/maps/api/js?v=3.2&key={$settings->get('key')}&sensor=true&async=2&callback=mapapiloaded',  dataType: 'script'  });    
    }
    else
    {
        initialize("{$key}","{$address}");
    }
</script>
{* <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key={$settings->get('key')}&sensor=false&async=2"></script> *}
<script>
 
   
function codeAddress(key,address) { 
  geocoder.geocode( { 'address': address }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
       $("#google-map-error-"+key).show();
    }
  });
}

</script>
{__('address')}:{$address}
<div id="google-map-error-{$key}" style="display:none">{__('Address has not been found.')}</div>
<div id="google-map-container-{$key}" style="width:{$width}px;height:{$height}px;"></div>