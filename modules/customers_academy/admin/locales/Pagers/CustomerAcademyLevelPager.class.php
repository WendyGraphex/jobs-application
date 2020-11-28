<?php


class CustomerAcademyLevelPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'CustomerAcademyLevel',
           'CustomerAcademyLevelI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getCustomerAcademyLevel();   
           //   var_dump($item);
              $item->setI18n($items->hasCustomerAcademyLevelI18n()?$items->getCustomerAcademyLevelI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


