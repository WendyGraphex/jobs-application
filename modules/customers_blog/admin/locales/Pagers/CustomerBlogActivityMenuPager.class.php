<?php


class CustomerBlogActivityMenuPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerBlogActivityMenu","CustomerBlogActivityMenuI18n","CustomerBlogActivity","CustomerBlogActivityI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerBlogActivityMenu(); 
            $item->setI18n($items->hasCustomerBlogActivityMenuI18n()?$items->getCustomerBlogActivityMenuI18n():false);
            $item->set('activity_id',$items->hasCustomerBlogActivity()?$items->getCustomerBlogActivity():false);
            if ($item->hasActivity())
              $item->getActivity()->setI18n($items->hasCustomerBlogActivityI18n()?$items->getCustomerBlogActivityI18n():false);  
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}