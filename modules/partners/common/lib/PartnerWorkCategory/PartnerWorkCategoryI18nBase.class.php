<?php

class PartnerWorkCategoryI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','url','meta_title','meta_description','content','template','meta_keywords','meta_robots','category_id','lang','is_active','created_at','updated_at');
    const table="t_partner_work_category_i18n"; 
    protected static $foreignKeys=array('category_id'=>'PartnerWorkCategory'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['category_id']))
              return $this->loadByLangAndCategoryId((string)$parameters['lang'],(string)$parameters['category_id']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);          
        //  if (isset($parameters['lang']) && isset($parameters['title']))
        //      return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['title']); 
        //  if (isset($parameters['title']))
        //      return $this->loadByTitle((string)$parameters['title']); 
        //  if (isset($parameters['name']))
        //      return $this->loadByName((string)$parameters['name']); 
        //  return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByTitle((string)$parameters);
      }   
    }        
    
     protected function loadByLangAndCategoryId($lang,$category_id)
    {       
       $this->set('category_id',$category_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('category_id'=>$category_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND category_id='{category_id}';")
            ->makeSqlQuery();         
        return $this->rowtoObject($db);
    }
    
    
    
    
  /*   protected function loadByLangAndTitle($lang,$title)
    {
       $this->set('title',$title);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByTitle($title)
    {
       $this->set('title',$title);      
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title))              
            ->setQuery("SELECT * FROM ".self::getTable().                        
                       " WHERE title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByName($name)
    {     
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().  
                       " LEFT JOIN ".self::getOuterForJoin('category_id').                      
                       " WHERE name='{name}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }*/
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%d';")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'is_active'=>'NO',
            'template'=>'default.tpl'
        ));   
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();  
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery();  
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuery();  
    }
    
    protected function executeIsExistQuery($db)    
    {      
        $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('title'=>$this->get('title'),'url'=>$this->get('url'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable().
                    " WHERE url='{url}' AND url!='' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();  
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("category_id"=>$this->get('category_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE category_id={category_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getCategory()->delete();
        return $this;
    }  
   
     function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new PartnerWorkCategory($this->get('category_id')):$this->_category_id;                 
    }    
    
     function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new PartnerWorkCategoryI18nFormatter($this):$this->formatter;
    }
   
   
    function __toString() {
        return (string)$this->get('title');
    }
    
   /* function getPartnerWorkCategories()
    {
        if ($this->partner_work_categories===null)
        {
            $this->partner_work_categories = new PartnerWorkCategoryPartnerWorkCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("category_id"=>$this->get('category_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('PartnerWorkCategoryPartnerWork','PartnerWork','PartnerWorkI18n','SupplierCompany'))
                    ->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryPartnerWork::getTable().
                               " INNER JOIN ".PartnerWorkCategoryPartnerWork::getOuterForJoin('partner_work_id').
                               " INNER JOIN ".PartnerWork::getOuterForJoin('supplier_id').
                               " LEFT JOIN ".PartnerWorkI18n::getInnerForJoin('partner_work_id'). " AND ".PartnerWorkI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE category_id={category_id}".  
                                " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->partner_work_categories;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getPartnerWorkCategoryPartnerWork();
               $item->set('partner_work_id',$items->getPartnerWork());                
               $item->set('supplier_id',$items->getSupplierCompany());     
               $item->getPartnerWork()->setI18n($items->hasPartnerWorkI18n()?$items->getPartnerWorkI18n():false);                
               $this->partner_work_categories[$item->get('id')]=$item;
            }               
        }   
        return $this->partner_work_categories;
    }*/
    
    
    function getPictures()
    {
        if ($this->pictures===null)
        {
            $this->pictures = new PartnerWorkCategoryPictureCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("category_id"=>$this->get('category_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('PartnerWorkCategoryPicture'))
                    ->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryPicture::getTable().                              
                               //" LEFT JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id'). " AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE category_id={category_id}".
                              " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->pictures;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getPartnerWorkCategoryPicture();                       
               $this->pictures[$item->get('id')]=$item;
            }                       
        }
        return $this->pictures;
    }
    
    function getUrlString()
    {
        if (strpos($this->get('url'), "/")===0)
           return substr($this->get('url'),1);
        return $this->get('url');         
    }
    
    function getUrl()
    {
        return link_i18n('partners_category',array('url'=>$this->getUrlString()),null,'frontend');
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    function getChildren($order="DESC")
    {
        if ($this->children===null)
       {            
           $this->children=new PartnerWorkCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$this->get('lang'),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('PartnerWorkCategory','PartnerWorkCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategory::getTable().
                       " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id').
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}'  AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".                          
                      // " ORDER BY ".PartnerWorkCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getPartnerWorkCategory()->get('id')]=$items->getPartnerWorkCategory()->setI18n($items->getPartnerWorkCategoryI18n());
        }       
       }    
       return $this->children;    
    } 
       
    function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new PartnerWorkCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getCategory()->get('lb'),'rb'=>$this->getCategory()->get('rb'),'lang'=>$this->get('lang')))
            ->setObjects(array('PartnerWorkCategoryI18n','PartnerWorkCategory'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryI18n::getTable(). 
                       " INNER JOIN ".PartnerWorkCategoryI18n::getOuterForJoin('category_id').
                       " WHERE lb < {lb} AND rb > {rb} AND level!=0 AND lang='{lang}'".                          
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getPartnerWorkCategoryI18n()->get('id')]=$items->getPartnerWorkCategoryI18n()->set('category_id',$items->getPartnerWorkCategoryI18n());
        }       
       }
       return $this->fathers;      
    } 
    
    function getUrlPathI18n()
    {
        return $this->getFathers()->getUrlPathI18n()->implode("/")->add("/");
    }
    
    function hasContent()
    {
        return (boolean)$this->get('content');
    }
}
