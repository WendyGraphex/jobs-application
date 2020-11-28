<?php


return array(
    
    "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(            
                                "7000_site_media_admin"=>null,
                              ),                     
                    ),                       
     ),
    
    
   "items"=>array(      
               "7000_site_media_admin"=>array(
                     "title"=>"Medias", 
                     "icon_awe"=>"fa-cubes",
                   // "credentials"=>array(array('superadmin','admin','settings_user')),
                 //    "route_ajax"=>array('site_ajax'=>array('action'=>'System')),
                     "childs"=>array(
                            "00_medias_admin_gallery"=>null,
                            "10_medias_admin_pictures"=>null,
                     ),
                     "enabled"=>true,  
               ),             
               
                  
                "10_medias_admin_pictures"=>array(
                     "title"=>"Pictures",                   
                     "route_ajax"=>array("site_gallery_ajax"=>array("action"=>"ListPicture")),                                           
                     "enabled"=>true,                   
                 ),   
       
                 "00_medias_admin_gallery"=>array(
                    "title"=>"Galleries",                  
                    "route_ajax"=>array("site_gallery_ajax"=>array("action"=>"ListGallery")),                    
                    "enabled"=>true,                  
                 ),                          
        
   ),      
);