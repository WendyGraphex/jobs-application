<?php

class CmsPageI18n extends CmsPageI18nBase {
 
    
    function __construct($parameters = null,$option=null) {
        if ($parameters instanceof mfDirname && is_string($option))
          return $this->loadByDirnameAndLang($parameters,$option);
    }
    
    protected function loadByDirnameAndLang(mfDirname $url,$lang)
    {        
        $this->set('url',$url->urldecode());
        $this->set('lang',$lang);
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('url'=>$url,"lang"=>$lang))
           ->setQuery("SELECT * FROM ".self::getTable()." WHERE url='{url}' AND lang='{lang}';")
           ->makeSqlQuery(); ;    
        return $this->rowtoObject($db);
    }  
    
    
 /*   function getBreadCrumb()
    {     
       $db = mfSiteDatabase::getInstance();                        
       $db->setParameters(array("page_id"=>$this->get('page_id')))
           ->setQuery("SELECT * FROM ".cmsMenu::getTable()." WHERE page_id={page_id};")
           ->makeSqlQuery();
        if (!$db->getNumRows())
            return array();
        $node=$db->fetchObject('cmsMenu');
        $db->setParameters(array("lb"=>$node->get('lb'),
                                 "rb"=>$node->get('rb'),
                                 "lang"=>$this->get('lang')
                          )) 
           ->setObjects(array('CmsMenuI18n','CmsPageI18n'))
           ->setQuery("SELECT {fields} FROM ".cmsMenu::getTable().  
                      " LEFT JOIN ".cmsMenu::getOuterForJoin('page_id').                    
                      " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND ".CmsPageI18n::getTableField('lang')."='{lang}'". //"t_cms_i18n_pages.lang='{lang}'".
                      " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'". //t_cms_i18n_menus.lang='{lang}'".
                      " WHERE ".cmsMenu::getTableField('lb')."<={lb}".
                            " AND ".cmsMenu::getTableField('rb').">={rb}".
                            " AND ".cmsMenu::getTableField('level')." !=0".
                            " AND url !='#'".
                       " ORDER BY ".cmsMenu::getTableField('lb')." ASC;")         
           ->makeSqlQuery();
        $list=array();
        while ($node =$db->fetchObjects())
           $list[]=$node;     
        return $list;
    }     
    
    function getI18nPages()
    {       
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($this->get('page_id')))
                ->setQuery("SELECT ".CmsPageI18n::getFieldsAndKeyWithTable(). 
                           " FROM ".CmsPageI18n::getTable().
                           " LEFT JOIN ".CmsPageI18n::getOuterForJoin('page_id').
                           " LEFT JOIN ".language::getTable()." ON ".language::getTableField('code')."=".CmsPageI18n::getTableField('lang').
                           " WHERE page_id=%d".
                                " AND ".CmsPageI18n::getTableField('is_active')."='YES'".
                                " AND ".language::getTableField('is_active')."='YES'".
                                " AND ".language::getTableField('application')."='frontend'".                                
                           ";") 
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $i18npages=array();
        while ($i18npage=$db->fetchObject('CmsPageI18n'))
            $i18npages[$i18npage->get('lang')]=$i18npage;     
        return $i18npages;
    }*/
    
     function getURL()
    {
         return $this->_url=$this->_url===null?new CmsPageI18nUrl($this->get('url'),$this->get('lang')):$this->_url;
    }
    
    
}
