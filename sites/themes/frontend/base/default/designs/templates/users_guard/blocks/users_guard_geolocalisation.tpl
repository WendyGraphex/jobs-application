<script type="text/javascript">
 
   
      if (navigator.geolocation)
      {    
        var watchId = navigator.geolocation.getCurrentPosition(
            function (position)
            {
                var params = { GeoLocation: { lat: position.coords.latitude, lng: position.coords.longitude, token: '{mfForm::getToken('GeoLocationForm')}' } };
                return $.ajax2({ data: params, 
                                    url:"{url_to('users_guard_ajax',['action'=>'GeoLocation'])}",                                              
                                    success: function() { 
                                                    navigator.geolocation.clearWatch(watchId); 
                                            }
                                     });           
            },
            function (error)
            {          
                var params = { GeoLocation: { error: error.code, token: '{mfForm::getToken('GeoLocationErrorForm')}' } };
                return $.ajax2({    data: params,
                                    url:"{url_to('users_guard_ajax',['action'=>'GeoLocationError'])}",                                              
                                    success: function() { 
                                                    navigator.geolocation.clearWatch(watchId); 
                                            }
                                     });                  
            }
        );
      }                
      else
        alert("Votre navigateur ne prend pas en compte la géolocalisation HTML5");
               
</script>