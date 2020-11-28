<?php

return array(

     "menu"=>array(                   
                    "dashboard"=>array(                                          
                        "childs"=>array(                           
                               "7000_site_languages"=>null),                     
                    ),                       
     ), 
    
  "items"=>array(
                       
       
        
       "7000_site_languages"=>array(
                     "title"=>"Languages",   
                     "icon_awe"=>"fa-language",
                 //    "route"=>array("cms_pages"=>array()),
                     "route_ajax"=>array("languages_ajax"=>array("action"=>"ListLanguage")),  
                    // "picture"=>"/pictures/icons/cms.png",
                     "enabled"=>true,                                       
                 ),     
  ),
);
