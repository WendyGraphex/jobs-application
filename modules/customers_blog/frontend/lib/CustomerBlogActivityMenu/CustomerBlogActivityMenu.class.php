<?php

class CustomerBlogActivityMenu extends CustomerBlogActivityMenuBase {
     
    
    
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerBlogActivityMenuCollection();
           if ($this->isNotLoaded())
               return $this->children;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerBlogActivityMenu','CustomerBlogActivityMenuI18n','CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivityMenu::getTable().
                       " INNER JOIN ".CustomerBlogActivityMenuI18n::getInnerForJoin('menu_id')." AND ".CustomerBlogActivityMenuI18n::getTableField('lang')."='{lang}'".
                       " INNER JOIN ".CustomerBlogActivityMenu::getOuterForJoin('activity_id').
                       " INNER JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".
                       " WHERE ".CustomerBlogActivityMenu::getTableField('lb')." > {lb} AND ". 
                                 CustomerBlogActivityMenu::getTableField('rb')." < {rb} AND ". 
                                 CustomerBlogActivityMenu::getTableField('level')."='{levelplusone}' AND ".CustomerBlogActivityMenu::getTableField('is_active')."='YES'".                          
                      // " ORDER BY ".CustomerBlogActivityI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY ".CustomerBlogActivityMenu::getTableField('rb')." ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $item = $items->getCustomerBlogActivityMenu();
           $item->setI18n($items->hasCustomerBlogActivityMenuI18n()?$items->getCustomerBlogActivityMenuI18n():false);
           $item->set('activity_id',$items->getCustomerBlogActivity());
           $item->getActivity()->setI18n($items->getCustomerBlogActivityI18n());
           $this->children[$item->get('id')]=$item;
        }       
       }    
       return $this->children;    
    }
}
