<?php


class  UserProfessionPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'UserProfession',
           'UserProfessionI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getUserProfession();                
              $item->setI18n($items->hasUserProfessionI18n()?$items->getUserProfessionI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }  
             
    }
   
    
}

