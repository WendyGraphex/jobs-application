<?php

return array(
         
        "items"=>array(
                                           
            "6000_site_admin"=>array(
                     
                     "childs"=>array(
                                 "60_cms_admin_pages"=>null,   
                     ),
                                       
                 ),  

        
       "60_cms_admin_pages"=>array(
                     "title"=>"CMS pages",   
                     "icon_awe"=>"fa-table",
                 //    "route"=>array("cms_pages"=>array()),
                     "route_ajax"=>array("cms_pages_ajax"=>array("action"=>"ListPage")),  
                    // "picture"=>"/pictures/icons/cms.png",
                     "enabled"=>true,                                       
                 ),     
  ),
);