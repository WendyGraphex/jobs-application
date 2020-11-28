<?php


return array(

    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "6500_site_event_admin"=>null,
                               ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
                
            "6500_site_event_admin"=>array(
                     "title"=>"Events", 
                     "icon_awe"=>"fa-globe",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                   //  "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListEvent')),
                     "childs"=>array("00_site_event_events_admin"=>null,
                                     "10_site_event_accounts_admin"=>null,
                                     "20_site_event_places_admin"=>null,
                                     "30_site_event_speakers_admin"=>null,
                                     "40_site_event_commissions_admin"=>null,
                                     "80_site_event_sessions_admin"=>null,
                                ),
                     "enabled"=>true,                                  
                 ),  
      
        "00_site_event_events_admin"=>array(
                     "title"=>"Events", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListEvent')),                   
                     "enabled"=>true,                                  
                 ),
        
           "10_site_event_accounts_admin"=>array(
                     "title"=>"Accounts", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListUser')),                   
                     "enabled"=>true,                                  
                 ),
        
        "20_site_event_places_admin"=>array(
                     "title"=>"Places", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListPlace')),                   
                     "enabled"=>true,                                  
                 ),
        
        "30_site_event_speakers_admin"=>array(
                     "title"=>"Speakers", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListSpeakerUser')),                   
                     "enabled"=>true,                                  
                 ),
        
          "40_site_event_commissions_admin"=>array(
                     "title"=>"Commissions", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListSellerCommission')),                   
                     "enabled"=>true,                                  
                 ),
        
        "80_site_event_sessions_admin"=>array(
                     "title"=>"Connexions", 
                   //  "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListSession')),                   
                     "enabled"=>true,                                  
                 ),
  ),
);