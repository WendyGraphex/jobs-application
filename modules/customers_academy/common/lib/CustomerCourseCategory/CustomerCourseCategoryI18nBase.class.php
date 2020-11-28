<?php

class CustomerCourseCategoryI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','url','meta_title','meta_description','content','template','meta_keywords','meta_robots','category_id','lang','is_active','created_at','updated_at');
    const table="t_customer_course_category_i18n"; 
    protected static $foreignKeys=array('category_id'=>'CustomerCourseCategory'); // By default
    
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
       return $this->_category_id=$this->_category_id===null?new CustomerCourseCategory($this->get('category_id')):$this->_category_id;                 
    }    
    
     function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerCourseCategoryI18nFormatter($this):$this->formatter;
    }
   
   
    function __toString() {
        return (string)$this->get('title');
    }
    
   /* function getCustomerCourseCategories()
    {
        if ($this->partner_work_categories===null)
        {
            $this->partner_work_categories = new CustomerCourseCategoryCustomerCourseCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("category_id"=>$this->get('category_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('CustomerCourseCategoryCustomerCourse','CustomerCourse','CustomerCourseI18n','SupplierCompany'))
                    ->setQuery("SELECT {fields} FROM ".CustomerCourseCategoryCustomerCourse::getTable().
                               " INNER JOIN ".CustomerCourseCategoryCustomerCourse::getOuterForJoin('partner_work_id').
                               " INNER JOIN ".CustomerCourse::getOuterForJoin('supplier_id').
                               " LEFT JOIN ".CustomerCourseI18n::getInnerForJoin('partner_work_id'). " AND ".CustomerCourseI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE category_id={category_id}".  
                                " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->partner_work_categories;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getCustomerCourseCategoryCustomerCourse();
               $item->set('partner_work_id',$items->getCustomerCourse());                
               $item->set('supplier_id',$items->getSupplierCompany());     
               $item->getCustomerCourse()->setI18n($items->hasCustomerCourseI18n()?$items->getCustomerCourseI18n():false);                
               $this->partner_work_categories[$item->get('id')]=$item;
            }               
        }   
        return $this->partner_work_categories;
    }*/
    
    
    function getPictures()
    {
        if ($this->pictures===null)
        {
            $this->pictures = new CustomerCourseCategoryPictureCollection();
            $db=mfSiteDatabase::getInstance()           
                    ->setParameters(array("category_id"=>$this->get('category_id'),'lang'=>$this->get('lang')))  
                    ->setObjects(array('CustomerCourseCategoryPicture'))
                    ->setQuery("SELECT {fields} FROM ".CustomerCourseCategoryPicture::getTable().                              
                               //" LEFT JOIN ".CustomerCourseCategoryI18n::getInnerForJoin('category_id'). " AND ".CustomerCourseCategoryI18n::getTableField('lang')."='{lang}'".                                                                                                                
                              " WHERE category_id={category_id}".
                              " ORDER BY position ASC ".
                              ";")
            ->makeSqlQuery(); 
              if (!$db->getNumRows())
                return $this->pictures;   
            while ($items=$db->fetchObjects())
            {
               $item=$items->getCustomerCourseCategoryPicture();                       
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
        return link_i18n('customers_course_category',array('url'=>$this->getUrlString()),null,'frontend');
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    function getChildren($order="DESC")
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerCourseCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$this->get('lang'),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerCourseCategory','CustomerCourseCategoryI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerCourseCategory::getTable().
                       " INNER JOIN ".CustomerCourseCategoryI18n::getInnerForJoin('category_id').
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}'  AND ".CustomerCourseCategoryI18n::getTableField('lang')."='{lang}'".                          
                      // " ORDER BY ".CustomerCourseCategoryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI ASC".
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();
      //  echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getCustomerCourseCategory()->get('id')]=$items->getCustomerCourseCategory()->setI18n($items->getCustomerCourseCategoryI18n());
        }       
       }    
       return $this->children;    
    } 
       
    function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new CustomerCourseCategoryI18nCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->getCategory()->get('lb'),'rb'=>$this->getCategory()->get('rb'),'lang'=>$this->get('lang')))
            ->setObjects(array('CustomerCourseCategoryI18n','CustomerCourseCategory'))
            ->setQuery("SELECT {fields} FROM ".CustomerCourseCategoryI18n::getTable(). 
                       " INNER JOIN ".CustomerCourseCategoryI18n::getOuterForJoin('category_id').
                       " WHERE lb < {lb} AND rb > {rb} AND level!=0 AND lang='{lang}'".                          
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getCustomerCourseCategoryI18n()->get('id')]=$items->getCustomerCourseCategoryI18n()->set('category_id',$items->getCustomerCourseCategoryI18n());
        }       
       }
       return $this->fathers;      
    } 
    
    function getUrlPathI18n()
    {
        return $this->getFathers()->getUrlPathI18n()->implode("/")->add("/");
    }
}
