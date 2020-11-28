<?php


class CustomerBlogArticleControllerPager extends Pager2 {
    
   
    function __construct() {                           
         parent::__construct(array("CustomerBlogArticle","CustomerBlogArticleI18n"));                   
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getCustomerBlogArticleI18n();           
           // if (!$this->getAdverts()->hasItemByKey($items->getEmployerAdvert()->get('id')))          
            $item->set('article_id',$items->getCustomerBlogArticle());           
            $this->items[$item->get('id')]=$item;               
       }                       
    } 
       
     
}