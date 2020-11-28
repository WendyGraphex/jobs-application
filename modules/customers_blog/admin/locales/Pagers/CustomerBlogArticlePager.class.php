<?php


class CustomerBlogArticlePager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array(
           'CustomerBlogArticle',
           'CustomerBlogArticleI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                            
          // echo "<pre>"; var_dump($items);
              $item=$items->getCustomerBlogArticle();             
              $item->setI18n($items->hasCustomerBlogArticleI18n()?$items->getCustomerBlogArticleI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }             
    }
   
}
