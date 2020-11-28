<?php

class CmsMenu extends cmsMenuBase {
    
    // protected $children_i18n=array(),$children_i18n_from_node=array();
    
   /*  function getChildrenI18n($lang,$options=array())
     {        
         if ($this->isNotLoaded())
             return array();
         // We get children (need father as root)
         if (!$this->children_i18n)
         {    
            $values=array(); 
            $where="";
            foreach ($options as $key=>$value)
                $values[]=$key."='".$value."'";
            if ($values)
                $where=" AND ".implode(" AND ",$values);               
            $db = mfSiteDatabase::getInstance();
            $db->setParameters(array('lang'=>$lang,'lb'=>$this->get('lb'),'rb'=>$this->get('rb')));
            $db->setObjects(array('CmsMenu','CmsMenuI18n','CmsPageI18n'));
            $db->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                      " LEFT JOIN ".CmsPageI18n::getTable()." ON ".CmsPageI18n::getTableField('page_id')."=".CmsMenu::getTableField('page_id').
                            " AND ".CmsPageI18n::getTableField('lang')."='{lang}'"." AND ".CmsPageI18n::getTableField('is_active')."='YES'".
                      " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id').
                            " AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".            
                         " WHERE lb=1 OR (lb>={lb} AND rb<={rb}".$where.")".  // Root + ...
                            " AND ".CmsPageI18n::getTableField('lang')." IS NOT NULL".   
                            " AND ".CmsPageI18n::getTableField('in_menu')."='YES'".                    
                            " AND (start_at<=NOW() OR start_at IS NULL)".   // date started ?
                            " AND (expired_at>=NOW() OR expired_at IS NULL)". // date expired ?
                      " GROUP BY ".CmsPageI18n::getTableField('id').
                      " ORDER BY lb ASC;");                
            $db->makeSiteSqlQuery($this->getSite());
            $tree=$db->fetchTreeObjects(get_class($this));                
            if ($tree)
                $this->children_i18n= $tree->_getChildren();  
         }
         return $this->children_i18n;
     } 
     
     function getChildrenI18nFromNode($lang,$options=array())
     {        
         if ($this->isNotLoaded())
             return array();
         // We get children (need father as root)
         if (!$this->children_i18n_from_node)
         {    
            $values=array(); 
            $where="";
            foreach ($options as $key=>$value)
                $values[]=$key."='".$value."'";
            if ($values)
                $where=" AND ".implode(" AND ",$values);               
            $db = mfSiteDatabase::getInstance();
            $db->setParameters(array('lang'=>$lang,'lb'=>$this->get('lb'),'rb'=>$this->get('rb')));
            $db->setObjects(array('CmsMenu','CmsMenuI18n','CmsPageI18n'));
            $db->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                      " LEFT JOIN ".CmsPageI18n::getTable()." ON ".CmsPageI18n::getTableField('page_id')."=".CmsMenu::getTableField('page_id').
                            " AND ".CmsPageI18n::getTableField('lang')."='{lang}'"." AND ".CmsPageI18n::getTableField('is_active')."='YES'".
                      " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id').
                            " AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".            
                         " WHERE (lb>={lb} AND rb<={rb}".$where.")".  // Root + ...
                            " AND ".CmsPageI18n::getTableField('lang')." IS NOT NULL".   
                            " AND ".CmsPageI18n::getTableField('in_menu')."='YES'".                    
                            " AND (start_at<=NOW() OR start_at IS NULL)".   // date started ?
                            " AND (expired_at>=NOW() OR expired_at IS NULL)". // date expired ?
                      " ORDER BY lb ASC;");                
            $db->makeSiteSqlQuery($this->getSite());
            $tree=$db->fetchTreeObjects(get_class($this));                   
            if ($tree)
                $this->children_i18n_from_node= $tree->_getChildren();  
         }
         return $this->children_i18n_from_node;
     } */
  
     
      function getChildren($order="ASC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CmsMenuCollection();
            if ($this->isNotLoaded())
               return $this->children;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CmsMenu','CmsMenuI18n','CmsPage','CmsPageI18n'))
            ->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                       " INNER JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".
                       " INNER JOIN ".CmsMenu::getOuterForJoin('page_id').
                       " INNER JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND ".CmsPageI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' AND ".CmsMenu::getTableField('is_active')."='YES'".                          
                      // " ORDER BY ".CmsMenuI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
             $item=$items->getCmsMenu();
             $item->setI18n($items->getCmsMenuI18n());
             $item->set('page_id',$items->getCmsPage());
             $item->getPage()->setI18n($items->getCmsPageI18n());
             $this->children[$item->get('id')]=$item;
        }       
       }    
       return $this->children;    
    }
}

