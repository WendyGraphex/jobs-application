<?php

 
class EmployeeEmployeeSkillsControllerPager extends   mfPager {
    
   
    function __construct($filter) {                       
         $this->filter=$filter;
         parent::__construct(array("EmployeeSkill","EmployeeSkillI18n"));                    
    }
    
    function configure()
    {
        $this->items=new EmployeeSkillBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObjects($db)
    {                
      while ($items= $db->fetchObjects()) 
      {                   
           $item=$items->getEmployeeSkill();
           $item->setI18n($items->getEmployeeSkillI18n());
           $this->items[$item->get('id')]=new EmployeeSkillBundling($item,$items->get('number_of_employees'));
      }    
      $this->items->loadEmployees($this->filter);    
    }
      
   
    
}