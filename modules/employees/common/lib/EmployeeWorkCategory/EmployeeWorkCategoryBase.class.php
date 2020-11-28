<?php

class EmployeeWorkCategoryBase extends PartnerWorkCategoryBase {
     
    
     function getChildren($order="DESC",$lang=null)
    {    
        if ($this->children===null)
       {            
           $this->children=new EmployeeWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('EmployeeWorkCategory','EmployeeWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployeeWorkCategory::getTable().
                       " INNER JOIN ".EmployeeWorkCategoryI18n::getInnerForJoin('category_id')." AND ".EmployeeWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
                                    " AND ".EmployeeWorkCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getEmployeeWorkCategory()->get('id')]=$items->getEmployeeWorkCategory()->setI18n($items->hasEmployeeWorkCategoryI18n()?$items->getEmployeeWorkCategoryI18n():false);
        }       
       }    
       return $this->children;    
    }
    
     function getSiblings($order="DESC",$lang=null)
    {          
        if ($this->siblings===null)
       {            
           $this->siblings=new EmployeeWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getFather()->get('lb'),'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->getFather()->get('rb'),'level'=>$this->get('level')))
            ->setObjects(array('EmployeeWorkCategory','EmployeeWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployeeWorkCategory::getTable().
                       " INNER JOIN ".EmployeeWorkCategoryI18n::getInnerForJoin('category_id')." AND ".EmployeeWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{level}' ".                          
                                    " AND ".EmployeeWorkCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->siblings; 
         while ($items=$db->fetchObjects())
        {
           $this->siblings[$items->getEmployeeWorkCategory()->get('id')]=$items->getEmployeeWorkCategory()->setI18n($items->hasEmployeeWorkCategoryI18n()?$items->getEmployeeWorkCategoryI18n():false);
        }       
       }    
       return $this->siblings;    
    }
      
}
