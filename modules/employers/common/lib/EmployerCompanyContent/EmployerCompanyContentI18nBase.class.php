<?php 
    
class EmployerCompanyContentI18nBase extends mfObject3 {
     
    protected static $fields=array('lang','meta_robots','meta_keywords','meta_description','meta_title','description','content_id','created_at','updated_at');
    const table="t_employer_company_content_i18n"; 
    protected static $foreignKeys=array('content_id'=>'EmployerCompanyContent'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);           
          if (isset($parameters['company']) && isset($parameters['lang']) && $parameters['company'] instanceof EmployerCompany)
             return $this->loadbyCompanyAndLang($parameters['company'],(string)$parameters['lang']);   
           if (isset($parameters['content']) && isset($parameters['lang']) && $parameters['content'] instanceof EmployerCompanyContent)
             return $this->loadbyContentAndLang($parameters['content'],(string)$parameters['lang']);   
          return $this->add($parameters); 
      }   
      else
      {
       //  if ($parameters instanceof EmployerCompany)
        //      return $this->loadbyCompany($parameters);               
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);              
      }   
    }
    
     protected function loadByContentAndLang(EmployerCompanyContent $content,$lang)
    {            
         if ($content->isNotLoaded())
             return ;                     
         $this->set('content_id',$content);
         $this->set('lang',$lang);
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('content_id'=>$content->get('id'),'lang'=>$lang))              
                 ->setQuery("SELECT * FROM ".self::getTable().                  
                       " WHERE lang='{lang}' AND content_id='{content_id}';")
            ->makeSqlQuery();            
        return $this->rowtoObject($db)    ;
    }  
    
     protected function loadByCompanyAndLang(EmployerCompany $company,$lang)
    {            
         if ($company->isNotLoaded())
             return ;                     
         $this->set('lang',$lang);
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('company_id'=>$company->get('id'),'lang'=>$lang))
                 ->setObjects(array('EmployerCompanyContent','EmployerCompanyContentI18n'))
                 ->setQuery("SELECT {fields} FROM ".EmployerCompanyContent::getTable().
                       " LEFT JOIN ".EmployerCompanyContentI18n::getInnerForJoin('content_id')." AND lang='{lang}'".
                       " WHERE company_id='{company_id}';")
            ->makeSqlQuery();            
       if (!$db->getNumRows())
       {          
           $this->add(array('meta_title'=>$company->get('name')));           
           $this->getContent()->set('company_id',$company);           
           return ;
       }
       $items=$db->fetchObjects();               
       if ($items->hasEmployerCompanyContentI18n())
           $this->toObject($items->getEmployerCompanyContentI18n());   
       else
           $this->set('meta_title',$company->get('name'));         
       $this->set('content_id',$items->getEmployerCompanyContent());                    
       $this->getContent()->set('company_id',$company);   
    }  
    
  /*  protected function loadByName($name)
    {    
         $this->set('name',$name);         
         $db=mfSiteDatabase::getInstance()->setParameters(array('name'=>$name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='{name}';")
            ->makeSiteSqlQuery($this->site);                           
         return $this->rowtoObject($db);   
    }    */
    
     
    
    protected function getDefaults()
    {
      $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
      $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");    
    }
     
     
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));   
    }            
    
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSiteSqlQuery($this->site);      
    }*/
    
       
  /*  function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployerCompanyFormatter($this):$this->formatter;
    }*/        
    
    function getContent()
    {
        return $this->_content_id=$this->_content_id===null?new EmployerCompanyContent($this->get('content_id')):$this->_content_id;
    }
      
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployerCompanyContentI18nFormatter($this):$this->formatter;
    } 
    
    function getUrl()
    {
        return url_i18n_to("employers_company",array('url'=>$this->get('url')),$this->get('lang'),'frontend');     
    }
    
    
}
