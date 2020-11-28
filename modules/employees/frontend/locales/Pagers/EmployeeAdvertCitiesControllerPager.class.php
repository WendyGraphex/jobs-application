<?php

 
class EmployeeAdvertCitiesControllerPager extends mfPager {
    
   
    function __construct($filter) {                       
         $this->filter=$filter;
         parent::__construct("EmployeeAdvertCityBundling");                    
    }
    
    function configure()
    {
        $this->items=new EmployeeAdvertCityBundlingCollection();
        return $this;
    }
    
    
     protected function fetchObject($db)
    {              
      while ($item = $db->fetchObject($this->class)) 
      {           
          $this->items[$item->country."_".$item->city]=$item;
      }
      $this->items->loadI18nAdverts($this->filter);    
    }
      
    
}