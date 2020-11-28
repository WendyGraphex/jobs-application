<?php

class SiteCountryLanguageBase extends mfObject3 {
     
    protected static $fields=array('language_id','country_id','position','created_at','updated_at');
    const table="t_site_country_language"; 
     protected static $foreignKeys=array('language_id'=>'Language',
                                        'country_id'=>'SiteCountry'
                                        ); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         
      }   
    }
    
     protected function getDefaults()
    {
          parent::getDefaults();
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
              'position'=>0
        ));   
    }
     
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    } 
    
    
   
      
      function getLanguage()
    {
       return $this->_language_id=$this->_language_id===null?new Language($this->get('language_id'),'frontend'):$this->_language_id;
    }  
     
      function getCountry()
    {
       return $this->_country_id=$this->_country_id===null?new SiteCountry($this->get('country_id')):$this->_country_id;
    }  
    
  
}

