<?php

 
class EmployeeSkillsControllerPager extends   mfPager {
    
   
    function __construct($filter) {                       
         $this->filter=$filter;
         parent::__construct(array("EmployeeSkill","EmployeeSkillI18n"));                    
    }
    
   
    
    
     protected function fetchObjects($db)
    {                
      while ($items= $db->fetchObjects()) 
      {                   
           $item=$items->getEmployeeSkill();
           $item->setI18n($items->getEmployeeSkillI18n());
           $this->items[$item->get('id')]=$item;
      }         
    }
      
   
    
}