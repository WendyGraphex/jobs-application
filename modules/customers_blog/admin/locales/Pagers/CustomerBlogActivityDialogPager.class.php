<?php


class CustomerBlogActivityDialogPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerBlogActivity","CustomerBlogActivityI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerBlogActivity(); 
            $item->setI18n($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}