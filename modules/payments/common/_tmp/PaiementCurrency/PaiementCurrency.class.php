<?php


class paymentCurrency  extends mfObject2 {
    
    const table="t_payments_currency"; 
    const key=null;   
    protected static $fields=array('payment_id','currency');   
    protected static $foreignKeys=array('payment_id'=>"payment"); 
    protected static $keys=array('payment_id','currency');   
    
    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);
      if ($parameters === null)
            return $this;
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['payment_id']) && isset($parameters['currency']))
              return $this->loadbypaymentAndCurrency((string)$parameters['payment_id'],(string)$parameters['currency']);         
      }   
      return $this->add($parameters); 
    }
   
    protected function loadBypaymentAndCurrency($payment_id,$country)
    {
        $this->set('payment_id',$payment_id);
        $this->set('currency',$currency);
        $db=mfSiteDatabase::getInstance()->setParameters(array('payment_id'=>$payment_id,'currency'=>$currency));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE currency='{currency}' AND payment_id={payment_id};")
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
