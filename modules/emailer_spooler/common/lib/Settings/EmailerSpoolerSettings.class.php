<?php

class EmailerSpoolerSettings extends mfSettingsBase {
    
     protected static $instance=null;    
     
     function __construct($data=null)
     {
         parent::__construct($data,null,'superadmin');
     } 
      
     function getDefaults()
     {   
         $this->add(array(
                             'number_of_emails'=>10
                          ));
        
     }        
     
    
}
