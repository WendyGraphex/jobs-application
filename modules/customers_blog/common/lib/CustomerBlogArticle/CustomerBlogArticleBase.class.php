<?php


class CustomerBlogArticleBase extends mfObject3 {
     
    protected static $fields=array('reference','is_active','author','started_at','expired_at','published_at','status','picture','created_at','updated_at');
    const table="t_customer_blog_article";
        protected static $fieldsNull=array('started_at','expired_at','updated_at','published_at'); 
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);        
      }   
    }
         
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'is_active'=>'NO',
            'author'=>$this->getSettings()->get('customer_blog_author'),
        ));       
    }        
       
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }*/
   
    
    
           
    function hasI18n()
    {
         return (boolean)$this->i18n;
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new CustomerBlogArticleI18n(array('lang'=>$lang,"article_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
     
    
      
     static function getAllI18nForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setQuery("SELECT ".CustomerBlogArticleI18n::getFieldsAndKeyWithTable()." FROM ".CustomerBlogArticleI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('CustomerBlogArticleI18n'))
        { 
            $values[$item->get('article_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('CustomerBlogArticleI18n','CustomerBlogArticle'))
                ->setQuery("SELECT {fields} FROM ".CustomerBlogArticle::getTable().
                           " INNER JOIN ".CustomerBlogArticleI18n::getInnerForJoin('article_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getCustomerBlogArticle()->get('id')]=$items->getCustomerBlogArticle()->setI18n($items->getCustomerBlogArticleI18n());
        }              
        return $values;
    }
    
    static function getContractFunctionsForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".CustomerBlogArticleI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('CustomerBlogArticleI18n'))
        {             
            $values[$item->get('article_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('CustomerBlogArticle','CustomerBlogArticleI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".CustomerBlogArticleI18n::getInnerForJoin('article_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getCustomerBlogArticle();
           $item->setI18n($items->getCustomerBlogArticleI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
       
    
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/articles/";
    }
    
    
    static function getName($name)
    {
       return str_replace(" ","-",mfTools::I18N_noaccent($name));
    }  
    
     public function getPictureDirectory()
    {
        return $this->getDirectory()."/pictures/".$this->get('id');
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
       
     function hasPicture()
    {    
        return (boolean)$this->get('picture');   
    }
    
     function getPicture()
    {    
        return $this->_picture=$this->_picture===null?new CustomerBlogArticlePictureFrame($this):$this->_picture;   
    }
    
    function save()
    {      
       if ($this->get('status')=='UPLOAD') 
           $this->set('status','ACTIVE');
       if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
            $this->getPicture()->removeAll();
        }
          if ($this->hasPropertyChanged('icon') && $this->isLoaded() && $this->__icon)
        {                
            $this->getIcon()->removeAll();
        }
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));  
           $this->getPicture()->generate();
           $this->__picture=null; 
        }        
        if ($this->__icon)
        {                    
           $this->_icon=null;
           $this->__icon->save($this->getIcon()->getPath(),$this->get('icon'));  
           $this->getIcon()->generate();
           $this->__icon=null; 
        }
        if ($this->activities instanceof CustomerBlogActivityCollection)
        {
            $this->updateActivities();
        }    
    }
    
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new CustomerBlogArticleFormatter($this):$this->formatter;
   }
   
  
    function getSettings()
    {
        return $this->settings=$this->settings===null?new CustomerBlogSettings():$this->settings;
    }
    
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('customer_blog_reference_format','A{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('article_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   function create()
    {
       $this->set('status','ACTIVE');
       $this->save();
       $this->setReference()->save();       
       return $this;
    }
    
    
    
     function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        return $this;
    } 
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('status','UPLOAD')->save();                                        
        return $this;
    }
    
    function isUpload()
    {
        return $this->get('status') =='UPLOAD';
    }
    
    function getStatusI18n()
    {
        return __($this->get('status'));
    }
    
    
    function hasStartedAt()
    {
        return (boolean)$this->get('started_at');
    }
    
      function hasExpiredAt()
    {
        return (boolean)$this->get('expired_at');
    }
    
    function isPublished()
    {
        return (boolean)$this->get('published_at');
    }
    
    /* function setActivities(CustomerBlogActivityCollection $activities)
    {
        $this->activities=$activities;
        return $this;
    }*/
    
    
    
    function getArticleActivities()
    {
        if ($this->article_activities===null)
        {
            $this->article_activities=new CustomerBlogArticleActivityCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('article_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage())) 
                ->setObjects(array('CustomerBlogArticleActivity','CustomerBlogActivity','CustomerBlogActivityI18n'))
                ->setQuery("SELECT {fields} FROM ".CustomerBlogArticleActivity::getTable(). 
                           " INNER JOIN ".CustomerBlogArticleActivity::getOuterForJoin('activity_id').
                           " INNER JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id').
                           " WHERE ".CustomerBlogArticleActivity::getTableField('article_id')."='{article_id}' AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".
                           ";")               
                ->makeSqlQuery(); 
            if (!$db->getNumRows())
               return $this->article_activities;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getCustomerBlogArticleActivity();
                $item->set('activity_id',$items->getCustomerBlogActivity());
                $item->getActivity()->setI18n($items->getCustomerBlogActivityI18n());
                $this->article_activities[$item->get('id')]=$item;
            } 
            $this->article_activities->loaded();
        }   
        return $this->article_activities;
    }    
    
    function getActivities()
    {
        if ($this->activities===null)
        {
           $this->activities=new CustomerBlogActivityCollection();
        }   
        return $this->activities;
    }
    
     function updateActivities()
    {          
        $db=mfSiteDatabase::getInstance();
        if ($this->getActivities()->isEmpty())
        {
            $db->setParameters(array('article_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogArticleActivity::getTable().                            
                           " WHERE ".CustomerBlogArticleActivity::getTableField('article_id')."='{article_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('article_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogArticleActivity::getTable().                            
                           " WHERE ".CustomerBlogArticleActivity::getTableField('article_id')."='{article_id}' AND activity_id NOT IN('".$this->getActivities()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('article_id'=>$this->get('id')))              
                ->setQuery("SELECT activity_id FROM ".CustomerBlogArticleActivity::getTable().                            
                           " WHERE ".CustomerBlogArticleActivity::getTableField('article_id')."='{article_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $this->getActivities()->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $this->article_activities = new CustomerBlogArticleActivityCollection();
         foreach ($this->getActivities() as $activity)
         {    
             $item= new CustomerBlogArticleActivity();
             $item->add(array('activity_id'=>$activity,'article_id'=>$this));
             $this->getArticleActivities()->push($item);
         }
         $this->article_activities->save(); 
         return $this;
    }
    
    function publish()
    {
        $this->set('published_at',date("Y-m-d H:i:s"));
         $this->save();
        return $this;
    }
}
