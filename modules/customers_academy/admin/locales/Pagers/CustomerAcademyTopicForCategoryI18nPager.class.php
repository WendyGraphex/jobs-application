<?php


class CustomerAcademyTopicForCategoryI18nPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'CustomerAcademyTopic',
           'CustomerAcademyTopicI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getCustomerAcademyTopic();   
           //   var_dump($item);
              $item->setI18n($items->hasCustomerAcademyTopicI18n()?$items->getCustomerAcademyTopicI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


