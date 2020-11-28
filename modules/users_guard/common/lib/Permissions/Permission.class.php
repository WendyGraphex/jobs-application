<?php

class Permission extends mfObject2 {
     
    protected static $fields=array('name','application','group_id','updated_at','created_at');
    protected static $foreignKeys=array('group_id'=>'PermissionGroup'); // By default
    const table="t_permissions";
            
    function __construct($parameters=null,$application=null) {
      parent::__construct($application);
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
         $this->set('name',$name);
         $db=mfSiteDatabase::getInstance()->setParameters(array($name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
   protected function executeLoadById($db)
   {
       $db->setQuery("SELECT * FROM ".self::getTable()." 
                      WHERE ".self::getKeyName()."=%d AND application@@IN_APPLICATION@@;")               
          ->makeSqlQuery($this->application);
   }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d AND application@@IN_APPLICATION@@;")
          ->makeSqlQuery($this->application);
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
    }   
    
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery($this->application);
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setQuery("DELETE FROM ".self::getTable()." WHERE id=%d AND application@@IN_APPLICATION@@ ;") 
          ->makeSqlQuery($this->application);     
    }
    
    protected function executeIsExistQuery($db)
     {
      /*  $parameters=array($this->name);
        if ($this->id)
        {
           $parameters[]=$this->id;
           $query="SELECT id FROM ".self::getTable()." WHERE t_permissions.name='%s' AND id!=%d AND application@@IN_APPLICATION@@;";               
        }
        else
        {
           $query="SELECT id FROM ".self::getTable()." WHERE t_permissions.name='%s' AND application@@IN_APPLICATION@@;";
        }    */
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND application@@IN_APPLICATION@@ ".$key_condition)
           ->makeSqlQuery($this->application);        
     }
     
       function getGroup()
     {
         if (!$this->_group_id)
         {
             $this->_group_id=new PermissionGroup($this->get('group_id'));
         }   
         return $this->_group_id;
     }
    
    // GETTER    
    function getId()
    {
        return $this->id;        
    }
    
    function getName()
    {
        return $this->name;
    }
    
    //
    
    public function __toString()
  {      
    return (string) $this->name;
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
             $this->i18n=new PermissionI18n(array('lang'=>$lang,"permission_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
}
