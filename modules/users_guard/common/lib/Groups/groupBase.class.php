<?php

class GroupBase extends mfObject2 {
     
    protected static $fields=array('name','is_active','application','updated_at');   
    const table="t_groups";
    
    function __construct($parameters=null,$application=null) {
      parent::__construct($application,$site);
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            $this->loadbyId((string)$parameters);
        else 
           $this->loadbyName((string)$parameters);         
      }   
    }
    
    protected function loadByName($name)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($name))
                ->setQuery("SELECT * FROM ".self::getTable()."
                        WHERE name='%s' AND application@@IN_APPLICATION@@;")
                 ->makeSqlQuery($this->application,$this->site); 
        $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()."
                        WHERE id=%d AND application@@IN_APPLICATION@@;")
                  ->makeSqlQuery($this->application,$this->site);  
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d AND application@@IN_APPLICATION@@;")
          ->makeSqlQuery($this->application,$this->site);
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
       $this->is_active=isset($this->is_active)?$this->is_active:"NO";
    }   
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery($this->application,$this->site);
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE id=%d AND application@@IN_APPLICATION@@;")
            ->makeSqlQuery($this->application,$this->site);    
    }
    
    protected function executeIsExistQuery($db)    
    {
      $parameters=array($this->name);  
      if ($this->id)
      {
          $parameters[]=$this->id;
          $query="SELECT id FROM ".self::getTable()." WHERE name='%s' AND id!=%d AND application@@IN_APPLICATION@@;";    
      }         
      else
      {    
         $query="SELECT id FROM ".self::getTable()." WHERE name='%s' AND application@@IN_APPLICATION@@;";               
      }
      $db->setParameters($parameters)
            ->setQuery($query)
            ->makeSqlQuery($this->application,$this->site);   
    }
    
    
    
    // GETTERS    
    function getId()
    {
        return $this->id;        
    }
    
    function getName()
    {
        return $this->name;
    }
    
    function __toString() {
        return $this->name;
    }
    
    public function hasI18n()
     {
         return ($this->get('i18n')!=0);
     } 
     
   public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
     
     public function getI18n($lang=null)
     {        
         if (!$this->i18n)
         {
              if ($lang==null)
                $lang=  mfcontext::getInstance()->getUser()->getCountry();
             $this->i18n=new GroupI18n(array('lang'=>$lang,"group_id"=>$this->get('id')));
         }   
         return $this->i18n;
     }
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
}
