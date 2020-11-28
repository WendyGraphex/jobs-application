<?php

class PartnerWorkCategoryMenuBase extends PartnerWorkCategoryMenuCore {
     
   
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),  
             'is_active'=>'NO',
            'state'=>'ACTIVE'
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
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new PartnerWorkCategoryMenuI18n(array('lang'=>$lang,"menu_id"=>$this->get('id')));
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
        return $this->formatter=$this->formatter===null?new PartnerWorkCategoryMenuFormatter($this):$this->formatter;
    }
    
    
     function getFathers()
    {
       if ($this->fathers===null)
       {            
           $this->fathers=new PartnerWorkCategoryMenuCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'rb'=>$this->rb,'lang'=>$this->hasI18n()?$this->getI18n()->get('lang'):mfcontext::getInstance()->getUser()->getLanguage()))
            ->setObjects(array('PartnerWorkCategoryMenu','PartnerWorkCategoryMenuI18n'))
            ->setQuery("SELECT {fields} FROM ".static::getTable().   
                       " LEFT JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id')." AND lang='{lang}'".
                       " WHERE lb<={lb} AND rb >={rb} AND level!=0 ".                           
                       " ORDER BY level ASC".
                       ";")
            ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->fathers; 
         while ($items=$db->fetchObjects())
        {
           $this->fathers[$items->getPartnerWorkCategoryMenu()->get('id')]=$items->getPartnerWorkCategoryMenu()->setI18n($items->hasPartnerWorkCategoryMenuI18n()?$items->getPartnerWorkCategoryMenuI18n():false);
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
    
    
    
    static function getCategoriesFromSelection(mfArray $selection,Language $lang)
    {      
        $list=new PartnerWorkCategoryMenuCollection();
        if ($selection->isEmpty())
            return $list;       
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang->get('code'):mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('PartnerWorkCategoryMenu','PartnerWorkCategoryMenuI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " LEFT JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id'). " AND ".PartnerWorkCategoryMenuI18n::getTableField('lang')."='{lang}'".                                                                                 
                           " WHERE ".self::getTableField('id')." IN('".$selection->implode("','")."')".                        
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getPartnerWorkCategoryMenu();                    
           $item->setI18n($items->hasPartnerWorkCategoryMenuI18n()?$items->getPartnerWorkCategoryMenuI18n():false);
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
           $this->children=new PartnerWorkCategoryMenuCollection();
           
          
          $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lb'=>$this->lb,'lang'=>$lang?$lang:mfContext::getInstance()->getUser()->getLanguage(),'rb'=>$this->rb,'levelplusone'=>$this->get('level') + 1))
            ->setObjects(array('PartnerWorkCategoryMenu','PartnerWorkCategoryMenuI18n'))
            ->setQuery("SELECT {fields} FROM ".PartnerWorkCategoryMenu::getTable().
                       " LEFT JOIN ".PartnerWorkCategoryMenuI18n::getInnerForJoin('menu_id')." AND ".PartnerWorkCategoryMenuI18n::getTableField('lang')."='{lang}'".
                       " WHERE lb > {lb} AND rb < {rb} AND level='{levelplusone}' ".                                               
                       " ORDER BY rb ".$order.
                       ";")
            ->makeSqlQuery();           
      //   echo $db->getQuery();
        if (!$db->getNumRows())
              return $this->children; 
         while ($items=$db->fetchObjects())
        {
           $this->children[$items->getPartnerWorkCategoryMenu()->get('id')]=$items->getPartnerWorkCategoryMenu()->setI18n($items->hasPartnerWorkCategoryMenuI18n()?$items->getPartnerWorkCategoryMenuI18n():false);
        }       
       }    
       return $this->children;    
    }
    
  
    function updatePartnerWorks(PartnerWorkCategoryMenuCollection $partner_work_categories)
    {
        //echo "<pre>"; var_dump($partner_work_categories);        
        $db=mfSiteDatabase::getInstance() ;
        if ($partner_work_categories->isEmpty())
        {
            $db->setParameters(array('menu_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".PartnerWorkCategoryMenu::getTable().                            
                           " WHERE ".PartnerWorkCategoryMenu::getTableField('menu_id')."='{menu_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }   
         $db->setParameters(array('menu_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".PartnerWorkCategoryMenu::getTable().                            
                           " WHERE ".PartnerWorkCategoryMenu::getTableField('menu_id')."='{menu_id}' AND partner_work_id NOT IN('".$partner_work_categories->getPartnerWorks()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $collection = new PartnerWorkCategoryMenuCollection();
        $db->setParameters(array('menu_id'=>$this->get('id')))              
           ->setQuery("SELECT * FROM ".PartnerWorkCategoryMenu::getTable().                            
                           " WHERE ".PartnerWorkCategoryMenu::getTableField('menu_id')."='{menu_id}'".  
                         //  " ORDER BY position ASC ".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
            while ($item=$db->fetchObject('PartnerWorkCategoryMenu'))
            {        
               $collection[$item->get('partner_work_id')]=$item->loaded();
            } 
            $collection->loaded();
         }            
       //  var_dump($collection->getKeys()->toArray());
         // create & update
         foreach ($partner_work_categories as $partner_work_category)
         {
             if (isset($collection[$partner_work_category->get('partner_work_id')]))
             {
                $collection[$partner_work_category->get('partner_work_id')]->set('position',$partner_work_category->get('position'));
             }   
             else
             {               
                $collection[]=$partner_work_category->set('category_id',$this);
             }
         }                      
        $collection->save();
        return $this;
    }
    
     function getNumberOfPictures()
    {
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('menu_id'=>$this->get('id')))               
                ->setQuery("SELECT count(id) FROM ".PartnerWorkCategoryMenuPicture::getTable().                           
                           " WHERE ".PartnerWorkCategoryMenuPicture::getTableField('menu_id')."='{menu_id}'".
                           ";")               
                ->makeSqlQuery(); 
        $row=$db->fetchRow();
        return intval($row[0]);
    }
    
    
       public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/categories/menu";
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
        return $this->_picture=$this->_picture===null?new PartnerWorkCategoryPictureMenuFrame($this):$this->_picture;   
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
    
    function save()
    {
         if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
            $this->getPicture()->removeAll();
        }
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));  
           $this->getPicture()->generate();
           $this->__picture=null; 
        }         
        return $this;
    }
    
    function delete() {
        $this->getPicture()->delete();
        return parent::delete();
    }
    
      function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}
