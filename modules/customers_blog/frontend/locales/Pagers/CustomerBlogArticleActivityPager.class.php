<?php


class CustomerBlogArticleActivityPager extends Pager {
    
    
    function __construct($user) {               
        parent::__construct(array("CustomerBlogArticle","CustomerBlogArticleI18n"));         
    }
    
    
   protected function fetchObjects($db)
    {                 
       while ($items = $db->fetchObjects()) 
       {                                               
            $item=$items->getCustomerBlogArticleI18n();                 
            $item->set('article_id',$items->getCustomerBlogArticle());                          
            $this->items[$item->get('id')]=$item;                           
       }                   
    } 
       
}