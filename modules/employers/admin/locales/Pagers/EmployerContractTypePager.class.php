<?php


class EmployerContractTypePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerContractType',
           'EmployerContractTypeI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerContractType();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerContractTypeI18n()?$items->getEmployerContractTypeI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


