<?php


class EmployerCityGalleryBase extends mfObject3 {
     
    protected static $fields=array('name','tpl','number_of_items','created_at','updated_at');    
    const table="t_employer_city_gallery"; 
     

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);            
           if (isset($parameters['name']))
             return $this->loadbyName((string)$parameters['name']);   
          return $this->add($parameters); 
      }   
      else
      {
           if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
      }    
    }
    
     protected function loadByName($name)
    {             
       $this->set('name',$name);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE name='{name};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
           
        )); 
    }
     
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
         
    protected function executeIsExistQuery($db)    
    {
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSqlQuery();       
    }
        
  
    
       function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->get('updated_at'));
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
             $this->i18n=new EmployerCityGalleryI18n(array('lang'=>$lang,"gallery_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
    
    
     function updateCities(EmployerCityGalleryCityCollection $selection)
     {
         $db=mfSiteDatabase::getInstance() ;
        if ($selection->isEmpty())
        {
            $db->setParameters(array('gallery_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployerCityGalleryCity::getTable().                            
                           " WHERE ".EmployerCityGalleryCity::getTableField('gallery_id')."='{gallery_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            $this->set('number_of_items',0)->save();
            return $this;
        }   
         $db->setParameters(array('gallery_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployerCityGalleryCity::getTable().                            
                           " WHERE ".EmployerCityGalleryCity::getTableField('gallery_id')."='{gallery_id}' AND city_id NOT IN('".$selection->getCities()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $collection = new EmployerCityGalleryCityCollection();
        $db->setParameters(array('gallery_id'=>$this->get('id')))              
           ->setQuery("SELECT * FROM ".EmployerCityGalleryCity::getTable().                            
                           " WHERE ".EmployerCityGalleryCity::getTableField('gallery_id')."='{gallery_id}'".  
                         //  " ORDER BY position ASC ".
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
            while ($item=$db->fetchObject('EmployerCityGalleryCity'))
            {        
               $collection[$item->get('city_id')]=$item->loaded();
            } 
            $collection->loaded();
         }            
       //  var_dump($collection->getKeys()->toArray());
         // create & update
          foreach ($selection as $employer_gallery)
         {
             if (isset($collection[$employer_gallery->get('city_id')]))
             {
                $collection[$employer_gallery->get('city_id')]->set('position',$employer_gallery->get('position'));
             }   
             else
             {               
                $collection[]=$employer_gallery->set('gallery_id',$this);
             }
         }                      
        $collection->save();
        $this->set('number_of_items',$collection->count())->save();
        return $this;      
     }
     
     
     function updatePositions(mfArray $positions)
     {
          if ($positions->isEmpty())
            return ;
         $db=mfSiteDatabase::getInstance();
         foreach ($positions as $position=>$id)
         {    
                $db->setParameters(array('position'=>$position+1,'id'=>$id,'gallery_id'=>$this->get('id')))
                   ->setQuery("UPDATE ". EmployerCityGalleryCity::getTable()." SET position={position}".
                              " WHERE id={id} AND gallery_id='{gallery_id}'".                    
                              ";")               
                ->makeSqlQuery(); 
         }                
         // Renumbering the rest if exists
         $db->setQuery("SELECT @position:=".$positions->count().";")
              ->makeSqlQuery();        
         $db->setParameters(array('gallery_id'=>$this->get('id')))
            ->setQuery("UPDATE ".EmployerCityGalleryCity::getTable()." SET position=( SELECT @position:=@position+1 ) ".
                      " WHERE id NOT IN('".$positions->implode("','")."')".
                            " AND gallery_id='{gallery_id}'".
                      " ORDER BY position;")
           ->makeSqlQuery();                      
         return $this;
     }
    
     function hasCities()
     {
         return (boolean)$this->number_of_items;
     }
     
     function getNumberOfCities()
     {
         return new IntegerFormatter($this->number_of_items);     
     }
     
     function getTemplate()
     {
         return $this->get('tpl')?$this->get('tpl'):'default';
     }
     function getFormatter()
     {
       return $this->formatter=$this->formatter===null?new EmployerCityGalleryFormatter($this):$this->formatter;
     }
}
