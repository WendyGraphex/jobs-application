<?php


class CartPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CartProduct","Product","ProductI18n","ProductTax"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCartProduct();                        
            $item->set('product_id',$items->getProduct());
            $item->getProduct()->setI18n($items->getProductI18n());
            $item->getProduct()->set('tax_id',$items->getProductTax());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}