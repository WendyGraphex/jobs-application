<?php

class SaleEmployeeQuotationCollection extends mfObjectCollection3 {
       
    protected $payment_employer_user=null;
    
    function __construct($data) {       
        if ($data instanceof PaymentEmployerUser)
        {            
            $this->payment_employer_user=$data;
            return parent::__construct();
        }           
        parent::__construct($data);
    }
    
    function getPaymentEmployerUser()
    {
       return $this->payment_employer_user; 
    }
    
      function getAll()
      {
          if ($this->isLoaded())
              return $this;
           $db=mfSiteDatabase::getInstance();
           if ($this->getPaymentEmployerUser())
           {               
               $db->setParameters(array('order_id'=>$this->getPaymentEmployerUser()->get('order_id')))
                  ->setQuery("SELECT ".SaleEmployeeQuotation::getFieldsAndKeyWithTable().                            
                             " FROM ".SaleEmployeeQuotation::getTable().
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " WHERE order_id='{order_id}'".                          
                             ";");                                         
           }
           else
           {
                $db->setParameters(array())
                   ->setQuery("SELECT ".SaleEmployeeQuotation::getFieldsAndKeyWithTable().                            
                             " FROM ".SaleEmployeeQuotation::getTable().
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').                                                 
                             ";");  
           }    
           $db->makeSqlQuery(); 
            if (!$db->getNumRows())
                return $this;       
            while ($item= $db->fetchObject('SaleEmployeeQuotation'))
            {
                $this[$item->get('id')]=$item->loaded();  
            }     
            $this->loaded();
            return $this;
      }
  /*  function getEmployers()
    {
         if ($this->employers===null)          
         {    
            $this->employers = new  EmployeeCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array())
                  ->setQuery("SELECT ".EmployerUser::getFieldsAndKeyWithTable().                            
                             " FROM ".SaleEmployeeQuotation::getTable().                           
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " INNER JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_user_id').
                             " WHERE ".SaleEmployeeQuotation::getTableField('id')." IN('".$this->getKeys()->implode("','")."')".                          
                             ";")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->employers;       
            while ($item= $db->fetchObject('EmployerUser'))
            {
                $this->employers[$item->get('id')]=$item->loaded();  
            }     
            $this->employers->loaded();
         }
         return $this->employers;
    }*/
    
    
    function withEmployees()
    {
         if ($this->with_employees===null)          
         {    
            $this->with_employees = true;  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array())
                  ->setQuery("SELECT ".Employee::getFieldsAndKeyWithTable().",".SaleEmployeeQuotation::getTableField('id')." as quotation_id".                           
                             " FROM ".SaleEmployeeQuotation::getTable().                           
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " INNER JOIN ".SaleEmployeeQuotation::getOuterForJoin('employee_user_id').
                             " WHERE ".SaleEmployeeQuotation::getTableField('id')." IN('".$this->getKeys()->implode("','")."')".                                
                             ";")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this;       
            while ($item= $db->fetchObject('Employee'))
            {
                $this[$item->get('quotation_id')]->set('employee_user_id',$item->loaded());  
            }            
         }
         return $this;                
    } 
    
    
    function withEmployers()
    {
         if ($this->with_employers===null)          
         {    
            $this->with_employers = true;  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array())
                  ->setQuery("SELECT ".EmployerUser::getFieldsAndKeyWithTable().",".SaleEmployeeQuotation::getTableField('id')." as quotation_id".                           
                             " FROM ".SaleEmployeeQuotation::getTable().                           
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " INNER JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_user_id').
                             " WHERE ".SaleEmployeeQuotation::getTableField('id')." IN('".$this->getKeys()->implode("','")."')".                                
                             ";")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this;       
            while ($item= $db->fetchObject('EmployerUser'))
            {
                $this[$item->get('quotation_id')]->set('employer_user_id',$item->loaded());  
            }              
         }
         return $this;                
    } 
    
    
    function byEmployees()
    {
        if ($this->by_employees===null)
        {
           $this->by_employees=new EmployeeCollection();
           foreach ($this as $quotation)
           {
               if (!isset($this->by_employees[$quotation->get('employee_user_id')]))
               {                      
                    $this->by_employees[$quotation->get('employee_user_id')]=$quotation->getEmployeeUser();
                    $this->by_employees[$quotation->get('employee_user_id')]->quotations= new SaleEmployeeQuotationCollection();
               }
               $this->by_employees[$quotation->get('employee_user_id')]->getQuotations()->push($quotation);                              
           }        
        }
        return $this->by_employees;
    }
    
    
    function toArrayForEmail()
    {
       $values=array();
       foreach ($this as $item) 
       {
           $values[]=$item->getFormatter()->toArrayForEmail();
       }
       return $values;   
    }
    
    
    function release()
    {
        if ($this->getPaymentEmployerUser())
        {   
          /*  $db=mfSiteDatabase::getInstance()
               ->setParameters(array('order_id'=>$this->getPaymentEmployerUser()->get('order_id')))
               ->setQuery("UPDATE ". SaleEmployeeQuotation::getTable().
                          " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                          " SET ".SaleEmployeeQuotation::getTableField('state')."='ACCEPTED'".
                          " WHERE order_id='{order_id}'".                          
                          ";")
               ->makeSqlQuery();   */ 
            $db=mfSiteDatabase::getInstance()
               ->setParameters(array('order_id'=>$this->getPaymentEmployerUser()->get('order_id')))
               ->setQuery("UPDATE ". SaleOrderQuotation::getTable().                        
                          " SET status='DELETE'".
                          " WHERE order_id='{order_id}'".                          
                          ";")
               ->makeSqlQuery();    
        } 
        
        return $this;
    }
}

