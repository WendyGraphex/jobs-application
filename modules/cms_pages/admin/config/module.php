<?php

// key=[action]
return array(
    
    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),      
    
    /* ======== MENUS ======================= */
 /*  "ajaxMenusDeleteNode"=>array("mode"=>"json"),    // OK
    
   "ajaxMenusMoveNode"=>array("mode"=>"json"),    
    
   "ajaxMenusDeletePicture"=>array("mode"=>"json"), 
    
   "ajaxMenusDeleteIcon"=>array("mode"=>"json"),  
    
   "ajaxMenusSavePicture"=>array("mode"=>"json"), 
    
   "ajaxMenusSaveIcon"=>array("mode"=>"json"), 
    
   "ajaxMenusNewNode"=>array("mode"=>"json"),  
    
   "ajaxMenusChangeIsActiveNode"=>array("mode"=>"json"),  
    
   "ajaxMenusSaveChangePage"=>array("mode"=>"json"),  */
    
    "ajaxChangeIsActiveMenu"=>array("mode"=>"json"),
    "ajaxMoveMenu"=>array("mode"=>"json"),
    "ajaxDeleteMenu"=>array("mode"=>"json","helpers"=>array('url'=>null)),
    
    /* ======== PAGES =================================== */    
    "ajaxChangeIsActivePageI18n"=>array("mode"=>"json"),
    "ajaxChangeSelectionIsActivePageI18n"=>array("mode"=>"json"),    
    "ajaxDeleteSelectionPage"=>array("mode"=>"json"),
    "ajaxDeletePage"=>array("mode"=>"json"),       
    "ajaxChangeIsActivePage"=>array("mode"=>"json"),       
    
);