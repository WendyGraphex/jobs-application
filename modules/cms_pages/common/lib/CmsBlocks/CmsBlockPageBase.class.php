<?php


class CmsBlockPageBase extends OrderedObject {
 
    protected static $fields=array('block_id','page_id','target','is_active','created_at','updated_at');  
    protected static $foreignKeys=array('block_id'=>'CmsBlock','page_id'=>'CmsPage'); 
    const table="t_site_cms_block_page";
    
    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
           elseif (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']);
           return $this->add($parameters); 
       }  
       else 
       {    
          if (is_numeric((string)$parameters)) 
             $this->loadById((string)$parameters);   
       } 
    }

    /* ============  M E T H O D S FOR NODE POSITION OBJECT ========================================= */
    
    public function moveTo($node) {
        parent::moveTo($node);
        if ($this->_node->get('block_id')!=$this->get('block_id'))  // Test if same block
            throw new mfDatabaseException("Node for move is not valid"); 
    }   
    
    protected function executeLastPositionQuery($db)
    {
        $db->addParameter($this->get('block_id'))
           ->setQuery("SELECT max(position) FROM ".static::getTable()." AND block_id=%d;")
           ->makeSqlQuery(); ; 
    }
    
    protected function executeShiftUpQuery($db)
    {
        $db->addParameter($this->get('block_id'))
           ->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d  AND block_id=%d;")
           ->makeSqlQuery(); ;   
    }
    
    protected function executeShiftDownQuery($db)
    {
         $db->addParameter($this->get('block_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d  AND block_id=%d;")
            ->makeSqlQuery(); ; 
    }
    
    protected function executeShiftQuery($db)
    {
         $db->addParameter($this->get('block_id'))
            ->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d  AND block_id=%d;")
            ->makeSqlQuery(); ; 
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position};")
          ->makeSqlQuery($this->application,$this->site);     
    }
    
    /* ============  M E T H O D S FOR OBJECT ========================================= */
    
    static function getFields()
    {
        return array_merge(parent::$fields,parent::getFields());
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuery(); ;   
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery(); ;  
    }
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery(); ; 
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery(); ;  
    }
    
    protected function loadByName($name)
    {
        $db=mfSiteDatabase::getInstance()
            ->setParameters($name)
            ->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")  
            ->makeSqlQuery(); ; 
        return $this->rowtoObject($db);
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s")); 
    }
    
    protected function getDefaults()
    {    	
	$this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
	$this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");
        $this->is_active=isset($this->is_active)?$this->is_active:'NO';
    }
    
}

