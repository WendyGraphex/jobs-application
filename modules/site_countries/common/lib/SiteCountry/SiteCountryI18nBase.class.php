<?php

class SiteCountryI18nBase extends  mfObject3  {

    protected static $fields=array('code','lang','title');
    const table="t_site_country_i18n";
            
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
            if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);         
            $this->add($parameters); 
       }  
       else
       {
           if (is_numeric((string)$parameters)) 
                $this->loadById((string)$parameters);             
          /* else
               $this->loadByCode((string)$parameters);    */         
       } 
    }
    
    
    
    
    
    
   
    
    
}


