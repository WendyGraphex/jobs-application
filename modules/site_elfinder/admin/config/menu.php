<?php



return array(
    
    
     "items"=>array(
                                   
        
            "6000_site_admin"=>array(
                     
                     "childs"=>array(
                                 "50_site_file_manager"=>null,                               
                     ),                                    
                 ),  

         "50_site_file_manager"=>array(
                     "title"=>"File manager",
                     "icon_awe"=>"fa-file-o",
                  //   "route"=>array("elfinder_file_manager"=>array()),  
                     "route_ajax"=>array("site_elfinder_ajax_file_manager"=>array("action"=>"View")),  
                   //  "picture"=>"/pictures/icons/filemanager.png",
                  //   "help"=>"file manager",
                     "credentials"=>array(),
                     "enabled"=>true,                  
                 ),
         
        
  ),
    
    
   
         
                  

);