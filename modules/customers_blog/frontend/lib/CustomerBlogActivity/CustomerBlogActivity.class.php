<?php

class CustomerBlogActivity extends CustomerBlogActivityBase {
      
    
    /* function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerBlogActivityCollection();
            if ($this->isNotLoaded())
               return $this->children;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivity::getTable().
                       " LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' AND ".CustomerBlogActivity::getTableField('is_active')."='YES'".                          
                      // " ORDER BY ".CustomerBlogActivityI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCustomerBlogActivity()->get('id')]=$items->getCustomerBlogActivity()->setI18n($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n():false);
        }       
       }    
       return $this->children;    
    }*/
    
     function getChildren($order="DESC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerBlogActivityCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivity::getTable().
                       " INNER JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
                                    " AND ".CustomerBlogActivity::getTableField('is_active')."='YES'".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
         //echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCustomerBlogActivity()->get('id')]=$items->getCustomerBlogActivity()->setI18n($items->getCustomerBlogActivityI18n());
        }       
       }    
       return $this->children;    
    }
}
