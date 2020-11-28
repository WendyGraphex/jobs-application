<?php


class EmployeeFunctionPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeFunction',
           'EmployeeFunctionI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeFunction();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeFunctionI18n()?$items->getEmployeeFunctionI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


