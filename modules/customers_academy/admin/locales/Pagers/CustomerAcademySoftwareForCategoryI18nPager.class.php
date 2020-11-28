<?php


class CustomerAcademySoftwareForCategoryI18nPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'CustomerAcademySoftware',
           'CustomerAcademySoftwareI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getCustomerAcademySoftware();   
           //   var_dump($item);
              $item->setI18n($items->hasCustomerAcademySoftwareI18n()?$items->getCustomerAcademySoftwareI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


