<?php

return array(
          
    "items"=>array(
                                                   
            "6000_site_admin"=>array(
                    'childs'=>array(
                        "40_site_guestbook_admin"=>null,
                    )                          
                 ),  
        
          "40_site_guestbook_admin"=>array(
                     "title"=>"Guest book",                   
                     "route_ajax"=>array("site_guestbook_ajax"=>array("action"=>"List")),                                           
                     "enabled"=>true,                   
                 ), 
  ),
);