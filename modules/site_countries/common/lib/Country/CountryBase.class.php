<?php

class CountryBase extends  mfObject3  {

    protected static $fields=array('code');
    const table="t_country";
            
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
           else
               $this->loadByCode((string)$parameters);             
       } 
    }
    
    
    
    protected function loadByCode($code)
    {
        $this->set('code',$code);
         $db=mfSiteDatabase::getInstance()->setParameters(array($code));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE code='%s' LIMIT 1;")
            ->makeSqlQuery();  
         return $this->rowtoObject($db);
    }
    
    
     
}


