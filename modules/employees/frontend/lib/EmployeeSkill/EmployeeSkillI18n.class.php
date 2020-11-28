<?php

class EmployeeSkillI18n extends EmployeeSkillI18nBase {
     
   
    function __construct($parameters = null) {
        if (is_array($parameters) || $parameters instanceof ArrayAccess)
        {
          if (isset($parameters['lang']) && isset($parameters['url']) && $parameters['url'] instanceof mfString)
                return $this->loadByLangAndUrl((string)$parameters['lang'],$parameters['url']); 
        }
        parent::__construct($parameters);
    }
    
     protected function loadByLangAndUrl($lang,mfString $url)
    {         
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>(string)$url->urldecode(),"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}';")
            ->makeSqlQuery();              
        return $this->rowtoObject($db);
    }
}
