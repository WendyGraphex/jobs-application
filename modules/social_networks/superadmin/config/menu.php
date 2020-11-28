<?php

return array(
        "items"=>array(   
                "site_customers"=>array(
                       "childs"=>array("admin_social_networks"=>""),
                ),
// ACTIONS
                "admin_social_networks"=>array(
                    "title"=>"social networks",
                  //  "route"=>array("social_networks_list"=>array()), 
                  //  "routeAjax"=>array("social_networks_ajax"=>array("action"=>"List")),
                    "url"=>"/social-networks/admin",     
                    "urlAjax"=>"/module/social-networks/admin/ListSocial",     
                    "picture"=>"/pictures/icons/social-networks.png",
                    "help"=>"social networks manager",
                    "credentials"=>array(),
                    "enabled"=>true,
                    "icon_awe"=>"fa-share-alt-square",
                    "module"=>"social_networks",
                ),
               
      
               ),
  
               
);