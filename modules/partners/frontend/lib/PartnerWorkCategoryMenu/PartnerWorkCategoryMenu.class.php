<?php

class PartnerWorkCategoryMenu extends PartnerWorkCategoryMenuBase {
     
    
    
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new PartnerWorkCategoryMenuCollection();
           if ($this->isNotLoaded())
               return $this->children;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('PartnerWorkCategoryMenu','PartnerWorkCategoryMenuI18n','PartnerWorkCategory','PartnerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryMenu::getTable().
                       " INNER JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id')." AND ".PartnerWorkCategoryMenuI18n::getTableField('lang')."='{lang}'".
                       " INNER JOIN ".PartnerWorkCategoryMenu::getOuterForJoin('category_id').
                       " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id')." AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".PartnerWorkCategoryMenu::getTableField('lb')." > {lb} AND ". 
                                 PartnerWorkCategoryMenu::getTableField('rb')." < {rb} AND ". 
                                 PartnerWorkCategoryMenu::getTableField('level')."='{levelplusone}' AND ".PartnerWorkCategoryMenu::getTableField('is_active')."='YES'".                          
                      // " ORDER BY ".PartnerWorkCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY ".PartnerWorkCategoryMenu::getTableField('rb')." ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $item = $items->getPartnerWorkCategoryMenu();
           $item->setI18n($items->hasPartnerWorkCategoryMenuI18n()?$items->getPartnerWorkCategoryMenuI18n():false);
           $item->set('category_id',$items->getPartnerWorkCategory());
           $item->getCategory()->setI18n($items->getPartnerWorkCategoryI18n());
           $this->children[$item->get('id')]=$item;
        }       
       }    
       return $this->children;    
    }
}
