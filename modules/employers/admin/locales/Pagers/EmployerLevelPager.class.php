<?php


class EmployerLevelPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerLevel',
           'EmployerLevelI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerLevel();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerLevelI18n()?$items->getEmployerLevelI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


