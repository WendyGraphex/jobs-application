<?php


class EmployerBudgetUnitPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerBudgetUnit',
           'EmployerBudgetUnitI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerBudgetUnit();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerBudgetUnitI18n()?$items->getEmployerBudgetUnitI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


