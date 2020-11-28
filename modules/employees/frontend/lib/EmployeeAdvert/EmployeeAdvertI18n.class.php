<?php

class EmployeeAdvertI18n extends EmployeeAdvertI18nBase {
     
    function __construct($parameters = null,$user=null) {
        if ($user instanceof Employee)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof Employee)      
            return $this->loadByIdAndEmployee($parameters,$user);   
        if (isset($parameters['lang']) && isset($parameters['url'])  && isset($parameters['id']))             
              return $this->loadByLangAndUrlAndId((string)$parameters['lang'],new mfString($parameters['url']),$parameters['id']);          
           if (is_array($parameters) && isset($parameters['lang']) && isset($parameters['url']))                   
              return $this->loadByLangAndUrl((string)$parameters['lang'],$parameters['url']); 
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployee($id,Employee $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                      " INNER JOIN ".self::getOuterForJoin('advert_id').
                      " WHERE  ".EmployeeAdvert::getTableField('employee_user_id')."='{employee_user_id}' AND  ".self::getTableField('id')."='{id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
   /*  protected function loadByLangAndUrl($lang,mfString $url)
    {            
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url->urldecode(),"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}' AND published_at IS NOT NULL;")
            ->makeSqlQuery();   
       //echo $db->getQuery();
        return $this->rowtoObject($db);
    }*/
    
       protected function loadByLangAndUrlAndId($lang,mfString $url,$id)
    {            
          
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url->urldecode(),"lang"=>$lang,'id'=>$id))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}' AND id='{id}' AND published_at IS NOT NULL;")
            ->makeSqlQuery();   
       //echo $db->getQuery();
        return $this->rowtoObject($db);
    }
       
      protected function loadByLangAndUrl($lang,$url)
    {                           
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}';")
            ->makeSqlQuery();        
        return $this->rowtoObject($db);
    } 
    
    function getUrl()
    {
        return url_i18n_to("employees_advert",array('url'=>$this->get('url'),'id'=>$this->get('id'),'lang'=>$this->get('lang')),"",'frontend');
    }
       
}
