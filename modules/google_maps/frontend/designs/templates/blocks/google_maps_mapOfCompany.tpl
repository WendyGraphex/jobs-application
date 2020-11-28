 <style>
      #google-map-container {
        height: 100%;
        {* margin: 0px; *}
        padding: 0px;
      }
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key={$settings->get('key')}&sensor=false"></script>
<script>
    
var myLatlng;

function initialize() {
    myLatlng = new google.maps.LatLng({$company->getCoordinates()});   
    var map = new google.maps.Map(document.getElementById("google-map-container"), {
        zoom: {$zoom},
        center: myLatlng
      });
   
    var marker = new google.maps.Marker({
          map: map,
          position: myLatlng,
          title:"{$company->get('commercial')}\n{$company->get('address1')}{$company->get('address2')}\n{$company->get('postcode')} {$company->get('city')}"
      });    
} 

google.maps.event.addDomListener(window, 'load', initialize); 

</script>
<div id="google-map-error" style="display:none">{__('address has not been found.')}</div>
<div id="google-map-container" style="width:{$width};height:{$height};"></div>

