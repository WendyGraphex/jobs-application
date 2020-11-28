<?php
 

class SiteGallerySettings extends mfSettingsBase {        
     
     protected static $instance=null;
     
     function __construct($data=null)
     {
        parent::__construct($data,null,'frontend');
     }
     
     function getDefaults()
     {   
         $this->add(array(
                 "component"=>"/gallery/default",                 
              ));        
     }
         
}
