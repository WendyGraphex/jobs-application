<?php

return array(
    
  "menu"=>array(                   
                  
                    "dashboard_home"=>array(                     
                       "childs"=>array("email_system"=>null),                                 
                      ),
  ),
    
  "items"=>array(   
          
      "email_system"=>array(
                    "title"=>"Emailer system",
                    "component"=>"/system_emailer/menuItem",
                 //   "url"=>"/system/emailer/admin/Emailer",
                    "route_ajax"=>array('system_emailer_ajax'=>array('action'=>'Emailer')),
                    "picture"=>"/module/system_emailer/pictures/logo.jpg",
                    "credentials"=>array(),
                    "enabled"=>true,                  
                    ), 

  )
);