<?php

class paymentCollection extends mfObjectCollection2 {
    
    function __construct($data=null,$site=null)
    {        
      parent::__construct($data,null,$site);
    }
    
    protected function executeSelectQuery($db)
    {
       $db->setParameters()
           ->setQuery("SELECT * FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
           ->makeSiteSqlQuery($this->site);   
    }
    
    protected function executeDeleteQuery($db)
    {
       $db->setParameters()
          ->setQuery("DELETE FROM ".$this->getTable()." WHERE ".$this->getWhereConditions().";")
          ->makeSiteSqlQuery($this->site);   
    }            
    
    protected function executeInsertQuery($db)
    {
       $db->makeSiteSqlQuery($this->site);   
    }   
    
    protected function executeUpdateQuery($db)
    {
        $db->setQuery("UPDATE ".$this->getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".$this->getWhereConditions().";")
           ->makeSiteSqlQuery($this->site);   
    }
    
    function getAuthorizedpayments($cart,$culture)
    {              
        $items=$this->collection;           
        foreach ($items as $index=>$payment)
        {           
            try
            {               
                $payment->loadpaymentEngine($cart,$culture);                                
                if (!$payment->getpaymentEngine()->isAuthorized())
                {                        
                    unset($this->collection[$index]);                    
                }  
            }
            catch (paymentEngineException $e)
            {              
               unset($this->collection[$index]); // remove payment with problem  
            }
        }           
        return $this;
    }        
    
}

