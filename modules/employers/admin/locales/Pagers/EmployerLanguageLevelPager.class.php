<?php


class EmployerLanguageLevelPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployerLanguageLevel',
           'EmployerLanguageLevelI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployerLanguageLevel();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployerLanguageLevelI18n()?$items->getEmployerLanguageLevelI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


