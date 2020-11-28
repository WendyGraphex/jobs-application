<?php

class CustomerBlogActivityBase extends CustomerBlogActivityCore {
     
   
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),  
             'is_active'=>'NO'
        ));  
        parent::getDefaults();
    }
     
   
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
   
    
    protected function executeIsExistQuery($db)    
    {    
       $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable().                    
                    " WHERE name='{name}' AND name!='' ".($this->getKey()?" AND ".self::getKeyName()."!='%s';":""))
         ->makeSqlQuery();       
    }        
   
    function hasI18n()
    {      
        return $this->i18n===null?$this->getI18n()->isLoaded():$this->i18n;
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new CustomerBlogActivityI18n(array('lang'=>$lang,"activity_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 	
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerBlogActivityFormatter($this):$this->formatter;
    }
    
    
     function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new CustomerBlogActivityCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'rb'=>$this->rb,'lang'=>$this->hasI18n()?$this->getI18n()->get('lang'):mfcontext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".static::getTable().   
                       " LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND lang='{lang}'".
                       " WHERE lb<={lb} AND rb >={rb} AND level!=0 ".                           
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getCustomerBlogActivity()->get('id')]=$items->getCustomerBlogActivity()->setI18n($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n():false);
        }       
       }
       return $this->fathers;      
    }
    
    function create()
    {       
         $node=new $this();                                   
         $node->at($this)->asFirstChild();  // Insert as child otherwise insert from root                             
        return $node;
    }
    
    
    
    static function getActivitiesFromSelection(mfArray $selection,Language $lang)
    {      
        $list=new CustomerBlogActivityCollection();
        if ($selection->isEmpty())
            return $list;       
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang->get('code'):mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id'). " AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".                                                                                 
                           " WHERE ".self::getTableField('id')." IN('".$selection->implode("','")."')".                        
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getCustomerBlogActivity();                    
           $item->setI18n($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n():false);
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
    
    function getPathI18n()
    {
        if ($this->isRoot())
            return "/";
        return $this->getFathers()->getPathI18n()->implode("/")->unshift("/")->add("/");
    }
    
    function getUrlPathI18n()
    {
        return $this->getFathers()->getUrlPathI18n()->implode("/")->add("/");
    }
    
    
    function getChildren($order="ASC",$lang=null)
    {
        if ($this->children===null)
       {            
           $this->children=new CustomerBlogActivityCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('CustomerBlogActivity','CustomerBlogActivityI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerBlogActivity::getTable().
                       " LEFT JOIN ".CustomerBlogActivityI18n::getInnerForJoin('activity_id')." AND ".CustomerBlogActivityI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                          
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
    }
    
    
    
   /* function updatePartnerWorks(PartnerWorkCollection $products)
    {
      //  echo "<pre>"; var_dump($partner_work_features);
        $db=mfSiteDatabase::getInstance() ;
        if ($products->isEmpty())
        {
            $db->setParameters(array('activity_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogActivityPartnerWork::getTable().                            
                           " WHERE ".CustomerBlogActivityPartnerWork::getTableField('activity_id')."='{activity_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }   
         $db->setParameters(array('activity_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogActivityPartnerWork::getTable().                            
                           " WHERE ".CustomerBlogActivityPartnerWork::getTableField('activity_id')."='{activity_id}' AND partner_work_id NOT IN('".$products->implode("','")."')".
                           ";")               
                ->makeSqlQuery();         
         $db->setParameters(array('activity_id'=>$this->get('id')))              
                ->setQuery("SELECT partner_work_id FROM ".CustomerBlogActivityPartnerWork::getTable().                            
                           " WHERE ".CustomerBlogActivityPartnerWork::getTableField('activity_id')."='{activity_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                if (isset($products[$row[0]]))
                    unset($products[$row[0]]);
            }   
         }        
         $collection = new CustomerBlogActivityPartnerWorkCollection();
         foreach ($products as $product)
         {    
             $item= new CustomerBlogActivityPartnerWork();
             $item->add(array('partner_work_id'=>$product,'activity_id'=>$this));
             $collection[]=$item;
         }
         $collection->save(); 
        return $this;
    }*/
    
    function updatePartnerWorks(CustomerBlogActivityCollection $partner_work_activities)
    {
        //echo "<pre>"; var_dump($partner_work_activities);        
        $db=mfSiteDatabase::getInstance() ;
        if ($partner_work_activities->isEmpty())
        {
            $db->setParameters(array('activity_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogActivity::getTable().                            
                           " WHERE ".CustomerBlogActivity::getTableField('activity_id')."='{activity_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }   
         $db->setParameters(array('activity_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerBlogActivity::getTable().                            
                           " WHERE ".CustomerBlogActivity::getTableField('activity_id')."='{activity_id}' AND partner_work_id NOT IN('".$partner_work_activities->getPartnerWorks()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $collection = new CustomerBlogActivityCollection();
        $db->setParameters(array('activity_id'=>$this->get('id')))              
           ->setQuery("SELECT * FROM ".CustomerBlogActivity::getTable().                            
                           " WHERE ".CustomerBlogActivity::getTableField('activity_id')."='{activity_id}'".  
                         //  " ORDER BY position ASC ".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
            while ($item=$db->fetchObject('CustomerBlogActivity'))
            {        
               $collection[$item->get('partner_work_id')]=$item->loaded();
            } 
            $collection->loaded();
         }            
       //  var_dump($collection->getKeys()->toArray());
         // create & update
         foreach ($partner_work_activities as $partner_work_activity)
         {
             if (isset($collection[$partner_work_activity->get('partner_work_id')]))
             {
                $collection[$partner_work_activity->get('partner_work_id')]->set('position',$partner_work_activity->get('position'));
             }   
             else
             {               
                $collection[]=$partner_work_activity->set('activity_id',$this);
             }
         }                      
        $collection->save();
        return $this;
    }
    
     function getNumberOfPictures()
    {
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('activity_id'=>$this->get('id')))               
                ->setQuery("SELECT count(id) FROM ".CustomerBlogActivityPicture::getTable().                           
                           " WHERE ".CustomerBlogActivityPicture::getTableField('activity_id')."='{activity_id}'".
                           ";")               
                ->makeSqlQuery(); 
        $row=$db->fetchRow();
        return intval($row[0]);
    }
    
    
       public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/activities";
    }
    
     public function getPictureDirectory()
    {
        return $this->getDirectory()."/picture/".$this->get('id');
    }
    
     public function getIconDirectory()
    {
        return $this->getDirectory()."/icon/".$this->get('id');
    }
    
     function hasPicture()
    {    
        return (boolean)$this->get('picture');   
    }
    
     function getPicture()
    {    
        return $this->_picture=$this->_picture===null?new CustomerBlogActivityPictureFrame($this):$this->_picture;   
    }
    
     function hasIcon()
    {    
        return (boolean)$this->get('icon');   
    }
    
     function getIcon()
    {    
        return $this->_icon=$this->_icon===null?new CustomerBlogActivityIconFrame($this):$this->_icon;   
    }
    
    function getName($name)
    {
       return (string)mfString::getInstance($name)->I18N_noaccent()->replace(' ','-');
    }
    
     function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        return $this;
    } 
    
     function setIcon(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__icon=$file;       
        $this->set('icon',$file->getOriginalName());
        return $this;
    } 
    
    function save()
    {
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
        return $this;
    }
    
    function delete() {
        $this->getPicture()->delete();
        $this->getIcon()->delete();
        return parent::delete();
    }
    
      function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    function toArray($fields=array())
    {
        $values=parent::toArray($fields);            
        $values['i18n']=isset($fields['i18n'])?$this->getI18n()->toArray($fields['i18n']):$this->getI18n()->toArray();         
        return $values;
    }
    
    function toJson($fields=array())
    {
        $values=new mfArray($this->toArray($fields));
        return $values->toJson();
    }
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
    
    function isUpload()
    {
        return $this->get('state') =='UPLOAD';
    }
}
