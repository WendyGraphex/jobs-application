<?php

class SiteSettings extends mfSettingsBase {
    
     protected static $instance=null;    
     
     function __construct($data=null)
     {
         parent::__construct($data,null,'superadmin');        
     } 
          
       function getClass()
    {
        return "SiteSettings";
    }
    
     function getDefaults()
     {   
         $this->add(array(
                             // "root_db_name"=>'ewebsolutb',      
                             'default_countries'=>array('MA','FR'),
                             'default_currency'=>'USD'
                          ));
        
     }        
     
     
     function getCurrency()
     {
         return $this->_default_currency=$this->_default_currency===null?new SiteCurrency($this->get('default_currency','USD')):$this->_default_currency;
     }
     
      
}
