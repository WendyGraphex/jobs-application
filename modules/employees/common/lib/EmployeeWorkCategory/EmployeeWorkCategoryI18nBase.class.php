<?php

class EmployeeWorkCategoryI18nBase extends PartnerWorkCategoryI18nBase {
     
    
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
       $this->set('url',(string)$url->urldecode());
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>(string)$url->urldecode(),"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}';")
            ->makeSqlQuery();                
        return $this->rowtoObject($db);
    }
    
    
     function getChildren($order="DESC")
    {
        if ($this->children===null)
       {            
           $this->children=new EmployeeWorkCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$this->get('lang'),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('EmployeeWorkCategory','EmployeeWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployeeWorkCategory::getTable().
                       " INNER JOIN ".EmployeeWorkCategoryI18n::getInnerForJoin('category_id').
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}'  AND ".EmployeeWorkCategoryI18n::getTableField('lang')."='{lang}'".                          
                      // " ORDER BY ".PartnerWorkCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //   echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getEmployeeWorkCategory()->get('id')]=$items->getEmployeeWorkCategory()->setI18n($items->getEmployeeWorkCategoryI18n());
        }       
       }    
       return $this->children;    
    } 
    
    
     
     function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new EmployeeWorkCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getCategory()->get('lb'),'rb'=>$this->getCategory()->get('rb'),'lang'=>$this->get('lang')))
            ->setObjects(array('EmployeeWorkCategoryI18n','EmployeeWorkCategory'))
            ->setQuery("SELECT {fields} FROM ".EmployeeWorkCategoryI18n::getTable(). 
                       " INNER JOIN ".EmployeeWorkCategoryI18n::getOuterForJoin('category_id').
                       " WHERE lb < {lb} AND rb > {rb} AND level!=0 AND lang='{lang}'".                          
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getEmployeeWorkCategoryI18n()->get('id')]=$items->getEmployeeWorkCategoryI18n()->set('category_id',$items->getEmployeeWorkCategoryI18n());
        }       
       }
       return $this->fathers;      
    } 
    
     function getUrl()
    {
        return link_i18n('employees_category',array('url'=>$this->getUrlString()),null,'frontend');
    }
    
    
    function getCategory()    
    {                
       return $this->_category_id=$this->_category_id===null?new  EmployeeWorkCategory($this->get('category_id')):$this->_category_id;                 
    } 
}
