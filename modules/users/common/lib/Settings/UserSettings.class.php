<?php

class UserSettings extends mfSettingsBase {
    
     protected static $instance=null;    
     
     function __construct($data=null)
     {
         parent::__construct($data,null,'frontend');
     } 
      
     function getDefaults()
     {   
         $this->add(array(
                              "has_manager2"=>'NO',                              
                          ));
        
     }        
     
     function hasManager2()
     {
         return (boolean)($this->get('has_manager2')=='YES');
     }
}
