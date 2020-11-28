<?php

return array(
     "google_maps_view"=>array("pattern"=>'/google/maps/admin',"module"=>"google_maps","action"=>"View"),    
     "google_maps_ajax"=>array("pattern"=>'/module/site/google/maps/admin/{action}',"module"=>"google_maps","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
        
  );
