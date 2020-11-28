<?php



class SiteEventOrderEventBase extends mfObject3 {
     
    protected static $fields=array('signature','order_id','event_id','seller_user_id','tax_id','cart_event_id','cart_id',                            
                                   'sale_price_with_tax','sale_price_without_tax','event_user_id',
                                   'total_sale_price_with_tax','total_sale_price_without_tax',
                                   'quantity','comments','status',
                                   'created_at','updated_at');    
   const table="t_site_event_order_event"; 
   protected static $foreignKeys=array('order_id'=>'SiteEventOrder',
                                       'cart_event_id'=>'SiteEventCartEvent',
                                       'event_user_id'=>'SiteEventUser',
                                       'seller_user_id'=>'SiteEventUser',
                                       'cart_id'=>'SiteEventCart',
                                       'tax_id'=>'SaleTax',                                    
                                       'event_id'=>'SiteEvent'); // By default
   protected static $fieldsNull=array('tax_id','seller_user_id'); // By default

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);            
          if (isset($parameters['signature']))
             return $this->loadbySignature((string)$parameters['signature']);    
          return $this->add($parameters); 
      }   
      else
      {         
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         
      }   
    }
            
     protected function loadBySignature($signature)
    {                
         $db=mfSiteDatabase::getInstance()->setParameters(array('signature'=>$signature));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE signature='{signature}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }      
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'status'=>'ACTIVE',
            'quantity'=>1
        ));                 
    }          
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
   
    protected function executeIsExistQuery($db)    
    {
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('signature'=>$this->get('signature'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE signature='{signature}' ".$key_condition)
         ->makeSqlQuery();  
     
    } 
    
        function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new SiteEventOrderEventFormatter($this):$this->formatter;
    }
    
    
     
    function getEvent()
    {
        return $this->_event_id=$this->_event_id===null?new SiteEvent($this->get('event_id')):$this->_event_id;
    } 
    
      function getTax()
    {
        return $this->_tax_id=$this->_tax_id===null?new SiteEventTax($this->get('tax_id')):$this->_tax_id;
    } 
    
    function setSignature()
    {
        $this->set('signature',md5($this->get('event_id').$this->get('comments').$this->get('cart_id').$this->get('quantity')));        
        return $this;
    }
        
    function getSalePriceWithTax()
     {
         return floatval($this->get('sale_price_with_tax'));
     }
     
     function getSalePriceWithoutTax()
     {
           return floatval($this->get('sale_price_without_tax'));
     }
     
     function getTotalSalePriceWithTax()
     {
           return floatval($this->get('total_sale_price_with_tax'));
     }
     
     function getTotalSalePriceWithoutTax()
     {
           return floatval($this->get('total_sale_price_without_tax'));
     }
     
     function getQuantity()
     {
         return floatval($this->get('quantity'));
     }
     
      function getStatusI18n()
    {
        return __($this->get('status'));
    }  
    
    function getTotalTax()
    {
        return $this->getTotalSalePriceWithoutTax() * $this->getTax()->getRate()->getValue();
    }
    
    
    
      
    
}
