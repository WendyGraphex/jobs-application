<?php


class EmployeeLanguageLevelPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeLanguageLevel',
           'EmployeeLanguageLevelI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeLanguageLevel();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeLanguageLevelI18n()?$items->getEmployeeLanguageLevelI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


