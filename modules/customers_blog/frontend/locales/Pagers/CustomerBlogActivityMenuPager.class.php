<?php


class CustomerBlogActivityMenuPager extends Pager {
    
    
    function __construct() {                  
        parent::__construct(array("CustomerBlogActivityI18n","CustomerBlogActivity"));           
    }
    
    
   protected function fetchObjects($db)
    {                 
       while ($items = $db->fetchObjects()) 
       {                                               
            $item=$items->getCustomerBlogActivityI18n();                   
            $item->set('activity_id',$items->getCustomerBlogActivity());          
            $this->items[$item->get('id')]=$item;                           
       }                   
    } 
    
   
}