<?php

class EmployerWorkCategory extends EmployerWorkCategoryBase {
     
    
    
    static function getCategoriesByNumberOfRequests($lang=null,$options=array())
    {
        $list = new EmployerWorkCategoryCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('EmployerWorkCategory','EmployerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployerWorkCategory::getTable().
                       " INNER JOIN ".EmployerWorkCategoryI18n::getInnerForJoin('category_id').
                       " WHERE ".EmployerWorkCategoryI18n::getTableField('lang')."='{lang}' AND number_of_jobs > 0".                                               
                       " ORDER BY number_of_jobs DESC".
                       " LIMIT 0,10".
                       ";")
            ->makeSqlQuery();
        // echo $db->getQuery();
        if (!$db->getNumRows())
              return $list; 
         while ($items=$db->fetchObjects())
        {
              $item=$items->getEmployerWorkCategory();
              $item->setI18n($items->getEmployerWorkCategoryI18n());
             $list[$item->get('id')]=$item;
        }               
        return $list;
    }
}
