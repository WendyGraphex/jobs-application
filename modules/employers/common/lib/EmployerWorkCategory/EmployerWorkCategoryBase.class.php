<?php

class EmployerWorkCategoryBase extends PartnerWorkCategoryBase {
     
    
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new EmployerWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('EmployerWorkCategory','EmployerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployerWorkCategory::getTable().
                       " INNER JOIN ".EmployerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".EmployerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
                                " AND ".EmployerWorkCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getEmployerWorkCategory()->get('id')]=$items->getEmployerWorkCategory()->setI18n($items->hasEmployerWorkCategoryI18n()?$items->getEmployerWorkCategoryI18n():false);
        }       
       }    
       return $this->children;    
    }
    function getLanguage()
    {
      return $this->language;
    } 
    
    function getSiblings($order="DESC",$lang=null)
    {          
        if ($this->siblings===null)
       {            
           $this->siblings=new EmployerWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getFather()->get('lb'),'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->getFather()->get('rb'),'level'=>$this->get('level')))
            ->setObjects(array('EmployerWorkCategory','EmployerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployerWorkCategory::getTable().
                       " INNER JOIN ".EmployerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".EmployerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{level}' ".                          
                                    " AND ".EmployerWorkCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->siblings; 
         while ($items=$db->fetchObjects())
        {
           $this->siblings[$items->getEmployerWorkCategory()->get('id')]=$items->getEmployerWorkCategory()->setI18n($items->hasEmployerWorkCategoryI18n()?$items->getEmployerWorkCategoryI18n():false);
        }       
       }    
       return $this->siblings;    
    }
}
