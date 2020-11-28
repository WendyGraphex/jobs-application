<?php

 
class EmployeeAdvertSkillsControllerPager extends   mfPager {
    
   
    function __construct($filter) {                       
         $this->filter=$filter;
         parent::__construct(array("EmployeeSkill","EmployeeSkillI18n"));                    
    }
    
    function configure()
    {
        $this->items=new EmployeeAdvertSkillBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObjects($db)
    {                
      while ($items= $db->fetchObjects()) 
      {           
           $item=$items->getEmployeeSkill();
           $item->setI18n($items->getEmployeeSkillI18n());
           $this->items[$item->get('id')]=new EmployeeAdvertSkillBundling($item,$items->get('number_of_adverts'));
      }    
       $this->items->loadI18nAdverts($this->filter);    
    }
      
   
    
}