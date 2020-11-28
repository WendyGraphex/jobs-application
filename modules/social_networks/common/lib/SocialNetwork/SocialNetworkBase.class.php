<?php


class SocialNetworkBase extends orderedObject {
    
  const table="t_social_networks";     
  protected static $fields=array('name','link','awe','picture','position','is_active','created_at','updated_at');   
  protected $_picture=null;
  
  function __construct($parameters=null) {
    parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);        
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         $this->loadByName((string)$parameters);
      }   
    }
    
    protected function loadByName($name)
    {
        $this->set('name',$name);             
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array('name'=>$name))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE name='{name}';")
          ->makeSqlQuery();        
        return $this->rowtoObject($db);
    }   
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery(); 
    }
    
    protected function getDefaults()
    {    	
	$this->is_active=isset($this->is_active)?$this->is_active:"NO";
	$this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
	$this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
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
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' ".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
     /* METHODS FOR nodePosition */
    
     protected function executeLastPositionQuery($db)
    {
     $db->setQuery("SELECT max(position) FROM ".self::getTable()." ;")
        ->makeSiteSqlQuery($this->site); 
    }
    
    protected function executeShiftUpQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d ;")
           ->makeSqlQuery();  
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d ;")
            ->makeSqlQuery();
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET position=position - 1 WHERE position > %d ;")
           ->makeSiteSqlQuery($this->site); 
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setQuery("SELECT * FROM ".self::getTable()." WHERE position={position};")
          ->makeSqlQuery();   
    }
    
    /*
     * Getter Methods
     */
    function getId()
    {
      return $this->id;
    }
    
    
    /*
     * Working directory data
     */
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/social-networks/".$this->get('id');
    }
    
    /* ============================ Pictures ============================================================= */
                                                                                     
     public function deletePicture()
       {
        $this->getPicture()->remove(); 
        $this->set('picture','');
        $this->save();
       }
    
       public function getPicture()
       {         
            return $this->_picture=$this->_picture===null?new PictureObject3(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('picture'),
                 "urlPath"=>url("/data/social-networks/".$this->get('id'),"web","frontend"),
                 "url"=>url("/data/social-networks/".$this->get('id')."/".$this->get('picture'),"web","frontend"),
                 "urlAdmin"=>url("/nocache/data/social-networks/".$this->get('id')."/".$this->get('picture'),"web","frontend")
              )):$this->_picture;   
      }
     
   
    function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__picture=$file;
         $this->set('picture',self::getName($file->getFilename()));
        return $this;
    }        
  
    
    static function getName($name)
    {
       return str_replace(" ","-",mfTools::I18N_noaccent($name));
    }  
        
    function save()
    {      
        if ($this->isLoaded() && $this->hasPropertyChanged('picture') && $this->__picture)
        {                  
            $this->getPicture()->remove();
        }
        parent::save();
        if ($this->__picture)
        {                       
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));    
           $this->__picture=null; 
        }        
        return $this;
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SocialNetworkFormatter($this):$this->formatter;
   }
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}



