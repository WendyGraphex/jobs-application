<?php


class EmployeeExperiencePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeExperience',
           'EmployeeExperienceI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeExperience();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeExperienceI18n()?$items->getEmployeeExperienceI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


