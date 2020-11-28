<?php

return array(
   
     "items"=>array(
      
        "6000_site_admin"=>array(
                     "childs"=>array('70_site_social_networks_admin'=>''),              
         ),                                  
     
       "70_site_social_networks_admin"=>array(
                "title"=>"Social networks",
                "icon_awe" => "fa-user fa-2x",
               // "route"=>array("social_networks_list"=>array()),      
                "route_ajax"=>array("social_networks_ajax"=>array("action"=>"ListSocial")),    
               // "picture"=>"/pictures/icons/social-networks.png",
               // "help"=>"social networks manager",
              //  "credentials"=>array(array('superadmin','admin')),
                "enabled"=>true,               
            ),   

  ),
);