<?php

class PartnerWorkCategory extends PartnerWorkCategoryBase {
      
    
    /* function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new PartnerWorkCategoryCollection();
            if ($this->isNotLoaded())
               return $this->children;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('PartnerWorkCategory','PartnerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategory::getTable().
                       " LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' AND ".PartnerWorkCategory::getTableField('is_active')."='YES'".                          
                      // " ORDER BY ".PartnerWorkCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getPartnerWorkCategory()->get('id')]=$items->getPartnerWorkCategory()->setI18n($items->hasPartnerWorkCategoryI18n()?$items->getPartnerWorkCategoryI18n():false);
        }       
       }    
       return $this->children;    
    }*/
    
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new PartnerWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('PartnerWorkCategory','PartnerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategory::getTable().
                       " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
                                    " AND ".PartnerWorkCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getPartnerWorkCategory()->get('id')]=$items->getPartnerWorkCategory()->setI18n($items->hasPartnerWorkCategoryI18n()?$items->getPartnerWorkCategoryI18n():false);
        }       
       }    
       return $this->children;    
    }
}
