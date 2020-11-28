<?php


class EmployeeNotationCategoryPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeNotationCategory',
           'EmployeeNotationCategoryI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeNotationCategory();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeNotationCategoryI18n()?$items->getEmployeeNotationCategoryI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


