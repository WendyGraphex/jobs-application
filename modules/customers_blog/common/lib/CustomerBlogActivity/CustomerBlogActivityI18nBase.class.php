<?php

class CustomerBlogActivityI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','url','meta_title','meta_description','content','template','meta_keywords','meta_robots','activity_id','lang','is_active','created_at','updated_at');
    const table="t_customer_blog_activity_i18n"; 
    protected static $foreignKeys=array('activity_id'=>'CustomerBlogActivity'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['activity_id']))
              return $this->loadByLangAndActivityId((string)$parameters['lang'],(string)$parameters['activity_id']); 
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
    
     protected function loadByLangAndActivityId($lang,$activity_id)
    {       
       $this->set('activity_id',$activity_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('activity_id'=>$activity_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND activity_id='{activity_id}';")
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
                       " LEFT JOIN ".self::getOuterForJoin('activity_id').                      
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
            ->setParameters(array("activity_id"=>$this->get('activity_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE activity_id={activity_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getActivity()->delete();
        return $this;
    }  
   
     function getActivity()
    {
       return $this->_activity_id=$this->_activity_id===null?new CustomerBlogActivity($this->get('activity_id')):$this->_activity_id;                 
    }    
    
     function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerBlogActivityI18nFormatter($this):$this->formatter;
    }
   
   
    function __toString() {
        return (string)$this->get('title');
    }
    
   /* function getPartnerWorkActivities()
    {
        if ($this->partner_work_activities===null)
        {
            $this->partner_work_activities = new CustomerBlogActivityPartnerWorkCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("activity_id"=>$this->get('activity_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('CustomerBlogActivityPartnerWork','PartnerWork','PartnerWorkI18n','SupplierCompany'))
                    ->setQuery("SELECT {fields} FROM ".CustomerBlogActivityPartnerWork::getTable().
                               " INNER JOIN ".CustomerBlogActivityPartnerWork::getOuterForJoin('partner_work_id').
                               " INNER JOIN ".PartnerWork::getOuterForJoin('supplier_id').
                               " LEFT JOIN ".PartnerWorkI18n::getInnerForJoin('partner_work_id'). " AND ".PartnerWorkI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE activity_id={activity_id}".  
                                " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->partner_work_activities;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getCustomerBlogActivityPartnerWork();
               $item->set('partner_work_id',$items->getPartnerWork());                
               $item->set('supplier_id',$items->getSupplierCompany());     
               $item->getPartnerWork()->setI18n($items->hasPartnerWorkI18n()?$items->getPartnerWorkI18n():false);                
               $this->partner_work_activities[$item->get('id')]=$item;
            }               
        }   
        return $this->partner_work_activities;
    }*/
    
    
    function getPictures()
    {
        if ($this->pictures===null)
        {
            $this->pictures = new CustomerBlogActivityPictureCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("activity_id"=>$this->get('activity_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('CustomerBlogActivityPicture'))
                    ->setQuery("SELECT {fields} FROM ".CustomerBlogActivityPicture::getTable().                              
                               //" LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id'). " AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE activity_id={activity_id}".
                              " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->pictures;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getCustomerBlogActivityPicture();                       
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
        return link_i18n('customers_blog_activity',array('url'=>$this->getUrlString()),null,'frontend');
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    function getChildren($order="DESC")
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerBlogActivityI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getActivity()->get('lb'),'lang'=>$this->get('lang'),'rb'=>$this->getActivity()->get('rb'),'levelplusone'=>$this->getActivity()->get('level') + 1))
            ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivity::getTable().
                       " INNER JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id').
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}'  AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".                          
                      // " ORDER BY ".CustomerBlogActivityI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
       //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCustomerBlogActivityI18n()->get('id')]=$items->getCustomerBlogActivityI18n()->set('activity',$items->getCustomerBlogActivity());
        }       
       }    
       return $this->children;    
    } 
       
    function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new CustomerBlogActivityI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getActivity()->get('lb'),'rb'=>$this->getActivity()->get('rb'),'lang'=>$this->get('lang')))
            ->setObjects(array('CustomerBlogActivityI18n','CustomerBlogActivity'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivityI18n::getTable(). 
                       " INNER JOIN ".CustomerBlogActivityI18n::getOuterForJoin('activity_id').
                       " WHERE lb < {lb} AND rb > {rb} AND level!=0 AND lang='{lang}'".                          
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getCustomerBlogActivityI18n()->get('id')]=$items->getCustomerBlogActivityI18n()->set('activity_id',$items->getCustomerBlogActivityI18n());
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
    
    
    function generateUrl()
    {
        $this->set('url',(string)mfString::getInstance($this->get('title'))->makeUrl());
        return $this;
    }
}
