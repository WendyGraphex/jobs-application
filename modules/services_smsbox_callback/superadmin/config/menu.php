<?php

return array(

    "menu"=>array(                   
        "dashboard_home"=>array(                                            
           // "childs"=>array('dashboard_smsbox'=>''),                    
        ),             
    ),
    
    "items"=>array(
        
        "dashboard_smsbox"=>array(                  
            "component"=>"/services_smsbox_callback/menuItem",
//            "childs"=>array('dashboard.smsbox.callback.admin'=>''),    
            "title"=>"SmsBox Callback Administration",
            "route_ajax"=>array('services_smsbox_callback_ajax'=>array('action'=>'ListCallback')),
            "picture"=>"/pictures/icons/smsbox.png",
            "enabled"=>true,                    
        ),   
        
//        "dashboard.smsbox.callback.admin"=>array(                  
//            //"childs"=>array('site.smsbox.callback.admin'=>''),    
//            "title"=>"SmsBox Callback Administration",
//            "route_ajax"=>array('services_smsbox_callback_ajax'=>array('action'=>'Settings')),
//            "picture"=>"/pictures/icons/smsbox.png",
//            "enabled"=>true,                    
//        ),   
    ),   
);