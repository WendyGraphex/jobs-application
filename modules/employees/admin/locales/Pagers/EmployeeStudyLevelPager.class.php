<?php


class EmployeeStudyLevelPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeStudyLevel',
           'EmployeeStudyLevelI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeStudyLevel();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeStudyLevelI18n()?$items->getEmployeeStudyLevelI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


