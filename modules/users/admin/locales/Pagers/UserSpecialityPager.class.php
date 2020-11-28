<?php


class  UserSpecialityPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'UserSpeciality',
           'UserSpecialityI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getUserSpeciality();                
              $item->setI18n($items->hasUserSpecialityI18n()?$items->getUserSpecialityI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}

