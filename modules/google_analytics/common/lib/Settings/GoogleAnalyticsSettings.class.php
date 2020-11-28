<?php
 

class GoogleAnalyticsSettings extends SiteSettings {      
       
      
      
     function getDefaults()
     {   
         parent::getDefaults();
         $this->add(array(
                "key"=>"",                
              ));        
     }
         
         
         
}
