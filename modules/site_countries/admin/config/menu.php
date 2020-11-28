<?php

return array(

  "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(                           
                               "8000_site_countries_admin"=>null),                     
                    ),                       
     ), 
    
  "items"=>array(
                             
        
       "8000_site_countries_admin"=>array(
                     "title"=>"Countries",   
                     "icon_awe"=>"fa-globe",              
                     "route_ajax"=>array("site_countries_ajax"=>array("action"=>"ListCountry")),  
                    // "picture"=>"/pictures/icons/cms.png",
                     "enabled"=>true,                                       
                 ),     
  ),
);
