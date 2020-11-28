<?php

class CustomerCourseCategory extends CustomerCourseCategoryBase {
     
   
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerCourseCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerCourseCategory','CustomerCourseCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerCourseCategory::getTable().
                       " INNER JOIN ".CustomerCourseCategoryI18n::getInnerForJoin('category_id')." AND ".CustomerCourseCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
                                    " AND ".CustomerCourseCategory::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCustomerCourseCategory()->get('id')]=$items->getCustomerCourseCategory()->setI18n($items->hasCustomerCourseCategoryI18n()?$items->getCustomerCourseCategoryI18n():false);
        }       
       }    
       return $this->children;    
    }
}
