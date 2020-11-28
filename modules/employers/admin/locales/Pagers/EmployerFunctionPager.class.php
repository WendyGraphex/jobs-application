<?php


class EmployerFunctionPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerFunction',
           'EmployerFunctionI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerFunction();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerFunctionI18n()?$items->getEmployerFunctionI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


