<?php

 
class OrderpaymentBase extends mfObject2 {
    
    const table="t_payments_order";  

    protected static $fields=array('response','order_id','ip','transaction','acceptance','status','created_at','updated_at');
    protected static $foreignKeys=array('order_id'=>'Order'); 
    protected static $fieldsNull=array();        
          
  function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);    
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
         if ($parameters instanceof Order && $parameters->isLoaded())
             return $this->loadByOrder($parameters);
         if (is_numeric((string)$parameters)) 
             return $this->loadbyId((string)$parameters);    
         if (is_string($parameters))
             return $this->loadbyTransaction($parameters);   
      }   
    }
    
    protected function loadByTransaction($transaction)
    {         
         $this->set('transaction',$transaction);
         $db=  mfSiteDatabase::getInstance();
         $db->setParameters(array('transaction'=>$transaction))
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE transaction={transaction};")
            ->makeSiteSqlQuery($this->site);    
         $this->rowtoObject($db);
    }   
    
    protected function loadByOrder($order)
    {         
         $this->set('order_id',$order);
         $db=  mfSiteDatabase::getInstance();
         $db->setParameters(array('order_id'=>$order->get('id')))
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE order_id={order_id};")
            ->makeSiteSqlQuery($this->site);    
         $this->rowtoObject($db);
    }   
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSiteSqlQuery($this->site);   
    }
    
    protected function getDefaults()
    {    	
	$this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
	$this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");           
    }
    
    protected function executeInsertQuery($db)
    {
         $db->makeSiteSqlQuery($this->site);   
    }
    
    function getValuesForUpdate()
    {
         $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")           
          ->makeSiteSqlQuery($this->site);    
    }
    
    protected function executeDeleteQuery($db)
    {     
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSiteSqlQuery($this->site);     
    }
    
    protected function executeIsExistQuery($db)    
    {
      
      $key_condition=($this->getKey())?"".self::getKeyName()."!='%s';":"";
      $db->setParameters(array())
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE ".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
    /* ======================== Getter Methods =============================================== */
    
    function getId()
    {
      return $this->id;
    }
    
    function getOrderId()
    {
      return $this->order_id;
    }
            
    function getStatus()
    {
      return $this->status;
    }
    
        function getCreatedAt()
    {
      return $this->created_at;
    }
    
        function getUpdatedAt()
    {
      return $this->updated_at;
    }
    
    
    /* ========================== Working directory data ================================================ */
    
    public function getDirectory()
    {
       // return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/carts/".$this->get('id');
    }
    
      
    /* ================== Foreign keys Methods ==========================================================  */
                              
        function getOrder()
        {
           if (!$this->_order_id)
           {
              $this->_order_id=new Order(($this->get('order_id')?$this->get('order_id'):null),$this->getSite());
           }   
           return $this->_order_id;
        }
                                                  
    /* ======================== Fields Methods =============================================== */
        
    
    
}



