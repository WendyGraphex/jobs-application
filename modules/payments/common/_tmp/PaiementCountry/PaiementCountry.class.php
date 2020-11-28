<?php


class paymentCountry  extends mfObject2 {
    
    const table="t_payments_country"; 
    const key=null;   
    protected static $fields=array('payment_id','country');   
    protected static $foreignKeys=array('payment_id'=>"payment"); 
    protected static $keys=array('payment_id','country');   
    
    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);
      if ($parameters === null)
            return $this;
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['payment_id']) && isset($parameters['country']))
              return $this->loadbypaymentAndCountry((string)$parameters['payment_id'],(string)$parameters['country']);         
      }   
      return $this->add($parameters); 
    }
   
    protected function loadBypaymentAndCountry($payment_id,$country)
    {
        $this->set('payment_id',$payment_id);
        $this->set('country',$country);
        $db=mfSiteDatabase::getInstance()->setParameters(array('payment_id'=>$payment_id,'country'=>$country));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE country='{country}' AND payment_id={payment_id};")
            ->makeSiteSqlQuery($this->site);                           
        return $this->rowtoObject($db); 
    }        
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereKeysCondition().";")
          ->makeSiteSqlQuery($this->site);
    }
       
    
    protected function executeInsertQuery($db)
    {
        $db->makeSiteSqlQuery($this->site);   
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".$this->getWhereKeysCondition().";")
           ->makeSiteSqlQuery($this->site);    
    }
    
    protected function executeIsExistQuery($db)
    {
       $db->setParameters($this->getWhereKeysParameters())
         ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".$this->getWhereKeysCondition().";")
         ->makeSiteSqlQuery($this->site); 
    }
}
