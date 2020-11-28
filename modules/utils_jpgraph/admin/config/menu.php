<?php

return array(
 "menu"=>array(                   
                    "dashboard"=>array(                                            
                        // "childs"=>array('40_utils_jpgraph'=>'', ),                    
                    ),
    ),
    
      "items"=>array(   // SITE MENU STRUCTURE 
        
               "40_utils_jpgraph"=>array(
                     "title"=>"JpGraph",
                     "route_ajax"=>array('utils_jpgraph_ajax'=>array('action'=>'Graph')),
                     "icon_awe"=>"fa-exchange",
                     "enabled"=>true,
                     //"childs"=>array(),
                     //"childs"=>array("site_admin_site"=>'',"site_info"=>'',"site_company"=>'' ,"site_preferences"=>'', "site_logs"=>'', "site_cache"=>''),
                 ), 
          
     ),  
);