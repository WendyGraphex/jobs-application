<?php


class EmployerActivityPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerActivity',
           'EmployerActivityI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerActivity();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerActivityI18n()?$items->getEmployerActivityI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


