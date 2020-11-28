<?php


class EmployeeSkillPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'EmployeeSkill',
           'EmployeeSkillI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmployeeSkill();   
           //   var_dump($item);
              $item->setI18n($items->hasEmployeeSkillI18n()?$items->getEmployeeSkillI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


