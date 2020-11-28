<?php


class EmployeeGraduateDiplomaPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeGraduateDiploma',
           'EmployeeGraduateDiplomaI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeGraduateDiploma();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeGraduateDiplomaI18n()?$items->getEmployeeGraduateDiplomaI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


