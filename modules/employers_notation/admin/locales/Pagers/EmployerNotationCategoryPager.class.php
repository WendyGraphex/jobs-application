<?php


class EmployerNotationCategoryPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerNotationCategory',
           'EmployerNotationCategoryI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerNotationCategory();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerNotationCategoryI18n()?$items->getEmployerNotationCategoryI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


