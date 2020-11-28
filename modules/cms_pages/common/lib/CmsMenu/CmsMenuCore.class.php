<?php


class CmsMenuCore extends TreeNode {
    
    const table="t_site_cms_menu";
    protected static $fields=array('page_id','is_active','icon','picture','target','is_link','awe','created_at','updated_at');     
    protected static $foreignKeys=array('page_id'=>'CmsPage'); 
    protected static $fieldsNull=array('page_id');  
           
    
   /* protected function loadByPageI18n($page)
    {
       $db=mfSiteDatabase::getInstance()
         ->setParameters(array($page->get('page_id')))
         ->setQuery("SELECT * FROM ".self::getTable()." WHERE page_id=%d;")
         ->makeSqlQuery(); ;  
       return $this->rowtoObject($db); 
    }*/
    
    
    
    static function getFields()
    {
        return array_merge(self::$fields,parent::$fields);
    }
    
    
    static function root()
    {        
         return  new CmsMenu('root');         
    }      
    
    function getRoot()
    {                     
      if ($this->lb==1 && $this->level==0 && $this->name=='root')
          return $this;
      if ($this->_root)
          return $this->_root;     
      $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".static::getTable()." WHERE lb=1 AND level=0;")
            ->makeSqlQuery();
      if (!$db->getNumRows())
            return false; 
      $this->_root=$db->fetchObject(get_class($this))->loaded();
      return $this->_root;
    }
    
    protected function _getRoot()
    {           
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".static::getTable()." WHERE lb=1 AND level=0;")
            ->makeSqlQuery();
       if ($db->getNumRows())
       {    
          $this->_root=$db->fetchObject(get_class($this))->loaded();               
       }  
       else
       {             
          $this->_root=$this->createRoot();    // Root doesn't exist
       }           
       return $this->_root;
    }
   
    protected function loadByName($name)
    {                 
        if ($name=='root')
        {
            if (($root=$this->_getRoot()))
                $this->toObject($root);
        }   
        else        
        {
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array('name'=>$name))
                ->setQuery("SELECT * FROM ".static::getTable()."  WHERE name='{name}' LIMIT 0,1;")
                ->makeSqlQuery();  
            $this->rowtoObject($db);
            return $this; 
        }    
        return $this;         
    }        
    
     protected function getRootDefaults()
    {
        $this->add(array(
            'lb'=>1,
            'rb'=>2,
            'level'=>0,     
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'is_active'=>'YES',          
            'is_link'=>"NO", 
        ));       
    }  
  
     function isExist()
    {
       $db=mfSiteDatabase::getInstance();
       $this->executeIsExistQuery($db);
       return $db->getNumRows();
    }
    
    
     function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new CmsMenuCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'rb'=>$this->rb,'lang'=>$this->hasI18n()?$this->getI18n()->get('lang'):mfcontext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array('CmsMenu','CmsMenuI18n'))
            ->setQuery("SELECT {fields} FROM ".static::getTable().   
                       " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND lang='{lang}'".
                       " WHERE lb<={lb} AND rb >={rb} AND level!=0 ".                           
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getCmsMenu()->get('id')]=$items->getCmsMenu()->setI18n($items->hasCmsMenuI18n()?$items->getCmsMenuI18n():false);
        }       
       }
       return $this->fathers;      
    }
    
    
      function getChildren($order="ASC",$lang=null)
    {
        if ($this->children===null)
       {               
           $this->children=new CmsMenuCollection();
           
          
          $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CmsMenu','CmsMenuI18n'))
            ->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                       " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                                               
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();           
      //   echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCmsMenu()->get('id')]=$items->getCmsMenu()->setI18n($items->hasCmsMenuI18n()?$items->getCmsMenuI18n():false);
        }       
       }    
       return $this->children;    
    }
}

